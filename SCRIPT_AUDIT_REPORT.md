# Finals Project Script Audit

Date: 2026-05-15

## Scope

This audit scores only the current R scripts in `scripts/` against the posted rubric.

- Per-script scores are normalized to the rubric areas that actually apply to a script.
- `Workflow & Documentation (10%)` is scored separately at the project level, because it is not meaningful to assign that category to each individual script.
- Runtime verification was done with `C:\Program Files\R\R-4.6.0\bin\Rscript.exe`.

## Requirement Check

### Requirement coverage

- `2 scripts per category`: Met.
- `For / While / Repeat / Functions / Data Visualization / Data Science`: Met.
- `SCRIPT / NEEDED FILES / SCREENSHOT OUTPUT / Explanation for e & f only`: Partially met.
- `README.md present`: Met technically, but the file is currently just a placeholder and does not explain the project or how to run it.

### Missing submission evidence

- No screenshot outputs were found for the visualization and data science parts.
- No written explanations were found for the `E_Visualization_*` and `F_DataScience_*` scripts.
- The `output/` folder is empty.
- `README.md` does not currently provide setup or run instructions.

## Project-Level Rubric Score

### Workflow & Documentation: 2/10

What helps:

- Folder structure is logical: `data/`, `scripts/`, `output/`.
- File naming is organized and easy to follow.

What hurts the score:

- `README.md` is effectively empty.
- No clear run order or dependency list is documented.
- No saved outputs, screenshots, or report artifact were found.
- The required explanation for visualization and data science work is missing.

## Per-Script Ratings

| Script | Category | Score | Rating | Verdict |
|---|---|---:|---|---|
| `A_For_Loops_Inventory.R` | For Loops | 75/100 | Good | Runs, but comments are mostly “what”, not “why”. |
| `A_For_Loops_Summary_Table.R` | For Loops | 68/100 | Fair | Runs, but relies on hardcoded column positions. |
| `B_While_Loops_First_10_Species.R` | While Loops | 37/100 | Poor | Major requirement mismatch: prints all rows, not the first 10. |
| `B_While_Loops_Max_Min_Avg.R` | While Loops | 78/100 | Good | Correct result and NA handling, but style and explanation need tightening. |
| `C_Repeat_Loops_Find_Dream_Island.R` | Repeat Loops | 77/100 | Good | Clear stop condition and works as intended. |
| `C_Repeat_Loops_Accumulate_Bills.R` | Repeat Loops | 70/100 | Fair | Works, but structure is brittle and comments are noisy. |
| `D_Functions_Convert_Kg.R` | Functions | 67/100 | Fair | Core function works, but script is not polished for reproducible submission. |
| `D_Functions_Deviation_Table.R` | Functions | 32/100 | Poor | Fails at runtime due to undefined object. |
| `E_Visualization_Body_Mass_Histogram.R` | Data Visualization | 60/100 | Fair | Plot is acceptable, but warnings, missing explanation, and no saved output reduce the grade. |
| `E_Visualization_Flipper_vs_Bill.R` | Data Visualization | 64/100 | Fair | Plot is readable, but analysis/reporting expectations are only partly met. |
| `F_DataScience_Clean_Subsets.R` | Data Science | 68/100 | Fair | Cleans data reasonably, but analysis depth and reporting are still limited. |
| `F_DataScience_Linear_Regression.R` | Data Science | 56/100 | Fair | Model runs, but it is under-evaluated and weak on interpretation. |

## Findings By Script

### `A_For_Loops_Inventory.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `33/40`

Findings:

- Runs successfully.
- Readable and simple.
- Comments are abundant, but most explain syntax line-by-line instead of explaining the decision or purpose.
- Uses base R appropriately for a simple loop exercise.
- No reuse or modularity beyond the loop itself.

Feedback:

- Replace low-value syntax comments with 2 to 3 comments explaining the purpose of the script and the meaning of the output.
- Consider printing a compact summary table instead of many separate `print()` calls.

### `A_For_Loops_Summary_Table.R`

Score breakdown:

- Code Quality & Structure: `11/20`
- Functional Correctness: `30/40`

Findings:

- Runs successfully.
- Handles missing values correctly with `na.rm = TRUE`.
- `names(penguins)[3:6]` hardcodes column positions, which is fragile if the dataset changes.
- Comments again focus more on beginner syntax explanation than project reasoning.

Feedback:

- Select numeric columns programmatically instead of relying on positions.
- Produce a result object instead of only printing lines to the console.

### `B_While_Loops_First_10_Species.R`

Score breakdown:

- Code Quality & Structure: `10/20`
- Functional Correctness: `12/40`

Findings:

- The script runs.
- The description says it should print the first 10 species.
- The loop condition is `while (i <= nrow(penguins))`, so it prints all 344 rows instead.
- This is the clearest requirement mismatch in the project.

Feedback:

- Change the stopping condition to 10 rows, or `min(10, nrow(penguins))`.
- The current version would lose major points under Functional Correctness because the behavior does not match the stated task.

### `B_While_Loops_Max_Min_Avg.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `35/40`

Findings:

- Runs successfully.
- Correctly skips `NA` values.
- Correctly tracks maximum, minimum, and average body mass.
- Good use of explicit variables for the loop state.
- Comments are overly long and include spelling/grammar issues that reduce professionalism.

Feedback:

- Shorten the comments and keep only the ones that explain the logic.
- Add a guard for the case where all values are missing, even if the current dataset does not trigger it.

### `C_Repeat_Loops_Find_Dream_Island.R`

Score breakdown:

