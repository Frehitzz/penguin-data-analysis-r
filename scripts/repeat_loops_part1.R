# Project: Finals R Project
# Category: c. Repeat Loops (Script 1)
# Description: a repeat loop to find the first penguin from Dream island

library(palmerpenguins)

# starting position begin checking at row 1
row_num <- 1

repeat {
  # get the island name for the current row
  # we need this code for us to know what/where no. of row doesthe dream island is
  # [row_num] - get the value of the current row
  # as.character() - convert factor type to plain text
  # current_island is the on holding the value of eahc row
  current_island <- as.character(penguins$island[row_num])
  
  # to make the current_island is find the dream value
  if (current_island == "Dream") {
    print(paste("Found the first Dream island penguin at row:", row_num))
    break  # a stoping function for the repeat loop
  }
  
  # increment to move to the next row
  row_num <- row_num + 1
  
  # !!!!! FOR SAFETY: THIS WILL STOP IF WE GO PAST THE END OF THE DATASET
  if (row_num > nrow(penguins)) {
    print("Reached the end of the data without finding it.")
    break
  }
}

