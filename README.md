# RUN ANALYSIS
---------------------------------------------------------

This script is organized in the following hierarchy

### Function tidyData(z) 
------------------------
This is an R function that returns a tiny data set meeting all the requirements in the Course Project except that it only contains either the Test or Train data.  
- Read the "features.txt" file into a data frame named **feat** 
- Create a new data frame named **featMS**.  This data frame only contains the features that are of type "mean" or "std" 
