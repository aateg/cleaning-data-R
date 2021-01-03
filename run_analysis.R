# imports
library(dplyr)

# read dataset
## train
train_path <- "./UCI HAR dataset/train/"
X_train <- read.table(paste(train_path, 'X_train.txt', sep = ""))
y_train <- read.table(paste(train_path, 'y_train.txt', sep = ""))
subject_train <- read.table(paste(train_path, 'subject_train.txt', sep = ""))
                            
## test
test_path <- "./UCI HAR dataset/test/"
X_test <- read.table(paste(test_path, 'X_test.txt', sep = ""))
y_test <- read.table(paste(test_path, 'y_test.txt', sep = ""))
subject_test <- read.table(paste(test_path, 'subject_test.txt', sep = ""))
## features labels
features <- read.table(
    './UCI HAR dataset/features.txt', 
    col.names = c('index', 'label'),
    colClasses = c("NULL", NA)) # ignore first column
## activity
activity <- read.table(
    './UCI HAR dataset/activity_labels.txt', 
    col.names = c('index', 'label'))

# 1. Merges the training and the test sets to create one data set.
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

## add names to variables
names(X) <- features$label
names(y) <- c('activity')
names(subject) <- c('subject')

## merge columns to create one data set
data <- cbind(X, cbind(y, subject))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
cols2extract <- grep(pattern="mean\\(\\)|std\\(\\)", x=colnames(X))
data <- dplyr::select(data, all_of(cols2extract), activity, subject)

# 3. Uses descriptive activity names to name the activities in the data set
aux_var <- factor(data$activity)
levels(aux_var) <- activity$label
data$activity <- aux_var

# 4. Appropriately labels the data set with descriptive variable names. 
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
tidy_data <- data %>%
    dplyr::group_by(subject, activity) %>%
    dplyr::summarise_all(mean)
