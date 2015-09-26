## You should create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.
##########################################################################################

# Clean up workspace
rm(list = ls())

## Download and unzip the dataset:
setwd("/Users/siyuanmeng/Downloads/")
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

# Reset working directory
setwd("/Users/siyuanmeng/Downloads/UCI HAR Dataset/")

## Read everything needed
features     <- read.table('./features.txt',header=FALSE) 
activityType <- read.table('./activity_labels.txt',header=FALSE)
# Training Dataset
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE)
xTrain       <- read.table('./train/x_train.txt',header=FALSE)
yTrain       <- read.table('./train/y_train.txt',header=FALSE)
Train <- cbind(subjectTrain, yTrain, xTrain)
# Test dataset
subjectTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest       <- read.table('./test/x_test.txt',header=FALSE)
yTest       <- read.table('./test/y_test.txt',header=FALSE)
Test <- cbind(subjectTest, yTest, xTest)

# Name header
colnames(Train) <- c('SubjectID', 'ActivityID', as.character(features[ ,2]))
colnames(Test) <- c('SubjectID', 'ActivityID', as.character(features[ ,2]))

## 1.Merged data
Merged_data <- rbind(Train, Test)

## 2.Extract only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(Merged_data)

Names <- (grepl("Activity..",colNames) | grepl("Subject..",colNames) | 
            grepl('mean', colNames)| grepl('std', colNames))
Merged_data <- Merged_data[Names]

## 3.Name the activities in the dataset
colnames(activityType)  <- c('ActivityID','activityType');
Renamed_data <- merge(Merged_data, activityType, by='ActivityID')
colNames <- colnames(Renamed_data)

## 4.Appropriately labels the data set with descriptive variable names
colNames <- gsub('BodyBody','Body',colNames)
colNames <- gsub('-mean','Mean',colNames)
colNames <- gsub('-std','Std',colNames)
colNames <- gsub("^(t)","time",colNames)
colNames <- gsub("^(f)","freq",colNames)
colNames <- gsub("\\()","",colNames)
colnames(Renamed_data) <- colNames

## 5.Create a second, tidy data
NoActivity <- Renamed_data[,names(Renamed_data) != 'activityType']

# Summarizing the NoActivity table to include just the mean of each variable for each activity and each subject
tidyData <- aggregate(NoActivity[,3:20],
                        by = list(ActivityID = NoActivity$ActivityID,
                                SubjectID = NoActivity$SubjectID), mean)

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData <- merge(tidyData, activityType, by='ActivityID')

# Export the tidyData set 
write.table(tidyData, './tidyData.txt', row.names = FALSE, quote = FALSE)
