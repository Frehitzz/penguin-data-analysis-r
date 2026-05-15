# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: c. repeat loops script 1
# DESCRIPTION: use a repeat loop to find the first penguin from dream island

library(palmerpenguins)

# SETUP
# start at the first row and move forward until dream island is found
row_num <- 1

# REPEAT LOOP
# include a safety stop in case the target island is not present
repeat {
  current_island <- as.character(penguins$island[row_num])

  if (current_island == "Dream") {
    print(paste("Found the first Dream island penguin at row:", row_num))
    break
  }

  row_num <- row_num + 1

  if (row_num > nrow(penguins)) {
    print("Reached the end of the data without finding it.")
    break
  }
}
