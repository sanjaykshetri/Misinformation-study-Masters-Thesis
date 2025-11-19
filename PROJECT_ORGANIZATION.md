# Project Organization Recommendations

## Current Issues

Your project currently has:
- All files in the root directory
- Inconsistent naming (e.g., "StudentsPerformance.csv" appears unrelated)
- Mix of thesis files and other analysis files

---

## Recommended Folder Structure

```
Misinformation-study-Masters-Thesis/
│
├── README.md                          # Main project overview (✓ UPDATED)
├── LICENSE                            # License file (✓ CREATED)
├── CITATION.cff                       # Citation metadata (✓ CREATED)
├── CODE_OF_CONDUCT.md                 # Community guidelines (✓ CREATED)
├── CONTRIBUTING.md                    # Contribution guide (✓ CREATED)
├── .gitignore                         # Git ignore rules (✓ UPDATED)
├── .gitattributes                     # Git attributes (✓ CREATED)
├── Misinformation-study-Masters-Thesis.Rproj
│
├── docs/                              # Documentation
│   ├── ANALYSIS_GUIDE.md             # How to run analysis (✓ CREATED)
│   ├── DATA_DICTIONARY.md            # Variable descriptions (✓ CREATED)
│   ├── Masters Thesis Sanjay Chhetri.pdf
│   └── methodology.md                # Detailed methods (optional)
│
├── data/                              # Data files
│   ├── raw/                          # Original unprocessed data
│   │   ├── raw_data_misinfor_study_qualtrics - Copy.csv
│   │   └── raw_dataset.csv
│   │
│   ├── processed/                    # Cleaned data
│   │   └── data_deidentified.sav
│   │
│   └── README.md                     # Data overview & access info
│
├── scripts/                           # Analysis scripts
│   ├── 01_data_cleaning.R            # Data preparation
│   ├── 02_descriptive_stats.R        # Descriptive analysis
│   ├── 03_reliability.R              # Reliability analysis
│   ├── 04_main_analysis.R            # Primary SEM/mediation
│   └── data_analysis1.R              # Current combined script
│
├── outputs/                           # Analysis outputs
│   ├── figures/                      # Plots and visualizations
│   ├── tables/                       # Statistical tables
│   └── results/                      # Model outputs
│
├── rmarkdown/                         # R Markdown reports
│   └── analysis_report.Rmd           # Reproducible report
│
└── archive/                           # Old/unrelated files
    ├── StudentsPerformance.csv       # Unrelated to thesis
    ├── markdown report on student performance.Rmd
    ├── markdown-report-on-student-performance.html
    └── Student Performance Analysis markdown pdf.pdf
```

---

## Benefits of This Structure

### 1. **Clarity**
- Clear separation between data, code, and documentation
- Easy to find specific files
- Professional appearance for GitHub/portfolio

### 2. **Reproducibility**
- Scripts numbered in order of execution
- Raw data preserved separately from processed data
- Output files organized by type

### 3. **Collaboration**
- Easy for others to understand project structure
- Standard academic research organization
- Better version control with Git

### 4. **Maintenance**
- Archive old/unrelated files without deleting
- Easy to add new analyses
- Cleaner root directory

---

## Migration Steps

### Option 1: Gradual Reorganization
Keep everything working while slowly organizing:

```bash
# Create new directories
mkdir -p docs data/raw data/processed scripts outputs/figures outputs/tables rmarkdown archive

# Move documentation
mv ANALYSIS_GUIDE.md DATA_DICTIONARY.md docs/
mv "Masters Thesis Sanjay Chhetri.pdf" docs/

# Move data files
mv raw_*.csv data/raw/
mv data_deidentified.sav data/processed/

# Move unrelated files to archive
mv StudentsPerformance.csv archive/
mv "markdown report on student performance.Rmd" archive/
mv markdown-report-on-student-performance.html archive/
mv "Student Performance Analysis markdown pdf.pdf" archive/

# Keep scripts in root for now, then move when ready
# cp data_analysis1.R scripts/
```

### Option 2: Create Fresh Structure
Start with new organized structure:

1. Create folder structure
2. Copy files to appropriate locations
3. Update file paths in R scripts
4. Test that everything still works
5. Commit changes

---

## File Naming Best Practices

### Current Issues
- Spaces in filenames
- Inconsistent capitalization
- Generic names

### Recommended Conventions
```
# Good examples:
data_deidentified.sav
01_data_cleaning.R
Masters_Thesis_Chhetri_2025.pdf
figure_01_crt_distribution.png

# Avoid:
raw_data_misinfor_study_qualtrics - Copy.csv  # Has spaces and "Copy"
markdown report on student performance.Rmd     # Spaces, unclear purpose
```

**Rules:**
- Use underscores or hyphens (no spaces)
- Use lowercase (except for README, LICENSE, etc.)
- Include dates in format YYYY-MM-DD if needed
- Be descriptive but concise
- Number scripts in execution order

---

## Update Required File Paths

After reorganizing, update paths in `data_analysis1.R`:

```r
# OLD:
raw_data <- read_sav("data_deidentified.sav")

# NEW:
raw_data <- read_sav("data/processed/data_deidentified.sav")

# Even better - use here package for robust paths:
library(here)
raw_data <- read_sav(here("data", "processed", "data_deidentified.sav"))
```

---

## Additional Data Files to Create

### `data/README.md`
```markdown
# Data Directory

## Files

### Raw Data
- `raw_data_misinfor_study_qualtrics.csv`: Original Qualtrics export
- Contains all responses including metadata

### Processed Data  
- `data_deidentified.sav`: De-identified, cleaned data
- Ready for analysis
- N = 194 after exclusions

## Access

All data is de-identified per IRB protocol.
See DATA_DICTIONARY.md for variable descriptions.
```

---

## GitHub Repository Enhancements

### Topics to Add
On GitHub, add these topics to your repository:
- psychology
- cognitive-science
- misinformation
- research
- masters-thesis
- r-statistics
- structural-equation-modeling
- conspiracy-theories

### Repository Description
```
Master's thesis investigating cognitive correlates of vulnerability to 
misinformation, examining roles of cognitive reflection, conspiracy 
mentality, and bullshit receptivity (R, SEM, N=194)
```

### About Section
- Add your OSF link
- Add keywords
- Enable Issues for questions
- Add website link (if you have one)

---

## Would You Like Help With...?

- [ ] Implementing this reorganization?
- [ ] Splitting the analysis script into modules?
- [ ] Creating visualizations?
- [ ] Writing an R Markdown report?
- [ ] Adding GitHub Actions for automated checks?
- [ ] Creating a project website with GitHub Pages?

Let me know what would be most helpful!
