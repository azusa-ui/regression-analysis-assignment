# Statistical Analysis Assignment For Group 1
**Linear and Logistic Regression Using Simulated Public Health Data**

## 1. Introduction
This repository contains a complete statistical analysis assignment demonstrating the application of **linear and logistic regression** in a public health epidemiology context. Two simulated datasets were generated to examine the effects of **physical activity, obesity, and years of working** on health outcomes, with particular emphasis on **interaction effects**, **model diagnostics**, and **influential observation analysis**.

The project follows the full analytical workflow from data generation to interpretation, aligned with good epidemiological and statistical practice.

---

## 2. Objectives
- Apply linear regression to evaluate determinants of **Quality of Life (QoL)**
- Apply logistic regression to assess factors associated with **depression**
- Examine whether **obesity modifies** the effect of physical activity on health outcomes
- Conduct comprehensive model checking and influence diagnostics
- Present results clearly using tables, plots, and public health–relevant interpretation

---

## 3. Datasets

### 3.1 : Dataset 1 for Linear Regression (QoL)
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

### 3.2 : Dataset 2 for Logistic Regression (Depression)
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

All datasets were generated using **Generative AI (ChatGPT 5.2)** to emulate realistic epidemiological data structures.

---

## 4. Analysis Workflow

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
## 📁 Repository Structure
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
## 5. Software & Packages
- **R** (≥ 4.3)

### 5.1 **Logistic Regression Analysis**
#### Data Manipulation & Wrangling
- library(tidyverse)        # dplyr, tidyr, ggplot2, purrr
- library(modelr)           # Predictions and model helpers

#### Statistical Modeling & Diagnostics
- library(broom)            # Tidy model outputs
- library(broom.helpers)    # Enhanced regression summaries
- library(performance)      # Model diagnostics (VIF, check_model)
- library(car)              # Regression diagnostics
- library(lmtest)           # Likelihood ratio tests
- library(pscl)             # Pseudo R² (McFadden)
- library(ResourceSelection) # Hosmer–Lemeshow test
- library(QuantPsyc)        # Classification tables
- library(pROC)             # ROC curves and AUC
- library(caret)            # Model evaluation and resampling

#### Interaction & Effect Estimation
- library(interactions)     # Interaction plots, simple slopes
- library(ggeffects)        # Predicted probabilities

#### Results Tables & Reporting
- library(gtsummary)        # Regression tables
- library(gt)               # Publication-ready tables
- library(knitr)            # Tables for R Markdown
- library(kableExtra)       # Table styling
- library(DT)               # Interactive tables

#### Data Exploration
- library(summarytools)     # Descriptive statistics

#### Visualization
- library(ggplot2)          # Core plotting
- library(GGally)           # Correlation plots
- library(corrplot)         # Correlation matrices
- library(patchwork)        # Combine plots
- library(viridis)          # Color-blind friendly palettes

### 5.2 **Linear Regression Analysis**
#### Data Manipulation & Wrangling
- library(tidyverse)        # dplyr, tidyr, ggplot2
- library(modelr)           # Predictions and model helpers

#### Statistical Modeling & Diagnostics
- library(broom)            # Tidy model outputs
- library(broom.helpers)    # Enhanced regression summaries/publish to posit-connect
- library(performance)      # Model diagnostics
- library(car)              # Regression diagnostics
- library(lmtest)           # Model comparison tests

#### Interaction & Effect Estimation
- library(interactions)     # Interaction plots
- library(ggeffects)        # Predicted values

#### Results Tables & Reporting
- library(gtsummary)        # Regression tables
- library(gt)               # Publication-ready tables
- library(knitr)            # Tables for R Markdown
- library(DT)               # Interactive tables

#### Data Exploration
- library(summarytools)     # Descriptive statistics

#### Visualization
- library(ggplot2)          # Core plotting
- library(GGally)           # Correlation plots
- library(corrplot)         # Correlation matrices
- library(patchwork)        # Combine plots

---

## 6. Ethics & Data Governance
All datasets are **simulated** and created solely for educational purposes. No real individuals or confidential data are involved. Ethical approval is not required.

---

## 7. SWOT Summary

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

## 👤 Author
- **Dr Ahmad Zulfahmi Sha'ari**
- DrPH Candidate , Group 1 Leader
- Public Health Epidemiology
