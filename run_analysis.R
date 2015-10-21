## Copyright 21 October 2015 by Bruce Leistikow
## for Coursera Class entitled, "Getting and Cleaning Data"; Course ID: getdata-033
## 
## This R script named "run_analysis.R" performs the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.

run_analysis <- function() {
  
  ## Assume that the function is called from the 'root' of the unzipped collection of data files
  
  ## Step 0 - Ensure that the require packages and data are available
  if (!require("data.table")) {
    install.packages("data.table")
  }
  require("data.table")
  
  if (!require("plyr")) {
    install.packages("plyr")
  }
  require("plyr")
  
  
  ## Step 1 - Merge the training and test sets into a single data set
  ## Step 1.1 - Obtain the raw data
  
  x_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")
  
  x_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  
  ## Step 1.2 - Bind the training and test datasets together
  x_ds <- rbind(x_train, x_test)
  y_ds <- rbind(y_train, y_test)
  subject_ds <- rbind(subject_train, subject_test)
  
  
  ## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## Step 2.1 - Get the Feature data
  features <- read.table("features.txt")
  
  ## Step 2.2 - find columns with mean or std in the feature names
  mANDs <- grep("-(mean|std)\\(\\)", features[, 2])
  
  ## Step 2.3 - subset to those names
  x_ds <- x_ds[, mANDs]
  
  ## Step 2.4 - correct the colnames
  names(x_ds) <- features[mANDs, 2]
  
  
  ## Step 3 - Uses descriptive activity names to name the activities in the data set
  ## Step 3.1 - Get the Activity Labels
  activity_lables <- read.table("activity_labels.txt")
  
  ## Step 3.2 - Update to these activity lables
  y_ds[, 1] <- activity_lables[y_ds[, 1], 2]
  
  ## Step 3.3 - Update the column name
  names(y_ds) <- "ACTIVITY"
  
  
  ## Step 4 - Appropriately labels the data set with descriptive variable names.
  ## Step 4.1 - Update the column name
  names(subject_ds) <- "SUBJECT"
  
  ## Step 4.2 - Finish combinging all the data together
  # Fuse all the datasets using cbind
  fused_ds <- cbind(x_ds, y_ds, subject_ds)
  
  
  ## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average 
  ##          of each variable for each activity and each subject.
  ## Step 5.1 - Calculate the means for each variable, activity, and subject
  tidy_ds <- ddply(fused_ds, .(SUBJECT, ACTIVITY), function(x) colMeans(x[, 1:66]))
  
  ## Step 5.1 - Write out the tidy dataset
  write.table(tidy_ds, "tidy.txt", row.name=FALSE)
  
}