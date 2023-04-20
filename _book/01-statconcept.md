# Basic Statistical Concepts

## Population and Sample

### Population

A population is the entire group of individuals, objects, or events that we are interested in studying. It includes all possible cases that meet the defined criteria for the study. For example, the population of interest for a study on student performance may include all students in a specific school, district, or country.

**Characteristics of a population:**

-   The population is usually large, and it is often impractical or impossible to study the entire population.
-   The population has fixed and known statistical properties, such as population mean, variance, and standard deviation.
-   The statistical properties of the population can be estimated through a census or other data collection methods.
-   Research conducted on a population is often aimed at generalizing the results to the entire population.

### Population Parameters:

Population parameters are characteristics of a variable in a population. These parameters are usually unknown and must be estimated from a sample. Some common population parameters are:

**Population Mean (μ)**: The average value of a variable in a population.

**Population Variance (σ\^2)**: A measure of the variability or spread of a variable in a population.

**Population Standard Deviation (σ)**: The square root of the population variance, often used as a measure of the spread of a variable in a population.

**Population Proportion (p)**: The proportion of individuals in a population with a certain characteristic.

### Sample

A sample is a subset of the population that is selected to represent the population. It is a smaller group of cases that are selected from the population for the purpose of conducting research. For example, a sample of students may be selected from a school to participate in a study on student performance.

**Characteristics of a sample:**

-   The sample is smaller than the population and represents only a portion of the population.
-   The statistical properties of the sample are used to estimate the population parameters, but these estimates are subject to sampling variability.
-   Data is collected from a sample of the population, and statistical inference is used to make inferences about the population based on the sample.
-   Research conducted on a sample is often aimed at making inferences about the population based on the sample data.

We will be focussing on sample statistics while refering to descriptive statistics and use these statistics to infer the predictions for the larger population.

## Data Types

Data types idea in computer science and program shares similar nomenclature in case of statistics. Data is broadly classified into constant and variables in terms of its nature during the execution of the analysis or the statistical program.

**Constant** are those kind of data types which are not changed during the program or during analysis. For eg, the value of alpha (alpha) is always kept constant.

**Variables** are those data types which are changed or have multiple values in the program.

## Types of variable

1.  **Quantitative Variables (Continuous and Discrete):**

-   Continuous Variables: Variables that can take any value within a range, typically measured on a continuous scale. Example: Height, weight, or temperature.
-   Discrete Variables: Variables that can only take specific values, usually whole numbers or counts. Example: Number of students in a class, or number of books in a library.

2.  **Qualitative Variables (Nominal and Ordinal):**

-   Nominal Variables: Variables that represent categories without any inherent order. Example: Gender (male or female), or types of food (vegetarian or non-vegetarian).
-   Ordinal Variables: Variables that represent categories with a natural order or ranking. Example: Education level (elementary, high school, or college), or customer satisfaction ratings (poor, average, or excellent).


```r
   VARIABLES
                               |
                    +----------+-----------+
                    |                      |
              Quantitative           Qualitative
                    |                      |
             +------+-------+      +-------+-------+
             |              |      |               |
        Continuous    Discrete   Nominal      Ordinal

```

## Types of scales of measurement of variables

Four different types of scales of measurement are presented in the table below.

| **Scale of Measurement** | **Description**                                                                                    | **Example**                                             |
|----------------|------------------------------------|--------------------|
| Nominal                  | Categorical data without any inherent order or ranking. Each value represents a distinct category. | Gender (male or female), colors, or religion.           |
| Ordinal                  | Categorical data with a natural order or ranking, but without a specific numerical value.          | Education level, Likert scale, or age group.            |
| Interval                 | Numeric data with a constant difference between values, but no true zero point.                    | Temperature (Celsius or Fahrenheit), or calendar years. |
| Ratio                    | Numeric data with a constant difference between values and a true zero point.                      | Age, height, weight, or income.                         |
