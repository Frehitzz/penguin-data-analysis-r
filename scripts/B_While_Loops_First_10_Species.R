# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: b. while loops script 1
# DESCRIPTION: use a counter to print the first 10 species from the dataset

library(palmerpenguins)

# SETUP
# limit the loop to the first 10 rows while staying safe for smaller datasets
i <- 1
row_limit <- min(10, nrow(penguins))

# WHILE LOOP
# print one species per row until the requested limit is reached
while (i <= row_limit) {
  current_species <- as.character(penguins$species[i])

  print(paste("Penguin number", i, "is an", current_species))

  i <- i + 1
}
