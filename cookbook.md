CookBook for Running Anlysis on UCI HAR Dataset
========================================================

INPUT VARIABLES
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

OUTPUT VARIABLES
========================================================

run_analysis.R Output Variables:
------------------------------

1. function merges training dataset(metrics, subject & label) using cbind function

2. function merges testing dataset(metrics, subject & label) using cbind function

3. function merges above two datasets(training & testing) using rbind function.

4. function merges above results with activity dataset using cbind function. All column names
for metrics are marked from features.txt

5. function seperates MEAN and STD realted fields and calculates mean by (subject & label activity, label) 

   NOTE: "Label"" and "Label Activity"" represent activity by subjects. "Label"" is numeric
   key and "Label Activity"" is description of activity

6. function modifies mean result column names by prefixing "mean of"

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

```

Step#2 Store paths of all files related for running analysis
-----

```{r}

         
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

