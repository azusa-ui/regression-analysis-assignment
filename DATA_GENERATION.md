# Data Generation Documentation

## Overview
This document provides comprehensive documentation of the data generation process for the regression analysis assignment. The data is synthetically generated to demonstrate various regression analysis techniques.

## Data Generation Methodology

### Script Information
- **Script Name**: `generate_data.R`
- **Purpose**: Generate synthetic datasets for regression analysis
- **Date Created**: 2026-01-04
- **Random Seed**: 42 (for reproducibility)

### Sample Size
All datasets contain **200 observations** to provide sufficient statistical power for regression analysis.

## Datasets Generated

### 1. Simple Linear Regression Data (`data_simple.csv`)

#### Description
This dataset demonstrates a simple linear relationship between one independent variable (X) and one dependent variable (Y).

#### Variables
- **X**: Independent variable (predictor)
  - Distribution: Normal distribution
  - Mean: 50
  - Standard Deviation: 10
  
- **Y**: Dependent variable (response)
  - Generated using the linear model: `Y = 10 + 2*X + ε`
  - Error term (ε): Normal distribution with mean 0 and SD 5

#### True Model Parameters
- **Intercept (β₀)**: 10
- **Slope (β₁)**: 2
- **Error Standard Deviation**: 5

#### Use Case
This dataset is ideal for:
- Learning basic linear regression concepts
- Understanding parameter estimation
- Practicing residual analysis
- Visualizing linear relationships

---

### 2. Multiple Regression Data (`data_multiple.csv`)

#### Description
This dataset includes multiple independent variables to demonstrate multiple regression analysis.

#### Variables
- **X1**: First independent variable
  - Distribution: Normal distribution
  - Mean: 50
  - Standard Deviation: 10

- **X2**: Second independent variable
  - Distribution: Normal distribution
  - Mean: 30
  - Standard Deviation: 8

- **Y**: Dependent variable
  - Generated using: `Y = 5 + 1.5*X1 + 0.8*X2 + ε`
  - Error term (ε): Normal distribution with mean 0 and SD 4

#### True Model Parameters
- **Intercept (β₀)**: 5
- **X1 Coefficient (β₁)**: 1.5
- **X2 Coefficient (β₂)**: 0.8
- **Error Standard Deviation**: 4

#### Use Case
This dataset is ideal for:
- Multiple regression analysis
- Understanding partial effects
- Studying multicollinearity (when applicable)
- Comparing simple vs. multiple regression

---

### 3. Categorical Data (`data_categorical.csv`)

#### Description
This dataset includes a categorical variable to demonstrate regression with categorical predictors.

#### Variables
- **X**: Continuous independent variable
  - Distribution: Normal distribution
  - Mean: 50
  - Standard Deviation: 10

- **Category**: Categorical variable with three levels
  - Levels: A, B, C
  - Distribution: Uniform (randomly assigned)

- **Y**: Dependent variable
  - Generated using: `Y = 15 + 2.5*X + 1.2*Category_effect + ε`
  - Category effect is numeric encoding (A=1, B=2, C=3)
  - Error term (ε): Normal distribution with mean 0 and SD 6

#### True Model Parameters
- **Intercept (β₀)**: 15
- **X Coefficient (β₁)**: 2.5
- **Category Effect Coefficient**: 1.2
- **Error Standard Deviation**: 6

#### Use Case
This dataset is ideal for:
- ANOVA and ANCOVA
- Dummy variable regression
- Categorical data analysis
- Comparing groups with continuous predictors

---

## Data Generation Process

### Step 1: Environment Setup
```r
# Set random seed for reproducibility
set.seed(42)

# Define sample size
n <- 200
```

### Step 2: Generate Independent Variables
Independent variables are generated from normal distributions with specified parameters:
```r
X <- rnorm(n, mean = 50, sd = 10)
X2 <- rnorm(n, mean = 30, sd = 8)
```

### Step 3: Generate Error Terms
Error terms follow normal distributions with mean 0:
```r
epsilon <- rnorm(n, mean = 0, sd = 5)
```

### Step 4: Calculate Dependent Variables
Dependent variables are calculated using linear models with known parameters:
```r
Y <- beta_0 + beta_1 * X + epsilon
```

### Step 5: Export to CSV
Data is exported to CSV files for analysis:
```r
write.csv(data, "data_simple.csv", row.names = FALSE)
```

## Reproducibility

### Ensuring Reproducibility
1. **Fixed Random Seed**: Using `set.seed(42)` ensures that the same random numbers are generated each time
2. **Documented Parameters**: All distribution parameters are clearly documented
3. **Version Control**: All scripts are version-controlled in the repository

### Regenerating Data
To regenerate the exact same datasets:
```bash
Rscript generate_data.R
```

This will overwrite existing CSV files with identical data (assuming the same R version).

## Data Quality Checks

### Expected Properties
1. **Sample Size**: Each dataset should have exactly 200 observations
2. **No Missing Values**: Generated data contains no missing values
3. **Distribution**: Variables follow specified normal distributions
4. **Linear Relationships**: Y variables should show strong linear relationships with predictors

### Verification
Run the analysis script to verify data quality:
```bash
Rscript analysis.R
```

Expected R² values:
- Simple regression: ~0.94-0.98
- Multiple regression: ~0.95-0.99
- Categorical regression: ~0.93-0.97

## Technical Details

### Software Requirements
- **R**: Version 4.0 or higher recommended
- **Base R**: All data generation uses base R functions (no additional packages required)

### File Format
- **Format**: CSV (Comma-Separated Values)
- **Encoding**: UTF-8
- **Header**: First row contains variable names
- **Delimiter**: Comma (,)
- **Decimal**: Period (.)

## Assumptions and Limitations

### Assumptions
1. **Linearity**: True relationships are linear
2. **Normality**: Errors are normally distributed
3. **Homoscedasticity**: Error variance is constant
4. **Independence**: Observations are independent

### Limitations
1. **Synthetic Data**: Data is artificial and may not reflect real-world complexity
2. **No Outliers**: Generated data contains no extreme outliers by design
3. **Perfect Model Specification**: True model form is known (not typical in practice)

## Contact and Support

For questions or issues with data generation:
1. Review this documentation
2. Check the `generate_data.R` script comments
3. Verify R installation and version
4. Ensure write permissions in the directory

## References

- R Core Team. R: A Language and Environment for Statistical Computing
- Statistical Regression Analysis Methods
- Monte Carlo Simulation for Statistical Education
