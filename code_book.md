# Code Book

This file describes the variables, the data, and transformations that you performed to clean up the data.

## Variables

The assignment asked for two tidy data sets, one with only the measurements on the mean and standard deviation for each measurement, and one independent tidy data set with the average of each variable for each activity and each subject. 
Both of them have the same columns, classes and units, which are represented above. (besides the second data set aggregates the data with the average, the name of the columns, class and unit was kept the same).

| Variable | Class | Unit |
|-|-|-|
| timeBodyAccelerometerMeanX | num | s |
| timeBodyAccelerometerMeanY | num | s |
| timeBodyAccelerometerMeanZ | num | s |
| timeBodyAccelerometerStdX | num | s |
| timeBodyAccelerometerStdY | num | s |
| timeBodyAccelerometerStdZ | num | s |
| timeGravityAccelerometerMeanX | num | s |
| timeGravityAccelerometerMeanY | num | s |
| timeGravityAccelerometerMeanZ | num | s |
| timeGravityAccelerometerStdX | num | s |
| timeGravityAccelerometerStdY | num | s |
| timeGravityAccelerometerStdZ | num | s |
| timeBodyAccelerometerJerkMeanX | num | s |
| timeBodyAccelerometerJerkMeanY | num | s |
| timeBodyAccelerometerJerkMeanZ | num | s |
| timeBodyAccelerometerJerkStdX | num | s |
| timeBodyAccelerometerJerkStdY | num | s |
| timeBodyAccelerometerJerkStdZ | num | s |
| timeBodyGyroscopeMeanX | num | s |
| timeBodyGyroscopeMeanY | num | s |
| timeBodyGyroscopeMeanZ | num | s |
| timeBodyGyroscopeStdX | num | s |
| timeBodyGyroscopeStdY | num | s |
| timeBodyGyroscopeStdZ | num | s |
| timeBodyGyroscopeJerkMeanX | num | s |
| timeBodyGyroscopeJerkMeanY | num | s |
| timeBodyGyroscopeJerkMeanZ | num | s |
| timeBodyGyroscopeJerkStdX | num | s |
| timeBodyGyroscopeJerkStdY | num | s |
| timeBodyGyroscopeJerkStdZ | num | s |
| timeBodyAccelerometerMagnitudeMean | num | s |
| timeBodyAccelerometerMagnitudeStd | num | s |
| timeGravityAccelerometerMagnitudeMean | num | s |
| timeGravityAccelerometerMagnitudeStd | num | s |
| timeBodyAccelerometerJerkMagnitudeMean | num | s |
| timeBodyAccelerometerJerkMagnitudeStd | num | s |
| timeBodyGyroscopeMagnitudeMean | num | s |
| timeBodyGyroscopeMagnitudeStd | num | s |
| timeBodyGyroscopeJerkMagnitudeMean | num | s |
| timeBodyGyroscopeJerkMagnitudeStd | num | s |
| frequencyBodyAccelerometerMeanX | num | Hz |
| frequencyBodyAccelerometerMeanY | num | Hz |
| frequencyBodyAccelerometerMeanZ | num | Hz |
| frequencyBodyAccelerometerStdX | num | Hz |
| frequencyBodyAccelerometerStdY | num | Hz |
| frequencyBodyAccelerometerStdZ | num | Hz |
| frequencyBodyAccelerometerJerkMeanX | num | Hz |
| frequencyBodyAccelerometerJerkMeanY | num | Hz |
| frequencyBodyAccelerometerJerkMeanZ | num | Hz |
| frequencyBodyAccelerometerJerkStdX | num | Hz |
| frequencyBodyAccelerometerJerkStdY | num | Hz |
| frequencyBodyAccelerometerJerkStdZ | num | Hz |
| frequencyBodyGyroscopeMeanX | num | Hz |
| frequencyBodyGyroscopeMeanY | num | Hz |
| frequencyBodyGyroscopeMeanZ | num | Hz |
| frequencyBodyGyroscopeStdX | num | Hz |
| frequencyBodyGyroscopeStdY | num | Hz |
| frequencyBodyGyroscopeStdZ | num | Hz |
| frequencyBodyAccelerometerMagnitudeMean | num | Hz |
| frequencyBodyAccelerometerMagnitudeStd | num | Hz |
| frequencyBodyAccelerometerJerkMagnitudeMean | num | Hz |
| frequencyBodyAccelerometerJerkMagnitudeStd | num | Hz |
| frequencyBodyGyroscopeMagnitudeMean | num | Hz |
| frequencyBodyGyroscopeMagnitudeStd | num | Hz |
| frequencyBodyGyroscopeJerkMagnitudeMean | num | Hz |
| frequencyBodyGyroscopeJerkMagnitudeStd | num | Hz |
| activity | str |  |
| subject | int |  |

# Transformations
The initial data set was split in train, test, features and labels. The assignment project intend
to join all the data, select specific columns, rename the columns and summarize the data. The workflow was the following:

1. Loading dependencies (dplyr, data.table)
2. Merge train and test data (rbind)
3. Add names to column variables
4. Filter columns for mean and std measurement
5. Merge features and labels (cbind)
6. Add descriptive names to activity varible and for all columns
7. Summarize data for activity and subject columns
