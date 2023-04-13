# Post hoc tests

Post hoc tests are statistical analyses performed after an ANOVA or other omnibus tests to determine which specific group means are significantly different from each other. These tests are necessary because ANOVA only tells you if there's a significant difference between groups but doesn't identify which groups are different.

## Tukey's Post Hoc Tests
Tukey's post hoc test, also known as Tukey's Honestly Significant Difference (HSD) test, is a widely used method for performing multiple comparisons. It is important because it controls the family-wise error rate (FWER), which is the probability of making at least one Type I error (false positive) when performing multiple tests. By controlling the FWER, Tukey's HSD test helps to reduce the risk of identifying false significant differences between groups due to chance alone.


## Performing Tukey's Post Hoc Tests using R
After running a one-way ANOVA using the aov() function, as shown in the previous answer, you can use the multcomp package to perform Tukey's post hoc test.

We will create a new variable in our dataframe named "Factors"where we will define the Sport variable as nominal and giving them cetain names. 


```r

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

# Creating new variable as factors
ourdata$SportF <- factor(ourdata$Sport, labels= c("movement", "target", "fielding", "territory"))

#Always good idea to verify. 
summary(ourdata)
#>      Sport         Distress           SportF 
#>  Min.   :1.00   Min.   : 3.00   movement :8  
#>  1st Qu.:1.75   1st Qu.:12.00   target   :8  
#>  Median :2.50   Median :20.00   fielding :8  
#>  Mean   :2.50   Mean   :18.41   territory:8  
#>  3rd Qu.:3.25   3rd Qu.:25.00                
#>  Max.   :4.00   Max.   :30.00
```

Then we generate one way ANOVA using the new factor varaible. 

```r
# Perform one-way ANOVA
anova_result <- aov(Distress ~ SportF, data = ourdata)

# Display the result
summary(anova_result)
#>             Df Sum Sq Mean Sq F value  Pr(>F)   
#> SportF       3  738.6  246.20   6.818 0.00136 **
#> Residuals   28 1011.1   36.11                   
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
Then we do post hoc test, 


```r
# Load the necessary packages
library(multcomp)
#> Warning: package 'multcomp' was built under R version 4.2.3
#> Loading required package: mvtnorm
#> Loading required package: survival
#> Loading required package: TH.data
#> Warning: package 'TH.data' was built under R version 4.2.3
#> Loading required package: MASS
#> 
#> Attaching package: 'TH.data'
#> The following object is masked from 'package:MASS':
#> 
#>     geyser

# Run Tukey's HSD post hoc test
tukey_results <- glht(anova_result, linfct = mcp(SportF = "Tukey"))

# Summary of Tukey's HSD test
summary(tukey_results)
#> 
#> 	 Simultaneous Tests for General Linear Hypotheses
#> 
#> Multiple Comparisons of Means: Tukey Contrasts
#> 
#> 
#> Fit: aov(formula = Distress ~ SportF, data = ourdata)
#> 
#> Linear Hypotheses:
#>                           Estimate Std. Error t value
#> target - movement == 0       6.750      3.005   2.247
#> fielding - movement == 0     9.125      3.005   3.037
#> territory - movement == 0   13.250      3.005   4.410
#> fielding - target == 0       2.375      3.005   0.790
#> territory - target == 0      6.500      3.005   2.163
#> territory - fielding == 0    4.125      3.005   1.373
#>                           Pr(>|t|)    
#> target - movement == 0      0.1357    
#> fielding - movement == 0    0.0249 *  
#> territory - movement == 0   <0.001 ***
#> fielding - target == 0      0.8582    
#> territory - target == 0     0.1585    
#> territory - fielding == 0   0.5262    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> (Adjusted p values reported -- single-step method)

# Confidence intervals for the pairwise comparisons
confint(tukey_results)
#> 
#> 	 Simultaneous Confidence Intervals
#> 
#> Multiple Comparisons of Means: Tukey Contrasts
#> 
#> 
#> Fit: aov(formula = Distress ~ SportF, data = ourdata)
#> 
#> Quantile = 2.7272
#> 95% family-wise confidence level
#>  
#> 
#> Linear Hypotheses:
#>                           Estimate lwr     upr    
#> target - movement == 0     6.7500  -1.4443 14.9443
#> fielding - movement == 0   9.1250   0.9307 17.3193
#> territory - movement == 0 13.2500   5.0557 21.4443
#> fielding - target == 0     2.3750  -5.8193 10.5693
#> territory - target == 0    6.5000  -1.6943 14.6943
#> territory - fielding == 0  4.1250  -4.0693 12.3193
```

The first part of the output shows the estimated mean differences between groups, standard errors, t-values, and adjusted p-values. The second part of the output presents the confidence intervals for the pairwise comparisons.

Here's a breakdown of the output:

Estimate: The estimated mean difference between each pair of groups.
Std. Error: The standard error associated with each estimate.
t value: The t-statistic for each pairwise comparison.
Pr(>|t|): The adjusted p-value for each pairwise comparison, controlling for multiple comparisons (single-step method).

In this case, the fielding vs. movement comparison and the territory vs. movement comparison are significant at the 0.05 and 0.001 levels, respectively.

The second part of the output provides simultaneous confidence intervals for the pairwise comparisons. The 'lwr' and 'upr' columns represent the lower and upper bounds of the 95% confidence intervals, respectively. If a confidence interval does not include zero, it indicates a significant difference between the corresponding pair of group means.

From the confidence intervals, we can see that the fielding vs. movement and territory vs. movement comparisons have intervals that do not include zero, which is consistent with the significant adjusted p-values found in the first part of the output.







