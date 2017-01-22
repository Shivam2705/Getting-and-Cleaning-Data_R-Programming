#Getting and Cleaning Data Course Project


Instructions to run R-File run_analysis.R
	Unzipping the data  from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
	Putting "data" and the run_analysis.R script in the current working directory.
	Using source("run_analysis .R") command in RStudio.
	Two output files are generated in the current working directory:
	merged_test&train_data.txt (8.15 MB): it contains a data frame called cleaned_Data with 10299*68 dimension.
	mean of data variables.txt (220 Kb): it contains a data frame called result with 180*68 dimension.
	Using data <- read.table("data_with_means.txt") command in RStudio to read the file. 
	Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
