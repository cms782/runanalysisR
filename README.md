runanalysisR
============

Run Analysis

The run_analysis function loads 6 tables, 3 of test data, and 3 of train data. 
The measurments for the mean and standard deviation are located in rows 1 through 6,
of X_test/train.txt. These columns are extracted and set to a new table. The tables
containing the subjects for each row and the activity for each row are loaded
using read.table(). The tables for test and train respectively are combined using
the cbind() function. 
The column names for testdata, and traindata are changed respectivley by assigning
the result of the colnames() function to a vector of character values. 
The two data frames are then combined using the rbind() function. 
The activity names are then changed by subsetting allData and using a 
conditional statement to determine when integer corresponds to 
which activity label. For example allData$activity[allData$activity==1] <- "Walking"
This is repeated for all values 1 through 6. 
The data is then melted using the melt() function, using ids "subject" and "activity",
and variables "tBAmeanX","tBAmeanY", "tBAmeanZ","tBAstdX","tBAstdY", and "tBAstdZ".
This creates a tall and skinner data frame.
This data frame is then reshaped using dcast() to aggregate the mean of the variables.
The mean of each variable is shown for each subject, activity combination.
This melted and reshaped data frame is then writen to a file suing write.table()
