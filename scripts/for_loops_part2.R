# Project: Finals R Project
# Category: a. For Loops (Script 2)
# Description: calculating means for all numeric columns while handling NA values

#call again the dataset we were using for this project
library(palmerpenguins)

# 1. choose the columns which isa numeric (start at col 3 then end on col 6)
numeric_cols <- names(penguins)[3:6]

# 2. loop through only the numeric columns
for (i in numeric_cols) {
  
  # mean calculation
  # na.rm = TRUE is CRITICAL: it tells R to ignore missing values
  col_mean <- mean(penguins[[i]], na.rm = TRUE)
  
  # rounded the result to 2 decimal places for better readability
  rounded_mean <- round(col_mean, 2)
  
  # Print the final report line
  print(paste("Average", i, ":", rounded_mean))
}
