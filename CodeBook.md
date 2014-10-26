# tidyData(z) EXPLANATION

The data set type is passed into this function.  For the function to work properly, the input can only be "train" or "test".

There are three variable  that contain the names for the X_z.txt, y_z.txt, and the subject_z.txt files.
- *XFile*
- *YFile*
- *SFile*

For example, if the instantiation of this function is going to work on the training data then the function call will be

```
tidyData("train")
```

and thus

- *XFile* = "./data/X_train.txt"  **(NOTE THAT ALL DATA ARE STORED IN the sub directory /data)**
- *YFile* = "./data/y_train.txt"   
- *SFile* = "./data/subject_train.txt"

The "features.txt" file is read into a data frame named *feat*.

Then grep and rbind are used on *feat* to delete all the rows that DO NOT contain "std" or "mean".
This new data frame is called *featMS*

*featMS* is now out of order, so arrange is used on it to sort it by column 1 which contains an index

The file *XFile* is now read into a data frame named *xdf*

The subset function is used to only keep the column numbers in *xdf* that are also in the *featMS* data frame.  In other words, only columns containing "mean" and "std" remain in *xdf*

***Use the colnames function to set each column name to be equal to the value in the features.txt file.***

A new data frame is created named *ydf*.  This contains the information in the *YFile*.  This is a dataframe that contains an Activity ID for each of the observations in the *xdf*

The lone column in *ydf* is added as a column to the *xdf* data frame

The *SFile* file is read into a data  frame *sdf*.  This is a single column data frame containing the subjectID for each observation in xdf.

The lone column in *sdf* is added as a column to the *xdf* data frame.

The "activity_labels.txt" is read into a data frame named *an*.  This will be used as a lookup table for the meaning of the *ydf* data.

*an* and *xdf* are put into a list of data frames and then merged using the join_all function.  Now each observation in xdf has a descriptive activity names
