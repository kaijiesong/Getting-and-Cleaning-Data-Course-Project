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
