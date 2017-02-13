# reading and loading the relevant files from the UHCI HAR Dataset

xTrain <- read.table('./train/X_train.txt') # read the observations file of training set
yTrain <- read.table('./train/Y_train.txt') # read the activity ID file of training set
xTrainSubject <- read.table('./train/subject_train.txt') # read the subject file
xTest <- read.table('./test/X_test.txt') # read the observations file of test set
yTest <- read.table('./test/Y_test.txt') # read the activity ID file of test set
xTestSubject <- read.table('./test/subject_test.txt') # read the subject file
act_labels <- read.table('./activity_labels.txt') # read the activity labels file 
features <- read.table('./features.txt') # read the features file

# Labelling the columns in Training & Testing dataset

names(xTrain) <- features$V2
names(xTest) <- features$V2

# Subsetting for the data set with Mean and Std

xTrain_sub <- xTrain[grep('mean()|std()',names(xTrain))]
xTest_sub <- xTest[grep('mean()|std()',names(xTest))]

# adding participant code
xTrain_sub$Participant <-xTrainSubject$V1
xTest_sub$Participant <-xTestSubject$V1

# adding activity ID
xTrain_sub$ActivityCode <-yTrain$V1
xTest_sub$ActivityCode <- yTest$V1

library(dplyr)
library(data.table)

# adding activity name as column
xTrain_sub <- merge(xTrain_sub,act_labels,by.x = "ActivityCode",by.y = "V1")
xTest_sub <- merge(xTest_sub,act_labels,by.x = "ActivityCode",by.y = "V1")
setnames(xTrain_sub,"V2","ActivityName")
setnames(xTest_sub,"V2","ActivityName")

#Combining Training & Testing datasets

Data_final <- rbind(xTrain_sub,xTest_sub)

#Appropriately labelling the data sets

library(tidyr)

names(Data_final) <- gsub('\\(|\\)',"",names(Data_final))
names(Data_final) <- gsub("mean","Mean",names(Data_final))
names(Data_final) <- gsub("std","StandardDeviation",names(Data_final))
names(Data_final) <- gsub('^t',"TimeDomain",names(Data_final))
names(Data_final) <- gsub('[aA]cc',"Acceleration",names(Data_final))
names(Data_final) <- gsub('Gyro',"AngularVelocity",names(Data_final))
names(Data_final) <- gsub('[fF]req',"Frequency",names(Data_final))
names(Data_final) <- gsub('[mM]ag',"Magnitude",names(Data_final))
names(Data_final) <- gsub('^f',"FrequencyDomain",names(Data_final))

#Re-order columns
Data_final1 <- Data_final[,c(81,1,82,2:80)]

#Preparing a tidy data set
summarise(Data_final1,mean)






