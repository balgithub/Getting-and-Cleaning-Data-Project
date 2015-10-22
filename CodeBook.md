# Code Book

This code book describes the data, the variables, and the work performed to clean up the data found in the **Human Activity Recognition Using Smartphones** dataset.

# Introduction

The **Human Activity Recognition Using Smartphones** dataset collected data on 30 subjects within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

# The Data

The dataset consists of a number data files of which the following are used in this analysis:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_test.txt': The subject identifer by data record.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_train.txt': The subject identifer by data record.
 
# The Variables
The variables used in the script and described here will generally follow the steps outlined in *The Work* section described below.  

In Step 1, each of the data files needed for the analysis are loaded into temporary variables using the read.table function.  For example, the data file named, "X_train.txt" was read into a temp variable named 'x_train'.  Similarly, temp variables named, y_train, subject_train, x_test, y_test, and subject_test held the associated data.  Next, similar datasets from the train and test groups were combined and stored in variables named, x_ds, y_ds, and subject_ds.

In Step 2, the features.txt file is loaded into a temp variable named 'features' which is then used to find the dataset variables containing either means or standard devation calculations.  These names are subset into a temp variable called mANDs which is used to further subset the x_ds variable and to set the associated column names.

In Step 3, the activity_labels.txt file is loaded into a temp variable named 'activity_labels' which is then used to replace the numeric identifier contained in the y_ds variable with a human readable label for each activity mentioned above.  Lastly, the column name in the y_ds variable is updated to reflect its purpose.

In Step 4, the subject_ds variable has it's column name updated to reflect its purpose, and the various temp datasets (x_ds, y_ds, subject_ds) are fused together using cbind() into the final dataset using the internal variable name ' fused_ds'.

In Step 5, the tidy dataset entitled 'tidy_ds' is created using the ddply() function on the fused_ds variable using the colmeans() function and splitting the data by SUBJECT and ACTIVITY.  Lastly, the tidy_ds variable is written to the local working directory using the write.table() function.

# The Work

The run_analysis.R script performs the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
