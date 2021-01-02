library(dplyr)

# read dataset
## train
train_path <- "./UCI HAR Dataset/train/"
X_train <- read.table(paste(train_path, 'X_train.txt', sep = ""))
y_train <- read.table(paste(train_path, 'y_train.txt', sep = ""))
## test
test_path <- "./UCI HAR Dataset/test/"
X_test <- read.table(paste(test_path, 'X_test.txt', sep = ""))
y_test <- read.table(paste(test_path, 'y_test.txt', sep = ""))
## features labels
features <- read.table('./UCI HAR Dataset/features.txt', col.names = c('index', 'label'))

# 1. Merges the training and the test sets to create one data set.
X <- rbind(X_train, X_test)
# add features labels names
names(X) <- features$label

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
X2 <- X[, grep(pattern="[Mm]ean|[Ss]td", x=colnames(X))]

# 3. Uses descriptive activity names to name the activities in the data set
