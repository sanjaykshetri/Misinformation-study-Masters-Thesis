# Cognitive Correlates of Vulnerability to Misinformation

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-4.0+-blue.svg)](https://www.r-project.org/)

**Master's Thesis Project**  
*Master of Arts in Psychological Sciences*  
Montclair State University

---

## 📋 Overview

This repository contains the complete research materials, data, and analysis code for my master's thesis investigating the **cognitive correlates of vulnerability to misinformation (VTM)**. The study examines how individual differences in cognitive reflection predict susceptibility to misinformation, with conspiracy mentality and bullshit receptivity as potential mediating factors.

### Research Question
How does cognitive reflection influence vulnerability to misinformation, and what roles do conspiracy mentality and bullshit receptivity play in this relationship?

---

## 🎯 Study Design

### Variables
- **Independent Variable**: Cognitive Reflection Test (CRT) - measures tendency to engage in reflective thinking vs. intuitive responses
- **Dependent Variable**: Vulnerability to Misinformation (VTM)
- **Mediators**: 
  - Conspiracy Mentality Questionnaire (CMQ)
  - Bullshit Receptivity Test (BRT)

### Methodology
- **Participants**: 200 adults recruited via Cloud Research
- **Final Sample**: 194 participants (after attention checks)
- **Survey Platform**: Qualtrics
- **Pre-registration**: Open Science Framework (OSF)
- **IRB Approval**: Montclair State University

---

## 📁 Repository Structure

```
├── data_analysis1.R                    # Main analysis script
├── data_deidentified.sav              # De-identified participant data (SPSS format)
├── raw_dataset.csv                     # Raw data from Qualtrics
├── Masters Thesis Sanjay Chhetri.pdf  # Full thesis document
├── README.md                           # This file
└── Misinformation-study-Masters-Thesis.Rproj  # R project file
```

---

## 🔬 Measures & Instruments

### Cognitive Reflection Test (CRT)
7-item measure assessing analytical vs. intuitive thinking

### Vulnerability to Misinformation (VTM)
Custom scale measuring susceptibility to false information

### Conspiracy Mentality Questionnaire (CMQ)
Assesses belief in conspiracy theories

### Bullshit Receptivity Test (BRT)
Measures receptivity to pseudo-profound statements

### Decision-Making Questionnaire (DMQ)
Assesses rational vs. intuitive decision-making styles

---

## 💻 Data Analysis

### Software & Packages
- **R** (version 4.0+)
- **Primary Packages**:
  - `lavaan` - Structural equation modeling
  - `tidyverse` - Data manipulation and visualization
  - `psych` - Psychometric analysis
  - `haven` - Import SPSS files

### Key Analyses
- Reliability analysis (Cronbach's alpha)
- Descriptive statistics
- Correlation analysis
- Structural equation modeling (SEM)
- Mediation analysis

---

## 🚀 Getting Started

### Prerequisites
```r
install.packages(c("haven", "tidyverse", "lavaan", "psych"))
```

### Running the Analysis
1. Clone this repository
2. Open `Misinformation-study-Masters-Thesis.Rproj` in RStudio
3. Run `data_analysis1.R` for complete analysis pipeline

---

## 📊 Key Findings

### Sample & Reliability
- **Final N = 194** (after attention check exclusions from initial N = 200)
- All reliability coefficients exceeded acceptable thresholds:
  - Bullshit Receptivity Scale (BRS): α = 0.92 [0.91, 0.94]
  - Conspiracy Mentality Questionnaire (CMQ): α = 0.77 [0.72, 0.82]
  - All scales demonstrated adequate to excellent internal consistency

### Main Effects: Cognitive Reflection → Vulnerability to Misinformation
- **Significant positive direct effect**: Higher CRT scores predicted better verification of online information (B = 9.800, p = .031, β = 0.149)
  - **Interpretation**: Individuals with greater cognitive reflection were more likely to verify online information, suggesting lower vulnerability to misinformation

### Predictor-Mediator Associations
- **CRT → Bullshit Receptivity**: Significant negative association (B = -0.502, p = .021, β = -0.164)
  - Higher cognitive reflection associated with lower bullshit receptivity
- **CRT → Conspiracy Mentality**: Non-significant association (B = -0.148, p = .365, β = -0.065)
  - Trend in expected direction but failed to reach statistical significance

### Mediation Analysis
- **Conspiracy Mentality pathway**: Indirect effect NOT significant (p = .399)
  - Bootstrap 95% CI included zero [-0.699, 3.549]
- **Bullshit Receptivity pathway**: Indirect effect significant (p = .046)
  - Bootstrap 95% CI did not include zero [-6.925, -0.824]
  - **Unexpected finding**: Direction was opposite to hypothesis (positive association between BRS and information verification)

### Alternative Model: Rational Decision Style
- Similar patterns observed when using self-reported rational decision-making style
- Stronger effects overall (R² = .142 vs .095 for main model)
- Rational decision style → BRS: Strong negative association (B = -0.625, p < .001, β = -0.413)
- Rational decision style → VOI: Significant positive effect (B = 9.302, p < .001, β = 0.287)

### Mediation vs. Direct Effects
- Both conspiracy mentality and bullshit receptivity showed significant associations with information verification
- However, evidence for full mediation was mixed
- Direct effects of cognitive reflection remained significant after accounting for mediators

### Model Fit
- Main model explained variance: VOI (R² = .095), BRS (R² = .027), CM (R² = .004)
- Alternative model explained variance: VOI (R² = .142), BRS (R² = .171), CM (R² = .019)

### Key Takeaway
Cognitive reflection significantly predicts online information verification behaviors, supporting the broader hypothesis that analytical thinking style protects against misinformation vulnerability. The mediation pathways were more complex than hypothesized, suggesting multiple mechanisms may be at play in the relationship between cognitive style and misinformation susceptibility.

---

## 👥 Contributors

**Author**: Sanjay Chhetri  
**Thesis Mentor**: Dr. Michael Bixter  
**Institution**: Montclair State University  
**Program**: Master of Arts in Psychological Sciences

---

## 📄 Citation

If you use this work, please cite:

```
Chhetri, S. (2025). Cognitive Correlates of Vulnerability to Misinformation 
[Master's thesis, Montclair State University].
```

---

## 📝 License

This project is licensed under the MIT License - see below for details.

---

## 🔗 Related Links

- [Open Science Framework Pre-registration](https://osf.io/) *(Add your OSF link)*
- [Full Thesis PDF](./Masters%20Thesis%20Sanjay%20Chhetri.pdf)

---

## 📧 Contact

For questions or collaborations, please reach out via [your email or GitHub profile].

---

**Note**: All data has been de-identified to protect participant privacy in accordance with IRB protocols. 
