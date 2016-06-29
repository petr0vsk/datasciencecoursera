#
# run_analysis.R from Petrovskii Aleksander
# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

require(stringr)
require(tidyr)
require(dplyr)

rm(list = ls())
setwd('D:/WorkR/UCI HAR Dataset/')
# --------- 1. Merges the training and the test sets to create one data set. ---------
# --- read train data
#Training set.  V1-V99 7352 obs. of  561 variables:
X.Train<-read.table("./train/X_train.txt") 
# Training labels V1 7352 obs. of  1 variable:
Y.Train<-read.table("./train/y_train.txt") 
# 'data.frame':	7352 obs. of  1 variable: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
Subject.Ttrain<-read.table("./train/subject_train.txt")
#Links the class labels with their activity name. 'data.frame':	6 obs. of  2 variables:
Activity.Labels<-read.table("./activity_labels.txt")
# List of all features.'data.frame':	561 obs. of  2 variables:
Features<-read.table("./features.txt")
# --- read test data
X.Test<-read.table("./test/X_test.txt")
Y.Test<-read.table("./test/y_test.txt")
#'data.frame':	7352 obs. of  1 variable:Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
Subject.Test<-read.table("./test/subject_test.txt")
# merge data
All.X <- bind_rows(X.Train,X.Test) %>%
setNames(c(as.character(Features[,2])))
All.Y <- rbind(Y.Train, Y.Test)
All.X.Y <- cbind(All.Y, All.X)

# ------ 2. Extracts only the measurements on the mean and standard deviation for each measurement. ------------------------------
# здесь надо выделять имена до добалвения колонки У
Select.Col <- (grep("mean|std", Features$V2, value = FALSE) +1)
Select.Col <- append(Select.Col, 1, after=0)
#length(Select.Col) <- 66 
Mean.Std <-All.X.Y[ ,Select.Col ]
colnames(Mean.Std)[1] <- "ActivityName"
# ------ 3. Uses descriptive activity names to name the activities in the data set ---------------------------------------------
#Activity.Labels[,2]<-as.character(Activity.Labels[,2])
#lapply(Mean.Std[1], function(i){ Mean.Std[i,1]<-Activity.Labels[Mean.Std[i,1],2]})
Mean.Std$ActivityName <-  sapply(Mean.Std$ActivityName, function(x) Mean.Std[x,1]<- Activity.Labels[x,2])

# ------- 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Subject.All <- rbind(Subject.Test,Subject.Ttrain)
Data.all <- cbind(Subject.All,Mean.Std )





X<- Mean.Std[c(1:10),]
Activity.Labels[,2]<-as.character(Activity.Labels[,2])
X$ActivityName<-sapply(X$ActivityName, function(x){X[x,1]<- Activity.Labels[x,2]})


