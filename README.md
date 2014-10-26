# run_analysis.R
---------------------------------------------------------


### Step 1. Create a Tidy Data Frame for the "train" data set
------------------------
Execute my R function named *tidyData(z)* that returns a tidy data frame meeting all the requirements in the Course Project except that it only works on one data set at a time. 

In the example belo the **trainDF** meets the From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

````
trainDF<-tidyData("train")
````
