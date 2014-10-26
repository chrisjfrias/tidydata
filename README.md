# run_analysis.R
--------------------------
### Step 0.  Custom Function
A custom R function that performs all the column deletions, column naming, row naming, and aggregations required to get an aggregated tidy data set that will be used to meet requirement number 5 in the project description.

**See CodeBook.md** for details about how this function works
```
tidyData<-function(z) 
{
XFile<-paste('./data/X_',z,'.txt',sep='',collapse='')  
YFile<-paste('./data/y_',z,'.txt',sep='',collapse='')  
SFile<-paste('./data/subject_',z,'.txt',sep='',collapse='')  

  
## read in the features.txt file into a data frame
feat = read.table("./data/features.txt", sep=" ",col.names=c("ColumnNumber", "FeatureName"))


## create a new data frame from feat that only contains columns with "std" or "mean"
featMS<-rbind(feat[(grep("std",feat$FeatureName)),],feat[(grep("mean",feat$FeatureName)),])

## sort the new data frame by ColumnNumber
featMS<-arrange(featMS,ColumnNumber)


## read the main xdf data set
xdf = read.table(XFile, sep="")


## only keep the columns that contain "std" or "mean
xdf <- subset(xdf,select=featMS$ColumnNumber)

## set column names in xdf to match the column names in the features.txt file
colnames(xdf) <- featMS$FeatureName


## bring the activity IDs into a data frame
ydf = read.table(YFile,sep="",col.names="ActivityID")

## add the activity IDs to xdf
xdf$ActivityID <- ydf$ActivityID


## read the subject data into a data frame
sdf = read.table(SFile,sep="",col.names="SubjectID")

## add the Subject ID to the xdf data frame
xdf$SubjectID <- sdf$SubjectID


## read the activity_labels file into a data frame
an = read.table("./data/activity_labels.txt", sep=" ",col.names=c("ActivityID", "ActivityName"))

## join the two data frames in the list.  this adds the ActivityName based on the ActivityID
xdf <-join_all(list(xdf,an))


## average the 79 features over ActivyName & SubjectID
## this is the returned data frame
xdf2 <- ddply(xdf, c("ActivityName", "SubjectID"), function(x) colMeans(x[as.character(featMS$FeatureName)]))

}
```

### Step 1. Create a Tidy Aggregated Data Frame for the "train" data set

Execute my R function named *tidyData(z)* that returns a tidy aggregated data frame meeting all the requirements in the Course Project except that it only works on one data set at a time. 

The data frame named **trainDF** meets requirement number 5 of the project except it only includes train data.
````
trainDF<-tidyData("train")
````
------------------------

### Step 2.  Create a Tidy Aggregated Data Frame for the "test" data set
By passing "test" to the tidyData() function, a tidy aggregated data frame for the test data set are passed to the testDF data frame

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
