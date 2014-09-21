=== run_analysis.R Code Book ===

joules98, September 21, 2014

================================

Setup:

        Companies like Fitbit, Nike, and Jawbone Up are developing algorithms to attract new users
        to its wearable computing products. The original data used for this project represent data 
        collected from a team of researchers from the accelerometers from the Samsung Galaxy S smartphone. 
        
        A full description is available at the site where the data was obtained is here: 
        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
        
        The data for the project was obtained here: 
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Experimental design and background:

        The experiments from the original dataset have been carried out with a group of 30 volunteers
        within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
        WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
        (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they 
        captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
        The experiments have been video-recorded to label the data manually. The obtained dataset was 
        randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
        the training data and 30% the test data. 
        
        The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
        and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
        The sensor acceleration signal, which has gravitational and body motion components, was separated 
        using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force 
        is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency 
        was used. From each window, a vector of features was obtained by calculating variables from 
        the time and frequency domain.

Raw data: 

        The features selected for the original source database come from the accelerometer and gyroscope
        3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
        were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and 
        a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
        the acceleration signal was then separated into body and gravity acceleration signals 
        (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency 
        of 0.3 Hz. 
        
        Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
        signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
        signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
        tBodyGyroMag, tBodyGyroJerkMag). 
        
        Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ,
        fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
        (Note the 'f' to indicate frequency domain signals). 
        
        These signals were used to estimate variables from the original source feature vector for each pattern:
        '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
        
        The Variables:
        
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
        


Processed data: 
        
        An independent tidy data set with the average of each mean and standard deviation value for 
        each activity and each subject from the original data set.  There are a total of 68 colummns
        in the dataset, with 66 variables representing the averages
        
        The set of averaged variables in this dataset are: 
        
        "Activity_Label"
        "Subject"
        "tBodyAcc-mean()-X"
        "tBodyAcc-mean()-Y"
        "tBodyAcc-mean()-Z"
        "tGravityAcc-mean()-X"
        "tGravityAcc-mean()-Y"
        "tGravityAcc-mean()-Z"
        "tBodyAccJerk-mean()-X"
        "tBodyAccJerk-mean()-Y"
        "tBodyAccJerk-mean()-Z"
        "tBodyGyro-mean()-X"
        "tBodyGyro-mean()-Y"
        "tBodyGyro-mean()-Z"
        "tBodyGyroJerk-mean()-X"
        "tBodyGyroJerk-mean()-Y"
        "tBodyGyroJerk-mean()-Z"
        "tBodyAccMag-mean()"
        "tGravityAccMag-mean()"
        "tBodyAccJerkMag-mean()"
        "tBodyGyroMag-mean()"
        "tBodyGyroJerkMag-mean()"
        "fBodyAcc-mean()-X"
        "fBodyAcc-mean()-Y"
        "fBodyAcc-mean()-Z"
        "fBodyAccJerk-mean()-X"
        "fBodyAccJerk-mean()-Y"
        "fBodyAccJerk-mean()-Z"
        "fBodyGyro-mean()-X"
        "fBodyGyro-mean()-Y"
        "fBodyGyro-mean()-Z"
        "fBodyAccMag-mean()"
        "fBodyBodyAccJerkMag-mean()"
        "fBodyBodyGyroMag-mean()"
        "fBodyBodyGyroJerkMag-mean()"
        "tBodyAcc-std()-X"
        "tBodyAcc-std()-Y"
        "tBodyAcc-std()-Z"
        "tGravityAcc-std()-X"
        "tGravityAcc-std()-Y"
        "tGravityAcc-std()-Z"
        "tBodyAccJerk-std()-X"
        "tBodyAccJerk-std()-Y"
        "tBodyAccJerk-std()-Z"
        "tBodyGyro-std()-X"
        "tBodyGyro-std()-Y"
        "tBodyGyro-std()-Z"
        "tBodyGyroJerk-std()-X"
        "tBodyGyroJerk-std()-Y"
        "tBodyGyroJerk-std()-Z"
        "tBodyAccMag-std()"
        "tGravityAccMag-std()"
        "tBodyAccJerkMag-std()"
        "tBodyGyroMag-std()"
        "tBodyGyroJerkMag-std()"
        "fBodyAcc-std()-X"
        "fBodyAcc-std()-Y"
        "fBodyAcc-std()-Z"
        "fBodyAccJerk-std()-X"
        "fBodyAccJerk-std()-Y"
        "fBodyAccJerk-std()-Z"
        "fBodyGyro-std()-X"
        "fBodyGyro-std()-Y"
        "fBodyGyro-std()-Z"
        "fBodyAccMag-std()"
        "fBodyBodyAccJerkMag-std()"
        "fBodyBodyGyroMag-std()"
        "fBodyBodyGyroJerkMag-std()"

        Each variable respresents, respecively:
        
        Average of the mean(): average Mean value for each measurement
        Average of the std(): average Standard deviation value for each measurement

CodeBook:

        * Merge the training and the test sets from the original data source to create one data set.
        * Extract only the measurements on the mean and standard deviation for each measurement. 
        * Use activity names from the original data source to name the activities in the data set
        * Label the data set with descriptive variable names from the origingal data source. 
        * Create independent tidy data set with the average of each variable for each activity and each subject.
        Note that the output can be obtained from the text file called "The_Averages.txt" in the working directory.



References:
========
The original dataset and explanation for this codebook was obtained by the following: 

Publication:  [1]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Full description at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Inspiration throughout the entire project:  https://class.coursera.org/getdata-007/forum/thread?thread_id=49

How to write a code book instruction came from:  https://class.coursera.org/getdata-007/forum/thread?thread\\\_id=28

