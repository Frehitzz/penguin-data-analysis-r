# Finals R Project: Statistical Analysis of Palmer Penguins

## 1. Cover Page

**Project Title:** Finals R Project: Statistical Analysis of Palmer Penguins

**Course/Subject Name:** Introduction to R Programming

**Student Name:** Fritz Harly G. Degamo

**Submission Date:** May 17, 2026

**Instructor Name:** [Instructor Name]

## 2. Abstract

This project demonstrates core R programming skills using the `palmerpenguins` dataset. The work includes examples of for loops, while loops, repeat loops, user-defined functions, data visualization, data cleaning, and simple linear regression modeling. The purpose of the project is to show that R can be used not only for writing code, but also for exploring data, handling missing values, creating visual evidence, and interpreting statistical results.

## 3. Introduction And Project Scope

The objective of this project is to demonstrate fundamental R programming concepts through a real dataset. The project includes 12 scripts divided into six categories: for loops, while loops, repeat loops, functions, data visualization, and data science using R/RStudio.

The dataset used in this project is the `palmerpenguins` dataset. The dataset contains size measurements for three penguin species: Adelie, Chinstrap, and Gentoo. These penguins were observed on three islands in the Palmer Archipelago, Antarctica. The dataset includes variables such as bill length, bill depth, flipper length, body mass, sex, species, island, and year.

Physical copies of the dataset are included in the project folder:

- `data/penguins.csv`
- `data/penguins_raw.csv`

## 4. Methodology

Each programming category contains two R scripts. The scripts were designed to run independently and avoid hardcoded local file paths. Missing values were handled where needed using `na.rm = TRUE`, `drop_na()`, or explicit `is.na()` filtering.

## Category A: For Loops

### Goal

The goal of the for loop scripts is to automate repetitive tasks in the dataset. Instead of manually checking every column or manually calculating every average, the scripts use loops to process multiple variables efficiently.

### Script 1: `A_For_Loops_Inventory.R`

This script loops through all columns in the penguin dataset and prints the data type of each column. This is useful for understanding the structure of the dataset before analysis.

Code snippet:

```r
penguin_columns <- names(penguins)

for (col in penguin_columns) {
  type <- class(penguins[[col]])
  print(paste("The column", col, "contains", type, "data."))
}
```

Proof to insert in Google Docs:

Insert a screenshot of the RStudio console output showing the column names and data types.

### Script 2: `A_For_Loops_Summary_Table.R`

This script loops through numeric measurement columns and calculates the average of each column while ignoring missing values.

Code snippet:

```r
numeric_cols <- names(penguins)[sapply(penguins, is.numeric)]
numeric_cols <- setdiff(numeric_cols, "year")

for (i in numeric_cols) {
  col_mean <- mean(penguins[[i]], na.rm = TRUE)
  rounded_mean <- round(col_mean, 2)
  print(paste("Average", i, ":", rounded_mean))
}
```

Proof to insert in Google Docs:

Insert a screenshot of the RStudio console output showing the averages for bill length, bill depth, flipper length, and body mass.

## Category B: While Loops

### Goal

The goal of the while loop scripts is to show how repeated actions can continue while a condition remains true. This is useful for tasks that require counters, searching, or calculating values step by step.

### Script 1: `B_While_Loops_First_10_Species.R`

This script prints the first 10 species entries from the dataset. It uses a counter and stops when the first 10 rows have been processed.

Code snippet:

```r
i <- 1
row_limit <- min(10, nrow(penguins))

while (i <= row_limit) {
  current_species <- as.character(penguins$species[i])
  print(paste("Penguin number", i, "is an", current_species))
  i <- i + 1
}
```

Proof to insert in Google Docs:

Insert a screenshot of the RStudio console output showing penguin numbers 1 through 10.

### Script 2: `B_While_Loops_Max_Min_Avg.R`

This script uses a while loop to find the heaviest penguin, lightest penguin, and average body mass. It skips missing values so the calculation stays accurate.

Code snippet:

```r
while (i <= total_rows) {
  current_val <- penguins$body_mass_g[i]

  if (!is.na(current_val)) {
    if (current_val > max_mass) {
      max_mass <- current_val
      max_row_index <- i
    }

    if (current_val < min_mass) {
      min_mass <- current_val
      min_row_index <- i
    }

    total_mass <- total_mass + current_val
    count_valid <- count_valid + 1
  }

  i <- i + 1
}
```

Proof to insert in Google Docs:

Insert a screenshot showing the heaviest row, lightest row, and average body mass result.

