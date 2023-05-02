# Loading Data in R

Data set can be directly imported or can be entered manually directly into R ans save as a R data file also. Lets see how we can manually enter and save or import different data formats in R Studio.

## Entering Data in R

We can start working in R right away by entering the data in R. To enter numerical data manually, `c` (stands for 'column') command is used.

```         
  age <- c(45, 23, 36, 29)
  
```

Similarly, categorical data can also be entered using quotation marks.

```         
  gpa <- c("A+", "A", "B+", "B")
  
```

## Importing CSV file

`read` command function in R is used to read the data files. To read CSV file, you can simply move the CSV file into the working directory and load the file using `read.csv` command. You will need the `readr` package to read CSV file.


```r
library (readr)
  csv1 <- read.csv("exampledata/survey1.csv")
  
 #To view the structure
  str(csv1)
#> 'data.frame':	100 obs. of  28 variables:
#>  $ sex         : int  0 0 0 0 0 0 0 0 1 1 ...
#>  $ height      : num  67 67 67 67 73 73 73 73 70 70 ...
#>  $ shoesize    : num  9.5 9.5 9.5 9.5 13 13 13 13 9 9 ...
#>  $ smoker      : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ handed      : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ mothand     : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ fathhand    : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ hairappt    : int  13 13 13 13 10 10 10 10 20 20 ...
#>  $ songs       : int  20 20 20 20 10 10 10 10 25 25 ...
#>  $ gpa_grade   : int  4 4 4 4 1 1 1 1 2 2 ...
#>  $ gpa         : num  4 4 4 4 3 3 3 3 3.6 3.6 ...
#>  $ exercise    : int  3 3 3 3 6 6 6 6 4 4 ...
#>  $ exercise_cat: int  3 3 3 3 4 4 4 4 3 3 ...
#>  $ polview     : int  4 4 4 4 2 2 2 2 3 3 ...
#>  $ tv          : int  6 6 6 6 15 15 15 15 8 8 ...
#>  $ coffee      : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ sleep       : num  9 9 9 9 6 6 6 6 6 6 ...
#>  $ drinks      : num  0.5 0.5 0.5 0.5 0 0 0 0 5 5 ...
#>  $ pepsicok    : int  1 1 1 1 0 0 0 0 1 1 ...
#>  $ haircol     : int  3 3 3 3 1 1 1 1 3 3 ...
#>  $ eyecolor    : int  3 3 3 3 3 3 3 3 2 2 ...
#>  $ distance    : num  1 1 1 1 60 60 60 60 80 80 ...
#>  $ distance_cat: int  1 1 1 1 2 2 2 2 3 3 ...
#>  $ books       : int  0 0 0 0 0 0 0 0 1 1 ...
#>  $ studyhrs    : int  3 3 3 3 3 3 3 3 4 4 ...
#>  $ studyhrs_cat: int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ mostint     : int  16 16 16 16 10 10 10 10 6 6 ...
#>  $ leastint    : int  8 8 8 8 13 13 13 13 3 3 ...
```

Here, *csv1* in the name assigned to the CSV file in R environment. You will be using the same variable name whenever you want to work with the csv file you imported.

## Importing SPSS and STATA file

R also has a package called `haven` which helps us read the SPSS and STATA data files easily in R. After installing the haven package, we use `read_sav` command to import the SPSS file.


```r
  #Install package
  install.packages('haven')
  
  #Load the package and read SPSS data file
  
  library(haven)
  savdata1 <- read_sav('ancova.sav')
  
  #To verify the file has been imported successfully.
  savdata1
  
  #Load the package and read STATA data file
  
  library(haven)
  dtadata1 <- read_dta('ancovastata.dta')
  
  #To verify the file has been imported successfully.
  dtadata1
  
```

## Importing Excel File

*readxl* package is used to read the excel file in R environment.


```r
 #Install package
  install.packages('readxl')
  
  #Load the package and read data
  
  library(readxl)
  xlsdata1 <- read_excel('C:\\Users\\para\\Downloads\\ancova.xls')
  
  #To verify the file has been imported successfully.
  xlsdata1
  
```

> R has comprehensive packages to import from multiple statistical systems. Some packages include `foreign`, `readdta1` etc. Find more about Data Import and Export in R [here](https://cran.r-project.org/doc/manuals/r-release/R-data.html).
