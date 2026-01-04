# Regression Analysis (GDT500/3)
**Statistical Analysis Assignment For Group 1**


## 1. Introduction
This repository contains a complete statistical analysis assignment demonstrating the application of **linear and logistic regression** in a public health epidemiology context. Two simulated datasets were generated to examine the effects of **physical activity, obesity, and years of working** on health outcomes, with particular emphasis on **interaction effects**, **model diagnostics**, and **influential observation analysis**.

The project follows the full analytical workflow from data generation to interpretation, aligned with good epidemiological and statistical practice.

---
## 2. Course & Assignment Context
- Course: GDT500/3 – Multivariable Analysis

- Programme: Master/Doctor of Public Health

- Institution: Universiti Sains Malaysia (USM)

- Assessment Type: Group assignment (simulated data)
  
## 3. Group Information
- Group : 1
- Members :
  - AHMAD ZULFAHMI BIN SHA’ARI 
  - MOHD FAIZ BIN MOHD GHAZALI 
  - MUHAMAD SYAFIQ BIN ZAINUL ABIDIN
  - ZAINAL BIN ZULKIFLI 

 ## 4. Objectives
- Simulate realistic public health datasets suitable for regression analysis.
- Apply linear regression to evaluate determinants of **Quality of Life (QoL)**
- Apply logistic regression to assess factors associated with **depression**
- Examine whether **obesity modifies** the effect of physical activity on health outcomes
- Conduct comprehensive model checking and influence diagnostics
- Present results clearly using tables, plots, and public health–relevant interpretation
- Ensure full analytical reproducibility.

---
## 📁5.Repository Structure
```
├── Linear_Regression/
│   ├── Multiple_LINEAR_Regression_Assignment.qmd    
│   ├── Multiple_LINEAR_Regression_Assignment.html   
│   ├── Simulate_data_linear_regression.R           
│   └── data_lm.csv                               
│
├── Logistic_Regression/
│   ├── Multiple_LOGISTIC_Regression_Assignment.qmd  
│   ├── Multiple_LOGISTIC_Regression_Assignment.html  
│   ├── Simulate_data_logistic_regression.R          
│   └── data_log2.csv                               
│
└── README.md                                   
```
---
## 6. Datasets
All datasets were generated using Generative AI (ChatGPT 5.2) to emulate realistic epidemiological data structures.

### 6.1 : Dataset 1 for Linear Regression (QoL)
- **Sample size:** 200
- **Outcome:**  
  - `qol` (continuous, range 0–100)
- **Covariates:**  
  - `years_working` (0–40 years)  
  - `phys_activity` (0–10 score)  
  - `obesity` (obese / not obese)
- **Key feature:**  
  - Interaction between physical activity and obesity
- **Design notes:**  
  - Plausible epidemiological effect sizes  
  - Deliberately inserted influential observations for diagnostic demonstration
- **File:** `data_lm.csv`

### 6.2 : Dataset 2 for Logistic Regression (Depression)
- **Sample size:** 200
- **Outcome:**  
  - `depression` (depressed / not depressed)
- **Covariates:**  
  - `years_working` (0–40 years)  
  - `phys_activity` (0–10 score)  
  - `obesity` (obese / not obese)
- **Key feature:**  
  - Interaction between physical activity and obesity
- **File:** `data_log2.csv`

---

## 7. Analysis Workflow
All steps are fully scripted and documented in the Quarto reports.

### Part A: Data Generation
- Synthetic datasets generated with predefined ranges, distributions, and interaction effects
- Saved as CSV files for reproducibility

### Part B: Exploratory Data Analysis
- Summary statistics (mean, SD, median, IQR)
- Frequencies and proportions for categorical variables
- Visualisations:
  - Histograms
  - Box plots
  - Scatter plots
  - Bar plots
- Correlation matrices for continuous variables

### Part C: Regression Modelling
**Linear Regression**
- Model 1: `qol ~ years_working + phys_activity + obesity`
- Model 2: `qol ~ years_working + phys_activity + obesity + phys_activity:obesity`

**Logistic Regression**
- Model 1: `depression ~ years_working + phys_activity + obesity`
- Model 2: `depression ~ years_working + phys_activity + obesity + phys_activity:obesity`

### Part D: Model Diagnostics
- **Linear regression:**
  - Linearity
  - Normality of residuals
  - Homoscedasticity
  - Independence
  - Influence analysis (Cook’s distance, DFBETAS, leverage)
- **Logistic regression:**
  - Linearity in the logit
  - Multicollinearity
  - Independence
  - Influence analysis (Cook’s distance, DFBETAS, leverage)

### Part E: Results & Interpretation
- Regression tables with estimates, confidence intervals, and goodness-of-fit statistics
- Interaction plots for linear and logistic regression
- Interpretation of:
  - Main effects
  - Interaction terms
  - Practical public health significance
- Discussion of assumption violations and influential observations
---
## 8. Published Reports (Posit Connect)

The rendered Quarto reports have been published online for easy access:

- Linear Regression: [View on Posit Connect](https://posit-connect.kk.usm.my/content/d5bb6a3a-1e01-48c1-8a67-95e0882bf1b9)

- Logistic Regression: [View on Posit Connect](https://posit-connect.kk.usm.my/content/a057a1db-140c-4f9e-ad5f-383d65ce6dee)

The GitHub repository link is also included within each Posit Connect publication for reference and reproducibility.

---
  
## 9. Required R Packages
### Prerequisites
- R: Version ≥ 4.0.0
- RStudio: Recommended for .Rproj workflow
- Quarto: Version ≥ 1.4

### For both analyses
- Data manipulation & workflow: tidyverse, dplyr, modelr
- Visualization: ggplot2, GGally, patchwork, corrplot, interactions
- Statistical modelling & diagnostics: broom, broom.helpers, performance, car, lmtest
- Table & report generation: gtsummary, gt, knitr
- Data exploration & formatting: summarytools, DT

### Logistic regression specific
- caret, ResourceSelection, pROC

---
## 10. Declaration on the Use of AI
AI tools (ChatGPT 5.2) were used to assist with code structuring and language refinement. All analytical decisions, interpretations, and conclusions were independently made by the authors.

---
## 11. Ethics & Data Governance
All datasets are **simulated** and created solely for educational purposes. No real individuals or confidential data are involved. Ethical approval is not required.

---
 
## 12. Contributing
This repository is an academic assignment. Contributions are limited to group members. For errors or suggestions:
- Open an issue with context, file, and line reference
- Contact the primary author
---
## 13. Contact
- Primary Contact: Dr Azul
- Email: azulmachang@gmail.com

---

## 14. SWOT Summary

**Strengths**
- Fully reproducible workflow  
- Clear demonstration of interaction effects  
- Comprehensive model diagnostics  

**Weaknesses**
- Simulated data limits external validity  

**Opportunities**
- Serves as a template for real epidemiological regression studies  

**Threats**
- Results may be misinterpreted if assumed to represent real populations  
---
## 15. Acknowledgments
- Professor Kamarul Imran Musa for supervision and guidance
- Department of Community Medicine, USM for resources
- R and Quarto communities for open-source tools
- Posit, PBC for maintaining Posit Connect
---
## 16. Disclaimer
All datasets are simulated. Analyses are for educational purposes only and should not be used for clinical decision-making.

---
## 17. License
This repository is licensed under the MIT License. Please cite the author if using any part of this repository.

---

## 👤 Author
- **Dr Ahmad Zulfahmi Sha'ari**
- DrPH Candidate , Group 1 Leader
- Public Health Epidemiology
