Code Book for Course Project
===================================

code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

### The Original Data

The data was collected from the Samsung Galaxy S smartphone.  UCI

The zip file containing all relevant files is available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip




### Script (run_analysis.R)

The script (run_analysis.R) is responsible for converting the original data files into a tidy data set.  It should be placed into the working directory and run using command:
source("run_analysis.R")

0. If the data files are present in the working directory, it moves onto the main part of the process, but if not, the zip file is downloaded and unzipped.

1. 
2. 

The set of variables with 'meanFreq' were not part of the extracted columns because it refers to the "weighted average of the frequency components" rather than being the mean of measurements as those with just 'mean' are.


### Tidy Data Set (tidy_data.txt)

This is the tidy data set that results from the transformation dictated by the script (run_analysis.R).  The text file (tidy_data.txt) can be read into R by using the command:
read.table("tidy_data.txt", header = TRUE)


General notes on the variables:

* All of the variables except for 'subject' and 'activity' are normalized and bounded in range [-1, 1], thus these do not have units.
* All of the variables except for 'subject' and 'activity' are the means of the measures associated with each subject and activity.
* The abbreviation 'stdDev' in variable names refers to standard deviation.
* The abbreviation 'Freq' in variable names refers to frequency (as in frequency domain signals, as opposed to time domain signals).
* The presence of 'time' in the variable names refers to time domain signals.


List of variables:

  |variable name | variacle description
--|--------------|---------------------
1 | subject | an identification number for the volunteer that performed the activity during which the measurements were taken
2 | activity | the activity performed by the subject during which the measurements were taken; it takes one of six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3 | meanTimeBodyAccelerationX |
4 | meanTimeBodyAccelerationY |
5 | meanTimeBodyAccelerationZ |
6 | stdDevTimeBodyAccelerationX |
7 | stdDevTimeBodyAccelerationY |
8 | stdDevTimeBodyAccelerationZ |
9 | meanTimeGravityAccelerationX |
10 | meanTimeGravityAccelerationY |
11 | meanTimeGravityAccelerationZ |
12 | stdDevTimeGravityAccelerationX | 
13 | stdDevTimeGravityAccelerationY |
14 | stdDevTimeGravityAccelerationZ |
15 | meanTimeBodyAccelerationJerkX |
16 | meanTimeBodyAccelerationJerkY |
17 | meanTimeBodyAccelerationJerkZ |
18 | stdDevTimeBodyAccelerationJerkX |
19 | stdDevTimeBodyAccelerationJerkY |
20 | stdDevTimeBodyAccelerationJerkZ |
21 | meanTimeBodyOrientationX |
22 | meanTimeBodyOrientationY |
23 | meanTimeBodyOrientationZ |
24 | stdDevTimeBodyOrientationX | 
25 | stdDevTimeBodyOrientationY |
26 | stdDevTimeBodyOrientationZ |
27 | meanTimeBodyOrientationJerkX |
28 | meanTimeBodyOrientationJerkY |
29 | meanTimeBodyOrientationJerkZ |
30 | stdDevTimeBodyOrientationJerkX |
31 | stdDevTimeBodyOrientationJerkY |
32 | stdDevTimeBodyOrientationJerkZ |
33 | meanTimeBodyAccelerationMagnitude |
34 | stdDevTimeBodyAccelerationMagnitude |
35 | meanTimeGravityAccelerationMagnitude |
36 | stdDevTimeGravityAccelerationMagnitude |
37 | meanTimeBodyAccelerationJerkMagnitude |
38 | stdDevTimeBodyAccelerationJerkMagnitude |
39 | meanTimeBodyOrientationMagnitude |
40 | stdDevTimeBodyOrientationMagnitude |
41 | meanTimeBodyOrientationJerkMagnitude |
42 | stdDevTimeBodyOrientationJerkMagnitude |
43 | meanFreqBodyAccelerationX |
44 | meanFreqBodyAccelerationY |
45 | meanFreqBodyAccelerationZ |
46 | stdDevFreqBodyAccelerationX |
47 | stdDevFreqBodyAccelerationY |
48 | stdDevFreqBodyAccelerationZ |
49 | meanFreqBodyAccelerationJerkX |
50 | meanFreqBodyAccelerationJerkY |
51 | meanFreqBodyAccelerationJerkZ |
52 | stdDevFreqBodyAccelerationJerkX |
53 | stdDevFreqBodyAccelerationJerkY |
54 | stdDevFreqBodyAccelerationJerkZ |
55 | meanFreqBodyOrientationX |
56 | meanFreqBodyOrientationY |
57 | meanFreqBodyOrientationZ |
58 | stdDevFreqBodyOrientationX |
59 | stdDevFreqBodyOrientationY |
60 | stdDevFreqBodyOrientationZ |
61 | meanFreqBodyAccelerationMagnitude |
62 | stdDevFreqBodyAccelerationMagnitude |
63 | meanFreqBodyAccelerationJerkMagnitude |
64 | stdDevFreqBodyAccelerationJerkMagnitude |
65 | meanFreqBodyOrientationMagnitude |
66 | stdDevFreqBodyOrientationMagnitude |
67 | meanFreqBodyOrientationJerkMagnitude |
68 | stdDevFreqBodyOrientationJerkMagnitude |

