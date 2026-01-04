# The R syntax for datasets were generated using Generative AI (ChatGPT 5.2) to emulate realistic epidemiological structures, including:
#   
#   -   Generate synthetic qol dataset (n=200)
# 
# -   QoL: 0-100
# 
# -   Years of Working: 0-40
# 
# -   Physical Activity Score : 0-10
# 
# -   Obesity factor (2 levels)
# 
# -   Interaction: PhysActivity \* Obesity
# 
# -   Plausible effect sizes
# 
# -   Interaction between physical activity and obesity
# 
# -   Deliberately inserted influential observations for diagnostic demonstration
# 
# The dataset then was saved in csv file format.

# ============================================================
# Generate synthetic qol dataset (n=200)
# - qol: 0-100
# - YearsWorking: 0-40
# - PhysActivity: 0-10
# - Obesity factor (2 levels)
# - Interaction: PhysActivity * Obesity
# - Random influential observations
# ============================================================

library(dplyr)
library(tibble)

set.seed(999)
n <- 200

# -----------------------------
# Generate covariates
# -----------------------------
datar <- tibble(
  years_working = runif(n, 0, 40),
  phys_activity = runif(n, 0, 10),
  obesity = sample(c("obese", "not obese"), n, replace = TRUE, prob = c(0.35, 0.65))
) %>%
  mutate(obese_bin = if_else(obesity == "obese", 1, 0))

# -----------------------------
# Outcome with interaction
# -----------------------------
coefs <- list(beta0 = 75, beta_yr = -0.4, beta_pa = 3.0, beta_ob = -15, beta_int = -3)
sigma <- 6

datar <- datar %>%
  mutate(qol = coefs$beta0 +
           coefs$beta_yr * years_working +
           coefs$beta_pa * phys_activity +
           coefs$beta_ob * obese_bin +
           coefs$beta_int * phys_activity * obese_bin +
           rnorm(n, 0, sigma)) %>%
  mutate(qol = pmin(pmax(qol, 0), 100)) %>%
  dplyr::select(qol, years_working, phys_activity, obesity)

# -----------------------------
# Inject influential observations
# -----------------------------
infl_idx <- sample(1:n, 6)

datar <- datar %>%
  mutate(
    qol = replace(qol, infl_idx, c(95, 15, 90, 10, 5, 98)),
    years_working = replace(years_working, infl_idx, c(40, 0, 39.5, 38.8, 1.0, 0.5)),
    phys_activity = replace(phys_activity, infl_idx, c(0, 10, 9.8, 0.2, 9.9, 0.1)),
    obesity = replace(obesity, infl_idx, c("obese", "not obese", "obese", "not obese", "obese", "not obese"))
  )

# -----------------------------
# Shuffle rows
# -----------------------------
datar <- datar %>% slice_sample(prop = 1)

# -----------------------------
# Save dataset
# -----------------------------

write.csv(datar, "data_lm.csv", row.names = FALSE)
