# tidyData(z) EXPLANATION

The data set type is passed into this function.  For the function to work properly, the input can only be "train" or "test".

There are three variable names that contain the names for the X_z.txt, y_z.txt, and the subject_z.txt files.
- XFile
- YFile
- SFile

For example, if the instantiation of this function is going to work on the training data then the function call will be

```
tidyData("train")
```

and **(NOTE THAT DATA ARE STORED IN the sub directory /data)**

XFile will equal "./data/X_train.txt"
YFile will equql "./data/y_train.txt"
SFile will equal "./data/subject_train.txt"

