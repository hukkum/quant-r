# Inferences between two means

The chapter covers different topics related to independent and dependent samples t-test, including its assumptions, procedures, and interpretations.

## Independent vs Dependent Samples

The table below provides a comprehensive comparison between dependent and independent samples, including their definitions, examples, hypothesis testing, assumptions, statistical tests, effect size measures, and R functions. By understanding these differences, we can choose the appropriate statistical test for their data and interpret the results correctly.

| **Feature**            | **Dependent Samples**                                                                                                                                                     | **Independent Samples**                                                                                                                                                                                                    |
|--------------|-------------------------|---------------------------------|
| **Definition**         | Dependent samples are paired or related observations collected from the same individuals or matched pairs.                                                                | Independent samples consist of observations collected from two separate and unrelated groups.                                                                                                                              |
| **Examples**           | \- Pre-test and post-test scores from the same individuals. \<br\> - Scores from matched pairs of individuals (e.g., siblings, twins).                                    | \- Test scores from two different groups of students taught using different teaching methods. \<br\> - Scores from two groups of participants exposed to different conditions in an experiment.                            |
| **Hypothesis Testing** | The null hypothesis states that there is no significant difference between the means of the paired differences. \<br\> H₀: μ₁ - μ₂ = 0                                    | The null hypothesis states that there is no significant difference between the means of the two independent groups. \<br\> H₀: μ₁ = μ₂                                                                                     |
| **Assumptions**        | \- The differences between the paired observations should be approximately normally distributed. \<br\> - The observations within each pair should be related or matched. | \- The observations in each group must be independent of each other. \<br\> - The data in each group should be approximately normally distributed. \<br\> - The variances of the two groups should be approximately equal. |
| **Statistical Test**   | Paired samples t-test                                                                                                                                                     | Independent samples t-test (or Welch's t-test if equal variances assumption is not met)                                                                                                                                    |
| **Effect Size**        | Cohen's d or the point-biserial correlation for paired samples                                                                                                            | Cohen's d or the point-biserial correlation for independent samples                                                                                                                                                        |
| **R Function**         | **`t.test(x, y, paired = TRUE)`**                                                                                                                                         | **`t.test(x, y)`** (or **`t.test(x, y, var.equal = FALSE)`** for Welch's t-test)                                                                                                                                           |
## Independent Samples t-test
The independent samples t-test is used to compare the means of two independent groups to determine if there is a significant difference between them.

The independent samples t-test is based on the following null (H₀) and alternative (H₁) hypotheses:

H₀: μ₁ = μ₂ (There is no significant difference between the means of the two groups.)
H₁: μ₁ ≠ μ₂ (There is a significant difference between the means of the two groups.)
The test statistic for the independent samples t-test is the t-value, which is calculated using the following formula:

t = (M₁ - M₂) / sqrt((s₁²/n₁) + (s₂²/n₂))

where:

M₁ and M₂ are the means of the two groups
s₁² and s₂² are the variances of the two groups
n₁ and n₂ are the sample sizes of the two groups
The t-value follows a t-distribution with degrees of freedom (df) approximated by the following formula:

df = min(n₁ - 1, n₂ - 1)

Once the t-value and degrees of freedom are calculated, the p-value can be determined by comparing the t-value to the t-distribution with the appropriate degrees of freedom. If the p-value is less than the chosen significance level (e.g., 0.05), the null hypothesis can be rejected, indicating a significant difference between the means of the two groups.

### Independent t-test using R
You will need data from two independent groups, typically stored in a data frame with one variable representing the group membership and another variable representing the outcome of interest.


```r
# Example data
group <- c("A", "A", "A", "A", "A", "B", "B", "B", "B", "B")
outcome <- c(10, 12, 14, 16, 18, 20, 22, 24, 26, 28)

# Create a data frame
data <- data.frame(group, outcome)
```

Perform the independent samples t-test: Use the t.test() function in R, specifying the formula and the data frame as arguments.


```r
# Perform the independent samples t-test
t_test_result <- t.test(outcome ~ group, data = data)

# Print the test result
print(t_test_result)
#> 
#> 	Welch Two Sample t-test
#> 
#> data:  outcome by group
#> t = -5, df = 8, p-value = 0.001053
#> alternative hypothesis: true difference in means between group A and group B is not equal to 0
#> 95 percent confidence interval:
#>  -14.612008  -5.387992
#> sample estimates:
#> mean in group A mean in group B 
#>              14              24
```

The output of the t.test() function will include the t-value, degrees of freedom, p-value, and confidence interval for the difference in means. If the p-value is less than the chosen significance level (e.g., 0.05), you can reject the null hypothesis, concluding that there is a significant difference between the means of the two groups.
