# R Basics

This sections covers everything you need to get run statistical analysis using R. Just like other programming language, R also has a base package and an Integrated Development Environment. Base package is what you need to run your R code in your computer. R Studio is an IDE developed specifically focusing on development of R programs and packages.

## Installing R base package.

R base package can be downloaded from [official website](https://cran.r-project.org/) of R. Once, you enter inside the website select the package for your operating system, download the file and install it. To ensure R is successfully installed, you should be able to run it from your command prompt or terminal using `R` command. Type `q()` to quit R console.

```         
$ R

R version 4.2.1 (2022-06-23 ucrt) -- "Funny-Looking Kid"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> q()
```

### Download R studio

Well, we do not need to do everything from command or terminal. R community has also a fully fledged development environment called R Studio which is free to use and very user friendly to work in R. You can download R studio from [here](https://posit.co/download/rstudio-desktop/).

The following resources provide an overview and introduction to the various components of R Studio:

-   [**RStudio IDE Cheat Sheet**](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)

-   [**Getting Started with RStudio**](https://support.rstudio.com/hc/en-us/articles/201141096-Getting-Started-with-RStudio)

This tutorial will help you understand the basic overview and components of R studio.

## R Packages

While R is simply a statistically programming language, the R packages developed by R community has been one of the key reason of its robustness, reproducibility and flexibility. Many statistics programmers have developed 100s of packages which we can run even complex statistics functions with single line of code. We will be using a few key packages throughout our examples and also discuss about those packages.

## R Console

The R Console is the interactive command-line interface for R, where you can enter commands and see their output. It's an essential component of RStudio, and you can use it for various tasks such as data manipulation, statistical analysis, and creating graphics.

## Getting Help

Here are few useful syntax to ask for help

```         
{Get help for an object, in this case for the –-plot– function. 
?plot  #You can also type: help(plot)

#Search the help pages for anything that has the word "regression". 
??regression #You can also type:  help.search("regression")

#Search the word "age" in the objects available in the current R session.
 apropos("age")
help(package=car) # View documentation in package ‘car’. You can also type: library(help="car“)
help(DataABC) # Access codebook for a dataset called ‘DataABC’ in the package ABC
args(log) # Description of the command.}
```

## **R Community and Resources**

R has a large community of developers and supporters. The following resources may be helpful as you progress in your research and experiments with R:

### **Documentation / Websites**

1.  [R Documentation](https://www.rdocumentation.org/)

2.  [R-bloggers](https://www.r-bloggers.com/)

3.  [RStudio Community](https://community.rstudio.com/)

4.  [Stack Overflow](https://stackoverflow.com/questions/tagged/r)

### **Books**

1.  Field, A., Miles, J., & Field, Z. (2012). Discovering statistics using R. London: Sage Publications.

2.  Kabacoff, R. I. (2015). R in action: Data analysis and graphics with R. Manning Publications Co.

3.  Navarro, D. J. (2015). Learning statistics with R: A tutorial for psychology students and other beginners. University of Adelaide.

4.  Wickham, H. (2014). Advanced R. CRC Press.

5.  Wilke, C. O. (2019). Fundamentals of Data Visualization: A Primer on Making Informative and Compelling Figures. O'Reilly Media.

### **Cheatsheets**

1.  [RStudio Cheatsheets](https://rstudio.com/resources/cheatsheets/)

2.  [DataCamp Cheatsheets](https://www.datacamp.com/community/data-science-cheatsheets)
