# One way ANOVA

One-way Analysis of Variance (ANOVA) is a statistical method used to analyze the differences between the means of three or more groups. It is a fixed-effects model, which means that it assumes that the levels of the independent variable (the factor) are fixed and have been specifically chosen by the researcher. In educational research, one-way ANOVA can be used to compare the mean scores of students from different schools, teaching methods, or grade levels.

The basic idea behind one-way ANOVA is to partition the total variation in the dependent variable into two components: between-group variation and within-group variation. Between-group variation represents the differences in the means between the groups, while within-group variation represents the differences within each group that can be attributed to random error or individual differences.

Mathematically, the one-way ANOVA model can be represented as:

Y_ij = μ + α_i + ε_ij

Where:

Y_ij is the observation for the j-th individual in the i-th group
μ is the overall mean of the dependent variable
α_i is the effect of the i-th group (the difference between the group mean and the overall mean)
ε_ij is the error term (the residual difference between the observed value and the predicted value)

## Characteristics
The characteristics of one-way ANOVA include:

One independent variable (factor) with at least three levels (groups): One-way ANOVA is designed to analyze the differences between the means of three or more groups. The independent variable should be categorical, and each level represents a distinct category.

Independent observations: The observations in each group should be independent of each other, which means that the outcome for one individual should not influence the outcome for another individual.

Normality: The dependent variable should be approximately normally distributed within each group. This assumption can be checked using graphical techniques (e.g., histograms or Q-Q plots) or formal tests (e.g., Shapiro-Wilk test).

Homogeneity of variances: The variances of the dependent variable should be approximately equal across all groups. This assumption can be checked using Levene's test or Bartlett's test.

Interval or ratio scale of measurement: The dependent variable should be measured on an interval or ratio scale, which means that the differences between the values have meaning, and there is a true zero point.

One-way ANOVA is a powerful technique for comparing the means of multiple groups, allowing researchers to determine whether there are any statistically significant differences between them.

## Performing one Way ANOVA using R

The base R aov() function and the **car** package are used for the actual ANOVA and homogeneity tests.


```r
# Load required libraries
library(psych)
#> Warning: package 'psych' was built under R version 4.2.3

# Read the CSV file
ourdata <- read.csv("exampledata/Ch11_distress.csv")

# Inspect the data
head(ourdata)
#>   Sport Distress
#> 1     1       15
#> 2     1       10
#> 3     1       12
#> 4     1        8
#> 5     1       21
#> 6     1        7

#Summary Statistics
summary(ourdata)
#>      Sport         Distress    
#>  Min.   :1.00   Min.   : 3.00  
#>  1st Qu.:1.75   1st Qu.:12.00  
#>  Median :2.50   Median :20.00  
#>  Mean   :2.50   Mean   :18.41  
#>  3rd Qu.:3.25   3rd Qu.:25.00  
#>  Max.   :4.00   Max.   :30.00

# Perform one-way ANOVA
anova_result <- aov(Distress ~ Sport, data = ourdata)

# Display the result
summary(anova_result)
#>             Df Sum Sq Mean Sq F value   Pr(>F)    
#> Sport        1  709.8   709.8   20.48 8.87e-05 ***
#> Residuals   30 1039.9    34.7                     
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
Lets break down the output:
Let's break it down:

Df (Degrees of Freedom): The degrees of freedom for the "Sport" factor is 1, and for the "Residuals" (error term) is 30. The degrees of freedom are used in the calculation of the F value.

Sum Sq (Sum of Squares): The sum of squares for the "Sport" factor is 709.8, and for the "Residuals" is 1039.9. The sum of squares represents the variation in the data that is accounted for by the factor (Sport) and the error term (Residuals).

Mean Sq (Mean Squares): The mean squares for the "Sport" factor is 709.8, and for the "Residuals" is 34.7. Mean squares are calculated by dividing the sum of squares by the degrees of freedom.

F value: The F value is 20.48. This is the test statistic for the one-way ANOVA, which is calculated by dividing the mean square for the "Sport" factor by the mean square for the "Residuals". The F value is used to determine if there is a statistically significant difference between the group means.

p-value: The p-value for the "Sport" factor is 8.87e-05 (0.0000887). This is the probability of observing an F value as extreme as the one calculated (20.48) if there were no true differences between the group means (null hypothesis).
Since the p-value (0.0000887) is less than the significance level (0.05), we can conclude that there is a statistically significant difference between the group means for the "Sport" factor(choice of participation).


We can also check the homogeneity, normality and effect size. 

```r
# Perform Shapiro-Wilk test for normality for each group
shapiro_test1 <- shapiro.test(ourdata$Distress[ourdata$Sport=="1"])
shapiro_test2 <- shapiro.test(ourdata$Distress[ourdata$Sport=="2"])
shapiro_test3 <- shapiro.test(ourdata$Distress[ourdata$Sport=="3"])
shapiro_test4 <- shapiro.test(ourdata$Distress[ourdata$Sport=="4"])

# Display the results
shapiro_test1
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  ourdata$Distress[ourdata$Sport == "1"]
#> W = 0.9847, p-value = 0.9823
shapiro_test2
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  ourdata$Distress[ourdata$Sport == "2"]
#> W = 0.93162, p-value = 0.531
shapiro_test3
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  ourdata$Distress[ourdata$Sport == "3"]
#> W = 0.90504, p-value = 0.3204
shapiro_test4
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  ourdata$Distress[ourdata$Sport == "4"]
#> W = 0.93347, p-value = 0.5482

# Load car library for Levene's test
library(car)
#> Warning: package 'car' was built under R version 4.2.3
#> Loading required package: carData
#> Warning: package 'carData' was built under R version 4.2.3
#> 
#> Attaching package: 'car'
#> The following object is masked from 'package:psych':
#> 
#>     logit

# Perform Levene's test
levene_test <- leveneTest(ourdata$Distress, ourdata$Sport )
#> Warning in leveneTest.default(ourdata$Distress,
#> ourdata$Sport): ourdata$Sport coerced to factor.

# Display the result
levene_test
#> Levene's Test for Homogeneity of Variance (center = median)
#>       Df F value Pr(>F)
#> group  3  0.6039  0.618
#>       28
```

The Shapiro-Wilk test is used to assess whether the sample data comes from a normally distributed population.All four sports, The p-values in all four sports are greater than the significance level of 0.05, indicating that we cannot reject the null hypothesis that the data is normally distributed. This suggests that the 'Distress' variable within each sport group is likely to be normally distributed, which is an important assumption for parametric statistical tests such as the one-way ANOVA.

Levene's test is used to assess if the variances of different groups are equal, which is an important assumption for one-way ANOVA. The p-value from Levene's test indicates that the assumption of homogeneity of variances is met for the data. This supports the use of one-way ANOVA to analyze differences between the group means.



