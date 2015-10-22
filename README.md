# Getting-and-Cleaning-Data-Project
This is my project repository for the Coursera class entitled [Getting and Cleaning Data] (https://www.coursera.org/course/getdata).  This project's goal is to read the **Human Activity Recognition Using Smartphones data set** and to perform an analysis on this data.

This repository contains the following files:

1. **README.md** - this file describing the repository's purpose and contents
2. **CodeBook.md** - a file describing the analysis conducted and the variables used
3. **run_analysis.R** - the R script used to conduct the analysis and generate the output
4. **tidy.txt** - the output file generated by the run_analysis.R script

If attempting to use the **run_analysis.R** script, it assumes the following:

* The raw data has been downloaded from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
* The raw data has been unzipped and the structure has not been altered.
* The run_analysis.R script has been placed at the root of the unzipped directory structure
* The working directory is set to the root of the unzipped data set (i.e. "UCI HAR Dataset")

The resulting output file, **tidy.txt** will be found at the root of the unzipped data set (i.e. "UCI HAR Dataset")
