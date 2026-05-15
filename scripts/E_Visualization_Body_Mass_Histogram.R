# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: e. data visualization script 1
# DESCRIPTION: show the distribution of body mass by species using ggplot2

library(palmerpenguins)
library(ggplot2)

# DATA PREPARATION
# remove missing body mass values before plotting to avoid warning messages
penguins_body_mass <- penguins[!is.na(penguins$body_mass_g), ]

# VISUALIZATION
# compare species distributions with overlapping histogram bars
ggplot(data = penguins_body_mass, aes(x = body_mass_g, fill = species)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  scale_fill_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
  labs(
    title = "Penguin Body Mass Distribution",
    subtitle = "Analysis of Adelie, Chinstrap, and Gentoo Species",
    x = "Body Mass (g)",
    y = "Frequency",
    fill = "Species"
  ) +
  theme_minimal()
