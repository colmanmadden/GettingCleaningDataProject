mydplyr <- function(){
  
  #Merge Training Data & Test Data to Create One Dataset
  features <- read.table("./UCIHARDataset-2/features.txt")
  activityLabelsData <- read.table("./UCIHARDataset-2/activity_labels.txt")
  trainData <- read.table("./UCIHARDataset-2/train/X_train.txt")
  testData <- read.table("./UCIHARDataset-2/test/X_test.txt")
  trainDataY <- read.table("./UCIHARDataset-2/train/Y_train.txt")
  testDataY <- read.table("./UCIHARDataset-2/test/Y_test.txt")
  subjectTrainData <- read.table("./UCIHARDataset-2/train/subject_train.txt")
  subjectTestData <- read.table("./UCIHARDataset-2/test/subject_test.txt")
  
  #rbind data
  allData <- rbind(testData,trainData)
  allDataAct <- rbind(testDataY,trainDataY)
  allDataSub <- rbind(subjectTestData,subjectTrainData)
  
  #Label Columns
  labelsForSubject <- c("SubjectID")
  names(allDataSub) <- labelsForSubject
  labelsForActivity <- c("ActivityID","Activity")
  names(activityLabelsData) <- labelsForActivity
  labelsForAllDataAct <- c("ActivityID")
  names(allDataAct) <- labelsForAllDataAct  
  labels <- as.vector(features$V2)
  names(allData) <- labels   
  
  #column bind all the data sets
  allData <- cbind(allData,allDataAct)
  allData <- cbind(allData,allDataSub)
 
  #remove duplicate columns as not relevant in this project (subjective)
  allData <- allData[ !duplicated(names(allData)) ]
  
  #remove all columns except mean or std  
  allData <- select(allData,matches("mean|std|Activity|Subject"))
  
  #Merge with activity Labels
  allData = merge(activityLabelsData,allData,by.x="ActivityID",by.y="ActivityID")
  
  #Rename column names to make them more meaningful
  allData <- allData %>% setNames(tolower(gsub("Acc","Acceleration",names(.)))) 
  allData <- allData %>% setNames(tolower(gsub("Mag","Magnitude",names(.))))
  allData <- allData %>% setNames(tolower(gsub("Gyro","Gyroscopic",names(.))))
  
  #Create tidy Dataset -> average of each variable for each activity and each subject
  tidyDataset <- allData %>% group_by(subjectid,activity,activityid) %>% summarise_each(funs(mean))
  write.table(tidyDataset, 'tidyDataset.txt', row.names=FALSE )
  #head(tidyDataset)
  
  
}