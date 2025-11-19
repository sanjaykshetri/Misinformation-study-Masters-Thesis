# Analysis Guide

## Quick Start

This guide walks you through reproducing the complete analysis for the misinformation study.

---

## Prerequisites

### Required Software
- **R** version 4.0 or higher
- **RStudio** (recommended)

### Required R Packages
```r
# Install required packages
install.packages(c(
  "haven",      # Read SPSS files
  "tidyverse",  # Data manipulation & visualization
  "psych",      # Psychometric analysis
  "lavaan"      # Structural equation modeling
))
```

---

## Step-by-Step Analysis

### 1. Setup
```r
# Open the R project
# File > Open Project > Misinformation-study-Masters-Thesis.Rproj

# Load the main analysis script
source("data_analysis1.R")
```

### 2. Data Loading & Preparation
The script performs:
- Loads de-identified SPSS data
- Renames variables for clarity
- Recodes CRT responses (correct = 1, incorrect = 0)

### 3. Data Quality Checks
**Attention Checks:**
- `BRS_11` should equal 5
- `DMQ_11` should equal 1
- Participants failing either check are excluded

**Expected Exclusions:**
- Started: 200 participants
- Excluded: 6 (1 rejected + 5 failed attention checks)
- Final N: 194

### 4. Descriptive Statistics
The script calculates:
- Age: Mean, SD, range
- Sex distribution (frequency table)
- Race/ethnicity distribution (frequency table)

### 5. Reliability Analysis
Cronbach's alpha for each scale:
- Cognitive Reflection Test (CRT) - 7 items
- Vulnerability to Misinformation (VOI)
- Decision-Making Questionnaire (DMQ) - with reverse coding check
- Conspiracy Mentality Questionnaire (CMQ)
- Bullshit Receptivity Scale (BRS)

**Acceptable threshold:** α ≥ 0.70

### 6. Variable Aggregation
Creates composite scores by averaging items:
```r
CRT = mean(CRT_1 through CRT_7)
CMQ = mean(CMQ items)
BRS = mean(BRS items)
VOI = mean(VOI items)
rational = mean(DMQ_1 through DMQ_5)
intuitive = mean(DMQ_6 through DMQ_10)
```

### 7. Correlation Analysis
Key correlations examined:
- Rational × Intuitive thinking (expected: negative)
- Rational × CRT
- Intuitive × CRT
- All predictors × outcome variables

### 8. Main Analysis
*(Complete this section with your SEM/mediation analysis details)*

**Hypothesized Model:**
```
CRT → VTM (direct effect)
CRT → CMQ → VTM (indirect effect via conspiracy mentality)
CRT → BRS → VTM (indirect effect via bullshit receptivity)
```

---

## Output Files

### Automatically Generated
- Console output with descriptive statistics
- Reliability coefficients
- Correlation matrices

### Manual Exports (if needed)
```r
# Save cleaned dataset
write_csv(df2, "cleaned_data.csv")

# Save correlation matrix
cor_matrix <- cor(df2 %>% select(CRT, CMQ, BRS, VOI))
write.csv(cor_matrix, "correlation_matrix.csv")
```

---

## Interpreting Results

### Reliability
- α ≥ 0.90: Excellent
- α ≥ 0.80: Good
- α ≥ 0.70: Acceptable
- α < 0.70: Questionable

### Effect Sizes
- r = 0.10: Small
- r = 0.30: Medium  
- r = 0.50: Large

### Statistical Significance
- p < .05: Significant
- p < .01: Highly significant
- p < .001: Very highly significant

---

## Troubleshooting

### Common Issues

**Problem:** Package not found
```r
# Solution: Install missing package
install.packages("package_name")
```

**Problem:** Data file not loading
```r
# Solution: Check working directory
getwd()
# Should be: /path/to/Misinformation-study-Masters-Thesis

# If not, set it manually:
setwd("/path/to/Misinformation-study-Masters-Thesis")
```

**Problem:** Different results from paper
- Check R version and package versions
- Verify data file integrity
- Check for random seed settings (if applicable)

---

## Extending the Analysis

### Additional Analyses You Could Run

1. **Demographic comparisons**
```r
# Compare by gender
t.test(CRT ~ sex, data = df2 %>% filter(sex %in% c("Male", "Female")))
```

2. **Visualizations**
```r
library(ggplot2)

# Scatterplot: CRT vs VTM
ggplot(df2, aes(x = CRT, y = VOI)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Relationship between CRT and Vulnerability to Misinformation",
       x = "Cognitive Reflection Test Score",
       y = "Vulnerability to Misinformation")
```

3. **Regression models**
```r
# Simple regression
model1 <- lm(VOI ~ CRT, data = df2)
summary(model1)

# Multiple regression
model2 <- lm(VOI ~ CRT + CMQ + BRS, data = df2)
summary(model2)
```

---

## Reproducibility Notes

### Session Info
Run this to record your computational environment:
```r
sessionInfo()
```

### Random Seed
If using any random procedures:
```r
set.seed(42)  # For reproducibility
```

---

## Questions & Support

- **Issues with code**: Open a GitHub issue
- **Questions about methods**: Contact the author
- **Replication attempts**: Share your results!

---

## References

*(Add key references for methods, scales, etc.)*

- Cognitive Reflection Test: Frederick (2005)
- Conspiracy Mentality: Bruder et al. (2013)
- Bullshit Receptivity: Pennycook et al. (2015)
