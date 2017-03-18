# Step1: Merging the training and the test sets.

training_Data <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/train/X_train.txt")
head(training_Data)
dim(training_Data) 
training_Label <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/train/y_train.txt")
table(training_Label)
training_Subject <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/train/subject_train.txt")
test_Data <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/test/X_test.txt")
dim(test_Data) 
test_Label <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/test/y_test.txt") 
table(test_Label) 
test_Subject <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/test/subject_test.txt")
join_Data <- rbind(training_Data, test_Data)
dim(join_Data) 
join_Label <- rbind(training_Label, test_Label)
dim(join_Label)
join_Subject <- rbind(training_Subject, test_Subject)
dim(join_Subject) 

# Step2. Measurements on the mean and standard deviation for each measurement. 
features <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/features.txt")
dim(features) 
mean_Std_Indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(mean_Std_Indices) 
join_Data <- join_Data[, mean_Std_Indices]
dim(join_Data) 
names(join_Data) <- gsub("\\(\\)", "", features[mean_Std_Indices, 2]) 
names(join_Data) <- gsub("mean", "Mean", names(join_Data)) 
names(join_Data) <- gsub("std", "Std", names(join_Data)) 
names(join_Data) <- gsub("-", "", names(join_Data)) 

# Step3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("C:/Users/117053/Desktop/getting and cleaning data/UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activity_Label <- activity[join_Label[, 1], 2]
join_Label[, 1] <- activity_Label
names(join_Label) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity names. 
names(join_Subject) <- "subject"
cleaned_Data <- cbind(join_Subject, join_Label, join_Data)
dim(cleaned_Data) # 10299*68
write.table(cleaned_Data, "merged_test&train_data.txt") 
# Step5. Creating independent tidy data set with the average of each variable for each activity and each subject. 
subject_Len <- length(table(join_Subject)) 
activity_Len <- dim(activity)[1] 
column_Len <- dim(cleaned_Data)[2]
result <- matrix(NA, nrow=subject_Len*activity_Len, ncol=column_Len) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleaned_Data)
row <- 1
for(i in 1:subject_Len) {
  for(j in 1:activity_Len) {
    result[row, 1] <- sort(unique(join_Subject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleaned_Data$subject
    bool2 <- activity[j, 2] == cleaned_Data$activity
    result[row, 3:column_Len] <- colMeans(cleaned_Data[bool1&bool2, 3:column_Len])
    row <- row + 1
  }
}
head(result)
write.table(result, "mean of data variables.txt") 