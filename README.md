README - UCI HAR Dataset Analysis
========================================================

Two R scripts created

url_analysis.R - Program that stores all paths of all files required. Input will be data.table 
will all file paths. Details provided in url_ananlysis.R file's comments. 

run_analysis.R - Program that generates Analysis

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

         
fnc <- url_analysis()

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

