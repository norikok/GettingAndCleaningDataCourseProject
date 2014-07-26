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

4. The original variable names (from features.txt) are replaced by a more descriptive set.  This is done by substituting each part of the original name with an expanded/clearer version (e.g. 'Acc' is replaced by 'Acceleration').  It should be noted that 'Gyro' has been changed to 'AngularVelocity' as that was the variable measured by the gyroscope originally.

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

1. **subject** - integer [1, 30]   
   an identification number for the volunteer that performed the activity during which the measurements were taken   
2. **activity** - factor   
   the activity performed by the subject during which the measurements were taken; it takes one of six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
3. **meanTimeBodyAccelerationX** - numeric  
   mean value of time domain body acceleration signal along x-axis
4. **meanTimeBodyAccelerationY** - numeric  
   mean value of time domain body acceleration signal along y-axis
5. **meanTimeBodyAccelerationZ** - numeric  
   mean value of time domain body acceleration signal along z-axis
6. **stdDevTimeBodyAccelerationX** - numeric  
   standard deviation of time domain body acceleration signal along x-axis
7. **stdDevTimeBodyAccelerationY** - numeric  
   standard deviation of time domain body acceleration signal along y-axis
8. **stdDevTimeBodyAccelerationZ** - numeric  
   standard deviation of time domain body acceleration signal along z-axis
9. **meanTimeGravityAccelerationX** - numeric  
   mean value of time domain gravity acceleration signal along x-axis
10. **meanTimeGravityAccelerationY** - numeric  
   mean value of time domain gravity acceleration signal along y-axis
11. **meanTimeGravityAccelerationZ** - numeric  
   mean value of time domain gravity acceleration signal along z-axis
12. **stdDevTimeGravityAccelerationX** - numeric   
   standard deviation of time domain gravity acceleration signal along x-axis
13. **stdDevTimeGravityAccelerationY** - numeric  
   standard deviation of time domain gravity acceleration signal along y-axis
14. **stdDevTimeGravityAccelerationZ** - numeric  
   standard deviation of time domain gravity acceleration signal along z-axis
15. **meanTimeBodyAccelerationJerkX** - numeric  
   mean value of time domain body acceleration Jerk signal along x-axis
16. **meanTimeBodyAccelerationJerkY** - numeric  
   mean value of time domain body acceleration Jerk signal along y-axis
17. **meanTimeBodyAccelerationJerkZ** - numeric  
   mean value of time domain body acceleration Jerk signal along z-axis
18. **stdDevTimeBodyAccelerationJerkX** - numeric  
   standard deviation of time domain body acceleration Jerk signal along x-axis
19. **stdDevTimeBodyAccelerationJerkY** - numeric  
   standard deviation of time domain body acceleration Jerk signal along y-axis
20. **stdDevTimeBodyAccelerationJerkZ** - numeric 
   standard deviation of time domain body acceleration Jerk signal along z-axis
21. **meanTimeBodyAngularVelocityX** - numeric  
   mean value of time domain body angular velocity signal along x-axis
22. **meanTimeBodyAngularVelocityY** - numeric  
   mean value of time domain body angular velocity signal along y-axis
23. **meanTimeBodyAngularVelocityZ** - numeric  
   mean value of time domain body angular velocity signal along z-axis
24. **stdDevTimeBodyAngularVelocityX** - numeric   
   standard deviation of time domain body angular velocity signal along x-axis
25. **stdDevTimeBodyAngularVelocityY** - numeric  
   standard deviation of time domain body angular velocity signal along y-axis
26. **stdDevTimeBodyAngularVelocityZ** - numeric  
   standard deviation of time domain body angular velocity signal along z-axis
27. **meanTimeBodyAngularVelocityJerkX** - numeric  
   mean value of time domain body angular velocity Jerk signal along x-axis
28. **meanTimeBodyAngularVelocityJerkY** - numeric  
   mean value of time domain body angular velocity Jerk signal along y-axis
29. **meanTimeBodyAngularVelocityJerkZ** - numeric  
   mean value of time domain body angular velocity Jerk signal along z-axis
30. **stdDevTimeBodyAngularVelocityJerkX** - numeric  
   standard deviation of time domain body angular velocity Jerk signal along x-axis
31. **stdDevTimeBodyAngularVelocityJerkY** - numeric  
   standard deviation of time domain body angular velocity Jerk signal along y-axis
32. **stdDevTimeBodyAngularVelocityJerkZ** - numeric  
   standard deviation of time domain body angular velocity Jerk signal along z-axis
33. **meanTimeBodyAccelerationMagnitude** - numeric  
   mean value of time domain body acceleration signal magnitude
34. **stdDevTimeBodyAccelerationMagnitude** - numeric  
   standard deviation of time domain body acceleration signal magnitude
