# Project: Finals R Project
# Category: a. For Loops (Script 1)
# Description: automate the data inventory check by looping through columns

# calling again the dataset we are using
library(palmerpenguins)

# ====== get a list of all column names ======
# 1.names() - built-in function that returns all column name as vector
# 2.penguins - name of the dataframe(table)
# 3.penguin_columns - a newly declared variable that contains all of the
#   column names of the dataframe(table)
penguin_columns <- names(penguins)
# ========== end ==========

# ========== Start the loop ==========
# 'col' is a placeholder that changes to the next column name in each turn
# 1.for - keyword that starts a loop
# 2.col - loopvariable = a placeholder that changes each round, you can name it any
# 3.in - a keyword that takes the value of penguin_columns
# 4.penguin_columns - the variable that contains the name of the column of the table
for (col in penguin_columns) {
  
  # identify the data type (numeric, factor, etc.)
  # 1.peguins[[col]] - extracts the entire column named by col
  # 2.class() - built-in functions that tells the data type returns (numeric,factor,etc)
  # 3. type - is a added variable that will hold the value of the column with data type
  type <- class(penguins[[col]])
  
  # Output the result to the console
  # paste() combines the text and variables into one sentence
  print(paste("The column", col, "contains", type, "data."))
}
