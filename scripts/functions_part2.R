# Project: Finals R Project
# Category: d. Functions (Script 2)
# Description: this will calculate how much value deviates from the average

# calling the downloaded penguins dataset
library(palmerpenguins)

# creating function named calculate_deviation
# function(value,average_val)
#   value - specific number you want to compare
#   average_val - the benchmark youre comparing 
calculate_deviation <- function(value, average_val) {
  # simple subtraction
  # result > 0 means above average; result < 0 means below average
  deviation <- value - average_val
  return(deviation)
}

# ====== Testing the Function ======

# calculate the average body mass, ignoring NA value (handling null values by ignoring)
# 1. mean() -   built-in function to calcul8 the average
# 2. penguins$body_mass_g - the column NAME on the orig dataset
# 3. na.rm = TRUE - ignore the missing one and average what it was
avg_mass <- mean(penguins$body_mass_g, na.rm = TRUE)

# function to see how "heavy" the first 6 penguins are compared to average
# 1. calculate_deviation - named of the function created on the top of this file
# 2. penguins$body_mass_g, avg_mass
penguin_deviations <- calculate_deviation(penguins$body_mass_g, avg_mass)

# ====== VIEW RESULT ( 1ST 6 ROWS ONLY) ======
head(penguin_deviations)
# ====== end ======

# ====== CREATING THE SUMARRY TABLE ======

# data frame (table) to hold our results
# 1. summary_table - name of the new table
# 2. data.frame() - r's version of a table/spreedsheet
summary_table <- data.frame(
  Original_Weight = penguins$body_mass_g,
  Deviation = penguin_deviations,
  avg_mass = avg_mass
)

# Status column using conditional logic
# use a nested ifelse to handle Positive, Negative, and NA values
summary_table$Status <- ifelse(is.na(summary_table$Deviation), "Missing Data",
                               ifelse(summary_table$Deviation > 0, "Heavier than Average", 
                                      ifelse(summary_table$Deviation < 0, "Lighter than Average", 
                                             "Exactly Average")))

# 3. View the new organized table
head(summary_table)
#or summon the table
View(summary_table)


# ====== debug test ======
# run only the #1 for testing and debugging to show only the first 6 row
# 1. Show the first 6 original masses
head(penguins$body_mass_g)
# to see specfic number of rows
head(penguins_kg$body_mass_g, n = 15)
# to see all the rows in the dataset
length(penguins_kg$body_mass_g)

# 2. Show the average
avg_mass

# 3. Manual calculation for first 6
head(penguins$body_mass_g) - avg_mass
# ====== end ======

# ====== DEBUGGING NOTES ======
# You need to subtract the body_mass_g value of the first 6 row to the avg_mass value
# if the value display when you run the #3 on the result of the subtraction, thats GOOD RESULT
