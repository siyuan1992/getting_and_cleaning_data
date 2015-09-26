# Code Book
This summarizes the data fields in `tidyData.txt`.

### Identifiers
Column 1: `ActivityID`	
Column 2: `SubjectID`

### Features selected
Column 3: `timeBodyAccMagMean`  
Column 4: `timeBodyAccMagStd`       
Column 5: `timeGravityAccMagMean`   
Column 6: `timeGravityAccMagStd`  
Column 7: `timeBodyAccJerkMagMean`  
Column 8: `timeBodyAccJerkMagStd`   
Column 9: `timeBodyGyroMagMean`   
Column 10: `timeBodyGyroMagStd`     
Column 11: `timeBodyGyroJerkMagMean`	 
Column 12: `timeBodyGyroJerkMagStd`			
Column 13: `freqBodyAccMagMean`	      
Column 14: `freqBodyAccMagStd`       
Column 15: `freqBodyAccJerkMagMean` 	 
Column 16: `freqBodyAccJerkMagStd`   
Column 17: `freqBodyGyroMagMean`    
Column 18: `freqBodyGyroMagStd`     
Column 19: `freqBodyGyroJerkMagMean` 	
Column 20: `freqBodyGyroJerkMagStd`  
#### Notes: 
~Mean & ~Std: the mean/standard deviation of the original feature(each column);   
timeAcc~ & timeGyro~: the original signal;    
timeBodyAcc~ & timeGravityAcc~: after filtering, the original signal was separated into body and gravity part;   
timeBodyAccJerk~ & timeBodyGyroJerk~: Subsequently, the body linear acceleration and angular velocity were
                                      derived in time to obtain Jerk signals;   
time~ & freq~: time domain signals and frequency domain (FFT) of the signals;     

### Categorical/Numerical features
Column 21: `activityType`	
It has six types as follows :	
WALKING (value 1): subject was walking during the test	
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test	
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test	
SITTING (value 4): subject was sitting during the test	
STANDING (value 5): subject was standing during the test	
LAYING (value 6): subject was laying down during the test	
