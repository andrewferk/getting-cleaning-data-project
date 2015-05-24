library(data.table)
library(dplyr)
library(stringr)

##
# Get the vector of subject ids
##
getSubjectIds <- function() {
  testSubjectIds <- readLines("./UCI HAR Dataset/test/subject_test.txt")
  trainSubjectIds <- readLines("./UCI HAR Dataset/train/subject_train.txt")
  c(testSubjectIds, trainSubjectIds)
}


##
# Get the vector of activities using descriptive activity names
##
getActivities <- function() {
  testActivities <- readLines("./UCI HAR Dataset/test/y_test.txt")
  trainActivities <- readLines("./UCI HAR Dataset/train/y_train.txt")
  activityLabels <- trimLeadingNumbers(
    readLines("./UCI HAR Dataset/activity_labels.txt"))
  
  # Convert the activities to descriptive names
  factor(c(testActivities, trainActivities), 1:length(activityLabels), activityLabels)
}


##
# Get a table of the mean and standard deviation measurements with descriptive labels
##
getData <- function() {
  dataVectors <- getRawData()
  features <- trimLeadingNumbers(
    readLines("./UCI HAR Dataset/features.txt"))
  
  # Convert the measurements to numeric
  dataAsNumeric <- as.numeric(unlist(dataVectors))
  
  # Convert the measurements in a table
  harData <- data.table(matrix(dataAsNumeric,
                               nrow = length(dataVectors),
                               ncol = length(dataVectors[[1]]),
                               byrow = TRUE))
  
  # Set descriptive labels
  setnames(harData, features)
  
  # Determine what columns are not mean or standard deviation
  grepMeanOrStd <- grep("(mean|std)", names(harData), ignore.case = TRUE)
  notMeanOrStd <- which(!(seq(names(harData)) %in% grepMeanOrStd))
  
  # Remove non mean or standard deviation columns from the table
  set(harData, j = notMeanOrStd, value = NULL)
}


##
# Get the raw measurement data
##
getRawData <- function() {
  testData <- readLines("./UCI HAR Dataset/test/X_test.txt")
  trainData <- readLines("./UCI HAR Dataset/train/X_train.txt")
  str_split(str_trim(c(testData, trainData)), "\\s+")
}


##
# Trim strings with leading numbers.
# e.g. trimLeadingNumbers("01 test") -> "test"
##
trimLeadingNumbers <- function(charVector) {
  str_replace(charVector, "^[0-9]+\\s", "")
}


##
# Create a table with the subject ids, descriptive activities,
# and measurement data with descriptive labels.
##
harData <- cbind(subjectId = getSubjectIds(),
                 activity = getActivities(),
                 getData())


##
# Group the HAR data table by subject id and activity,
# and summarize all other measurements by average.
##
summarizedHarData <- summarise_each(group_by(harData, subjectId, activity), funs(mean))


##
# Write the summarized HAR data to a text file.
##
write.table(summarizedHarData, "summarizedHarData.txt", row.names = FALSE)