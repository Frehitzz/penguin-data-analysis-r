# Linear Regression Output Explanation

Script: `scripts/F_DataScience_Linear_Regression.R`

Model used:

```r
lm(formula = body_mass_g ~ bill_length_mm, data = model_data)
```

This model predicts penguin body mass in grams using bill length in millimeters.

## 1. Call

Output:

```text
Call:
lm(formula = body_mass_g ~ bill_length_mm, data = model_data)
```

Explanation:

The `Call` shows the exact model that R ran.

- `body_mass_g` is the dependent variable or response variable
- `bill_length_mm` is the independent variable or predictor variable
- `model_data` is the cleaned dataset used for modeling

Meaning:

The model is asking: can bill length help predict body mass

## 2. Residuals

Output:

```text
Residuals:
     Min       1Q   Median       3Q      Max 
-1762.08  -446.98    32.59   462.31  1636.86
```

Explanation:

Residuals are the differences between the actual body mass values and the body mass values predicted by the model.

Formula:

```text
residual = actual value - predicted value
```

Value meaning:

- `Min = -1762.08`: the largest negative error, meaning one penguin was about 1762 grams lighter than the model predicted
- `1Q = -446.98`: 25 percent of residuals are below about -447 grams
- `Median = 32.59`: the middle residual is close to 0, which is good because the model is not strongly biased in one direction
- `3Q = 462.31`: 75 percent of residuals are below about 462 grams
- `Max = 1636.86`: the largest positive error, meaning one penguin was about 1637 grams heavier than the model predicted

Interpretation:

The residuals show that the model has prediction errors, but the median residual being close to 0 suggests the model is reasonably centered. However, the large minimum and maximum residuals show that bill length alone cannot perfectly predict body mass.

## 3. Coefficients

Output:

```text
Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     362.307    283.345   1.279    0.202    
bill_length_mm   87.415      6.402  13.654   <2e-16 ***
```

Coefficients are the numbers used to create the regression equation.

Regression equation:

```text
predicted body mass = 362.307 + 87.415 * bill length
```

## 4. Intercept

Output:

```text
(Intercept)  Estimate = 362.307
```

Explanation:

The intercept is the predicted body mass when bill length is 0 mm.

Interpretation:

In this project, the intercept is not biologically meaningful because a penguin cannot realistically have a bill length of 0 mm. It is mainly needed mathematically so R can draw the regression line.

Other intercept values:

- `Std. Error = 283.345`: the uncertainty around the intercept estimate
- `t value = 1.279`: the test statistic for the intercept
- `p-value = 0.202`: this is greater than 0.05, so the intercept is not statistically significant

Meaning:

The intercept is not the important part of this model. The important predictor is `bill_length_mm`.

## 5. Bill Length Coefficient

Output:

```text
bill_length_mm  Estimate = 87.415
```

Explanation:

The estimate for `bill_length_mm` tells how much body mass is expected to change for every 1 mm increase in bill length.

Interpretation:

For every 1 mm increase in bill length, the model predicts that body mass increases by about 87.415 grams.

Example:

If one penguin has a bill length 1 mm longer than another penguin, the model expects that penguin to weigh about 87 grams more on average.

## 6. Standard Error

Output:

```text
Std. Error = 6.402
```

Explanation:

The standard error shows how much uncertainty there is in the coefficient estimate.

Interpretation:

The standard error for `bill_length_mm` is 6.402, which is small compared with the estimate of 87.415. This means the estimate is fairly precise.

## 7. T Value

Output:

```text
t value = 13.654
```

Explanation:

The t value measures how strong the predictor is compared with its uncertainty.

Formula idea:

```text
t value = estimate / standard error
```

For bill length:

```text
87.415 / 6.402 = about 13.654
```

Interpretation:

A large t value means bill length is a strong predictor of body mass in this model.

## 8. P-Value

Output:

```text
Pr(>|t|) = <2e-16
```

Explanation:

