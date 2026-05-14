# Project: Finals R Project
# Category: c. Repeat Loops (Script 2)
# Description: accumulate bill lengths until total sum reaches 200mm
# THIS SCRIPT ANSWERS: "How many penguins do I need to line up before 
                      # their combined bill lengths hit 200mm?"

library(palmerpenguins)

# ====== SET UP VARIABLES ======
total_bill <- 0 # running sum of bill lengths
i <- 1 # current row number
count_penguins <- 0 # calculate how many valid(no NA) penguins contributed
penguin_log <- c() # empty vector to store row numbers of used penguins
# ========== END =========


repeat {
  bill_val <- penguins$bill_length_mm[i]
  
  #IT NEEDS TO BE FIRST BECAUSE IF ALL OF THIS DATA 
  #IS LESS THAN THE 200MM, IT WILL HAVE INFINITE LOOP
  # ====== SAFETY BREAK ======
  # prevent infinite loop if threshold never reached
  if (i > nrow(penguins)) {
    print(paste("WARNING: Checked all", nrow(penguins), "rows."))
    print(paste("Final total:", round(total_bill, 2), "mm (target was 200mm)"))
    print(paste("Valid penguins used:", count_penguins))
    break
  }
  # ====== END ======
  
  # Only add valid (non-NA) measurements
  if (!is.na(bill_val)) {
    total_bill <- total_bill + bill_val
    count_penguins <- count_penguins + 1
    penguin_log <- c(penguin_log, i)
  }
  
  # Primary stop condition: threshold reached
  if (total_bill >= 200) {
    avg_bill <- total_bill / count_penguins
    
    print(paste("SUCCESS: Total bill length reached", round(total_bill, 2), "mm"))
    print(paste("Penguins used:", count_penguins, "(rows:", paste(penguin_log, collapse = ", "), ")"))
    print(paste("Stopped at row:", i))
    print(paste("Average bill length:", round(avg_bill, 2), "mm"))
    break
  }
  
  i <- i + 1
}
