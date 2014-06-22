library(Defaults)
library(data.table)
library(plyr)
################################################################################
# Function: url_analysis 
# Function store all urls required for running analysis on UCI HAR Dataset.
# Function also return list of functions listed below. function will by default
# Base working Dir - getwd() to search for data provided by UCI HAR Dataset
# Training Dir - getwd()/train to search for training data
# Testing Dir - getwd()/test to search for testing data.
################## 
# getUrl(url_type) - url_type should be passed in with below mentioned column names.
# setUrl(url_type,url_val) - Set url_value by passing url_type and url_val. 
#                            url_type will be column names mentioned below
#                            url_val will be value for url.
# getAllUrls() - return data.table of urls
# setAllUrls(dt_urls) - read all urls passed in dt_urls. dt_urls should be data.table with 
#                       column name mentioned below
# getUrlHeader() - return list of header values. Will return below listed column names.
##################
# columns names - to use while calling setUrl, getUrl, getAllUrls or setAllUrls functions :
#                       c("url_features","url_activity","url_test_subject",
#                       "url_test_metric","url_test_label",
#                       "url_train_subject","url_train_metric","url_train_label")
##################
# Details of value stored in dt_urls
# column url_features value - Url for features.txt file.
# column url_activity value - Url for activity_labels.txt file.
# column url_test_subject value - Url for subject_test.txt file.
# column url_test_metric value - Url for X_test.txt file.
# column url_test_label value - Url for y_test.txt file.
# column url_train_subject value - Url for subject_train.txt file.
# column url_train_metric value - Url for X_train.txt file.
# column url_train_label value - Url for y_train.txt file.
#
################################################################################

url_analysis <- function(){

working_dir  <- paste(gsub("/","//",getwd()),"//",sep="")       
testing_dir  <- paste(working_dir,"//test//",sep="")
training_dir <- paste(working_dir,"//train//",sep="")

#Test header names
url_features <- paste(working_dir,"features.txt",sep="")
url_activity <- paste(working_dir,"activity_labels.txt",sep="")

#Testing file URL
url_test_subject <- paste(testing_dir,"subject_test.txt",sep="")
url_test_metric <- paste(testing_dir,"X_test.txt",sep="")
url_test_label <- paste(testing_dir,"y_test.txt",sep="")

#trianing file URL
url_train_subject <- paste(training_dir,"subject_train.txt",sep="")
url_train_metric <- paste(training_dir,"X_train.txt",sep="")
url_train_label <- paste(training_dir,"y_train.txt",sep="")
        
#unknown URL
url_unknown <- ""

#list of header for URL provided as data.frame
url_header <- c("url_features","url_activity",
                "url_test_subject","url_test_metric","url_test_label",
                "url_train_subject","url_train_metric","url_train_label")

#list of URL provided for data.frame
url_filled_val <- c(url_features,url_activity,
                    url_test_subject,url_test_metric,url_test_label,
                    url_train_subject,url_train_metric,url_train_label)

setUrl <- function(url_type,url_val){
        
        switch(url_type, 
               url_features={
                       url_features <<- url_val
               },
               url_activity={
                       url_activity <<- url_val    
               },
               url_test_subject={
                       url_test_subject <<- url_val
               },
               url_test_metric={
                       url_test_metric <<- url_val    
               },
               url_test_label={
                       url_test_label <<- url_val
               },
               url_train_subject={
                       url_train_subject <<- url_val    
               },
               url_train_metric={
                       url_train_metric <<- url_val
               },
               url_train_label={
                       url_train_label <<- url_val    
               },
               {
                        url_unknown <<- url_val                
               }
              )
} #end of setUrl       

getUrl <- function(url_type){
        switch(url_type, 
               url_features={
                       print(url_features)
               },
               url_activity={
                       print(url_activity)    
               },
               url_test_subject={
                       print(url_test_subject)
               },
               url_test_metric={
                       print(url_test_metric)
               },
               url_test_label={
                       print(url_test_label)
               },
               url_train_subject={
                       print(url_train_subject)
               },
               url_train_metric={
                       print(url_train_metric)
               },
               url_train_label={
                       print(url_train_label)
               },
               {
                        print('unknown URL type')
                }
             )

}#end of getUrl()

setAllUrls <- function(dt_url = data.table()){
               url_features <<- dt_url[["url_features"]]
               url_activity <<- dt_url[["url_activity"]]
               url_test_subject <<- dt_url[["url_test_subject"]]
               url_test_metric <<- dt_url[["url_test_metric"]]
               url_test_label <<- dt_url[["url_test_label"]]
               url_train_subject <<- dt_url[["url_train_subject"]]
               url_train_metric <<- dt_url[["url_train_metric"]]
               url_train_label <<- dt_url[["url_train_label"]]
}#end of setAllUrls()

getAllUrls <- function(){
        
        data.table(url_filled_val,col.names=url_header)
        
}#end of getAllUrls()

getUrlHeader <- function(){
        url_header    
}



list(getUrl=getUrl,setUrl=setUrl,
     getAllUrls=getAllUrls,setAllUrls=setAllUrls,
     getUrlHeader=getUrlHeader)
        
}
