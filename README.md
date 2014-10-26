# RUN ANALYSIS
---------------------------------------------------------

This script is organized in the following hierarchy

### Function tidyData(z) 
------------------------
This is an R function that returns a tidy data frame meeting all the requirements in the Course Project except that it only works on one data set at a time.  For example to return a tidy data frame for the training set, then the string "training" is passed to the function.  Or to return a data data frame for the test set, then the string "test" is passed to the function

````
trainDF<-tidyData("train")
````
- Read the "features.txt" file into a data frame named **feat** 
- Create a new data frame named **featMS**.  This data frame only contains the features that are of type "mean" or "std" 