- Code Quality & Structure: `11/20`
- Functional Correctness: `35/40`

Findings:

- Runs successfully.
- Has a valid `break` condition and a safety stop.
- Logic matches the script description.
- Style is acceptable, but comments are verbose and uneven.

Feedback:

- Keep the safety check.
- Clean up the comments and make the output more informative, for example by including species or island value.

### `C_Repeat_Loops_Accumulate_Bills.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `30/40`

Findings:

- Runs successfully.
- Correctly skips missing bill lengths.
- Tracks rows used and reports a usable result.
- The safety check is useful, but it appears after `bill_val <- penguins$bill_length_mm[i]`, which is not the safest ordering.
- Repeated vector growth with `c(penguin_log, i)` is acceptable for this small dataset but not a best practice in general.

Feedback:

- Move the bounds check before indexing into the vector.
- Reduce comment noise and keep only the reasoning-heavy comments.

### `D_Functions_Convert_Kg.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `28/40`

Findings:

- The conversion function itself works.
- The script runs under `Rscript`.
- The script depends on `View()`, which is not appropriate for a polished non-interactive submission.
- The function has no input validation and is only demonstrated on one column.

Feedback:

- Remove `View()` from the submitted version.
- Print a compact preview or save an output file instead.
- Add a short explanation of why a function improves reuse here.

### `D_Functions_Deviation_Table.R`

Score breakdown:

- Code Quality & Structure: `11/20`
- Functional Correctness: `8/40`

Findings:

- This script fails at runtime.
- It references `penguins_kg` even though `penguins_kg` is not created in this file.
- A script that depends on an object created in a different script is not reproducible when run independently.
- `View()` is again included in a script that should be submission-ready.

Feedback:

- Remove all references to `penguins_kg` or define it inside the same file.
- Every script should run from start to finish on its own.
- This script currently loses substantial points under the 40% Functional Correctness category.

### `E_Visualization_Body_Mass_Histogram.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `26/40`
- Data Visualization & Reporting: `16/30`

Findings:

- The script runs and produces a usable histogram.
- Labels and legend are present.
- `ggplot2` is an appropriate choice.
- Runtime warning shows rows with missing values were removed automatically.
- The plot is not saved to a file.
- No narrative interpretation or explanation is provided, even though visualization scripts need explanation in the project brief.

Feedback:

- Filter out missing values explicitly before plotting.
- Save the plot to `output/`.
- Add short written interpretation such as which species tends to have larger body mass ranges.

### `E_Visualization_Flipper_vs_Bill.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `28/40`
- Data Visualization & Reporting: `18/30`

Findings:

- The script runs and produces a readable scatter plot.
- Axis labels and legends are present.
- The regression line improves interpretation.
- Missing values are again handled implicitly through warnings rather than explicit cleaning.
- There is still no required explanation or saved output artifact.

Feedback:

- Clean the plotting data first so the script runs without warnings.
- Add a subtitle or annotation explaining the relationship shown.
- Save the figure and include a short interpretation paragraph for submission.

### `F_DataScience_Clean_Subsets.R`

Score breakdown:

- Code Quality & Structure: `14/20`
- Functional Correctness: `30/40`
- Data Visualization & Reporting: `17/30`

Findings:

- This is one of the stronger scripts in the set.
- Uses tidyverse verbs appropriately for filtering, selecting, and reshaping.
- Missing values are handled with `drop_na()`.
- The script creates useful cleaned subsets and a simple comparison table.
- The analysis is still shallow: there is no outlier check, no saved artifact, and no written explanation.
- The plot only compares `Count` and `Avg_Body_Mass`; the script computes `Avg_Bill_Length` but does not visualize or interpret it.

Feedback:

- Keep the tidyverse approach.
- Save both the cleaned tables and the plot.
- Add interpretation about what differs across species and why that matters.

### `F_DataScience_Linear_Regression.R`

Score breakdown:

- Code Quality & Structure: `12/20`
- Functional Correctness: `24/40`
- Data Visualization & Reporting: `14/30`

Findings:

- The model runs and produces a prediction.
- Using `lm()` is a reasonable start.
- The script does not clean data explicitly; it relies on `lm()` dropping missing values internally.
- The model is not evaluated beyond the default summary output.
- There is no residual check, no performance discussion, and no interpretation of the coefficient or `R-squared`.
- For a data science rubric, this is underdeveloped.

Feedback:

- Filter missing values before modeling so the workflow is explicit.
- Explain what the coefficient means in context.
- Evaluate model quality and state the limitations of predicting body mass from bill length alone.

## Highest-Priority Fixes Before Submission

1. Fix `B_While_Loops_First_10_Species.R` so it actually prints only the first 10 rows.
2. Fix `D_Functions_Deviation_Table.R` so it runs independently without `penguins_kg`.
3. Replace the placeholder `README.md` with real project instructions.
4. Add screenshot outputs and short explanations for all `E_*` and `F_*` scripts.
5. Save plots/results into `output/` instead of relying only on console display.
6. Reduce low-value comments and replace them with short, meaningful explanations.

## Bottom Line

Current state:

- Requirement coverage by count of scripts: good.
- Reproducibility and grading readiness: mixed.
- Strongest area: basic loop logic and simple tidyverse cleaning.
- Weakest area: submission polish, documentation, and analysis/reporting depth.

If graded now, the biggest avoidable deductions would likely come from:

- incorrect behavior in `B_While_Loops_First_10_Species.R`
- runtime failure in `D_Functions_Deviation_Table.R`
- missing README content
- missing screenshots and explanations for the visualization and data science sections
