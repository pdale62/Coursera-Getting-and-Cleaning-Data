## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

### Overview

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Please refer to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset.

### Processing steps

1. All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns were removed that did not contain the string "mean" or "std".
3. The activity column was converted from a integer to a factor, using labels describing the activities from the activity_lables.txt file.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output to a CSV file.

### Variables

featureNames <- Contains the data from file features.txt
data_subject_train <- Contains the data from file subject_train.txt
data_subject_test <- Contains the data from file subject_test.txt
data_X_train <- Contains the data from file X_train.txt
data_X_test <- Contains the data from file X_test.txt
data_y_train <- Contains the data from file y_train.txt
data_y_test <- Contains the data from file y_test.txt
allData <- Combined data from data files above
wantedCols <- Subset of columns from allData containing "mean" or "std"
allData <- Cleaned dataset.
activityLabels <- Contains the data from file activity_labels.txt
tidyDataSet <- Final cleaned dataset
