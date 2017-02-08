library("data.table")
#
#1. Merges the training and the test sets to create one data set.
# Prepare the Train table
# The data are spread in three differents files, 

# Subject : subject_train.txt
# Obs     : X_train.txt
# Labels  : y_train.txt

train_Subject <- read.table("./train/subject_train.txt")
train_Obs     <- read.table("./train/X_train.txt")#Contains 561 columns and 7352 obs.
train_Labels  <- read.table("./train/y_train.txt")

#Labels descriptions (values) are in activity_labels.txt
#column names are in features.txt

activity_labels  <- read.table("./activity_labels.txt")
names(activity_labels) <- c("labelid","activityname")

column_names     <- read.table("./features.txt")
names(column_names) <- c("id","column_name")


# Assign column_names to train_Obs column
names(train_Obs) <- column_names[,"column_name"]

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Do this first because train_Obs is pretty big

train_Obs_sd_m  <- train_Obs[,grep("mean\\(\\)|std\\(\\)", names(train_Obs))]

#then add subject and labels to the table
names(train_Subject) <- "subject"
names(train_Labels) <- "labelid"
train_Obs_sd_m <- cbind(train_Obs_sd_m,train_Subject)
train_Obs_sd_m <- cbind(train_Obs_sd_m,train_Labels)


train_Obs_final <- merge (train_Obs_sd_m,activity_labels,  by="labelid")


# Prepare the test table
# We have three variable spread in three differents files, 

# Subject : subject_test.txt
# Obs     : X_test.txt
# Labels  : y_test.txt

test_Subject <- read.table("./test/subject_test.txt")
test_Obs     <- read.table("./test/X_test.txt")#Contains 561 columns and 2947 obs.
test_Labels  <- read.table("./test/y_test.txt")

#Labels descriptions (values) are in activity_labels.txt
#Obs labels (column names) are in features.txt
# Already prepared in activity_labels and column_names
names(test_Obs) <- column_names[,"column_name"]

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Do this first because test_Obs is pretty big
test_Obs_sd_m  <- test_Obs[,grep("mean\\(\\)|std\\(\\)", names(test_Obs))]
#then add subject and labels to the table
names(test_Subject) <- "subject"
names(test_Labels) <- "labelid"
test_Obs_sd_m <- cbind(test_Obs_sd_m,test_Subject)
test_Obs_sd_m <- cbind(test_Obs_sd_m,test_Labels)



#3. Uses descriptive activity names to name the activities in the data set
#Add Label description to test_Obs_sd_m
test_Obs_final <- merge (test_Obs_sd_m,activity_labels,  by="labelid")


#4. Appropriately labels the data set with descriptive variable names.
#clean columns names
#train dataset
#remove parenthesis
names (train_Obs_final) <- sub("\\(","",names (train_Obs_final),)
names (train_Obs_final) <- sub("\\)","",names (train_Obs_final),)
#all lowercase
names (train_Obs_final) <- tolower (names(train_Obs_final))
#hyphen
names (train_Obs_final) <- gsub("\\-","",names (train_Obs_final),)

#test dataset
#remove parenthesis
names (test_Obs_final) <- sub("\\(","",names (test_Obs_final),)
names (test_Obs_final) <- sub("\\)","",names (test_Obs_final),)
#all lowercase
names (test_Obs_final) <- tolower (names(test_Obs_final))
#hyphen
names (test_Obs_final) <- gsub("\\-","",names (test_Obs_final),)


#1.Merge DATA! 
# before merging , add one column (set) to each dataset to identify if the obs is training or test 

train_Obs_final$set <- "TRAIN"
test_Obs_final$set <- "TEST"

final_dataset <- rbind (train_Obs_final,test_Obs_final) # 10299 obs of 7- variable


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)

final_tidy <- ddply(final_dataset, .(subject,activityname), function(x) colMeans(x[, 2:67]))

write.table(final_tidy, "final_tidy.txt", row.name=FALSE)
