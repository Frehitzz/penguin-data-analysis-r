# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: d. functions script 1
# DESCRIPTION: convert body mass from grams to kilograms for easier reading

library(palmerpenguins)

# FUNCTION
# keep the conversion reusable instead of repeating the formula in the script
convert_to_kg <- function(grams) {
  grams / 1000
}

# DATA PREPARATION
# create a copy so the original dataset remains unchanged
penguins_kg <- penguins
penguins_kg$body_mass_kg <- convert_to_kg(penguins$body_mass_g)

# OUTPUT
# preview the converted column and updated table
head(penguins_kg$body_mass_kg)
head(penguins_kg)
