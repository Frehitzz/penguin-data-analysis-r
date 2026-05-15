# Project: Finals R Project
# Category: e. Data Visualization (Script 2)
# Description: Correlation between Flipper Length and Bill Length

library(palmerpenguins)
library(ggplot2)


ggplot(data = penguins, aes(x = flipper_length_mm, y = bill_length_mm)) +
  
  #geom_point - type of chart we will use for this
  # use a color and species to improve readingness of the charts
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  #method ="lm" - linear model
  geom_smooth(method = "lm", color = "black", linetype = "dashed") +
  labs(
    title = "Flipper Length vs. Bill Length",
    x = "Flipper Length (mm)",
    y = "Bill Length (mm)",
    color = "Species",
    shape = "Species"
  ) +
  theme_light()
