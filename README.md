# run_analysis.R
--------------------------


### Step 1. Create a Tidy Data Frame for the "train" data set

Execute my R function named *tidyData(z)* that returns a tidy data frame meeting all the requirements in the Course Project except that it only works on one data set at a time. 

The data frame named **trainDF** meets requirement number 5 of the project except it only includes train data.
````
trainDF<-tidyData("train")
````
------------------------

### Step 2.  Create a Tidy Data Frame for the "test" data set
By passing "test" to the tidyData() function, a tidy data frame for the test data set are passed to the testDF data frame

```
testDF<-tidyData("test")
```
--------------------------
