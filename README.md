# Getting and Cleaning Data - Course Project



This is the course project for the Getting and Cleaning Data Coursera course.


The R script, `Assign.R`, does the following:



1. Load the Training datasets: Observations File (X_train),Activity ID file ( Y_train) and the Subjects File (subject_train )
2. Load the Test datasets: Observations File (X_test),Activity ID file ( Y_test) and the Subjects File (subject_test )
3. Load the activity and feature info:
 (activity_labels) & (features)
4. Label the columns in Training & Testing set appropriately with the help of 'features info'
5. Search for Mean(mean) & Standard deviation(std) and create a new subset with only those observations for both Traning & Testing datasets
6. Add the participant & activity details for the observations for both Training & Testing datasets
7. Merge the refined training & testing datasets
8. Appropriately label the datasets
9. Re-order the columns 
10. Summarize the dataset