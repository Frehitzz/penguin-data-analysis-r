# Project: Finals R Project
# Category: f. Data Science (Script 2)
# Description: using Linear Regression to predict Body Mass.

library(palmerpenguins)

# 1. create the Linear Model (lm)
# formula: y ~ x (body mass depends on bill length)
penguin_model <- lm(body_mass_g ~ bill_length_mm, data = penguins)

# 2. get the statistical summary
model_summary <- summary(penguin_model)

# 3. print the results
print(model_summary)

#========================================
# PREDICTION TESTING
#========================================
# predict mass for a penguin with 45mm bill
new_bill <- data.frame(bill_length_mm = 45)
predicted_mass <- predict(penguin_model, newdata = new_bill)

print(paste("Predicted body mass:", round(predicted_mass), "g"))
