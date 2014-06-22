CookBook for Running Anlysis on UCI HAR Dataset
========================================================

VARIABLES
========================================================

UCI HAR Dataset provides 561 Variables for testing subjects as well as training subject. 

Metric details:
---------------
features.txt - This file consists of all 561 fields.
features_info.txt - This file consist of details of metric calculation.


Training dataset details:
-------------------------

subject_train.txt - file from UCI HAR Dataset consists of subjects corresponding to training metric provided in metric files.
X_train.txt - Provide 561 metric measures
y_train.txt - provides Activity Labels


Testing dataset details:
------------------------

subject_test.txt - file from UCI HAR Dataset consists of subjects corresponding to training
metric provided in metrics file.
X_test.txt - Provide 561 metric measures
y_test.txt - provides Activity Labels


Activities Master data details:
-------------------------------

activity_labels.txt - This file consist of master list of label codes and thier activity description.


Run Analysis Output Variables:

1. run_analysis.R will merge training and test dataset.

2. run_analysis.R will first pull MEAN and STANDARD DEVIATION related metric columns. Dataset will be associated with LABEL, LABEL ACTIVITY, SUBJECT

3. Mean value will be calculated on MEAN & STANDARD DEVIATION dataset group by (LABEL, LABEL ACTIVITY & SUBJECT)


DATA
========================================================

Tidy dataset provided in above steps will be stored to tidy_dataset.csv file.


TRANSFORMATION
========================================================

Steps followed for Tranformation

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

