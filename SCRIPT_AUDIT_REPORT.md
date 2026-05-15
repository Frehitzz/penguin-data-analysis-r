# Finals Project Script Audit

Date: 2026-05-15

## Scope

This audit scores only the current R scripts in `scripts/` against the posted rubric.

- Per-script scores are normalized to the rubric areas that actually apply to a script
- `Workflow & Documentation (10%)` is scored separately at the project level because it is not meaningful to assign that category to each individual script
- Runtime verification was done with `C:\Program Files\R\R-4.6.0\bin\Rscript.exe`

## Current Status

The script set is in much better shape than the earlier audit state.

- all 12 scripts run successfully from start to finish
- comment style has been cleaned up and made more consistent
- `B_While_Loops_First_10_Species.R` now matches its stated task
- `D_Functions_Deviation_Table.R` now runs independently
- missing-value handling is more explicit in the visualization and modeling scripts
- physical dataset copies are now stored in `data/`
- generated CSV outputs and plot images are now stored in `output/`

## Requirement Check

### Requirement coverage

- `2 scripts per category`: Met
- `For / While / Repeat / Functions / Data Visualization / Data Science`: Met
- `SCRIPT / NEEDED FILES / SCREENSHOT OUTPUT / Explanation for e & f only`: Partially met
- `README.md present`: Met technically, but it still does not explain the project or how to run it

### Remaining submission gaps

- physical dataset copies are now present in `data/` as `penguins.csv` and `penguins_raw.csv`
- screenshot or image outputs are now present in `output/` for the visualization and clean-subset data science scripts
- no written explanations were found for the `E_Visualization_*` and `F_DataScience_*` scripts
- there is still no saved visual output for `F_DataScience_Linear_Regression.R`
- `README.md` still does not provide setup or run instructions

## Project-Level Rubric Score

### Workflow & Documentation: 6/10

What helps:

- folder structure is logical with `data/`, `scripts/`, and `output/`
- file naming is organized and easy to follow
- the scripts now run independently, which improves project usability
- the project now includes physical copies of the source data in `data/`
- the project now includes generated CSV files and plot images in `output/`

What still hurts the score:

- `README.md` is still effectively a placeholder
- no clear run order or dependency list is documented
- the required explanation for visualization and data science work is still missing
- the linear regression script still has no saved figure or report-style output

## Per-Script Ratings

| Script | Category | Score | Rating | Verdict |
|---|---|---:|---|---|
| `A_For_Loops_Inventory.R` | For Loops | 84/100 | Good | Runs cleanly and comments are now focused |
| `A_For_Loops_Summary_Table.R` | For Loops | 82/100 | Good | Runs cleanly and no longer depends on hardcoded positions |
| `B_While_Loops_First_10_Species.R` | While Loops | 84/100 | Good | Now matches the stated first 10 rows requirement |
| `B_While_Loops_Max_Min_Avg.R` | While Loops | 86/100 | Good | Correct result with cleaner logic and a missing-data guard |
| `C_Repeat_Loops_Find_Dream_Island.R` | Repeat Loops | 84/100 | Good | Clear stop condition and cleaner structure |
| `C_Repeat_Loops_Accumulate_Bills.R` | Repeat Loops | 83/100 | Good | Safer loop ordering and cleaner comments |
| `D_Functions_Convert_Kg.R` | Functions | 82/100 | Good | Reproducible now that interactive viewing was removed |
| `D_Functions_Deviation_Table.R` | Functions | 81/100 | Good | Runtime issue fixed and script is now self-contained |
| `E_Visualization_Body_Mass_Histogram.R` | Data Visualization | 76/100 | Good | Cleaner data handling and the plot output is now present |
| `E_Visualization_Flipper_vs_Bill.R` | Data Visualization | 78/100 | Good | Cleaner plotting workflow and output artifact is now present |
| `F_DataScience_Clean_Subsets.R` | Data Science | 79/100 | Good | Stronger summary, broader visualization, and output artifacts are now present |
| `F_DataScience_Linear_Regression.R` | Data Science | 70/100 | Fair | Cleaner modeling workflow, but still light on evaluation and interpretation |

## Findings By Script

### `A_For_Loops_Inventory.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `35/40`

Findings:

- runs successfully
- comments are now shorter and explain purpose instead of narrating syntax
- base R is appropriate for the exercise
- still prints line by line rather than producing a summary object

Feedback:

- this is now solid for a loop exercise
- a compact result table would make it more polished, but it is no longer a major weakness

### `A_For_Loops_Summary_Table.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `34/40`

Findings:

- runs successfully
- handles missing values correctly with `na.rm = TRUE`
- no longer depends on fixed column positions
- the current numeric selection excludes `year`, which preserves the intended measurement-focused output

