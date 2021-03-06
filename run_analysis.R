## (1) Downloading and extracting data files

url_zip<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_zip,destfile="./Coursera.zip")
unzip("./Coursera.zip")
print("Data files have been successfully retrieved")
 
## (2) Opening files and assigning data frames

library(data.table)
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")

## (3) Main code

## (3.1) Merges the training and the test sets to create one data set
library(dplyr)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

## (3.2) Extracts only the measurements on the mean and standard deviation for each measurement
good_data <- select(merged_data, subject, code, contains("mean"), contains("std"))

## (3.3) Uses descriptive activity names to name the activities in the data set
good_data$code <- activities[good_data$code, 2]

## (3.4)Appropriately labels the data set with descriptive variable names 
names(good_data)[2] = "activity"
names(good_data)<-gsub("Acc", "Accelerometer", names(good_data))
names(good_data)<-gsub("Gyro", "Gyroscope", names(good_data))
names(good_data)<-gsub("BodyBody", "Body", names(good_data))
names(good_data)<-gsub("Mag", "Magnitude", names(good_data))
names(good_data)<-gsub("^t", "Time", names(good_data))
names(good_data)<-gsub("^f", "Frequency", names(good_data))
names(good_data)<-gsub("tBody", "TimeBody", names(good_data))
names(good_data)<-gsub("angle", "Angle", names(good_data))
names(good_data)<-gsub("gravity", "Gravity", names(good_data))
names(good_data)<-gsub("-mean()", "Mean", names(good_data), ignore.case = TRUE)
names(good_data)<-gsub("-std()", "Stdev", names(good_data), ignore.case = TRUE)
names(good_data)<-gsub("-freq()", "Frequency", names(good_data), ignore.case = TRUE)

## (3.5) From the data set in step 4, creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.
final_data <- group_by(good_data,subject, activity) 
write.table(final_data, "./FinalData.txt", row.name=FALSE)

