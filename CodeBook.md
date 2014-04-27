##Variables:

1.features: data read from features.txt

2.feature$feature_label: cleaned feature name

3.activity_labels_data: data read from activity_labels.txt

4.subject_train_data: data read from subject_train.txt

5.subject_test_data: data read from subject_test.txt

6.subject: combination of subject_train_data and subject_test_data

7.X_train_data:data read from X_train.txt

8.X_test_data: data read from X_test.txt

9.Y_train_data: data read from Y_train.txt

10.Y_test_data: data read from Y_test

11.X: combination of X_train_data and X_test_data

12.Y: combination of Y_train_data and Y_test_data

13.full_data: column combine of Y, subject and X

14.final_data: combination of full_data, activity and subject while calculating the mean

15.final_data2: merge the final_data with activity_lables


##Steps:

1.Read the features and activity_labels from features.txt

2.Remove the - ,  ( and ) of feature_label

3.Read train and test subject and combine them

4.Read X_train, X_test, Y_train and Y_test data sets.

5.Combine X, subject and Y, then combine train and test to the full_data

6.Calculate mean for each activity and each subject and create the new tidy data set

7.Write down the tidy data set


