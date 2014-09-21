## This Script file called run_analysis.R does the following:

## Step1 - Merges the training and the test sets to create one data set.
## Step2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
## Step3 - Uses activity names from the original data source to name the activities in the data set
## Step4 - Labels the data set with descriptive variable names from the origingal data source. 
## Step5 - From the data set in step 4, creates a second, independent tidy data set 
##         with the average of each variable for each activity and each subject.

## if you need the data, you can download and uzip the file to the working directory
## temp <- tempfile()
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileUrl,temp)
## unzip(temp)
## unlink(temp)

## read in the unzipped files from the working directory
thefeatures <- read.table("./UCI HAR Dataset/features.txt")
theTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
theTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
theTrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
theTestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
theTrainAct <- read.table("./UCI HAR Dataset/train/y_train.txt")
theTestAct <- read.table("./UCI HAR Dataset/test/y_test.txt")
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## combine the Train and Test Data
theData <- rbind(theTrainData,theTestData)

## assign column names for the combined Train and Test Data provided in the 'Features' file
theFeatures <- thefeatures[,2]
colnames(theData) <- theFeatures

## combine the Train and Test Subject Data and set the column name to 'Subject'
theSubject <- rbind(theTrainSubject,theTestSubject)
colnames(theSubject) <- c("Subject")

## combine the Train and Test Activity Data and set the column name to 'Activity'
theActivity <- rbind(theTrainAct,theTestAct)
colnames(theActivity) <- c("Activity")

## bring together the Data, Subject, and Activity columns into one dataset
theCombined <- cbind(theActivity,theSubject,theData)

## set ID for activity labels
colnames(actlabels) <- c("Activity_ID", "Activity_Label")

## provide activity labels for the combined data
labeledData = merge(actlabels,theCombined, by.x="Activity_ID",by.y="Activity",all=TRUE)

## find the columns containing values for mean and standard deviation
labeledDataNames <- names(labeledData)
theseAreMeans <- grep(as.character("mean()"), labeledDataNames, fixed = TRUE)
theseAreSTDs <- grep(as.character("std()"), labeledDataNames, fixed = TRUE)

## extract the columns containing the Activity, Subject, and data on means and standard deviations
theMeans <- labeledData[,theseAreMeans]
theSTDs <- labeledData[,theseAreSTDs]
theLabels <- labeledData[,2:3]

## combine the columns containig activity, subject, means and standard deviation data
theMeansAndSTDs <- cbind(theLabels,theMeans,theSTDs)

## create an independent tidy data set with the average of each variable for each activity and each subject
## to use a feature from the 'plyr' package, load the plyr library
library(plyr)
theAvgs <- ddply(theMeansAndSTDs, .(Subject,Activity_Label), numcolwise(mean))

## write the data set containing the averages to a file called 'The_Averages.txt'
write.table(theAvgs, file = "The_Averages.txt", row.names = FALSE)

## you can now find a file called 'The_Averages.txt' in the working directory
## to read this file from the working directory, use the code:
The_Averages_data <- read.table("The_Averages.txt", header = TRUE);View(The_Averages_data)
