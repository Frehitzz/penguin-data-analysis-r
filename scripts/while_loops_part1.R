# Project: Finals R Project
# Category: b. While Loops (Script 1)
# Description: using a counter to print the first 10 species from the dataset

library(palmerpenguins)

# setting the i var to a value of 1
i <- 1

# the loop runs as long as it checks the row of the penguins dataset
# 1.nrow - number of rows
while (i <= nrow(penguins)) {
  
  # Get the species of the penguin at row 'i'
  # 1.penguins$species[i] - the species column
  # 2.[i] - 'row index', get the value at row i
  # 3.as.character() - this convert factor to plain text, uses this to have clean and readable output
  # 4.current_species - newly added var that holds the value of the species
  current_species <- as.character(penguins$species[i])
  
  print(paste("Penguin number", i, "is an", current_species))
  
  # CRITICAL: Increase the counter or the loop will run forever!
  #incrementing
  i <- i + 1
}
  
