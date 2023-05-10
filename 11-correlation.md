# Correlation

Correlation is a standardized measure of the linear relationship between two variables. Pearson's correlation coefficient (r), the most commonly used correlation measure, ranges from -1 to 1, with -1 indicating a perfect negative relationship, 1 indicating a perfect positive relationship, and 0 indicating no linear relationship.

Mathematically, Pearson's correlation coefficient (r) can be calculated using the following formula:

r = Σ((Xi - X_mean) \* (Yi - Y_mean)) / (sqrt(Σ(Xi - X_mean)\^2) \* sqrt(Σ(Yi - Y_mean)\^2))

where:

Xi and Yi are the individual data points for variables X and Y, respectively X_mean and Y_mean are the means of variables X and Y, respectively Σ denotes the sum over all data points This formula calculates the correlation coefficient by dividing the covariance of X and Y by the product of their standard deviations.


```r
library(readr)
#> Warning: package 'readr' was built under R version 4.2.2
# Read the CSV file into a data frame
cordata <- read_csv("exampledata/Ch10_kidspets.csv")
#> Rows: 5 Columns: 2
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> dbl (2): Children, Pets
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

# Calculate the covariance between two variables (e.g., var1 and var2)
correlation<- cor(cordata$Children, cordata$Pets)
print(correlation)
#> [1] 0.9
```

To interpret the result:

-   A correlation coefficient close to 1 indicates a strong positive relationship between the variables, meaning that as one variable increases, the other variable also tends to increase.
-   A correlation coefficient close to -1 indicates a strong negative relationship, meaning that as one variable increases, the other variable tends to decrease.
-   A correlation coefficient close to 0 suggests that there is no linear relationship between the two variables.

A significant correlation between two variables indicates that there is a relationship between them, but it does not necessarily mean that one variable causes the other. Additional research and analysis may be needed to establish causality.
