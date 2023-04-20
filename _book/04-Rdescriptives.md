# Describing Data in R

Describing data is the process of summarizing and interpreting information that has been collected through research or observation.

To describe data, we typically use statistical measures such as measures of central tendency (e.g., mean, median, mode) and measures of variability (e.g., range, variance, standard deviation). These measures help us to understand the distribution of the data, including how the data is spread out and whether it is skewed or symmetrical.

When describing data, it's important to consider the research question or hypothesis that is being investigated. By focusing on the relevant aspects of the data and using appropriate statistical and visual tools, we can better understand the underlying trends and relationships in the data and draw meaningful conclusions that can inform future research or educational practice.

## Central Tendency:

Central tendency measures provide a single value that represents the center or "typical" value of a dataset. The primary measures of central tendency are the mean, median, and mode.

### Sample Mean

The sample mean is the average value of a variable in a sample. It is denoted by the symbol "x̄".

The sample mean, often referred to as the average, is the sum of all data points divided by the total number of data points. The mean is sensitive to extreme values (outliers) and may not always represent the true center of the data.

$\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i$

where $\bar{x}$ is the mean, $n$ is the total number of data points, and $x_i$ are the individual data points.

In R, we can calculate the mean using the **`mean()`** function. For example:


```r
# Example: Mean test scores of all students in a school
scores <- c(80, 85, 90, 75, 95, 85, 70, 75, 90, 80)
mean(scores)
#> [1] 82.5
```

### Median

The median is the middle value of a dataset when it is sorted in ascending or descending order. If the dataset has an odd number of data points, the median is the middle value; if it has an even number of data points, the median is the average of the two middle values. The median is less sensitive to extreme values compared to the mean.

t is represented as:

$median = \begin{cases} x_{(n+1)/2} &\text{if }n\text{ is odd}\ \frac{x_{n/2} + x_{(n/2)+1}}{2} &\text{if }n\text{ is even} \end{cases}$

where $n$ is the total number of data points, and $x_{(n+1)/2}$ and $x_{n/2}$ are the middle values for odd and even $n$ respectively.


```r
# Example: Median income
income <- c(25000, 30000, 35000, 40000, 45000, 50000) # income data
median(income) # calculate the median
#> [1] 37500
```

### Mode

The mode is the value that occurs most frequently in a dataset. A dataset can have more than one mode (multimodal) or no mode (no value occurs more than once). The mode can be used for both numerical and categorical data.

## Measures of Dispersion

Measures of dispersion are statistical values that describe the degree of spread or variability of a dataset. There are several measures of dispersion, including the range, interquartile range, variance, and standard deviation. In this section, we will discuss each measure of dispersion and its formula in detail.

### Range:

The range is the simplest measure of dispersion that gives the difference between the maximum and minimum values in a dataset. It provides an idea of how spread out the data is. However, it is highly sensitive to outliers and does not provide information about the distribution's shape. The formula for the range is as follows:

```{=tex}
\begin{equation}
Range = Max(X) - Min(X)
\end{equation}
```
The range() function returns the difference between the maximum and minimum values in a dataset, providing a measure of the spread of data around them.


```r
# Example dataset
income <- c(25000, 30000, 35000, 40000, 45000, 50000)
# Calculate range
range(income)
#> [1] 25000 50000
```

### Interquartile Range (IQR):

The interquartile range (IQR) is the measure of dispersion that indicates the spread of the middle 50% of the data. It is less sensitive to outliers than the range. The IQR is defined as the difference between the first quartile (Q1, the 25th percentile) and the third quartile (Q3, the 75th percentile) of a dataset. The formula for IQR is as follows:

```{=tex}
\begin{equation}
IQR = Q3 - Q1
\end{equation}
```
where Q1 is the first quartile and Q3 is the third quartile of the dataset.

The IQR() function calculates the difference between the 75th percentile (Q3) and the 25th percentile (Q1) of a dataset, providing a measure of the spread of the middle 50% of the data.


```r
IQR(income)
#> [1] 12500
```

### Variance:

The variance is a measure of dispersion that quantifies the average deviation of data points from the mean. It measures how far a set of numbers is spread out from their average value. The variance is expressed in squared units and is influenced by outliers. There are two types of variance: population variance and sample variance.

Population variance is used when the entire population is available, while sample variance is used when only a sample of the population is available. The formula for population variance is as follows:

```{=tex}
\begin{equation}
\sigma^2 = \frac{\sum(X - \mu)^2}{N}
\end{equation}
```
where X is the data point, μ is the mean of the dataset, and N is the total number of data points in the population.

The formula for sample variance is slightly different and is as follows:

```{=tex}
\begin{equation}
s^2 = \frac{\sum(X - \bar{x})^2}{n - 1}
\end{equation}
```
where X is the data point, $\bar{x}$ is the mean of the sample, and n is the sample size.

`var()` function is used to calcultate the variance.


```r
# Calculate variance
var(income)
#> [1] 87500000
```

### Standard Deviation:

The standard deviation is the square root of the variance. It is a widely used measure of dispersion that measures the average deviation of data points from the mean. It is expressed in the same units as the data and is sensitive to outliers, just like variance. There are two types of standard deviation: population standard deviation and sample standard deviation.

