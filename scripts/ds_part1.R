# Project: Finals R Project
# Category: f. Data Science (Script 1)
# Description: Data cleaning - creating clean subsets for all three penguin species

library(palmerpenguins)
library(tidyverse)

# ============================================
# 1. GENTOO SUBSET
# ============================================
gentoo_clean <- penguins %>%
  filter(species == "Gentoo") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

# Verify
cat("Gentoo clean rows:", nrow(gentoo_clean), "\n")
summary(gentoo_clean)

# ============================================
# 2. ADELIE SUBSET
# ============================================
adelie_clean <- penguins %>%
  filter(species == "Adelie") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

cat("Adelie clean rows:", nrow(adelie_clean), "\n")
summary(adelie_clean)

# ============================================
# 3. CHINSTRAP SUBSET
# ============================================
chinstrap_clean <- penguins %>%
  filter(species == "Chinstrap") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

cat("Chinstrap clean rows:", nrow(chinstrap_clean), "\n")
summary(chinstrap_clean)

# ============================================
# 4. COMBINED COMPARISON TABLE
# ============================================
# this will print the count,avg bill length and avg body mass in all species
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

#==========================================
# PLOT VISUALIZATION
#==========================================
# this will display the avg body mass and count, of each species
# reshape data for ggplot (long format)
library(tidyr)

species_long <- species_summary %>%
  pivot_longer(cols = c(Count, Avg_Body_Mass),
               names_to = "Metric",
               values_to = "Value")

ggplot(species_long, aes(x = Species, y = Value, fill = Species)) +
  geom_col() +
  facet_wrap(~ Metric, scales = "free_y") +
  labs(title = "Species Comparison: Sample Size and Body Mass") +
  theme_minimal()
