# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: e. data visualization script 2
# DESCRIPTION: show the relationship between flipper length and bill length
# EXPLANATION: this graph shows the relationship between flipper length and bill length across penguin records
#              the upward trend suggests that penguins with longer flippers also tend to have longer bills in this dataset
#              the species colors and shapes help show that the pattern is shared across groups while still revealing variation between species

library(palmerpenguins)
library(ggplot2)

# DATA PREPARATION
# remove missing measurements before plotting the relationship
penguins_measurements <- penguins[
  !is.na(penguins$flipper_length_mm) & !is.na(penguins$bill_length_mm),
]

# VISUALIZATION
# use points and a linear trend line to make the relationship easier to interpret
ggplot(data = penguins_measurements, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", color = "black", linetype = "dashed") +
  labs(
    title = "Flipper Length vs. Bill Length",
    subtitle = "longer flippers generally match longer bills in the sample",
    x = "Flipper Length (mm)",
    y = "Bill Length (mm)",
    color = "Species",
    shape = "Species"
  ) +
  theme_light()

# EXPLANATION
# this graph shows the relationship between flipper length and bill length across penguin records
# the upward trend suggests that penguins with longer flippers also tend to have longer bills in this dataset
# the species colors and shapes help show that the pattern is shared across groups while still revealing variation between species
