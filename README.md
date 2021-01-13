# Coursera_R_assignments

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set, preparing a tidy data that can be used for later analysis. 


## Data set

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  


## How all of the scripts work and are connected

The script "run_analysis.R" merges the training and the test sets in the available data package to create a single data set. It then extracts only the measurements on the mean and standard deviation for each measurement.

Next, it applies the correct labels to the data set according to the activities and features of each observation and variable.

Finally, it creates a second, independent tidy data set with the average of each variable for each activity and each subject (available in "final.txt").
