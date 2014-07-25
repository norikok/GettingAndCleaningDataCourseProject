# Getting and Cleaning Data
# Course Project

# Notes:
# - Before running this script, set the working directory: i.e. with command,
#   > setwd("/Users/jim/Desktop/coursera/GettingAndCleaningDataCourseProject/")


# (0) Download and unzip the data files (if necessary)

# check if data folder exists
datafolder <- "./UCI HAR Dataset/"
if(!file.exists(datafolder)) {

    # download the zip file if it does not exist
    zipName <- "UCI_HAR_Dataset.zip"
    if(!file.exists(zipName)) {
        zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(zipUrl, destfile = zipName, method = "curl")
    }

    # unzip the zip file
    unzip(zipName)
}


# (1) Merge training and test sets into one

# (a) read in relevant files into tables
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# (b) combine data tables
data_combined <- cbind(rbind(subjectTrain, subjectTest),
                       rbind(yTrain, yTest),
                       rbind(xTrain, xTest))
names(data_combined) <- c("subject", "activity", as.character(features$V2))


# (2) Extract only the measurements on mean and standard deviation
colsToKeep <- grepl("subject|activity|mean|std", names(data_combined)) &
              !grepl("meanFreq", names(data_combined))
data_extracted <- data_combined[, colsToKeep]


# (3) Use descriptive activity names
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
data_merged <- merge(data_extracted, activities, by.x = "activity", by.y = "V1",
                     all.x = TRUE)
data_merged$activity <- data_merged$V2
data_merged <- data_merged[, 1:ncol(data_merged) - 1]


# (4) Assign descriptive activity names
colNames <- sub("BodyBody", "Body", names(data_merged))
colNames <- sub("tBody", "TimeBody", colNames)
colNames <- sub("tGravity", "TimeGravity", colNames)
colNames <- sub("fBody", "FreqBody", colNames)
colNames <- sub("Acc", "Acceleration", colNames)
colNames <- sub("Mag", "Magnitude", colNames)
colNames <- sub("Gyro", "Orientation", colNames)
stat <- paste0(sub("FALSE", "",
                   sub("TRUE", "mean", as.character(grepl("mean", colNames)))),                sub("FALSE", "",
                   sub("TRUE", "stdDev", as.character(grepl("std", colNames)))))
colNames <- sub("mean()", "", colNames, fixed = TRUE)
colNames <- sub("std()", "", colNames, fixed = TRUE)
colNames <- paste0(stat, gsub("-", "", colNames))
names(data_merged) <- colNames


# (5) Calculate mean of each variable for each activity and subject
data_tidy <- aggregate(data_merged[, 3:ncol(data_merged)],
                  by = list(data_merged$subject, data_merged$activity),
                  FUN = mean)
names(data_tidy) <- c("subject", "activity",
                      names(data_tidy)[3:ncol(data_tidy)])


# (6) Write tidy data into text file
write.table(data_tidy, file = "tidy_data.txt", quote = FALSE, row.names = FALSE)
