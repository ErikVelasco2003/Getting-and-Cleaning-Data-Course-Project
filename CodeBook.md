run_analysis.R

1) Download and extract data files from the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Open files and assign data frames, as follow:
features <- "./UCI HAR Dataset/features.txt"
activities <- "./UCI HAR Dataset/activity_labels.txt"
subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
x_test <- "./UCI HAR Dataset/test/X_test.txt"
y_test <- “./UCI HAR Dataset/test/y_test.txt"
subject_train <- "UCI HAR Dataset/train/subject_train.txt
x_train <- "./UCI HAR Dataset/train/X_train.txt"
y_train <- "./UCI HAR Dataset/train/y_train.txt"

3) Merges the training and the test sets to create one data set
This is done in four steps:
i)  x_train and x_test are merged in the data.frame x
ii) y_train and y_test are merged in the data.frame y
iii) subject_train and subject_test are merged in the data.frame subject
iv) finally, x, y and subject are merged in merged_data

4) Extracts only the measurements on the mean and standard deviation for each measurement

5) Uses descriptive activity names to name the activities in the data set

6) Appropriately labels the data set with descriptive variable names

7) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The final data set is stored in “./FinalData.txt”