## Category C: Repeat Loops

### Goal

The goal of the repeat loop scripts is to demonstrate loops that continue until a `break` condition is reached. Repeat loops are useful when the stopping point depends on a result found during execution.

### Script 1: `C_Repeat_Loops_Find_Dream_Island.R`

This script searches row by row until it finds the first penguin from Dream island.

Code snippet:

```r
repeat {
  current_island <- as.character(penguins$island[row_num])

  if (current_island == "Dream") {
    print(paste("Found the first Dream island penguin at row:", row_num))
    break
  }

  row_num <- row_num + 1
}
```

Proof to insert in Google Docs:

Insert a screenshot showing the console output for the first Dream island row.

### Script 2: `C_Repeat_Loops_Accumulate_Bills.R`

This script adds penguin bill lengths until the total reaches at least 200 mm. It skips missing values and stops once the target total is reached.

Code snippet:

```r
repeat {
  if (i > nrow(penguins)) {
    break
  }

  bill_val <- penguins$bill_length_mm[i]

  if (!is.na(bill_val)) {
    total_bill <- total_bill + bill_val
    count_penguins <- count_penguins + 1
  }

  if (total_bill >= 200) {
    break
  }

  i <- i + 1
}
```

Proof to insert in Google Docs:

Insert a screenshot showing the total bill length, number of penguins used, and average bill length.

## Category D: Functions

### Goal

The goal of the function scripts is to show how custom functions improve reproducibility and reduce repeated code. A function allows the same logic to be reused consistently instead of manually rewriting the same formula multiple times.

### Script 1: `D_Functions_Convert_Kg.R`

This script creates a function called `convert_to_kg()` to convert body mass from grams to kilograms. This is better than doing the math manually every time because the formula is written once and can be reused across the dataset.

Code snippet:

```r
convert_to_kg <- function(grams) {
  grams / 1000
}

penguins_kg <- penguins
penguins_kg$body_mass_kg <- convert_to_kg(penguins$body_mass_g)
```

Proof to insert in Google Docs:

Insert a screenshot showing the new `body_mass_kg` column or the generated file `output/D_Functions_Convert_Kg_penguins_kg.csv`.

### Script 2: `D_Functions_Deviation_Table.R`

This script creates a function that calculates how far each penguin's body mass is from the average body mass.

Code snippet:

```r
calculate_deviation <- function(value, average_val) {
  value - average_val
}

avg_mass <- mean(penguins$body_mass_g, na.rm = TRUE)
penguin_deviations <- calculate_deviation(penguins$body_mass_g, avg_mass)
```

Proof to insert in Google Docs:

Insert a screenshot showing the deviation table or the generated file `output/D_Functions_Deviation_Table_summary_table.csv`.

## Category E: Data Visualization

### Goal

The goal of the visualization scripts is to convert numerical data into graphs that are easier to interpret. The project uses `ggplot2` because it provides clear, labeled, and customizable visualizations.

### Script 1: `E_Visualization_Body_Mass_Histogram.R`

This script creates a histogram showing the distribution of penguin body mass by species.

Code snippet:

```r
ggplot(data = penguins_body_mass, aes(x = body_mass_g, fill = species)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(
    title = "Penguin Body Mass Distribution",
    x = "Body Mass (g)",
    y = "Frequency",
    fill = "Species"
  ) +
  theme_minimal()
```

Figure to insert:

![Figure 1: Body mass histogram by species](output/E_Visualization_Body_Mass_Histogram.png)

Figure caption:

Figure 1: Distribution of penguin body mass across Adelie, Chinstrap, and Gentoo species

Analysis:

The histogram clearly shows that Gentoo penguins occupy a different weight class than Adelie and Chinstrap. Gentoo penguins appear more often in the heavier body mass range, while Adelie and Chinstrap are concentrated in lower ranges. This means body mass is a useful feature for comparing species differences.

### Script 2: `E_Visualization_Flipper_vs_Bill.R`

This script creates a scatter plot showing the relationship between flipper length and bill length.

Code snippet:

```r
ggplot(data = penguins_measurements, aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", color = "black", linetype = "dashed") +
  labs(
    title = "Flipper Length vs. Bill Length",
    x = "Flipper Length (mm)",
    y = "Bill Length (mm)"
  ) +
  theme_light()
```

Figure to insert:

![Figure 2: Flipper length vs bill length](output/E_Visualization_Flipper_vs_Bill.png)

Figure caption:

Figure 2: Relationship between flipper length and bill length with a linear trend line

Analysis:

