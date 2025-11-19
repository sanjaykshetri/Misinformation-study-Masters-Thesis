# Data Dictionary

## Overview
This document describes the structure and variables in the de-identified dataset used for the misinformation study.

---

## Files

### `data_deidentified.sav`
De-identified participant responses in SPSS format. Contains all survey responses after removing personally identifiable information.

### `raw_dataset.csv`
Raw export from Qualtrics (includes metadata columns).

---

## Variables

### Demographics
| Variable | Description | Values/Range |
|----------|-------------|--------------|
| `age_1` | Participant age | Continuous (years) |
| `sex` | Gender identity | 1=Male, 2=Female, 3=Non-binary, 4=Not disclosed |
| `race` | Racial/ethnic background | 1=White, 2=Black, 3=Other, 4=Asian, 6=Other |

### Cognitive Reflection Test (CRT)
| Variable | Description | Coding |
|----------|-------------|--------|
| `CRT_Q1` / `CRT_1` | CRT Item 1 | 1=Correct, 0=Incorrect |
| `CRT_Q2` / `CRT_2` | CRT Item 2 | 1=Correct, 0=Incorrect |
| `CRT_3` through `CRT_7` | CRT Items 3-7 | 1=Correct, 0=Incorrect |

**Note**: All correct answers were coded as option 1 in the original survey.

### Vulnerability to Misinformation (VOI)
| Variable | Description | Scale |
|----------|-------------|-------|
| `VOI_1` through `VOI_X` | Misinformation susceptibility items | Likert scale (1-7) |

### Conspiracy Mentality Questionnaire (CMQ)
| Variable | Description | Scale |
|----------|-------------|-------|
| `CMQ_1` through `CMQ_X` | Conspiracy belief items | Likert scale |

### Bullshit Receptivity Scale (BRS)
| Variable | Description | Scale |
|----------|-------------|-------|
| `BRS_1` through `BRS_10` | Pseudo-profound statement items | Likert scale |
| `BRS_11` | Attention check item | Should equal 5 for valid responses |

### Decision-Making Questionnaire (DMQ)
| Variable | Description | Scale |
|----------|-------------|-------|
| `DMQ_1` through `DMQ_5` | Rational thinking style items | Likert scale |
| `DMQ_6` through `DMQ_10` | Intuitive thinking style items | Likert scale |
| `DMQ_11` | Attention check item | Should equal 1 for valid responses |

---

## Computed Variables

### In Analysis Script
| Variable | Description | Calculation |
|----------|-------------|-------------|
| `CRT` | Total CRT score | Mean of CRT_1 through CRT_7 |
| `CMQ` | Total conspiracy mentality | Mean of CMQ items |
| `BRS` | Total bullshit receptivity | Mean of BRS items (excluding attention check) |
| `VOI` | Total vulnerability to misinformation | Mean of VOI items |
| `rational` | Rational thinking style | Mean of DMQ_1 through DMQ_5 |
| `intuitive` | Intuitive thinking style | Mean of DMQ_6 through DMQ_10 |

---

## Data Cleaning Notes

### Exclusion Criteria
- Failed attention checks (`BRS_11 ≠ 5` OR `DMQ_11 ≠ 1`)
- 6 participants excluded (1 rejected + 5 failed attention checks)
- **Final N = 194**

### Missing Data
*(Add information about missing data handling if applicable)*

---

## Reliability Estimates

| Scale | Cronbach's Alpha |
|-------|------------------|
| CRT | *(Add from analysis)* |
| VOI | *(Add from analysis)* |
| DMQ | *(Add from analysis)* |
| CMQ | *(Add from analysis)* |
| BRS | *(Add from analysis)* |

---

## Data Collection

- **Platform**: Qualtrics
- **Recruitment**: Cloud Research
- **Date**: *(Add collection period)*
- **Location**: United States only

---

## Ethics & Privacy

- All data has been de-identified per IRB requirements
- No personally identifiable information (PII) is included
- Participants provided informed consent
- IRB Protocol: *(Add protocol number)*

---

## Questions?

For clarifications about variables or data structure, please open an issue or contact the repository owner.
