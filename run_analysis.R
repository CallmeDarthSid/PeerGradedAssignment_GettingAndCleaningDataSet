##--Peer-graded Assignment : Getting and Cleaning Data Sets--


## 1. Merge the training and test data set to create one data set

## a. Read train, test set, and features into Dataframe
X_train <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/test/subject_test.txt")
activity_labels <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/activity_labels.txt")
features <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/features.txt")
subject

## b. Name the X_train and X_test v
names(X_train) <- features$V2
names(X_test) <- features$V2
names(y_train) <- "ActivityName"
names(y_test) <- "ActivityName"
names(subject_train) <- "SubjectType"
names(subject_test) <- "SubjectType"

## c. Merge train and test data set
label <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data <- cbind(rbind(X_train, X_test), label, subject)

## 2.  Extract the measurement on mean and standart deviation

VariableNames <- names(data)
to_subset <- c(grep("mean[^Freq]()", VariableNames), grep("std()", VariableNames),
               grep("ActivityName", VariableNames), grep("SubjectType", VariableNames))
new_data <- data[, to_subset]

## 3. Uses descriptive activity names to name the activities in the data set

## reformat the data type of label variables from integer to factor based on levels
new_data$ActivityName <- as.factor(new_data$ActivityName)
  
## 4. Appropriately labels the data set with descriptive variable names.
  
## it has been done in step 2
  
## 5. reates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Create second tidy data set by calculate average in each variables
sec_data <- aggregate(new_data, by=list(ActivityID=new_data$ActivityName, SubjectID=new_data$SubjectType), FUN=mean)
sec_data <- select(sec_data, -c(ActivityName, SubjectType))
write.table(sec_data, "C:/Users/Pudja Gemilang/Desktop/PeerGradedAssignmentCourse3/PeerGradedAssignment_GettingAndCleaningDataSet/SecTidyDataSet.txt")
