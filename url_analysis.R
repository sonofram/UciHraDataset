library(Defaults)
library(data.table)
library(plyr)
################################################################################
# Function: url_analysis 
# Function store all urls required for running analysis on UCI HAR Dataset.
# Function also return list of functions listed below and set sets url with data.table
# value passed in
# 
# getUrl(url_type) - url_type should be passed in with below mentioned column names.
# setUrl(url_type,url_val) - pass url_type and url_val. url_type should be column name mentioned below.
# getAllUrls() - return data.table of urls
# setAllUrls(dt_urls) - read all urls passed in dt_urls.
# getUrlHeader() - return list of header values
#
# Argument: dt_urls - argument need to be data.table with url
# dt_urls columns names c("url_features","url_activity","url_test_subject",
#                       "url_test_metric","url_test_label",
#                       "url_train_subject","url_train_metric","url_train_label")
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

url_analysis <- function(dt_urls = data.table()){

#Test header names
url_features <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\features.txt"  
url_activity <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\activity_labels.txt"

#Testing file URL
url_test_subject <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\test\\subject_test.txt"
url_test_metric <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\test\\X_test.txt"
url_test_label <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\test\\y_test.txt"

#trianing file URL
url_train_subject <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\train\\subject_train.txt"
url_train_metric <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\train\\X_train.txt"
url_train_label <- "C:\\selva\\Data Science\\Data Cleansing\\Week2\\UCI HAR Dataset\\train\\y_train.txt"
        
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

##Extracing data.table with url details
##setting it to variables.
setAllUrls(dt_urls)

list(getUrl=getUrl,setUrl=setUrl,
     getAllUrls=getAllUrls,setAllUrls=setAllUrls,
     getUrlHeader=getUrlHeader)
        
}
