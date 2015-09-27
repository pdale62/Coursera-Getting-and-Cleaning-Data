library(reshape2)

## Merges the training and the test sets to create one data set
data_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
data_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
data_X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
data_X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
data_y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
data_y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

names(data_subject_train) <- "subjectID"
names(data_subject_test) <- "subjectID"

featureNames <- read.table("UCI HAR Dataset/features.txt")[,2]
names(data_X_train) <- featureNames
names(data_X_test) <- featureNames

names(data_y_train) <- "activity"
names(data_y_test) <- "activity"

allData <- rbind(cbind(data_subject_train, data_y_train, data_X_train), cbind(data_subject_test, data_y_test, data_X_test))

## Extracts only the measurements on the mean and standard
## deviation for each measurement.

wantedCols <- grepl("mean|std", names(allData))
wantedCols[1:2] <- TRUE
allData <- allData[, wantedCols]

## Uses descriptive activity names to name the activities
## in the data set.
## Appropriately labels the data set with descriptive
## activity names. 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
allData$activity <- factor(allData$activity, labels=activityLabels)

## Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.
tidyDataSet <- dcast(melt(allData, id=c("subjectID","activity")), subjectID+activity ~ variable, mean)

write.csv(tidyDataSet, "tidyDataSet.csv", row.names=FALSE)