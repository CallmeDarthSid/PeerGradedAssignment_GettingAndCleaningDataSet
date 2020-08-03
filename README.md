# Project Assignment : Getting and Cleaning Data

## About Repository

This repository was made in order to complete the Peer-graded Assignment : Getting and Cleaning data. The students are required to complete the project based on thereview criteria made by the instructor :
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to 4.      indicate all the variables and summaries calculated, along with units, and any other relevant          information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set, and the goal is to prepare tidy data that can be used for later analysis.

## run_analysis.R

This file contains scripts which is divided into 5 section based on the course project instruction in Coursera web page.

### 1. Merges the training and the test sets to create one data set.
  
  This section is finished by first read the txt files into dataframe using "read.csv" function
```{r}
...
X_train <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("D:/PUDJA/PROGRAMMING/Data Science coursera (J.Hopkins University)/Course/3. Getting and cleaning data/Week 4/Course Project/UCI HAR Dataset/test/X_test.txt")
...
```
  Then, i created names of each variable in each dataframe above
```{r}
...
names(X_train) <- features$V2
names(X_test) <- features$V2
...
```
  After that, i merged all data frame using "rbind" and "cbind" function to create one new data set
```{r}
...
data <- cbind(rbind(X_train, X_test), label, subject)
...
```
  
### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  
  This section can be done by subsetting all the "mean, std, activity name, and subject name" variable   related  from the variable names of new unity data sets using "grep" function to get the index of the   desired variable names which then can be subset to new unity data sets. This is few section of code i   use,
```{r}
...
label <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data <- cbind(rbind(X_train, X_test), label, subject)
...
```
  
### 3. Uses descriptive activity names to name the activities in the data set
  
  This section can be done by replace the "ActivityName" column with the activity_labels data set by     reformat the variable from integer (1 - 6) to factor variable
  
### 4. Appropriately labels the data set with descriptive variable names.

  This section has been done in section 2 by naming the variable names descriptively ("ActivityName"     and "SubjectType")

### 5. rom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  This section can be done by aggregating the data sets using "aggregates" function from "stats"         package to calculate the mean of each aggregation to create new dataframe. Then, The result dataframe   of aggregation should be wrote to be txt file form using "write.table" function.