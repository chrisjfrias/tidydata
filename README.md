# run_analysis.R
--------------------------


### Step 1. Create a Tidy Aggregated Data Frame for the "train" data set

Execute my R function named *tidyData(z)* that returns a tidy data frame meeting all the requirements in the Course Project except that it only works on one data set at a time. 

The data frame named **trainDF** meets requirement number 5 of the project except it only includes train data.
````
trainDF<-tidyData("train")
````
------------------------

### Step 2.  Create a Tidy Aggregated Data Frame for the "test" data set
By passing "test" to the tidyData() function, a tidy data frame for the test data set are passed to the testDF data frame

```
testDF<-tidyData("test")
```
--------------------------

### Step 3.  Union trainDF and testDF
Using rbind, the two data frames are unioned into one data frame named **DF**

```
DF<-rbind(trainDF,testDF)
```
------------------------------

### Step 4.  Sort the Data Frame
There is no explicit requirement, but the wording from the project ,"with the average of each variable for each activity and each subject." implied to me that the final data file should be sorted first by the activity being perfomed and then the subject performing the activity.

```
DF<-arrange(DF,ActivityName,SubjectID)
```

----------------------
### Step 5. 
Write the data frame DF into a file named "tidydata.txt" which is stored in the working directory 
```
write.table(DF, "tidydata.txt", row.names=FALSE,col.names=TRUE, sep=",")
```
