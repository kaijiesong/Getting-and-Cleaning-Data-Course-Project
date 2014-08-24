Getting-and-Cleaning-Data-Course-Project
========================================

This repo is for the course project of Getting and Cleaning Data.

The R script run_analysis.R downloads and perform the required analyis.It outputs two .txt files in the working directory: the Tidy_Data.txt and the Final_Tidy_Data.txt. The latter one is the one with averages of each variable for each combination of activity and subject, which is also the one to be submitted.

##Source
A full description for the source data is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset is availble here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Input of the data
The R script includes the codes to download and unzip the data in your working directory. However, if you already have the "UCI HAR Dataset" directory in your working directory, you can skip the download part of the script to save time. 

##How the script works
1. Download the zipped data to working directory and unzip it.  
2. Load the datasets.  
3. Merge the test and train datasets. Cbind the subject, activity and X_data. Use the values in features.txt as the names of the variables.  
4. Extract the mean and standard deviation measurements
5. Replace the activity index with descriptive names
6. Label the data with descriptive variable names.
7. Summarize the data and creat a tidy dataset with the averages of each variable for each combination of activity and subject.
8. Output the final tidy data with write.table().
