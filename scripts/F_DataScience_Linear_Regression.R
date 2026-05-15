# AUTHOR: Ralph Blancas
# PROJECT: Finals R Project
# CATEGORY: f. data science script 2
# DESCRIPTION: use linear regression to predict body mass from bill length
# EXPLANATION This script applies a simple linear regression model where body_mass_g 
#             is predicted using bill_length_mm. The output shows the model summary and
#             a sample prediction for a penguin with a 45 mm bill length. The script is meant to demonstrate a basic predictive workflow in R.

library(palmerpenguins)

# DATA PREPARATION
# remove missing values before modeling so the training data is explicit
model_data <- penguins[!is.na(penguins$body_mass_g) & !is.na(penguins$bill_length_mm), ]

# MODEL
# predict body mass using bill length as the explanatory variable
penguin_model <- lm(body_mass_g ~ bill_length_mm, data = model_data)
model_summary <- summary(penguin_model)

# OUTPUT
# show model results and test one prediction value
print(model_summary)

new_bill <- data.frame(bill_length_mm = 45)
predicted_mass <- predict(penguin_model, newdata = new_bill)

print(paste("Predicted body mass:", round(predicted_mass), "g"))
