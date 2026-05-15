# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: a. for loops script 2
# DESCRIPTION: calculate means for all numeric columns while handling missing values

library(palmerpenguins)

# SETUP
# select numeric measurement columns without depending on their position
numeric_cols <- names(penguins)[sapply(penguins, is.numeric)]
numeric_cols <- setdiff(numeric_cols, "year")

# FOR LOOP
# calculate each average while ignoring missing values
for (i in numeric_cols) {
  col_mean <- mean(penguins[[i]], na.rm = TRUE)
  rounded_mean <- round(col_mean, 2)

  print(paste("Average", i, ":", rounded_mean))
}
