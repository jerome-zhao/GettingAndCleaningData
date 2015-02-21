library(reshape2)

features <- read.table("features.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
train_merged <- cbind(subject_train, x_train, y_train)
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
test_merged <- cbind(subject_test, x_test, y_test)
all_merged <- rbind(train_merged, test_merged)
names(all_merged) <- c('subject', as.character(features$V2), 'activityNumber')

activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c('activityNumber', 'activity')
interim <- merge(activity_labels, all_merged, all = TRUE)
data <- interim[order(interim$activityNumber, interim$subject),]
processed_data <- data[, c(2, 3, grep("-mean\\(\\)|-std\\(\\)", names(data)))]

column_names <- names(processed_data)[-(1:2)]
column_names <- gsub('-|\\(\\)', '', column_names)
column_names <- gsub('^t', 'Time', column_names)
column_names <- gsub('^f', 'Freq', column_names)
column_names <- gsub('Acc', 'Accl', column_names)
column_names <- gsub('Gyro', 'Gyr', column_names)
column_names <- gsub('Mag', 'Mag', column_names)
column_names <- gsub('mean', 'Mean', column_names)
column_names <- gsub('std', 'StdDev', column_names)
names(processed_data)[-(1:2)] <- column_names

data_set <- melt(processed_data, id = c('activity', 'subject'))
data_set <- dcast(data_set, activity + subject ~ variable, mean)
write.table(data_set, "result.txt", row.name=FALSE)