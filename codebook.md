# Coursera Getting and Cleaning Data Project Codebook

## Origins of the Data
This dataset originates from the "Human Activity Recognition Using Smartphones Data Set" 
The original source of the data was: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Description 

The signals below estimate variables of the feature vector for all patterns:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

### I have renamed some of the variables as I thought suitable:
For example:
Acc -> Acceleration
Mag -> Magnitude
Gyro -> Gyroscopic

Also I removed any duplicate columns as they were causing issues and not subjective to the data I needed to colmple this project.
I removed any variables that did not have the below contained in them: 

* mean(): Mean value
* std(): Standard deviation


My features are normalized and bounded within [-1,1].
