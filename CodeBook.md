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
- **testLab** corresponds to 'y_test.txt'
- **testSubject** corresponds to s'ubject_test.txt'
- **testData** corresponds to 'x_test.txt'
- **test** combines testLab, testSubject and testData

## Compiling train files into one file
- **trainLab** corresponds to 'y_train.txt'
- **trainSubject** corresponds to 'subject_train.txt'
- **trainData** corresponds to 'x_train.txt'
- **train** combines trainLab, trainSubject and trainData

## Merging test and train datasets
- **merged** combines test and train data sets

## Applying labels
The labels in 'features.txt' and 'activity_labels.txt' are applied to the merged data set, to the columns and rows, respectively.

## Extracting the mean and standard deviation columns
There are multiple columns that contain mean and standard deviation. These columns are extracted and saved into a new data set named **data**.

## Creating new data set with the average of each variable for each activity and each subject
The data is aggregated by subject and activity, and the mean is calculated for each column and saved into a new data set called **final**.

## Saving the final data set
The data created in the previous step is saved into a file called 'final.txt'.
