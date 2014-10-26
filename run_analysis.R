tidyData<-function(z) 
{
XFile<-paste('./data/X_',z,'.txt',sep='',collapse='')  
YFile<-paste('./data/y_',z,'.txt',sep='',collapse='')  
SFile<-paste('./data/subject_',z,'.txt',sep='',collapse='')  

  
## read in the features.txt file into a data frame
feat = read.table("./data/features.txt", sep=" ",col.names=c("ColumnNumber", "FeatureName"))

# feat[(grep("std",feat$FeatureName)),]
# feat[(grep("mean",feat$FeatureName)),]

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
xdf2 <- ddply(xdf, c("ActivityName", "SubjectID"), function(x) colMeans(x[as.character(featMS$FeatureName)]))

}
trainDF<-tidyData("train")
testDF<-tidyData("test")
DF<-rbind(trainDF,testDF)
DF<-arrange(DF,ActivityName,SubjectID)
write.table(DF, "tidydata.txt", row.names=FALSE,col.names=TRUE, sep=",")




