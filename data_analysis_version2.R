################################################################################
# Syntax Sample: Reproducible Survey Data Management and SEM Analysis Pipeline
# Author: Sanjay Chhetri
# Purpose:
#   This script demonstrates an end-to-end R workflow for importing, cleaning,
#   recoding, validating, scoring, and analyzing survey-based behavioral research
#   data. The emphasis is on transparent data management, reproducible coding,
#   scale construction, attention-check filtering, reliability analysis, and
#   preparation of analysis-ready datasets.
# GitHub Repository:
# https://github.com/sanjaykshetri/Misinformation-study-Masters-Thesis
################################################################################

# -----------------------------------------------------------------------------
# 1. Setup
# -----------------------------------------------------------------------------

library(haven)
library(tidyverse)
library(psych)
library(lavaan)
library(semPlot)

# Optional: set project-relative paths
raw_data_path <- "data_deidentified.sav"
output_dir <- "outputs"

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# -----------------------------------------------------------------------------
# 2. Import raw survey data
# -----------------------------------------------------------------------------

raw_data <- read_sav(raw_data_path)

cat("Raw dataset dimensions:\n")
print(dim(raw_data))

glimpse(raw_data)

# -----------------------------------------------------------------------------
# 3. Standardize variable names and prepare working dataset
# -----------------------------------------------------------------------------

working_data <- raw_data %>%
  rename(
    CRT_1 = CRT_Q1,
    CRT_2 = CRT_Q2,
    attention_check_brs = BRS_11,
    attention_check_dmq = DMQ_11
  )

# -----------------------------------------------------------------------------
# 4. Recode Cognitive Reflection Test items
# -----------------------------------------------------------------------------
# Coding note:
# In the source survey, the correct answer for each CRT item was coded as 1.
# All other responses are recoded to 0. This produces seven binary CRT indicators.

recoded_data <- working_data %>%
  mutate(
    across(
      starts_with("CRT_"),
      ~ if_else(.x == 1, 1, 0, missing = 0),
      .names = "{.col}"
    )
  )

# Frequency checks for recoded CRT items
crt_frequency_checks <- recoded_data %>%
  select(starts_with("CRT_")) %>%
  map(~ table(.x, useNA = "ifany"))

print(crt_frequency_checks)

# -----------------------------------------------------------------------------
# 5. Recode demographic variables
# -----------------------------------------------------------------------------

recoded_data <- recoded_data %>%
  mutate(
    sex = factor(
      sex,
      levels = c("1", "2", "3", "4"),
      labels = c("Male", "Female", "Non-binary", "Not disclosed")
    ),
    race = factor(
      race,
      levels = c(1, 2, 3, 4, 6),
      labels = c("White", "Black", "Other", "Asian", "Other")
    )
  )

# -----------------------------------------------------------------------------
# 6. Apply attention-check exclusion criteria
# -----------------------------------------------------------------------------
# Inclusion rule:
# Participants are retained if they answered both embedded attention checks
# correctly: BRS attention check = 5 and DMQ attention check = 1.

analysis_data <- recoded_data %>%
  filter(attention_check_brs == 5, attention_check_dmq == 1)

cat("Participants retained after attention checks:\n")
print(nrow(analysis_data))

# -----------------------------------------------------------------------------
# 7. Descriptive summaries
# -----------------------------------------------------------------------------

demographic_summary <- analysis_data %>%
  summarize(
    n = n(),
    mean_age = mean(age_1, na.rm = TRUE),
    sd_age = sd(age_1, na.rm = TRUE)
  )

print(demographic_summary)
print(table(analysis_data$sex, useNA = "ifany"))
print(table(analysis_data$race, useNA = "ifany"))

# -----------------------------------------------------------------------------
# 8. Reliability analysis for multi-item scales
# -----------------------------------------------------------------------------

scale_items <- list(
  CRT = analysis_data %>% select(starts_with("CRT_")),
  VOI = analysis_data %>% select(starts_with("VOI")),
  DMQ = analysis_data %>% select(starts_with("DMQ")),
  CMQ = analysis_data %>% select(starts_with("CMQ")),
  BRS = analysis_data %>% select(starts_with("BRS_"))
)

