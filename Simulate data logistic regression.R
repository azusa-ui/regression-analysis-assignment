# The R syntax for datasets was generated using Generative AI (ChatGPT 5.2) to emulate realistic epidemiological structures.The resulting dataset was then saved in CSV file format for subsequent analysis.
# 
# -   Generate synthetic depression dataset (n=200)
# 
# -   Depression: binary ("depressed" / "not depressed")
# 
# -   Years of working: 0-40
# 
# -   Physical activity score: 0-10
# 
# -   Obesity factor (2 levels)
# 
# -   Interaction: phys_activity \* obesity

# ============================================================
# Generate synthetic depression dataset (n=200)
# - depression: binary ("depressed" / "not depressed")
# - years_working: 0-40
# - phys_activity: 0-10
# - obesity factor (2 levels)
# - Interaction: phys_activity * obesity
# ============================================================

library(dplyr)
library(tibble)

set.seed(3030)
n <- 200

# Generate predictors
data_sim <- tibble(
  years_working = round(runif(n, 0, 40), 1),
  phys_activity = round(runif(n, 0, 10), 1),
  obesity = sample(c("obese", "not obese"), n, replace = TRUE, prob = c(0.3, 0.7))
) %>%
  mutate(
    obese_bin = ifelse(obesity == "obese", 1, 0),
    years_working_c = years_working - mean(years_working),
    phys_activity_c = phys_activity - mean(phys_activity)
  )

# Coefficients tuned for significance and realistic ORs
b0 <- -2.0        # intercept (~25% prevalence)
b1 <- 0.08        # years_working  
b2 <- -0.2       # PA main effect  
b3 <- 0.2        # obesity main effect  
b4 <- -0.3       # PA × obesity interaction  

# Generate outcome probabilities with clamping
data_sim <- data_sim %>%
  mutate(
    logit_p = b0 +
      b1 * years_working_c +
      b2 * phys_activity_c +
      b3 * obese_bin +
      b4 * phys_activity_c * obese_bin,
    prob_raw = plogis(logit_p),
    prob = pmin(pmax(prob_raw, 0.05), 0.95),  # clamp to avoid separation
    depression = if_else(runif(n) < prob, "depressed", "not depressed")
  ) %>%
  dplyr::select(depression, years_working, phys_activity, obesity)

# Save dataset
write.csv(data_sim, "data_log2.csv", row.names = FALSE)