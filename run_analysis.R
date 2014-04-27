################################################################################
## Read the features and activity_labels from features.txt
features <- read.table("./UCI HAR Dataset/features.txt", 
                        stringsAsFactors = FALSE, 
                       col.names = c("item", "feature_label"))
################################################################################
## Remove the - ,  ( and ) of feature_label
features$feature_label <- gsub(pattern = "-", replacement = "", 
                               x = features$feature_label, fixed = TRUE)
features$feature_label <- gsub(pattern = "(", replacement = "", 
                               x = features$feature_label, fixed = TRUE)
features$feature_label <- gsub(pattern = ")", replacement = "", 
                               x = features$feature_label, fixed = TRUE)
features$feature_label <- gsub(pattern = ",", replacement = "", 
                               x = features$feature_label, fixed = TRUE)

activity_labels_data <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE,
                              col.names = c("activity", "activity_labels"))

################################################################################
## Read train and test subject and combine
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            header = FALSE, sep = "", col.names = "subject")

subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           header = FALSE, sep = "", col.names = "subject")
subject <- rbind(subject_train_data, subject_test_data)

################################################################################
## Read X_train, X_test, Y_train and Y_test data sets. 
X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                      sep = "", col.names = features$feature_label)
X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, 
                     sep = "", col.names = features$feature_label)
Y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                      sep = " ", quote = "", 
                      col.names = "activity")
Y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, 
                     sep = " ", quote = "", 
                     col.names = "activity")

################################################################################
## Combine X, subject and Y, then combine train and test to the full_data
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)

full_data <- cbind(X[, grep("mean|std", colnames(X))], 
                  Y, subject)

################################################################################
## mean for each activity and each subject and create the new tidy data set
library(plyr)
final_data <- ddply(full_data, .(activity, subject), colwise(mean))
final_data2 <- merge(activity_labels, final_data, by.x = "activity", 
                    by.y = "activity", all = TRUE)

## Create the tidy data set
write.table(final_data2[, -1], file ="finaldata.txt")
