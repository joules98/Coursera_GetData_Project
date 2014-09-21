Coursera_GetData_Project
========================

The project for Coursera's Getting and Cleaning Data class 

==================================================================
The project purspose was to create a script called 'run_analysis.R' 
which will average mean and standard deviation data derived from: 

 Human Activity Recognition Using Smartphones Dataset
 Version 1.0
  
==================================================================


What is run_analyis.R?
======================================
        
  'run_analyis.R' is script that produces a tidy dataset containing 
  the average mean and standard deviation for data derived from the 
  Human Activity Recognition Using Smartphones Dataset Version 1.0.
  There are identifiers for the subject and the activity performed,
  along with average mean and standardard deviation variables
  in a text file called "Averages.txt" placed in the working directory.
        

  The set of 66 variables contained in this dataset are: 
  
      average mean(): the average of the Mean value for each measure of the original dataset
      average std(): the average of the Standard deviation for each measure of the original dataset


Original Source Data Installation instructions: (.ZIP distribution)
======================================

  If you do not have the original data source in your working directory, 
  you can download and uzip the files to the working directory using the code:
        
        temp <- tempfile()
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,temp)
        unzip(temp)
        unlink(temp)


How to use run_analyis.R
-----------------------------------------------

 Once you have the original source data in your working directory, in the command prompt window you can:

    1. run the script in your working directory
    2. view the dataset by using the code:
            data <- read.table("The_Averages.txt", header = TRUE);View(data) 
            


A Detailed Explanation of the run_analysis Code
-----------------------------------------------

  Read in the unzipped files from the working directory

    thefeatures <- read.table("./UCI HAR Dataset/features.txt")
    theTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
    theTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
    theTrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    theTestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    theTrainAct <- read.table("./UCI HAR Dataset/train/y_train.txt")
    theTestAct <- read.table("./UCI HAR Dataset/test/y_test.txt")
    actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

  Combine the Train and Test Data
  
    theData <- rbind(theTrainData,theTestData)

  Assign column names for the combined Train and Test Data provided in the 'Features' file
  
    theFeatures <- thefeatures[,2]
    colnames(theData) <- theFeatures

  Combine the Train and Test Subject Data and set the column name to 'Subject'
  
    theSubject <- rbind(theTrainSubject,theTestSubject)
    colnames(theSubject) <- c("Subject")

  Combine the Train and Test Activity Data and set the column name to 'Activity'
  
    theActivity <- rbind(theTrainAct,theTestAct)
    colnames(theActivity) <- c("Activity")

  Bring together the Data, Subject, and Activity columns into one dataset

    theCombined <- cbind(theActivity,theSubject,theData)

  Set ID for activity labels

    colnames(actlabels) <- c("Activity_ID", "Activity_Label")

  Provide activity labels for the combined data

    labeledData = merge(actlabels,theCombined, by.x="Activity_ID",by.y="Activity",all=TRUE)

  Find the columns containing values for mean and standard deviation

    labeledDataNames <- names(labeledData)
    theseAreMeans <- grep(as.character("mean()"), labeledDataNames, fixed = TRUE)
    theseAreSTDs <- grep(as.character("std()"), labeledDataNames, fixed = TRUE)

 Extract the columns containing the Activity, Subject, and data on means and standard deviations

    theMeans <- labeledData[,theseAreMeans]
    theSTDs <- labeledData[,theseAreSTDs]
    theLabels <- labeledData[,2:3]

  Combine the columns containig activity, subject, means and standard deviation data

    theMeansAndSTDs <- cbind(theLabels,theMeans,theSTDs)

  Create an independent tidy data set with the average of each variable for each activity and each subject
  To use a feature from the 'plyr' package, load the plyr library

    library(plyr)
    theAvgs <- ddply(theMeansAndSTDs, .(Subject,Activity_Label), numcolwise(mean))

  Write the data set containing the averages to a file called 'The_Averages.txt'

    write.table(theAvgs, file = "The_Averages.txt", row.names = FALSE)

  You can now find a file called 'The_Averages.txt' in the working directory
  To read this file, use the code:

    The_Averages_data <- read.table("The_Averages.txt", header = TRUE);View(The_Averages_data)


Notes: 
======================================
Information about the original dataset contact: activityrecognition@smartlab.ws

The original dataset was obtained from the work of:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Code and general inspiration was derived from the following sources:

  *  R Function of the Day for "grep" examples:  http://rfunction.com/archives/1481
  *  Plyr help at: https://class.coursera.org/getdata-007/forum/thread?thread_id=215
  *  Additional numcolwise() function help at: http://stackoverflow.com/questions/10787640/ddply-summarize-for-repeating-same-statistical-function-across-large-number-of
  *  how to approach the project from David's Project FAQ at: https://class.coursera.org/getdata-007/forum/thread?thread_id=49 
  *  how to write a code book:  https://class.coursera.org/getdata-007/forum/thread?thread\\\_id=28
      

