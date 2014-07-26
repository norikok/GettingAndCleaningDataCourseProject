Code Book for Course Project
===================================

### The Original Data

The data consists of measurements collected by the accelerometer and gyroscope embedded in a Samsung Galaxy S II.  There were 30 subjects whose age ranged between 19 and 48 that volunteered to wear the smartphone on their waist and have their linear acceleration and angular velocity captured while performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying).  

The zip file containing the data files is available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The 30 subjects were randomly partitioned into two distinct groups - 70 percent as whose data went into the training set and the rest (30 percent) as whose data went into the test set.  Thus there are often a pair of files of the same form, one for training and other for test (labeled accordingly in the filenames).

The relevant files from the zip file include:

* Main data files (train/X_train.txt and test/X_test.txt)

   These two files contain the 561 feature variables derived from the raw signal measurements from the accelerometer and gyroscope.  There are 7,352 rows in X_train.txt and 2,947 rows in X_test.txt for a total of 10,299 rows.

* Activity (train/y_train.txt and test/y_test.txt)

   These files correspond to X_train.txt and X_test.txt, respectively, as a variable that identifies the activity that the subject was participating in when the measurements were taken.  The activity here is expressed as an integer in the range from 1 to 6 (which can be looked up via activity_labels.txt below).

* Subject (train/subject_train.txt and test/subject_test.txt)

   These files also correspond to X_train.txt and X_test.txt, as a variable that identifies the subject (i.e. which volunteer) from which the measurements were taken.

* Feature Labels (features.txt)

   This file contains the column names/labels for the variables in X_train.txt and X_test.txt. 

* Activity Labels (activity_labels.txt)

   This file maps the activity code (integer 1 through 6) to the activity (walking, walking upstairs, walking downstairs, sitting, standing, and laying), thus can be used to translate the values in y_train.txt and y_test.txt. 


More information, in addition to any explanation provided in the later sections here, can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Script (run_analysis.R)

The script (run_analysis.R) is responsible for converting the original data files into a tidy data set.  It should be placed into the working directory and run using command:
`source("run_analysis.R")`

0. If the data files are present in the working directory, it moves onto the main part of the process, but if not, the zip file is downloaded and unzipped.

1. The original data that have been split into two sets (training and test) by subjects, are combined into one, resulting in a data set with 10,299 rows (7,352 + 2,947).  The subject and activity columns are also added at this stage (in the same order as the main data sets) at this point, as well as the column names set.  The files read in and combined in this step are: X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, and features.txt.

2. Out of the 561 feature variables, only those representing the  mean or standard deviation for the computed measurements, along with subject and activity, are extracted into a new data set.  This results in 66 variables plus subject and activity columns.  This was accomplished by keeping the variables whose name included 'mean' and 'std'.  The set of variables with 'meanFreq' were not part of the extracted columns because it refers to the "weighted average of the frequency components" rather than being the mean of measurements as those with just 'mean' are.

3. The actual activity names/labels (e.g. walking) replace the integers representing the activity during which the measurements were taken.  This utilizes the activity_labels.txt file, which served as the lookup table.

4. The original variable names (from features.txt) are replaced by a more descriptive set.  This is done by substituting each part of the original name with an expanded/clearer version (e.g. 'Acc' is replaced by 'Acceleration').

5. The data set is collapsed by taking the mean of each variable for each subject-activity pair.  The resulting tidy data set has 180 rows, which is consistent with the fact that there are 30 volunteers and 6 activities for which measurements were taken.

6. The tidy data is written out as a text file into the working directory. 


### Tidy Data Set (tidy_data.txt)

This is the tidy data set that results from the transformation dictated by the script (run_analysis.R).  The text file (tidy_data.txt) can be read into R by using the command:
`read.table("tidy_data.txt", header = TRUE)`


General notes on the variables:

* All of the variables except for 'subject' and 'activity' are normalized and bounded in range [-1, 1], thus these numeric values do not have units.
* All of the variables except for 'subject' and 'activity' are the means of the measures associated with each subject and activity.
* The abbreviation 'stdDev' in variable names refers to standard deviation.
* The abbreviation 'Freq' in variable names refers to frequency (as in frequency domain signals, as opposed to time domain signals).
* The presence of 'time' in the variable names refers to time domain signals.


List of variables:

|    | variable name | variacle description |
| -- | ------------- | -------------------- |
| 1 | subject | an identification number for the volunteer that performed the activity during which the measurements were taken |
| 2 | activity | the activity performed by the subject during which the measurements were taken; it takes one of six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| 3 | meanTimeBodyAccelerationX | |
| 4 | meanTimeBodyAccelerationY | |
| 5 | meanTimeBodyAccelerationZ | |
| 6 | stdDevTimeBodyAccelerationX | |
| 7 | stdDevTimeBodyAccelerationY | |
| 8 | stdDevTimeBodyAccelerationZ | |
| 9 | meanTimeGravityAccelerationX | |
| 10 | meanTimeGravityAccelerationY | |
| 11 | meanTimeGravityAccelerationZ | |
| 12 | stdDevTimeGravityAccelerationX | | 
| 13 | stdDevTimeGravityAccelerationY | |
| 14 | stdDevTimeGravityAccelerationZ | |
| 15 | meanTimeBodyAccelerationJerkX | |
| 16 | meanTimeBodyAccelerationJerkY | |
| 17 | meanTimeBodyAccelerationJerkZ | |
| 18 | stdDevTimeBodyAccelerationJerkX | |
| 19 | stdDevTimeBodyAccelerationJerkY | |
| 20 | stdDevTimeBodyAccelerationJerkZ | |
| 21 | meanTimeBodyOrientationX | |
| 22 | meanTimeBodyOrientationY | |
| 23 | meanTimeBodyOrientationZ | |
| 24 | stdDevTimeBodyOrientationX | | 
| 25 | stdDevTimeBodyOrientationY | |
| 26 | stdDevTimeBodyOrientationZ | |
| 27 | meanTimeBodyOrientationJerkX | |
| 28 | meanTimeBodyOrientationJerkY | |
| 29 | meanTimeBodyOrientationJerkZ | |
| 30 | stdDevTimeBodyOrientationJerkX | |
| 31 | stdDevTimeBodyOrientationJerkY | |
| 32 | stdDevTimeBodyOrientationJerkZ | |
| 33 | meanTimeBodyAccelerationMagnitude | |
| 34 | stdDevTimeBodyAccelerationMagnitude | |
| 35 | meanTimeGravityAccelerationMagnitude | |
| 36 | stdDevTimeGravityAccelerationMagnitude | |
| 37 | meanTimeBodyAccelerationJerkMagnitude | |
| 38 | stdDevTimeBodyAccelerationJerkMagnitude | |
| 39 | meanTimeBodyOrientationMagnitude | |
| 40 | stdDevTimeBodyOrientationMagnitude | |
| 41 | meanTimeBodyOrientationJerkMagnitude | |
| 42 | stdDevTimeBodyOrientationJerkMagnitude | |
| 43 | meanFreqBodyAccelerationX | |
| 44 | meanFreqBodyAccelerationY | |
| 45 | meanFreqBodyAccelerationZ | |
| 46 | stdDevFreqBodyAccelerationX | |
| 47 | stdDevFreqBodyAccelerationY | |
| 48 | stdDevFreqBodyAccelerationZ | |
| 49 | meanFreqBodyAccelerationJerkX | |
| 50 | meanFreqBodyAccelerationJerkY | |
| 51 | meanFreqBodyAccelerationJerkZ | |
| 52 | stdDevFreqBodyAccelerationJerkX | |
| 53 | stdDevFreqBodyAccelerationJerkY | |
| 54 | stdDevFreqBodyAccelerationJerkZ | |
| 55 | meanFreqBodyOrientationX | |
| 56 | meanFreqBodyOrientationY | |
| 57 | meanFreqBodyOrientationZ | |
| 58 | stdDevFreqBodyOrientationX | |
| 59 | stdDevFreqBodyOrientationY | |
| 60 | stdDevFreqBodyOrientationZ | |
| 61 | meanFreqBodyAccelerationMagnitude | |
| 62 | stdDevFreqBodyAccelerationMagnitude | |
| 63 | meanFreqBodyAccelerationJerkMagnitude | |
| 64 | stdDevFreqBodyAccelerationJerkMagnitude | |
| 65 | meanFreqBodyOrientationMagnitude | |
| 66 | stdDevFreqBodyOrientationMagnitude | |
| 67 | meanFreqBodyOrientationJerkMagnitude | |
| 68 | stdDevFreqBodyOrientationJerkMagnitude | |