The scatter plot shows an upward trend, meaning penguins with longer flippers also tend to have longer bills. The positive trend line suggests a positive correlation between the two measurements. The use of species colors and shapes also helps show how the species groups differ while still following the overall relationship.

## Category F: Data Science And Modeling

### Goal

The goal of the data science scripts is to clean the dataset, summarize species-level patterns, and apply a basic predictive model. This section demonstrates data preparation, summary statistics, visualization, and linear regression.

### Script 1: `F_DataScience_Clean_Subsets.R`

This script creates clean subsets for Adelie, Chinstrap, and Gentoo by removing missing values and selecting key measurement variables. It then creates a summary table and visualization comparing species.

Code snippet:

```r
gentoo_clean <- penguins %>%
  filter(species == "Gentoo") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

adelie_clean <- penguins %>%
  filter(species == "Adelie") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

chinstrap_clean <- penguins %>%
  filter(species == "Chinstrap") %>%
  drop_na(body_mass_g, bill_length_mm) %>%
  select(species, island, bill_length_mm, body_mass_g)

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

species_long <- species_summary %>%
  pivot_longer(
    cols = c(Count, Avg_Bill_Length, Avg_Body_Mass),
    names_to = "Metric",
    values_to = "Value"
  )
```

Figure to insert:

![Figure 3: Species comparison summary](output/F_DataScience_Clean_Subsets.png)

Figure caption:

Figure 3: Species comparison by sample size, average bill length, and average body mass

Analysis:

The cleaned subsets make the analysis more reliable because missing values are removed before calculating averages. The summary shows that Gentoo penguins have the highest average body mass compared with Adelie and Chinstrap. This supports the pattern already shown in the body mass histogram.

### Script 2: `F_DataScience_Linear_Regression.R`

This script fits a linear regression model to predict `body_mass_g` using `bill_length_mm`.

Code snippet:

```r
model_data <- penguins[
  !is.na(penguins$body_mass_g) & !is.na(penguins$bill_length_mm),
]

penguin_model <- lm(body_mass_g ~ bill_length_mm, data = model_data)
model_summary <- summary(penguin_model)

print(model_summary)
```

Linear regression result to paste:

```text
Coefficients:
               Estimate Std. Error t value Pr(>|t|)
(Intercept)     362.307    283.345   1.279    0.202
bill_length_mm   87.415      6.402  13.654   <2e-16

Multiple R-squared: 0.3542
Adjusted R-squared: 0.3523
```

Interpretation:

The model suggests that for every 1 mm increase in bill length, the predicted body mass increases by about 87.42 grams. The p-value for `bill_length_mm` is less than 0.05, meaning the relationship is statistically significant. This means bill length can be used as a meaningful predictor of body mass, although the R-squared value of 0.3542 shows that bill length alone does not explain all variation in body mass.

The sample prediction in the script estimates the body mass of a penguin with a 45 mm bill length. The predicted value is approximately 4296 grams.

## Project Structure And Workflow

The project is organized into three main folders:

- `data/` contains physical copies of the original and cleaned penguin datasets
- `scripts/` contains the 12 required R scripts
- `output/` contains generated CSV files and plot images

The project avoids using `setwd()` and does not depend on local file paths. This improves reproducibility because the scripts can be run from the project root folder in RStudio.

Missing values were handled carefully throughout the project. For example, averages use `na.rm = TRUE`, visualizations filter missing measurements before plotting, and data science scripts use `drop_na()` or explicit `is.na()` conditions before analysis. This matters because missing values can cause incorrect calculations, warnings, or failed models if they are ignored.

## Conclusion

This project successfully met the requirement of providing two R scripts for each required category: for loops, while loops, repeat loops, functions, data visualization, and data science. Through this project, I learned how loops can automate repetitive tasks, how functions improve reproducibility, how visualizations make patterns easier to understand, and how a simple regression model can be used to make predictions from data.

The project also showed the importance of clean data. Handling missing values helped make the calculations, plots, and model results more reliable. Overall, the project demonstrates both basic R programming skills and introductory data analysis using a real dataset.

## Google Docs Formatting Checklist

Use this checklist when transferring this Markdown draft into Google Docs:

- add a Table of Contents using `Insert > Table of contents`
- use a light gray background for code snippets
- use `Courier New` or `Consolas` for code blocks
- insert screenshots of RStudio console output for loop and function sections
- insert the plot images from the `output/` folder
- add captions below every figure
- replace `[Instructor Name]` with the actual instructor name
- review spelling and spacing before exporting to PDF
