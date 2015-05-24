# Overview

This is a solution for the course project of Johns Hopkins' [Getting and Cleaning Data](https://www.coursera.org/course/getdata) on Coursera.

The solution contains:

* README.md - this readme file.
* run_analysis.R - the R script that generates the project's solution.
* CodeBook.md - a code book that describes the variables, the data, and the transformations performed to create the data.

# Running run_analysis.R

## Step 1: Download UCI HAR Dataset

The run_analysis.R script requires the UCI HAR Dataset directory be [downloaded](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ), extracted, and within R's working directory.

## Step 2: Install R packages

The following packages are required to for run_analysis.R:

1. data.table
2. dplyr
3. stringr

```
install.packages(c("data.table", "dplyr", "stringr"))
```

## Step 3: Execute run_analysis.R

The script run_analysis.R can be sourced, assuming the working directory includes the UCI HAR Dataset from Step 1 and the packages are installed from Step 2.

```
source('./run_analysis.R')
```

## Output: summarizedHarData.txt

The output of run_analysis.R is the file summarizedHarData.txt in the working directory.