The p-value tells whether the relationship between bill length and body mass is statistically significant.

Interpretation:

The p-value is much smaller than 0.05, so the relationship is statistically significant. This means it is very unlikely that the relationship happened by random chance alone.

Meaning for the project:

Bill length is a meaningful predictor of body mass in the `palmerpenguins` dataset.

## 9. Significance Codes

Output:

```text
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

Explanation:

Significance codes are shortcuts that show how statistically significant a result is.

Meaning:

- `***` means very highly significant
- `**` means highly significant
- `*` means significant
- `.` means weak evidence
- blank means not significant

Interpretation:

The `bill_length_mm` row has `***`, meaning bill length is a very significant predictor of body mass.

## 10. Residual Standard Error

Output:

```text
Residual standard error: 645.4 on 340 degrees of freedom
```

Explanation:

Residual standard error measures the typical size of the model's prediction error.

Interpretation:

The model's predictions are typically off by about 645.4 grams.

Meaning:

This is a fairly large error, so while bill length is useful, it is not enough by itself to make very accurate body mass predictions. Other variables like species, flipper length, sex, and bill depth may improve the model.

## 11. Degrees Of Freedom

Output:

```text
340 degrees of freedom
```

Explanation:

Degrees of freedom represent the amount of information left after estimating the model parameters.

In this model:

- there are 342 complete observations used
- 2 parameters are estimated: intercept and bill length coefficient
- 342 - 2 = 340 degrees of freedom

Meaning:

The model had enough data to estimate the relationship between bill length and body mass.

## 12. Multiple R-Squared

Output:

```text
Multiple R-squared: 0.3542
```

Explanation:

R-squared tells how much of the variation in body mass is explained by the model.

Interpretation:

An R-squared value of 0.3542 means bill length explains about 35.42 percent of the variation in body mass.

Meaning:

This is a moderate relationship. Bill length helps predict body mass, but 64.58 percent of the variation is still explained by other factors not included in this simple model.

## 13. Adjusted R-Squared

Output:

```text
Adjusted R-squared: 0.3523
```

Explanation:

Adjusted R-squared is a version of R-squared that accounts for the number of predictors in the model.

Interpretation:

The adjusted R-squared value is 0.3523, which is very close to the regular R-squared value of 0.3542.

Meaning:

Because this model only uses one predictor, adjusted R-squared is almost the same as regular R-squared.

## 14. F-Statistic

Output:

```text
F-statistic: 186.4 on 1 and 340 DF
```

Explanation:

The F-statistic tests whether the overall regression model is useful.

Interpretation:

The F-statistic is 186.4, which is large. This means the model explains significantly more variation than a model with no predictor.

Meaning:

The model using bill length is better than simply predicting the average body mass for every penguin.

## 15. Model P-Value

Output:

```text
p-value: < 2.2e-16
```

Explanation:

This p-value tests whether the overall model is statistically significant.

Interpretation:

The p-value is far below 0.05, so the overall model is statistically significant.

Meaning:

Bill length provides meaningful information for predicting body mass.

## 16. Final Interpretation

The linear regression model shows a statistically significant positive relationship between bill length and body mass. For every 1 mm increase in bill length, body mass is predicted to increase by about 87.4 grams. The relationship is statistically significant because the p-value is extremely small.

However, the model does not explain all variation in body mass. The R-squared value of 0.3542 means bill length explains about 35.42 percent of the differences in body mass. This is useful, but not complete. A stronger model could include additional predictors such as species, flipper length, bill depth, and sex.

## 17. Short Version For Google Docs

The regression model predicts penguin body mass using bill length. The coefficient for `bill_length_mm` is 87.415, meaning that every 1 mm increase in bill length is associated with an estimated 87.415 gram increase in body mass. The p-value is less than 0.05, so the relationship is statistically significant. The R-squared value is 0.3542, meaning bill length explains about 35.42 percent of the variation in body mass. This shows that bill length is a useful predictor, but other variables are also needed for a more accurate model.
