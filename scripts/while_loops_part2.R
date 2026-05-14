# Project: Finals R Project
# Category: b. While Loops (Script 2)
# Description: finding the max, min, and average body mass, 
# plus identifying which row (penguin) holds those records.

library(palmerpenguins)

# ====== SETTING UP VARIABLES ======
# 1. i -make the i to start with 1
# 2. nrow(penguins) - get the bumber of rows the penguins datafreme have
#    and store it on total_rows
i <- 1
total_rows <- nrow(penguins)
# ========== END ==========

# ====== VAR WHERE WE STORE THE VALUES ======
# 1.max_mass is 0 bc any real penguin mass will be heavier than 0 
# 2.min_mass is Inf bc any real number is less than infinity, 
#   so first valid penguin automatically becomes min
# 3.total_mass is 0 it needs to start empty, and add each valid mass to it
# 4.count_valid is 0 it counts how nany penguins had valid di kasama mga na mass
max_mass <- 0
min_mass <- Inf
total_mass <- 0
count_valid <- 0
# ========== END ==========

# ====== VARIABLES TO STORE ROW NO. ======
max_row_index <- 0
min_row_index <- 0
# ========== END =========

# ========== START THE LOOPS ==========
while (i <= total_rows) {
  # it loops through boy_mass_g column name and store it in the current_val
  current_val <- penguins$body_mass_g[i]
  
  # HANDLE NA VALUES
  # !is.na() - check if theres no missing value and,
  # if it have missing value it skip them
  if (!is.na(current_val)) {
    
    # FINDING THE MAXIMUM
    # this checks first if the current_val is greater than max_mass,
    # who contains 0 value, then that row1 will be the first candidate,
    # and that candidate body mass value wil store on the max_mass,
    # it loops again and again until it finish and holds the biggest body mass
    if (current_val > max_mass) {
      max_mass <- current_val
      # save the row numver on that penguins who hold the records, it is to display after
      max_row_index <- i
    }
    
    # FINDING THE MIN
    if (current_val < min_mass) {
      min_mass <- current_val
      min_row_index <- i
    }
    
    # AVERAGE CALCULATION
    total_mass <- total_mass + current_val
    count_valid <- count_valid + 1
  }
  
  #incrementing
  i <- i + 1 
}

# 3. Final Calculations
avg_mass <- total_mass / count_valid

# ========== OUTPUT TESTING =========
print(paste("The HEAVIEST penguin is at row", max_row_index, "weighing", max_mass, "g"))
print(paste("The LIGHTEST penguin is at row", min_row_index, "weighing", min_mass, "g"))
print(paste("Average Weight of the colony:", round(avg_mass, 2), "g"))
