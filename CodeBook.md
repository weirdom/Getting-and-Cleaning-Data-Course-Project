# Code book

## Datasets informations
The source files contains features from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
	   
## Transformation step 

* Prepare the Train table , The data are spread in three differents files, 
	* Subject : subject_train.txt
	* Obs     : X_train.txt
	* Labels  : y_train.txt

* Prepare the Test table , The data are spread in three differents files, 
	* Subject : subject_test.txt
	* Obs     : X_test.txt
	* Labels  : y_test.txt

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Merge training and test datasets

* Create final_tidy.txt summary datasets 


Finally a tidy data set with the average of each variable group by activity and subject (final_tidy.txt).


## Dataset description
 
      "subject"  :      The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years (id).
	  
      "activityname"  : 1 WALKING
						2 WALKING_UPSTAIRS
						3 WALKING_DOWNSTAIRS
						4 SITTING
						5 STANDING
						6 LAYING
            
	   An average of each variable group by activity and subject
	 
       "tbodyaccmeanx"           
       "tbodyaccmeany"            "tbodyaccmeanz"            "tbodyaccstdx"            
       "tbodyaccstdy"             "tbodyaccstdz"             "tgravityaccmeanx"        
       "tgravityaccmeany"         "tgravityaccmeanz"         "tgravityaccstdx"         
       "tgravityaccstdy"          "tgravityaccstdz"          "tbodyaccjerkmeanx"       
       "tbodyaccjerkmeany"        "tbodyaccjerkmeanz"        "tbodyaccjerkstdx"        
       "tbodyaccjerkstdy"         "tbodyaccjerkstdz"         "tbodygyromeanx"          
       "tbodygyromeany"           "tbodygyromeanz"           "tbodygyrostdx"           
       "tbodygyrostdy"            "tbodygyrostdz"            "tbodygyrojerkmeanx"      
       "tbodygyrojerkmeany"       "tbodygyrojerkmeanz"       "tbodygyrojerkstdx"       
       "tbodygyrojerkstdy"        "tbodygyrojerkstdz"        "tbodyaccmagmean"         
       "tbodyaccmagstd"           "tgravityaccmagmean"       "tgravityaccmagstd"       
       "tbodyaccjerkmagmean"      "tbodyaccjerkmagstd"       "tbodygyromagmean"        
       "tbodygyromagstd"          "tbodygyrojerkmagmean"     "tbodygyrojerkmagstd"     
       "fbodyaccmeanx"            "fbodyaccmeany"            "fbodyaccmeanz"           
       "fbodyaccstdx"             "fbodyaccstdy"             "fbodyaccstdz"            
       "fbodyaccjerkmeanx"        "fbodyaccjerkmeany"        "fbodyaccjerkmeanz"       
       "fbodyaccjerkstdx"         "fbodyaccjerkstdy"         "fbodyaccjerkstdz"        
       "fbodygyromeanx"           "fbodygyromeany"           "fbodygyromeanz"          
       "fbodygyrostdx"            "fbodygyrostdy"            "fbodygyrostdz"           
       "fbodyaccmagmean"          "fbodyaccmagstd"           "fbodybodyaccjerkmagmean" 
       "fbodybodyaccjerkmagstd"   "fbodybodygyromagmean"     "fbodybodygyromagstd"     
       "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd" 

	   