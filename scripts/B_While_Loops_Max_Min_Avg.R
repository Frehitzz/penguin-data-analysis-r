# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: b. while loops script 2
# DESCRIPTION: find the max min and average body mass with row records

library(palmerpenguins)

# SETUP
# initialize loop counters and storage for valid body mass records
i <- 1
total_rows <- nrow(penguins)

max_mass <- -Inf
min_mass <- Inf
total_mass <- 0
count_valid <- 0
max_row_index <- 0
min_row_index <- 0

# WHILE LOOP
# skip missing values while tracking summary statistics manually
while (i <= total_rows) {
  current_val <- penguins$body_mass_g[i]

  if (!is.na(current_val)) {
    if (current_val > max_mass) {
      max_mass <- current_val
      max_row_index <- i
    }

    if (current_val < min_mass) {
      min_mass <- current_val
      min_row_index <- i
    }

    total_mass <- total_mass + current_val
    count_valid <- count_valid + 1
  }

  i <- i + 1
}

# OUTPUT
# guard against empty or fully missing data before calculating the average
if (count_valid == 0) {
  print("No valid body mass values were found.")
} else {
  avg_mass <- total_mass / count_valid

  print(paste("The HEAVIEST penguin is at row", max_row_index, "weighing", max_mass, "g"))
  print(paste("The LIGHTEST penguin is at row", min_row_index, "weighing", min_mass, "g"))
  print(paste("Average Weight of the colony:", round(avg_mass, 2), "g"))
}