The formula for population standard deviation is as follows:

```{=tex}
\begin{equation}
\sigma = \sqrt{\sigma^2}
\end{equation}
```
where $\sigma^2$ is the population variance.

The formula for sample standard deviation is slightly different and is as follows:

```{=tex}
\begin{equation}
s = \sqrt{s^2}
\end{equation}
```
where s\^2 is the sample variance.

`sd()` function is used to calculate the standard deviation.


```r
# Calculate standard deviation
sd(income)
#> [1] 9354.143
```

## The `psych` package - Kitchen knife of social scientists

The psych package in R is a popular package for psychometrics and psychological research. It contains various functions for data manipulation, visualization, and statistical analysis. Some of the commonly used functions in the psych package include `describe()`, `alpha()`, and `fa()`.

### The `describe()` Function

The describe() function in the psych package provides a summary of a dataset's variables. It includes the number of observations, mean, standard deviation, minimum, maximum, and other useful statistics. Here's an example:


```r
# Load required packages and dataset
library(psych)
#> Warning: package 'psych' was built under R version 4.2.3
library(ISLR)
#> Warning: package 'ISLR' was built under R version 4.2.3
data("College") 
```

Descriptives of *income* dataset


```r

#view summary of the income data
describe(income)
#>    vars n  mean      sd median trimmed     mad   min   max
#> X1    1 6 37500 9354.14  37500   37500 11119.5 25000 50000
#>    range skew kurtosis      se
#> X1 25000    0     -1.8 3818.81
```

We will use the College dataset from the ISLR package [@ISLR] . This dataset contains information on a number of colleges in the US, including variables such as acceptance rate, graduation rate, and median SAT score.


```r
# View summary statistics of the college dataset
describe(College)
#>             vars   n     mean      sd median  trimmed
#> Private*       1 777     1.73    0.45    2.0     1.78
#> Apps           2 777  3001.64 3870.20 1558.0  2193.01
#> Accept         3 777  2018.80 2451.11 1110.0  1510.29
#> Enroll         4 777   779.97  929.18  434.0   575.95
#> Top10perc      5 777    27.56   17.64   23.0    25.13
#> Top25perc      6 777    55.80   19.80   54.0    55.12
#> F.Undergrad    7 777  3699.91 4850.42 1707.0  2574.88
#> P.Undergrad    8 777   855.30 1522.43  353.0   536.36
#> Outstate       9 777 10440.67 4023.02 9990.0 10181.66
#> Room.Board    10 777  4357.53 1096.70 4200.0  4301.70
#> Books         11 777   549.38  165.11  500.0   535.22
#> Personal      12 777  1340.64  677.07 1200.0  1268.35
#> PhD           13 777    72.66   16.33   75.0    73.92
#> Terminal      14 777    79.70   14.72   82.0    81.10
#> S.F.Ratio     15 777    14.09    3.96   13.6    13.94
#> perc.alumni   16 777    22.74   12.39   21.0    21.86
#> Expend        17 777  9660.17 5221.77 8377.0  8823.70
#> Grad.Rate     18 777    65.46   17.18   65.0    65.60
#>                 mad    min     max   range  skew kurtosis
#> Private*       0.00    1.0     2.0     1.0 -1.02    -0.96
#> Apps        1463.33   81.0 48094.0 48013.0  3.71    26.52
#> Accept      1008.17   72.0 26330.0 26258.0  3.40    18.75
#> Enroll       354.34   35.0  6392.0  6357.0  2.68     8.74
#> Top10perc     13.34    1.0    96.0    95.0  1.41     2.17
#> Top25perc     20.76    9.0   100.0    91.0  0.26    -0.57
#> F.Undergrad 1441.09  139.0 31643.0 31504.0  2.60     7.61
#> P.Undergrad  449.23    1.0 21836.0 21835.0  5.67    54.52
#> Outstate    4121.63 2340.0 21700.0 19360.0  0.51    -0.43
#> Room.Board  1005.20 1780.0  8124.0  6344.0  0.48    -0.20
#> Books        148.26   96.0  2340.0  2244.0  3.47    28.06
#> Personal     593.04  250.0  6800.0  6550.0  1.74     7.04
#> PhD           17.79    8.0   103.0    95.0 -0.77     0.54
#> Terminal      14.83   24.0   100.0    76.0 -0.81     0.22
#> S.F.Ratio      3.41    2.5    39.8    37.3  0.66     2.52
#> perc.alumni   13.34    0.0    64.0    64.0  0.60    -0.11
#> Expend      2730.95 3186.0 56233.0 53047.0  3.45    18.59
#> Grad.Rate     17.79   10.0   118.0   108.0 -0.11    -0.22
#>                 se
#> Private*      0.02
#> Apps        138.84
#> Accept       87.93
#> Enroll       33.33
#> Top10perc     0.63
#> Top25perc     0.71
#> F.Undergrad 174.01
#> P.Undergrad  54.62
#> Outstate    144.32
#> Room.Board   39.34
#> Books         5.92
#> Personal     24.29
#> PhD           0.59
#> Terminal      0.53
#> S.F.Ratio     0.14
#> perc.alumni   0.44
#> Expend      187.33
#> Grad.Rate     0.62
```
