# Data information

**Data source:** Human Activity Recognition Using Smartphones Dataset - Version 1.0

**Data description:** The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following file is available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

# Variables used
testLab  corresponds to y_test.txt
testSubject <- read.table("./test/subject_test.txt")
testData <- read.table("./test/x_test.txt")
test <- cbind(testLab,testSubject,testData)

## Compiling train files into one file
trainLab <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
trainData <- read.table("./train/x_train.txt")
train <- cbind(trainLab,trainSubject,trainData)

## Merge test and train datasets
merged <- rbind(test,train)

## Gets labels
library(dplyr)
FeatLabel <- read.table("./features.txt")
ActLabel <- read.table("./activity_labels.txt")

#Label features (cols)
colnames(merged) <- c("activity","subject",FeatLabel$V2)

#Label activities (rows)
merged$activity <- ActLabel$V2[match(merged$activity, ActLabel$V1)]

#Extracts only the measurements on the mean and standard deviation for each measurement
measure <- grep( "std|mean\\(\\)", FeatLabel$V2 ) + 1

# Data with only the mean and standard deviation for each column 
data <- merged[, c( 1,measure,563 ) ]


#From the data, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

final <- aggregate( . ~ subject + activity, data = data, FUN = mean )

#creating a tidy dataset file  
library(data.table)
write.table(final,"final.txt",row.names = FALSE)
