##Download data
#If you have the unzipped "UCI HAR Dataset" file in your working directory,
#you can skip this step
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="data.zip")
unzip("data.zip")

##Load data
features <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors=FALSE)
features <- features[ ,2]
activity_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
activity_train<- activity_train[ ,1]
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
subject_train <- subject_train[ ,1]
data_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", colClasses="numeric")
activity_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
activity_test <- activity_test[ ,1]
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
subject_test <- subject_test[ ,1]
data_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", colClasses="numeric")

##Merge test and train data
subject <- c(subject_train,subject_test,recursive=TRUE)
activity <- c(activity_train,activity_test)
xdata <- rbind(data_train,data_test)
mergedata <- cbind(subject,activity,xdata)
names(mergedata) <- c("subject_ID", "Activity_name", features)

##Extract the mean and standard deviation measurements
meancol <- grep("mean()", names(mergedata),fixed=TRUE)
stdcol <- grep("std()", names(mergedata),fixed=TRUE)
meanstdcol <- sort(c(meancol,stdcol))
finaldata <- mergedata[ , c(1,2,meanstdcol)]

##Use descriptive activity names to name the activities in the data set
activityname <- c("Walking", "Walking.upstairs", "Walking.downstairs", "Sitting", "Standing", "Laying")
for (i in 1:6) {      
      temp <- grep(i, finaldata$Activity_name, fixed=TRUE)
      finaldata$Activity_name[temp] <- activityname[i]
}

##Appropriately labels the data set with descriptive variable names. 
##I chose to stick to the original variables names as in the features.txt.
write.table(finaldata, file="Tidy_Data.txt", row.names=FALSE)

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
finaldata_2 <- aggregate(finaldata[ ,3:68], by=list(finaldata$subject_ID, finaldata$Activity_name), FUN=mean)
names(finaldata_2)[1:2] <- c("subject_ID","Activity_name")
write.table(finaldata_2, file="Final_Tidy_Data.txt", row.names=FALSE)

##Test whether the data output is correct
testtable <- read.table("Final_Tidy_Data.txt", header=TRUE)
ncol(finaldata_2) == ncol(testtable)
nrow(finaldata_2) == nrow(testtable)
