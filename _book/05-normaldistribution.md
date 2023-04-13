---
editor_options: 
  markdown: 
    wrap: 72
---

# Normal Distribution

The Normal distribution is a continuous, symmetric, bell-shaped
distribution that is defined by two parameters: the mean (μ) and the
standard deviation (σ).

The mean (μ) determines the center of the distribution, and the standard
deviation (σ) controls the spread or dispersion of the data.
Approximately 68% of the data falls within one standard deviation from
the mean, 95% falls within two standard deviations, and 99.7% falls
within three standard deviations. This is known as the Empirical Rule or
the 68-95-99.7 rule.

The probability density function (PDF) of the Normal distribution is
given by:

f(x) = (1 / (σ \* √(2π))) \* e\^(-1/2 \* ((x - μ) / σ)\^2)

Where:

f(x) is the probability density at point x μ is the mean of the
distribution σ is the standard deviation of the distribution e is the
base of the natural logarithm (approximately 2.718) π is the
mathematical constant Pi (approximately 3.141) To help you visualize the
Normal distribution, consider the following example using R:


```r
# Load required libraries
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.2.3

# Define the mean and standard deviation
mean <- 0
sd <- 1

# Generate a sequence of x values
x <- seq(-4, 4, length.out = 1000)

# Calculate the probability density function for the x values
pdf <- dnorm(x, mean = mean, sd = sd)

# Create the plot
ggplot() +
  geom_line(aes(x, pdf), color = "blue") +
  xlab("X") +
  ylab("Probability Density") +
  ggtitle("Normal Distribution (μ = 0, σ = 1)") +
  theme_minimal()
```

<img src="05-normaldistribution_files/figure-html/unnamed-chunk-1-1.png" width="672" />

This R code generates a plot of the Normal distribution with a mean of 0
and a standard deviation of 1, which is also known as the standard
Normal distribution or the Z-distribution. The plot shows the
bell-shaped curve of the distribution, illustrating how the data is
symmetric around the mean and decreases as you move away from the
center.

ggplot2 is a powerful package to draw graphics. It implements the
grammar of graphics (and hence its name). You can find the official
documentation for ggplot2 here: <https://ggplot2.tidyverse.org> We can
also use ggplot2 to create different descriptive graphs we create
earlier and also customize as we want.

Understanding the Normal distribution is crucial in statistics because
many statistical tests and procedures are based on the assumption of
Normality. It is also essential because, in practice, many naturally
occurring phenomena approximately follow a Normal distribution.

# Skewness and Kurtosis

Skewness and Kurtosis are two different measures of shapes and
distribution of a dataset in qualitative methods.

## Skewness

Skewness is a measure of the asymmetry of a distribution. It describes
the degree to which the distribution deviates from a symmetric shape. A
skewness value of 0 indicates a perfectly symmetric distribution.
Positive skewness indicates a distribution with a longer tail on the
right side, while negative skewness indicates a longer tail on the left
side.

## Kurtosis

Kurtosis is a measure of the "tailedness" or "peakedness" of a
distribution. It describes how the distribution's tails and peak compare
to a normal distribution. A kurtosis value of 0 indicates a distribution
with a similar shape to a normal distribution. Positive kurtosis
indicates a distribution with heavier tails and a more peaked shape than
a normal distribution, while negative kurtosis indicates lighter tails
and a less peaked shape.

## Generating Skewness and Kurtosis using R

We can use the same *psych* package to generate skewness and Kurtosis.
