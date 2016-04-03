### COURSE PROJECT

setwd("F:/Coursera/Data Science Specialization/3. Getting and Cleaning Data/Course Project")

library(dplyr)
library(reshape2)
library(tidyr)

filename <- "getdata_dataset.zip"

## Download and unzip the dataset:

if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, filename)
}  

if (!file.exists("UCI HAR Dataset")) { 
      unzip(filename) 
}

## Load activity labels and its features:

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Extract only the data on mean and standard deviation:

features_wanted <- grep(".*mean.*|.*std.*", features[,2])
features_wanted.names <- features[features_wanted,2]
features_wanted.names = gsub('-mean', 'Mean', features_wanted.names)
features_wanted.names = gsub('-std', 'Std', features_wanted.names)
features_wanted.names <- gsub('[-()]', '', features_wanted.names)

# Load the datasets:

train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_wanted]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_wanted]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

# Merge datasets and add labels:

Data <- rbind(train, test)
colnames(Data) <- c("subject", "activity", features_wanted.names)

# Turn activities & subjects into factors:

Data$activity <- factor(Data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
Data$subject <- as.factor(Data$subject)

Data.melted <- melt(Data, id = c("subject", "activity"))
Data.mean <- dcast(Data.melted, subject + activity ~ variable, mean)

# Creat new data set with means and sd:

write.table(Data.mean, "Means_data.csv", row.names = FALSE, quote = FALSE)

### END OF PROGRAMMING FILE ###
