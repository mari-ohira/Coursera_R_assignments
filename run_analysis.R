## Compiling test files into one file
testLab <- read.table("./test/y_test.txt")
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