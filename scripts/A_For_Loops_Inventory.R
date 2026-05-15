# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: a. for loops script 1
# DESCRIPTION: automate the data inventory check by looping through columns

library(palmerpenguins)

# SETUP
# store column names so the loop can inspect every variable in the dataset
penguin_columns <- names(penguins)

# FOR LOOP
# print the data type of each column for a quick inventory check
for (col in penguin_columns) {
  type <- class(penguins[[col]])

  print(paste("The column", col, "contains", type, "data."))
}
