#!/usr/bin/env Rscript

# Regression Analysis Script
# This script performs comprehensive regression analysis on the generated data
# Author: Regression Analysis Assignment Team
# Date: 2026-01-04

# Load required libraries (optional for enhanced features)
# The script works with base R, but can use additional packages if available
# If you want to install optional packages, uncomment the following lines:
# install.packages("ggplot2")

# Try to load ggplot2, but continue if not available
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  cat("Note: ggplot2 package not found. Using base R graphics.\n")
  cat("For enhanced plots, install with: install.packages('ggplot2')\n\n")
}

# Function to perform simple linear regression analysis
analyze_simple_regression <- function(data_file) {
  cat("\n==================================================\n")
  cat("SIMPLE LINEAR REGRESSION ANALYSIS\n")
  cat("==================================================\n\n")
  
  # Load data
  data <- read.csv(data_file)
  
  cat("Data loaded from:", data_file, "\n")
  cat("Number of observations:", nrow(data), "\n\n")
  
  # Summary statistics
  cat("Summary Statistics:\n")
  print(summary(data))
  cat("\n")
  
  # Fit linear regression model
  model <- lm(Y ~ X, data = data)
  
  # Print model summary
  cat("Regression Model Summary:\n")
  print(summary(model))
  cat("\n")
  
  # Extract coefficients
  cat("Model Coefficients:\n")
  cat("Intercept:", coef(model)[1], "\n")
  cat("Slope:", coef(model)[2], "\n\n")
  
  # R-squared value
  cat("R-squared:", summary(model)$r.squared, "\n")
  cat("Adjusted R-squared:", summary(model)$adj.r.squared, "\n\n")
  
  # Residual analysis
  cat("Residual Statistics:\n")
  cat("Mean of residuals:", mean(residuals(model)), "\n")
  cat("SD of residuals:", sd(residuals(model)), "\n\n")
  
  # Create scatter plot with regression line
  plot_file <- gsub(".csv", "_plot.png", data_file)
  png(plot_file, width = 800, height = 600)
  plot(data$X, data$Y, 
       main = "Simple Linear Regression",
       xlab = "X", ylab = "Y",
       pch = 19, col = "blue")
  abline(model, col = "red", lwd = 2)
  legend("topleft", 
         legend = paste("Y =", round(coef(model)[1], 2), "+", 
                       round(coef(model)[2], 2), "* X"),
         col = "red", lwd = 2, bty = "n")
  dev.off()
  cat("Plot saved to:", plot_file, "\n")
  
  return(model)
}

# Function to perform multiple regression analysis
analyze_multiple_regression <- function(data_file) {
  cat("\n==================================================\n")
  cat("MULTIPLE REGRESSION ANALYSIS\n")
  cat("==================================================\n\n")
  
  # Load data
  data <- read.csv(data_file)
  
  cat("Data loaded from:", data_file, "\n")
  cat("Number of observations:", nrow(data), "\n\n")
  
  # Summary statistics
  cat("Summary Statistics:\n")
  print(summary(data))
  cat("\n")
  
  # Fit multiple regression model
  model <- lm(Y ~ X1 + X2, data = data)
  
  # Print model summary
  cat("Multiple Regression Model Summary:\n")
  print(summary(model))
  cat("\n")
  
  # Extract coefficients
  cat("Model Coefficients:\n")
  cat("Intercept:", coef(model)[1], "\n")
  cat("X1 coefficient:", coef(model)[2], "\n")
  cat("X2 coefficient:", coef(model)[3], "\n\n")
  
  # R-squared values
  cat("R-squared:", summary(model)$r.squared, "\n")
  cat("Adjusted R-squared:", summary(model)$adj.r.squared, "\n\n")
  
  return(model)
}

# Function to analyze categorical data
analyze_categorical <- function(data_file) {
  cat("\n==================================================\n")
  cat("REGRESSION WITH CATEGORICAL VARIABLES\n")
  cat("==================================================\n\n")
  
  # Load data
  data <- read.csv(data_file)
  
  cat("Data loaded from:", data_file, "\n")
  cat("Number of observations:", nrow(data), "\n\n")
  
  # Summary statistics
  cat("Summary Statistics:\n")
  print(summary(data))
  cat("\n")
  
  # Fit regression model with categorical variable
  model <- lm(Y ~ X + Category, data = data)
  
  # Print model summary
  cat("Regression Model with Categorical Variable:\n")
  print(summary(model))
  cat("\n")
  
  # R-squared values
  cat("R-squared:", summary(model)$r.squared, "\n")
  cat("Adjusted R-squared:", summary(model)$adj.r.squared, "\n\n")
  
  return(model)
}

# Main analysis execution
cat("========================================\n")
cat("REGRESSION ANALYSIS ASSIGNMENT\n")
cat("========================================\n")
cat("Starting comprehensive regression analysis...\n")

# Check if data files exist
if (!file.exists("data_simple.csv")) {
  cat("\nError: Data files not found!\n")
  cat("Please run generate_data.R first to create the data files.\n")
  stop("Data files missing")
}

# Perform analyses
model1 <- analyze_simple_regression("data_simple.csv")
model2 <- analyze_multiple_regression("data_multiple.csv")
model3 <- analyze_categorical("data_categorical.csv")

# Final summary
cat("\n========================================\n")
cat("ANALYSIS COMPLETE\n")
cat("========================================\n")
cat("All regression analyses have been completed successfully!\n")
cat("Review the output above for detailed results.\n")
