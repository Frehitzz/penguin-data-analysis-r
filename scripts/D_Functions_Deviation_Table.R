# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: d. functions script 2
# DESCRIPTION: calculate how much each body mass value differs from the average

library(palmerpenguins)

# FUNCTION
# reuse one calculation for every body mass value
calculate_deviation <- function(value, average_val) {
  value - average_val
}

# DATA PREPARATION
# use the average as the comparison point and keep missing data visible
avg_mass <- mean(penguins$body_mass_g, na.rm = TRUE)
penguin_deviations <- calculate_deviation(penguins$body_mass_g, avg_mass)

# SUMMARY TABLE
# classify each row based on whether it is above below or equal to the average
summary_table <- data.frame(
  Original_Weight = penguins$body_mass_g,
  Deviation = penguin_deviations,
  avg_mass = avg_mass
)

summary_table$Status <- ifelse(is.na(summary_table$Deviation), "Missing Data",
                               ifelse(summary_table$Deviation > 0, "Heavier than Average",
                                      ifelse(summary_table$Deviation < 0, "Lighter than Average",
                                             "Exactly Average")))

# OUTPUT
# preview the deviation values and the organized summary table
head(penguin_deviations)
head(summary_table)
avg_mass
