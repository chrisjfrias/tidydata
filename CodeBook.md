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

- XFile = "./data/X_train.txt"  **(NOTE THAT ALL DATA ARE STORED IN the sub directory /data)**
- YFile = "./data/y_train.txt"   
- SFile = "./data/subject_train.txt"

The "features.txt" file is read into a data frame named *feat*.

Then grep and rbind are used on *feat* to delete all the rows that DO NOT contain "std" or "mean".
This new data frame is called *featMS*

*featMS* is now out of order, so arrange is used on it to sort it by column 1 which contains an index

The X data contained in the file *XFile* are now read into a data frame named *xdf*
