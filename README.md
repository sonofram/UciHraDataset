README - UCI HAR Dataset Analysis
========================================================

Two R script created
url_analysis.R - Program that stores all paths of all files required
run_analysis.R - Program that generates Analysis.

Step#Initiation Load Rscripts
-----

```{r}

source("url_analysis.R")
source("run_analysis.R")

```



Step#1 List of all file paths related for running analysis
-----

```{r}

#Example of Header & activity master
url_features <- "C:\\UCI HAR Dataset\\features.txt"  
url_activity <- "C:\\UCI HAR Dataset\\activity_labels.txt"

#Testing file URL
url_test_subject <- "C:\\UCI HAR Dataset\\test\\subject_test.txt"
url_test_metric <- "C:\\UCI HAR Dataset\\test\\X_test.txt"
url_test_label <- "C:\\UCI HAR Dataset\\test\\y_test.txt"

#trianing file URL
url_train_subject <- "C:\\UCI HAR Dataset\\train\\subject_train.txt"
url_train_metric <- "C:\\UCI HAR Dataset\\train\\X_train.txt"
url_train_label <- "C:\\UCI HAR Dataset\\train\\y_train.txt

```

Step#2 Store paths of all files related for running analysis
-----

```{r}

dt <- data.table(url_features,url_activity,
                 url_test_subject,url_test_metric,url_test_label,
                 url_train_subject,url_train_metric,url_train_label)
                 
fnc <- url_analysis(dt)

```

Step#3 Run Analysis
-----

```{r}

tidy_ds <- run_analysis(fnc)

```

Step#4 Write data to file
----

```{r}
write.csv(tidy_ds,"tidy_dataset.csv",row.names=FALSE)

```

