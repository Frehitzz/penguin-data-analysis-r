# Project: Finals R Project
# Category: e. Data Visualization (Script 1)
# Description: Distribution of Body Mass by Species using ggplot2

library(palmerpenguins)
library(ggplot2)

# ====== CREATING THE PLOT ======
# data - dataset you will use
# aes() - aesthetics = maps data columns to visual properties
# x = body_mass_g - put the body mass column on the horizontal axis
# fill = species - color the bars differently for each species(columns on your datset)
ggplot(data = penguins, aes(x = body_mass_g, fill = species)) +
  
  # COUNTS HOW MANY PENGUINS FALL INTO EACH bin/range of body mass, then create a bars for them
  # geom_histogram() - built-in functions that automatically display the frequency, and it tell this is the chart we will use
  #alpha = 0.6 - transparency
    # why 0.6? - let overlap the bars colors and mix the colors
  #position = "identity" - make the bars overlap to each other
  # bins = 30 - bins is how many bars the histogram has
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  
  #putting custom colors
  # scale_fill_manualy() - its like saying " iwant to set manually the color
  # values =c() - named victor, the value you have on your species column
  scale_fill_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
  
  #labels
  labs(
    title = "Penguin Body Mass Distribution",
    subtitle = "Analysis of Adelie, Chinstrap, and Gentoo Species",
    x = "Body Mass (g)",
    y = "Frequency",
    fill = "Species"
  ) +
  theme_minimal()

