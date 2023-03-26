# Loading Data in R

Data set can be directly imported or can be entered manually directly into R ans save as a R data file also. Lets see how we can manually enter and save or import different data formats in R Studio.

## Entering Data in R

We can start working in R right away by entering the data in R. To enter numerical data manually, c (stands for 'column') command is used.

      age <- c(45, 23, 36, 29)
      

Similarly, categorical data can also be entered using quotation marks.

      gpa <- c("A+", "A", "B+", "B")
      

## Importing CSV file

read command function in R is used to read the data files. To read CSV file, you can simply move the CSV file into the working directory and load the file using read.csv command. You will need the readr package to read CSV file.

      library (readr)
      csv1 <- read.csv("records.csv")
      
      #To view the structure
      str(csv1)
      
      #To view the CSV file
      csv1

Here, csv1 in the name assigned to the CSV file in R environment. You will be using the same variable name whenever you want to work with the csv file you imported.

## Importing SPSS and STATA file

R also has a package called 'haven' which helps us read the SPSS and STATA data files easily in R. After installing the haven package, we use read_sav command to import the SPSS file.

      #Install package
      install.packages('haven')
      
      #Load the package and read SPSS data file
      
      library(haven)
      savdata1 <- read_sav('C:\\Users\\para\\Downloads\\ancova.sav')
      
      #To verify the file has been imported successfully.
      savdata1
      
      #Load the package and read STATA data file
      
      library(haven)
      dtadata1 <- read_dta('C:\\Users\\para\\Downloads\\ancovastata.dta')
      
      #To verify the file has been imported successfully.
      dtadata1
      

Note: It seems like we should be using \\ instead of  while writing the path name to prevent the error : `Error: '\U' used without hex digits in character string starting "'C:\U"1`

## Importing Excel File

*readxl* package is used to read the excel file in R environment.

     #Install package
      install.packages('readxl')
      
      #Load the package and read data
      
      library(readxl)
      xlsdata1 <- read_excel('C:\\Users\\para\\Downloads\\ancova.xls')
      
      #To verify the file has been imported successfully.
      xlsdata1
      

**R has comprehensive packages to import from multiple statistical systems. Some packages include foreign, readdta1 etc. Find more about Data Import and Export in R [here](https://cran.r-project.org/doc/manuals/r-release/R-data.html).**
