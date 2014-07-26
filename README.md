Getting and Cleaning Data Course Project
===================================

The project involves preparing a tidy data set ready for analysis using skills acquired during the course.  Below is an overview of the files involved in the assignment as well as an explanation of the steps that produces the final tidy data set.

For more detailed information, please refer to the CodeBook.md. 


## The Script: run_analysis.R

This script contains all of the steps necessary to take the original data and transform it into a tidy data set:
0. Download the data files (if not present in working directory).
1. Merge training and test data sets into one
2. Extract only the variables representing the mean and standard deviations for the measurements.
3. Use descriptive activity names.
4. Assign descriptive variable names.
5. Calculate mean of each variable for each activity and subject to produce the final tidy data set.
6. Write the tidy data set into a text file.


## The Original Data Set

This project uses the "Human Activity Recognition Using Smartphones Data Set" at UCI Machine Learning Repository.  It contains measurements collected by the accelerometer and gyroscope embedded in a Samsung Galaxy S.  The zip file containing all relevant data sets is downloaded, if not available in the directory in which the script is placed, as explained above.


## The Tidy Data Set: tidy_data.txt

This resulting tidy data set is produced by the script (run_analysis.R) by transforming the original data files according to the steps outlined.  This file is also uploaded directly to Coursera project page for evaluation.


## The Code Book: CodeBook.md

The Code Book explains each of the components introduced here in more detail.  In addition, it contains the description for each of the variables in the final tidy data set.
