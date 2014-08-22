run_analysis <- function() {

  library(plyr)
  #load in the test data
  setwd("/Users/bronzeon/Desktop/UCI HAR Dataset/test")
  testsubs <- read.table("./subject_test.txt")
  testset <- read.table("./X_test.txt")

  #2) Extracts only the measurements on the mean and standard deviation for each measurement. 
  teststats <- testset[,1:6]
  testlabels <- read.table("./y_test.txt")

  #combine the columns
  testdata <- cbind(testsubs,testlabels,teststats)
  
  #4) Appropriately labels the data set with descriptive variable names. 
  colnames(testdata) = c("subject","activity","tBAmeanX","tBAmeanY",
                          "tBAmeanZ","tBAstdX","tBAstdY","tBAstdZ")

  #load in the train data
  setwd("/Users/bronzeon/Desktop/UCI HAR Dataset/train")
  trainsubs <- read.table("./subject_train.txt")
  trainset <- read.table("./X_train.txt")
  
  #2) Extracts only the measurements on the mean and standard deviation for each measurement. 
  trainstats <- trainset[,1:6]
  #rename the column names
  trainlabels <- read.table("./y_train.txt")
  #combine the columns 
  traindata <- cbind(trainsubs,trainlabels,trainstats)
  
  #4) Appropriately labels the data set with descriptive variable names. 
  colnames(traindata) = c("subject","activity","tBAmeanX","tBAmeanY",
                          "tBAmeanZ","tBAstdX","tBAstdY","tBAstdZ")
  
  #1) Merges the training and the test sets to create one data set.
  allData <- rbind(testdata,traindata)

  #3) Uses descriptive activity names to name the activities in the data set
  allData$activity[allData$activity==1] <- "walking"
  allData$activity[allData$activity==2] <- "walkingUp"
  allData$activity[allData$activity==3] <- "walkingDown"
  allData$activity[allData$activity==4] <- "sitting"
  allData$activity[allData$activity==5] <- "standing"
  allData$activity[allData$activity==6] <- "laying"
  
  #5) Creates a second, independent tidy data set with the average of each variable 
  #for each activity and each subject. 
  meltedData <- melt(allData, id=c("subject","activity"),
                     measure.vars=c("tBAmeanX","tBAmeanY",
                                    "tBAmeanZ","tBAstdX","tBAstdY","tBAstdZ"))
  avgData <- dcast(meltedData,subject + activity ~ variable,mean)
  write.table(avgData,file="/Users/bronzeon/Desktop/averageData.txt",row.names=FALSE)

}