Feedback:

- this is materially improved from the earlier version
- storing the results in a small object before printing would make the output easier to reuse

### `B_While_Loops_First_10_Species.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `35/40`

Findings:

- runs successfully
- now prints only the first 10 rows as described
- uses `min(10, nrow(penguins))` so it stays safe on smaller datasets

Feedback:

- this fix removes the biggest correctness issue from the earlier audit

### `B_While_Loops_Max_Min_Avg.R`

Score breakdown:

- Code Quality & Structure: `16/20`
- Functional Correctness: `35/40`

Findings:

- runs successfully
- correctly skips `NA` values
- correctly tracks maximum minimum and average body mass
- now includes a guard for the case where no valid values exist

Feedback:

- this is one of the stronger loop scripts in the project

### `C_Repeat_Loops_Find_Dream_Island.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `35/40`

Findings:

- runs successfully
- has a valid `break` condition and safety stop
- comment style is cleaner and easier to read

Feedback:

- functionality is correct and the script is now cleaner without changing its intent

### `C_Repeat_Loops_Accumulate_Bills.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `34/40`

Findings:

- runs successfully
- correctly skips missing bill lengths
- bounds check now happens before indexing into the dataset
- still grows `penguin_log` incrementally, which is acceptable here because the dataset is small

Feedback:

- the earlier loop-safety concern has been addressed

### `D_Functions_Convert_Kg.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `33/40`

Findings:

- runs successfully
- `View()` has been removed so the script works in non-interactive execution
- the function is short and reusable

Feedback:

- this is now reproducible enough for submission
- optional input validation could improve it further, but it is no longer a major rubric problem

### `D_Functions_Deviation_Table.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `32/40`

Findings:

- runs successfully
- no longer depends on `penguins_kg` from another script
- `View()` and debug-only leftovers were removed
- the script is now self-contained and reproducible

Feedback:

- this script improved the most from the earlier audit because the main runtime failure is gone

### `E_Visualization_Body_Mass_Histogram.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `29/40`
- Data Visualization & Reporting: `22/30`

Findings:

- runs successfully
- missing body mass values are filtered before plotting
- labels and legend are present
- plot output is present in `output/`
- the written explanation required by the project brief is still missing

Feedback:

- the warning issue has been fixed
- the remaining deductions here are mostly the missing written explanation rather than script correctness

### `E_Visualization_Flipper_vs_Bill.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `30/40`
- Data Visualization & Reporting: `23/30`

Findings:

- runs successfully
- missing values are cleaned before plotting
- axis labels legend and regression line are present
- the subtitle improves interpretation slightly
- plot output is present in `output/`
- the required explanation is still missing

Feedback:

- this is stronger than the earlier version, but the reporting side is still incomplete

### `F_DataScience_Clean_Subsets.R`

Score breakdown:

- Code Quality & Structure: `16/20`
- Functional Correctness: `31/40`
- Data Visualization & Reporting: `22/30`

Findings:

- runs successfully
- tidyverse usage is appropriate and clear
- missing values are handled explicitly
- the comparison plot now includes `Avg_Bill_Length` in addition to `Count` and `Avg_Body_Mass`
- generated csv outputs and a plot image are now present in `output/`
- analysis depth is still modest and no written explanation is included

Feedback:

- this remains one of the stronger scripts in the set
- the biggest remaining gap is presentation rather than core script execution

### `F_DataScience_Linear_Regression.R`

Score breakdown:

- Code Quality & Structure: `15/20`
- Functional Correctness: `27/40`
- Data Visualization & Reporting: `18/30`

Findings:

- runs successfully
- missing values are removed before modeling so the workflow is explicit
- the model summary and prediction output are valid
- evaluation is still limited to the default `summary()` output
- interpretation of coefficient strength and model quality is still missing

Feedback:

- this script is cleaner and more reproducible now
- the main remaining weakness is that the analysis stops too early for a full data science grading rubric

## Highest-Priority Remaining Fixes Before Submission

1. replace the placeholder `README.md` with real project instructions
2. add screenshot outputs and short explanations for all `E_*` and `F_*` scripts
3. add a saved visual or report-style output for `F_DataScience_Linear_Regression.R`
4. add stronger interpretation for the data science results especially the linear regression script

## Bottom Line

Current state:

- requirement coverage by count of scripts is good
- script reproducibility is now strong
- strongest area is now the loop and functions sections
- workflow evidence is much stronger now because the project includes local data copies and generated outputs
- weakest area is still documentation and written reporting for visualization and data science

If graded now the biggest avoidable deductions would likely come from:

- missing README content
- missing screenshots and explanations for the visualization and data science sections
- missing written explanations for the visualization and data science sections
- missing saved output for the linear regression script
- limited interpretation in the data science work
