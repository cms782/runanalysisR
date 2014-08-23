testsubs: subject table for the test data
testset: initial X_test data read in
teststats: extracts the first 6 rows of testset, which correspond the measurements
           of the mean and standard deviation
testlabels: activity labels for the test data

trainsubs: subject table for the train data
trainset: initial X_train data read in
trainstats: extracts the first 6 rows of trainset, which correspond the measurements
           of the mean and standard deviation
trainlabels: activity labels for the train data

testdata: data containing testsubs, teststats, and testlabels, combined using cbind()
traindata: data containing trainsubs, trainstats, and trainlabels, combined using cbind()

allData <- data containing testdata and train data, combined using rbind()

allData$activity[allData$activity=1:6] is changed to corresponding lable using assignment operator.

meltedData: melted data set, using melt(). ids are "subject" and "activity". variables are
            ""tBAmeanX","tBAmeanY", "tBAmeanZ","tBAstdX","tBAstdY", and "tBAstdZ". 
avgData: reshaped data set by passing meltedData to dcast(). shapes the data so that the mean of
        the variables for each subject, activity combination is shown. 

