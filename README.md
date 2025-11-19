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

*(Add your main findings here once you want to share results)*

- Reliability coefficients for all scales exceeded α = 0.70
- Sample demographics: [Add summary]
- Main effects: [Add results]
- Mediation effects: [Add results]

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
