#!/usr/bin/env Rscript

# Data Generation Script for Regression Analysis Assignment
# This script generates synthetic data for regression analysis purposes
# Author: Regression Analysis Assignment Team
# Date: 2026-01-04

# Set seed for reproducibility
set.seed(42)

# Define sample size
n <- 200

# Generate independent variable (X)
# X represents a predictor variable with normal distribution
X <- rnorm(n, mean = 50, sd = 10)

# Generate error term
# Error follows normal distribution with mean 0
epsilon <- rnorm(n, mean = 0, sd = 5)

# Generate dependent variable (Y) with linear relationship
# True model: Y = 10 + 2*X + epsilon
beta_0 <- 10  # Intercept
beta_1 <- 2   # Slope
Y <- beta_0 + beta_1 * X + epsilon

# Create data frame
data <- data.frame(
  X = X,
  Y = Y
)

# Add additional variables for multiple regression
# Second predictor variable
X2 <- rnorm(n, mean = 30, sd = 8)
epsilon2 <- rnorm(n, mean = 0, sd = 4)
# Y2 with multiple predictors: Y2 = 5 + 1.5*X + 0.8*X2 + epsilon2
Y2 <- 5 + 1.5 * X + 0.8 * X2 + epsilon2

# Extended data frame with multiple predictors
data_multiple <- data.frame(
  X1 = X,
  X2 = X2,
  Y = Y2
)

# Generate categorical data for analysis
categories <- sample(c("A", "B", "C"), n, replace = TRUE)
X3 <- ifelse(categories == "A", 1, 
              ifelse(categories == "B", 2, 3))
epsilon3 <- rnorm(n, mean = 0, sd = 6)
Y3 <- 15 + 2.5 * X + 1.2 * X3 + epsilon3

data_categorical <- data.frame(
  X = X,
  Category = categories,
  Y = Y3
)

# Save datasets to CSV files
write.csv(data, "data_simple.csv", row.names = FALSE)
write.csv(data_multiple, "data_multiple.csv", row.names = FALSE)
write.csv(data_categorical, "data_categorical.csv", row.names = FALSE)

# Print summary statistics
cat("Data Generation Complete!\n")
cat("=========================\n\n")

cat("Simple Linear Regression Data (data_simple.csv):\n")
cat("Sample size:", n, "\n")
cat("True model: Y = 10 + 2*X + epsilon\n")
cat("X statistics: Mean =", mean(X), ", SD =", sd(X), "\n")
cat("Y statistics: Mean =", mean(Y), ", SD =", sd(Y), "\n\n")

cat("Multiple Regression Data (data_multiple.csv):\n")
cat("Sample size:", n, "\n")
cat("True model: Y = 5 + 1.5*X1 + 0.8*X2 + epsilon\n\n")

cat("Categorical Data (data_categorical.csv):\n")
cat("Sample size:", n, "\n")
cat("Categories:", unique(categories), "\n")
cat("True model: Y = 15 + 2.5*X + 1.2*Category_effect + epsilon\n\n")

cat("All data files have been generated successfully!\n")
