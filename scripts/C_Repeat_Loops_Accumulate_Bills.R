# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: c. repeat loops script 2
# DESCRIPTION: accumulate bill lengths until the total reaches 200 mm

library(palmerpenguins)

# SETUP
# track total bill length and the rows that contributed valid measurements
total_bill <- 0
i <- 1
count_penguins <- 0
penguin_log <- c()

# REPEAT LOOP
# stop when the target is reached or all rows have been checked
repeat {
  if (i > nrow(penguins)) {
    print(paste("WARNING: Checked all", nrow(penguins), "rows."))
    print(paste("Final total:", round(total_bill, 2), "mm (target was 200mm)"))
    print(paste("Valid penguins used:", count_penguins))
    break
  }

  bill_val <- penguins$bill_length_mm[i]

  if (!is.na(bill_val)) {
    total_bill <- total_bill + bill_val
    count_penguins <- count_penguins + 1
    penguin_log <- c(penguin_log, i)
  }

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
