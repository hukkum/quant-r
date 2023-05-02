# Multiple Regression

Multiple linear regression is an extension of simple linear regression, where you model the relationship between a single dependent (outcome) variable and multiple independent (predictor) variables. The goal is to predict the dependent variable based on the values of the independent variables while accounting for the influence of each predictor variable.

The multiple linear regression equation is as follows:

Y = β0 + β1X1 + β2X2 + ... + βnXn + ε

Where:

Y is the dependent variable
β0 is the intercept (the value of Y when all independent variables are zero)
β1, β2, ..., βn are the regression coefficients for each independent variable X1, X2, ..., Xn
ε is the error term, representing the difference between the actual and predicted values of Y
The regression coefficients (β1, β2, ..., βn) represent the average change in the dependent variable for a one-unit increase in the corresponding independent variable, holding all other independent variables constant.

We can perform linear regression in R using the *psych* package. 


```r
# Load the necessary libraries.
library(psych)
library(tidyverse)
#> ── Attaching core tidyverse packages ──── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────── tidyverse_conflicts() ──
#> ✖ ggplot2::%+%()   masks psych::%+%()
#> ✖ ggplot2::alpha() masks psych::alpha()
#> ✖ dplyr::filter()  masks stats::filter()
#> ✖ dplyr::lag()     masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

# Reading the CSV file. 
data <- read_csv("exampledata/Ch18_GGPA.csv")
#> Rows: 11 Columns: 3
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> dbl (3): GRE_Total, UGPA, GGPA
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

# Define the model. 
model <- lm(GGPA  ~UGPA + GRE_Total, data = data)

summary(model)
#> 
#> Call:
#> lm(formula = GGPA ~ UGPA + GRE_Total, data = data)
#> 
#> Residuals:
#>      Min       1Q   Median       3Q      Max 
#> -0.19943 -0.06029  0.02812  0.06216  0.17207 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 0.637906   0.326537   1.954 0.086517 .  
#> UGPA        0.468670   0.093181   5.030 0.001015 ** 
#> GRE_Total   0.012463   0.002288   5.447 0.000611 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.1127 on 8 degrees of freedom
#> Multiple R-squared:  0.9076,	Adjusted R-squared:  0.8845 
#> F-statistic: 39.29 on 2 and 8 DF,  p-value: 7.289e-05
```

The output shows us the regression coefficients, standard errors, t-values, and p-values for each independent variable. We can also see the R-squared value, adjusted R-squared value, and other model fit statistics.

The summary statistics for the residuals are provided, including the minimum, first quartile (1Q), median, third quartile (3Q), and maximum values.

The coefficients table provides the regression coefficients (Estimate), standard errors (Std. Error), t-values (t value), and p-values (Pr(>|t|)) for each independent variable, as well as the intercept.

The regression equation based on this output is:

Y = 0.637906 + 0.468670 * UGPA + 0.012463 * GRE_Total

Where:

Y is the dependent variable
UGPA is the first independent variable (Undergraduate GPA)
GRE_Total is the second independent variable (Total GRE score)
Significance codes: These indicate the level of statistical significance for each independent variable, with 0.001 (*), 0.01 (), 0.05 (.), and 0.1 ( ).

### Model Fit Statistics:

Residual standard error: This is the standard deviation of the residuals, indicating the average difference between the actual and predicted values of the dependent variable.

Multiple R-squared: This value represents the proportion of the total variability in the dependent variable explained by the independent variables in the model.

Adjusted R-squared: This value adjusts the R-squared for the number of independent variables, providing a more accurate estimate of the model's explanatory power when multiple predictors are included.

F-statistic and p-value: These values indicate the overall significance of the regression model, with the F-statistic measuring the ratio of the explained variance to the unexplained variance and the p-value providing the probability of observing such an F-statistic under the null hypothesis (i.e., that all regression coefficients are equal to zero).
