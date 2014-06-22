library(Defaults)
library(data.table)
library(plyr)

#####################################################################
# run_analysis: function to run analysis and provide results as 
# per project assignment.
#
# url_analysis: stores all paths of files required. Please refer to
#               details in url_analysis.R file. This function will
#               return list of functions that can provide file paths
#               required for running analysis
# run_analysis function details:
#               Function reads all files provided by url_analysis()
#               and will provide mean of all MEAN & STD variables
#               group by label activity, label & subject
#####################################################################

run_analysis <- function(url,...){
#####################################################################
#####################Data Required For Assignment####################
#####################################################################
#Test header names
url_features <- url$getUrl("url_features")
url_activity <- url$getUrl("url_activity")

#Testing file URL
url_test_subject <- url$getUrl("url_test_subject")
url_test_metric <- url$getUrl("url_test_metric")
url_test_label <- url$getUrl("url_test_label")


#trianing file URL
url_train_subject <- url$getUrl("url_train_subject")
url_train_metric <- url$getUrl("url_train_metric")
url_train_label <- url$getUrl("url_train_label")

#Header listing
features <- read.table(url_features,header=FALSE, stringsAsFactor=FALSE)
features <- sapply(features$V2,as.character)

#Data table for activity 
activity <- read.table(url_activity,header=FALSE, stringsAsFactor=FALSE,col.names=c("label","activity"))

#Data table for test data
test_subject <- read.table(url_test_subject,header=FALSE,col.names=c("subject"),colClasses=c("numeric"))
test_metric <- read.table(url_test_metric,header=FALSE,strip.white=TRUE,col.names=features,check.names=FALSE)
test_label <- read.table(url_test_label,header=FALSE,col.names=c("label"),colClasses=c("numeric"))

#Data table for Training data
train_subject <- read.table(url_train_subject,header=FALSE,col.names=c("subject"),colClasses=c("numeric"))
train_metric <- read.table(url_train_metric,header=FALSE,strip.white=TRUE,col.names=features,check.names=FALSE)
train_label <- read.table(url_train_label,header=FALSE,col.names=c("label"),colClasses=c("numeric"))

##############################################################
#Project Step#1.Merges the training and the test sets to create one data set
##############################################################
#Binding subject, test, label

full_dataset <- rbind( cbind(test_metric,cbind(test_subject,test_label)),
                       cbind(train_metric,cbind(train_subject,train_label))
                     )

#########################################################################################
#Project Step#2.Extracts only the measurements on the mean and standard deviation for each measurement
#########################################################################################

mean_flds <- sapply(grep("mean",features,ignore.case=TRUE),function(i) features[i])
std_flds <- sapply(grep("std",features,ignore.case=TRUE),function(i) features[i])
dataset_mean_std <- as.data.table(
                                  subset(full_dataset,
                                         select=c(mean_flds,std_flds,"label","subject")
                                         )
                                 )

#########################################################################################
#Project Step#3.Uses descriptive activity names to name the activities in the data set
#########################################################################################

dataset_mean_std_desc <- merge(dataset_mean_std,activity,by="label",all=FALSE)

#########################################################################################
#Project Step#4.Appropriately labels the data set with descriptive variable names. 
#Project Step#5.5.Creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject. 
#########################################################################################

#list of labels for group by mean.
group_flds <- c("label","activity","subject")

##Calculating mean by group (label,activity,subject)
dt_mean <- dataset_mean_std_desc[, lapply(.SD, mean), by=group_flds]

# Creating appropriate column names.
mean_col_names <- sapply(colnames(dt_mean),function(x){if(x == "label" || x == "activity" || x == "subject") x else paste("mean of",x)})

# setting column names.
setnames(dt_mean,colnames(dt_mean),mean_col_names)

# returning tidy dataset.
dt_mean

}