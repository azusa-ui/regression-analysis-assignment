# Regression Analysis Assignment

A comprehensive repository for regression analysis with synthetic data generation and analysis scripts.

## Overview

This repository contains all necessary components for conducting regression analysis, including:
- R scripts for data generation
- R scripts for statistical analysis
- Raw data files in CSV format
- Comprehensive documentation

## Repository Contents

### R Scripts

#### 1. `generate_data.R`
Generates synthetic datasets for regression analysis.

**Features:**
- Creates three different datasets for various regression scenarios
- Uses reproducible random seed (42)
- Generates 200 observations per dataset
- Exports data to CSV format

**Usage:**
```bash
Rscript generate_data.R
```

**Output Files:**
- `data_simple.csv` - Simple linear regression data
- `data_multiple.csv` - Multiple regression data
- `data_categorical.csv` - Regression with categorical variables

#### 2. `analysis.R`
Performs comprehensive regression analysis on the generated datasets.

**Features:**
- Simple linear regression analysis
- Multiple regression analysis
- Regression with categorical predictors
- Statistical summaries and diagnostics
- Visualization of results

**Usage:**
```bash
Rscript analysis.R
```

**Prerequisites:**
- Data files must exist (run `generate_data.R` first)
- R packages: ggplot2 (for enhanced plotting)

### Data Files

All data files are in CSV format with headers:

#### `data_simple.csv`
- **Variables:** X (predictor), Y (response)
- **Model:** Y = 10 + 2*X + ε
- **Sample Size:** 200
- **Purpose:** Simple linear regression

#### `data_multiple.csv`
- **Variables:** X1, X2 (predictors), Y (response)
- **Model:** Y = 5 + 1.5*X1 + 0.8*X2 + ε
- **Sample Size:** 200
- **Purpose:** Multiple regression analysis

#### `data_categorical.csv`
- **Variables:** X (continuous predictor), Category (A/B/C), Y (response)
- **Model:** Y = 15 + 2.5*X + 1.2*Category_effect + ε
- **Sample Size:** 200
- **Purpose:** Regression with categorical variables

### Documentation

#### `DATA_GENERATION.md`
Comprehensive documentation of the data generation process including:
- Detailed methodology
- Distribution parameters
- True model specifications
- Reproducibility guidelines
- Quality checks and validation
- Technical details and assumptions

## Getting Started

### Prerequisites

- **R**: Version 4.0 or higher
- **R Packages** (optional, for enhanced analysis):
  - ggplot2

### Installation

1. Clone the repository:
```bash
git clone https://github.com/azusa-ui/regression-analysis-assignment.git
cd regression-analysis-assignment
```

2. Install R (if not already installed):
   - **Ubuntu/Debian:** `sudo apt-get install r-base`
   - **macOS:** `brew install r`
   - **Windows:** Download from [CRAN](https://cran.r-project.org/)

3. Install optional R packages (from R console):
```r
install.packages("ggplot2")
```

### Quick Start

1. **Generate Data:**
```bash
Rscript generate_data.R
```

2. **Run Analysis:**
```bash
Rscript analysis.R
```

3. **Review Results:**
   - Check console output for statistical summaries
   - View generated plots (e.g., `data_simple_plot.png`)

## Workflow

```
┌─────────────────────┐
│  generate_data.R    │
│  (Create datasets)  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│   CSV Data Files    │
│ (Raw data storage)  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│    analysis.R       │
│ (Perform analysis)  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Results & Plots    │
│   (Output files)    │
└─────────────────────┘
```

## Data Generation Process

The data generation follows these principles:

1. **Reproducibility**: Fixed random seed (42) ensures identical results
2. **Realistic Structure**: Data follows linear models with normally distributed errors
3. **Educational Purpose**: Known true parameters for learning and validation
4. **Multiple Scenarios**: Three datasets covering different regression types

For detailed information, see [DATA_GENERATION.md](DATA_GENERATION.md).

## Analysis Features

The analysis script provides:

- **Descriptive Statistics**: Summary statistics for all variables
- **Model Fitting**: Linear regression models with parameter estimates
- **Model Diagnostics**: R², residual analysis, coefficient significance
- **Visualization**: Scatter plots with regression lines
- **Comprehensive Output**: Detailed results for interpretation

## Expected Results

When running the analysis, you should observe:

### Simple Linear Regression
- R² ≈ 0.95-0.98 (strong linear relationship)
- Estimated slope ≈ 2.0 (close to true value)
- Estimated intercept ≈ 10.0 (close to true value)

### Multiple Regression
- R² ≈ 0.96-0.99 (strong fit)
- X1 coefficient ≈ 1.5
- X2 coefficient ≈ 0.8

### Categorical Regression
- R² ≈ 0.94-0.97
- Significant effects for both continuous and categorical predictors

## File Structure

```
regression-analysis-assignment/
│
├── README.md                    # This file
├── DATA_GENERATION.md           # Detailed documentation
│
├── generate_data.R              # Data generation script
├── analysis.R                   # Analysis script
│
├── data_simple.csv              # Simple regression data
├── data_multiple.csv            # Multiple regression data
└── data_categorical.csv         # Categorical regression data
```

## Contributing

This is an educational repository. For questions or improvements:
1. Review existing documentation
2. Check script comments
3. Verify your R installation and environment

## License

This project is created for educational purposes.

## Acknowledgments

- R Core Team for the R statistical computing environment
- Statistical methods based on standard regression analysis theory
