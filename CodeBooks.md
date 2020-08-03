## The data was transformed by 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variable info
1. ActivitID and SubjectID : contain information about activity and subject 
2. X_train, X_test : dataframe that contain train and test sets which directly read from X_train.txt and X_test.txt
3. y_train, y_test : dataframe that contain train and test labels which directly read from y_train.txt and y_test.txt
4. actvity_labels : dataframe that contain the labels of activity regard to experiment
5. subject_train and subject_test : dataframe that contan the information about subject in experiment