35. **meanTimeGravityAccelerationMagnitude** - numeric  
   mean value of time domain gravity acceleration signal magnitude 
36. **stdDevTimeGravityAccelerationMagnitude** - numeric  
   standard deviation of time domain gravity acceleration signal magnitude 
37. **meanTimeBodyAccelerationJerkMagnitude** - numeric  
   mean value of time domain body acceleration Jerk signal magnitude
38. **stdDevTimeBodyAccelerationJerkMagnitude** - numeric  
   standard deviation of time domain body acceleration Jerk signal magnitude
39. **meanTimeBodyAngularVelocityMagnitude** - numeric  
   mean value of time domain body angular velocity signal magnitude
40. **stdDevTimeBodyAngularVelocityMagnitude** - numeric  
   standard deviation of time domain body angular velocity signal magnitude
41. **meanTimeBodyAngularVelocityJerkMagnitude** - numeric  
   mean value of time domain body angular velocity Jerk signal magnitude
42. **stdDevTimeBodyAngularVelocityJerkMagnitude** - numeric  
   standard deviation of time domain body angular velocity Jerk signal magnitude
43. **meanFreqBodyAccelerationX - numeric  
   mean value of frequency domain body acceleration signal along x-axis
44. **meanFreqBodyAccelerationY** - numeric  
   mean value of frequency domain body acceleration signal along y-axis
45. **meanFreqBodyAccelerationZ** - numeric  
   mean value of frequency domain body acceleration signal along z-axis
46. **stdDevFreqBodyAccelerationX** - numeric  
   standard deviation of frequency domain body acceleration signal along x-axis
47. **stdDevFreqBodyAccelerationY** - numeric  
   standard deviation of frequency domain body acceleration signal along y-axis
48. **stdDevFreqBodyAccelerationZ** - numeric  
   standard deviation of frequency domain body acceleration signal along z-axis
49. **meanFreqBodyAccelerationJerkX** - numeric  
   mean value of frequency domain body acceleration Jerk signal along x-axis
50. **meanFreqBodyAccelerationJerkY** - numeric  
   mean value of frequency domain body acceleration Jerk signal along y-axis
51. **meanFreqBodyAccelerationJerkZ** - numeric  
   mean value of frequency domain body acceleration Jerk signal along z-axis
52. **stdDevFreqBodyAccelerationJerkX** - numeric  
   standard deviation of frequency domain body acceleration Jerk signal along x-axis
53. **stdDevFreqBodyAccelerationJerkY** - numeric  
   standard deviation of frequency domain body acceleration Jerk signal along y-axis
54. **stdDevFreqBodyAccelerationJerkZ** - numeric  
   standard deviation of frequency domain body acceleration Jerk signal along z-axis
55. **meanFreqBodyAngularVelocityX** - numeric  
   mean value of frequency domain body angular velocity signal along x-axis
56. **meanFreqBodyAngularVelocityY** - numeric  
   mean value of frequency domain body angular velocity signal along y-axis
57. **meanFreqBodyAngularVelocityZ** - numeric  
   mean value of frequency domain body angular velocity signal along z-axis
58. **stdDevFreqBodyAngularVelocityX** - numeric  
   standard deviation of frequency domain body angular velocity signal along x-axis
59. **stdDevFreqBodyAngularVelocityY** - numeric  
   standard deviation of frequency domain body angular velocity signal along y-axis
60. **stdDevFreqBodyAngularVelocityZ** - numeric  
   standard deviation of frequency domain body angular velocity signal along z-axis
61. **meanFreqBodyAccelerationMagnitude** - numeric  
   mean value of frequency domain body acceleration signal magnitude
62. **stdDevFreqBodyAccelerationMagnitude** - numeric  
   standard deviation of frequency domain body acceleration signal magnitude
63. **meanFreqBodyAccelerationJerkMagnitude** - numeric  
   mean value of frequency domain body acceleration Jerk signal magnitude
64. **stdDevFreqBodyAccelerationJerkMagnitude** - numeric  
   standard deviation of frequency domain body acceleration Jerk signal magnitude
65. **meanFreqBodyAngularVelocityMagnitude** - numeric  
   mean value of frequency domain body angular velocity signal magnitude
66. **stdDevFreqBodyAngularVelocityMagnitude** - numeric  
   standard deviation of frequency domain body angular velocity signal magnitude
67. **meanFreqBodyAngularVelocityJerkMagnitude** - numeric  
   mean value of frequency domain body angular velocity Jerk signal magnitude
68. **stdDevFreqBodyAngularVelocityJerkMagnitude** - numeric  
   standard deviation of frequency domain body angular velocity Jerk signal magnitude
