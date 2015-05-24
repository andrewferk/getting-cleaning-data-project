# Code Book

This code book describes the transformations in run_analysis.R and the variables and data created by the ouput (summarizedHarData.txt) of run_analysis.R.

The input data comes from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Transformations

### Subject IDs

1. The subject IDs are read from test/subject_test.txt and train/subject_train.txt.
2. The vector of IDs from both files are concatenated to create a single vector.

### Activities

1. The activity IDs are read from test/y_test.txt and train/y_train.txt.
2. The vector of IDs from both files are concatenated to create a sinlge vector.
3. The vector of IDs are converted to descriptive activity names found in activity_labels.txt.

### Measurement Data

1. All measurement data is read from test/X_test.txt and train/X_train.txt as a list of character vectors.
2. The measurement data from both files are concatenated to a singe list of character vectors.
3. The measurement data is converted to be numeric.
4. The measurement data is transformed into data table where each original line of measurement data is now a row in the table.
5. The columns in the table are renamed to match the descriptive labels in features.txt.
6. All columns not matching a mean or standard deviation measurement are removed from the table.

### Complete Table

1. The subject IDs, activities and measurement data are merged together into a single table.

### Summarized Table

1. The complete table is grouped by subject ID and activity.
2. For each group, the measurement data is averaged.

### Output

1. The summarized table is saved to summarizedHarData.txt in the working directory.

## Variables and Data

The dataset includes 88 columns. The first two columns (subjectId and activity) are the group by columns and columns 3 to 88 are the averaged value of the grouped by measurements.

1. subjectId - the ID of the subject (1 to 30)
2. activity - the descriptive activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X
47. fBodyAcc-std()-Y
48. fBodyAcc-std()-Z
49. fBodyAcc-meanFreq()-X
50. fBodyAcc-meanFreq()-Y
51. fBodyAcc-meanFreq()-Z
52. fBodyAccJerk-mean()-X
53. fBodyAccJerk-mean()-Y
54. fBodyAccJerk-mean()-Z
55. fBodyAccJerk-std()-X
56. fBodyAccJerk-std()-Y
57. fBodyAccJerk-std()-Z
58. fBodyAccJerk-meanFreq()-X
59. fBodyAccJerk-meanFreq()-Y
60. fBodyAccJerk-meanFreq()-Z
61. fBodyGyro-mean()-X
62. fBodyGyro-mean()-Y
63. fBodyGyro-mean()-Z
64. fBodyGyro-std()-X
65. fBodyGyro-std()-Y
66. fBodyGyro-std()-Z
67. fBodyGyro-meanFreq()-X
68. fBodyGyro-meanFreq()-Y
69. fBodyGyro-meanFreq()-Z
70. fBodyAccMag-mean()
71. fBodyAccMag-std()
72. fBodyAccMag-meanFreq()
73. fBodyBodyAccJerkMag-mean()
74. fBodyBodyAccJerkMag-std()
75. fBodyBodyAccJerkMag-meanFreq()
76. fBodyBodyGyroMag-mean()
77. fBodyBodyGyroMag-std()
78. fBodyBodyGyroMag-meanFreq()
79. fBodyBodyGyroJerkMag-mean()
80. fBodyBodyGyroJerkMag-std()
81. fBodyBodyGyroJerkMag-meanFreq()
82. angle(tBodyAccMean,gravity)
83. angle(tBodyAccJerkMean),gravityMean)
84. angle(tBodyGyroMean,gravityMean)
85. angle(tBodyGyroJerkMean,gravityMean)
86. angle(X,gravityMean)
87. angle(Y,gravityMean)
88. angle(Z,gravityMean)
