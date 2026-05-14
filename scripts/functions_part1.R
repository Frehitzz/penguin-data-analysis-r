# Project: Finals R Project
# Category: d. Functions (Script 1)
# Description: this function will convert grams to kilograms for easier reading

# calling the downloaded penguins dataset
library(palmerpenguins)

# convert_to_kg is a function name
#function(grams) - declaring its a function with an input parameter named grams
convert_to_kg <- function(grams) {
  
  #it takes the gram(inputvalue) and divide it to 1000 then put it to kg
  #1000 grams = 1kg
  kg <- grams / 1000
  
  return(kg) #sends the calculated kg to the function
}

# makes a copy of the original penguins dataset
# instead of modifying, i create a copy, bc never overwrite the original data
# so that if i mess up i can go back to the original and clean dataset
penguins_kg <- penguins

# penguins$body_mass_g - the original named of the column on the penguin dataset
# convert_to_kg() - call the created function, then putting the body mass column
# that will be the value of the input to convert the body mass gram to kilogram
# penguins_kg$body_mass_kg  - creates a new column(body_mass_kg) on the copid dataset penguins_kg
penguins_kg$body_mass_kg <- convert_to_kg(penguins$body_mass_g)


# ========== OUTPUT TESTING =========
# check the result
head(penguins_kg$body_mass_kg)
head(penguins_kg)

#view table for testing
View(penguins_kg)
