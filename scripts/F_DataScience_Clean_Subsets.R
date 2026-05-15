# AUTHOR: Fritz Harly G. Degamo
# PROJECT: Finals R Project
# CATEGORY: f. data science script 1
# DESCRIPTION: clean the data and compare species-level summaries
# EXPLANATION: This script cleans the penguin data by removing missing values and splitting the dataset into 
#              separate subsets for Adelie, Chinstrap, and Gentoo. It then creates a comparison table and 
#              reshapes the result for plotting. The goal is to make species-level differences easier to inspect

library(palmerpenguins)
library(tidyverse)

# DATA CLEANING
# create one clean subset per species using the same selected variables
gentoo_clean <- penguins %>%
  filter(species == "Gentoo") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

cat("Gentoo clean rows:", nrow(gentoo_clean), "\n")
summary(gentoo_clean)

adelie_clean <- penguins %>%
  filter(species == "Adelie") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

cat("Adelie clean rows:", nrow(adelie_clean), "\n")
summary(adelie_clean)

chinstrap_clean <- penguins %>%
  filter(species == "Chinstrap") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

cat("Chinstrap clean rows:", nrow(chinstrap_clean), "\n")
summary(chinstrap_clean)

# SUMMARY TABLE
# compare sample size average bill length and average body mass by species
species_summary <- data.frame(
  Species = c("Adelie", "Chinstrap", "Gentoo"),
  Count = c(nrow(adelie_clean), nrow(chinstrap_clean), nrow(gentoo_clean)),
  Avg_Bill_Length = c(
    mean(adelie_clean$bill_length_mm),
    mean(chinstrap_clean$bill_length_mm),
    mean(gentoo_clean$bill_length_mm)
  ),
  Avg_Body_Mass = c(
    mean(adelie_clean$body_mass_g),
    mean(chinstrap_clean$body_mass_g),
    mean(gentoo_clean$body_mass_g)
  )
)

print(species_summary)

# VISUALIZATION
# reshape the summary table so each metric can be shown in its own panel
library(tidyr)

species_long <- species_summary %>%
  pivot_longer(cols = c(Count, Avg_Bill_Length, Avg_Body_Mass),
               names_to = "Metric",
               values_to = "Value")

ggplot(species_long, aes(x = Species, y = Value, fill = Species)) +
  geom_col() +
  facet_wrap(~ Metric, scales = "free_y") +
  labs(title = "Species Comparison: Sample Size and Measurements") +
  theme_minimal()