reliability_results <- list(
  CRT = psych::alpha(scale_items$CRT),
  VOI = psych::alpha(scale_items$VOI),
  DMQ = psych::alpha(scale_items$DMQ, check.keys = TRUE),
  CMQ = psych::alpha(scale_items$CMQ),
  BRS = psych::alpha(scale_items$BRS)
)

print(reliability_results)

# -----------------------------------------------------------------------------
# 9. Construct scale scores
# -----------------------------------------------------------------------------

scored_data <- analysis_data %>%
  mutate(
    CRT = rowMeans(across(starts_with("CRT_")), na.rm = TRUE),
    CMQ = rowMeans(across(starts_with("CMQ")), na.rm = TRUE),
    BRS = rowMeans(across(starts_with("BRS_")), na.rm = TRUE),
    VOI = rowMeans(across(starts_with("VOI")), na.rm = TRUE),
    rational = rowMeans(across(DMQ_1:DMQ_5), na.rm = TRUE),
    intuitive = rowMeans(across(DMQ_6:DMQ_10), na.rm = TRUE),
    intuitive_reverse = 6 - intuitive,
    DMS = rowMeans(cbind(rational, intuitive_reverse), na.rm = TRUE)
  )

analysis_ready <- scored_data %>%
  select(CRT, CMQ, BRS, VOI, DMS, rational, intuitive, intuitive_reverse)

write_csv(analysis_ready, file.path(output_dir, "analysis_ready_scale_scores.csv"))

# -----------------------------------------------------------------------------
# 10. Correlation checks among key predictors
# -----------------------------------------------------------------------------

correlation_matrix <- analysis_ready %>%
  select(CRT, DMS, CMQ, BRS, VOI) %>%
  cor(use = "pairwise.complete.obs")

print(correlation_matrix)
write_csv(
  as.data.frame(correlation_matrix),
  file.path(output_dir, "correlation_matrix.csv")
)

# -----------------------------------------------------------------------------
# 11. Structural equation models
# -----------------------------------------------------------------------------

model_crt <- '
  VOI ~ CRT + a*CMQ + b*BRS
  CMQ ~ c*CRT
  BRS ~ d*CRT
  CMQ ~~ BRS

  ind_cmq := a*c
  ind_brs := b*d
'

fit_crt <- sem(model_crt, data = analysis_ready)

summary(
  fit_crt,
  rsq = TRUE,
  standardized = TRUE,
  fit.measures = TRUE
)

model_dms <- '
  VOI ~ DMS + a*CMQ + b*BRS
  CMQ ~ c*DMS
  BRS ~ d*DMS
  CMQ ~~ BRS

  ind_cmq := a*c
  ind_brs := b*d
'

fit_dms <- sem(model_dms, data = analysis_ready)

summary(
  fit_dms,
  rsq = TRUE,
  standardized = TRUE,
  fit.measures = TRUE
)

# -----------------------------------------------------------------------------
# 12. Bootstrap indirect effects for primary CRT model
# -----------------------------------------------------------------------------

fit_crt_boot <- sem(
  model_crt,
  data = analysis_ready,
  se = "bootstrap",
  bootstrap = 5000
)

boot_parameters <- parameterEstimates(
  fit_crt_boot,
  standardized = TRUE,
  boot.ci.type = "perc"
)

write_csv(
  boot_parameters,
  file.path(output_dir, "bootstrap_parameter_estimates.csv")
)

# -----------------------------------------------------------------------------
# 13. Save SEM path diagram
# -----------------------------------------------------------------------------

png(file.path(output_dir, "sem_path_diagram_crt_model.png"), width = 1200, height = 900)
semPaths(
  fit_crt_boot,
  what = "est",
  layout = "tree2",
  sizeMan = 10,
  residuals = FALSE,
  edge.label.cex = 0.8,
  color = "lightblue",
  edge.color = "red"
)
dev.off()

# -----------------------------------------------------------------------------
# 14. Session information for reproducibility
# -----------------------------------------------------------------------------

sink(file.path(output_dir, "session_info.txt"))
sessionInfo()
sink()

cat("Analysis pipeline completed successfully. Outputs saved to:", output_dir, "\n")

