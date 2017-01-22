## This is a markdown file

#Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.


Data Source:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data required for project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Description of run_analysis R- programming file:

Loading Data:
	read.table(): Read X_train.txt, y_train.txt and subject_train.txt and store them in training_Data, training_Label and training_Subject variables respectively.

	Similarly read X_test.txt, y_test.txt and subject_test.txt and store them in test_Data, test_Label and test_Subject variables respectively
Concatenating data, labels and subjects:

	Concatenate test_Data to training_Data to generate a 10299x561 data frame, join_Data.

	Concatenate test_Label to train_Label to generate a 10299x1 data frame, join_Label.

	Concatenate test_Subject to training_Subject to generate a 10299x1 data frame, join_Subject.


Reading Data:
	Read the features.txt file and store the data in a variable called features. 

	Extract the measurements on the mean and standard deviation. 

	Obtained a subset of join_Data with the 66 corresponding columns.



Analysis on Data:
	Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

	Read the activity_labels.txt file and store the data in a variable called activity.

	Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.

	Transform the values of join_Label according to the activity data frame.

	Combine the join_Subject, join_Label and join_Data by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

	We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.



Writing Output Files:
	Write the cleaned_Data out to " merged_test&train_data.txt" file in current working directory.

	Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. Write the result out to " mean of data variables.txt" file in current working directory.

