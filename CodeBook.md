Code Book
==============================

Variables
------------------------------
* `features` - Data frame, listing all features which are read from "features.txt"
* `subject_train` - Data frame, training subject read from "train/subject_train.txt"
* `x_train` - Data frame, x coordinate of training subject read from "train/X_train.txt"
* `y_train` - Data frame, y coordinate of training subject read from "train/Y_train.txt"
* `train_merged` - Data frame, merged training data from the above 3 variables
* `subject_test` - Data frame, testing subject read from "train/test_train.txt"
* `x_test` - Data frame, x coordinate of testing subject read from "train/X_test.txt"
* `y_test` - Data frame, y coordinate of testing subject read from "train/Y_test.txt"
* `test_merged` - Data frame, merged testing data from the above 3 variables
* `all_merged` - Data frame, data merged from training and testing data
* `activity_labels` - Data frame, labels of activites read from "activity_labels.txt"
* `interim` - Data frame, data merged from variable "activity_labels" and "all_merged"
* `data` - Data frame, which is sorted from variable "interim"
* `processed_data` - Data frame, data processed with pattern matching
* `column_names` - Character list of columns of the final result
* `data_set` - Data frame, final result to be written as output

Data
------------------------------
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Transformations
------------------------------
1. Read training data from files "train/subject_train.txt", "train/X_train.txt", "train/y_train.txt" and merge into variable "train_merged".
2. Read testing data from files "test/subject_test.txt", "test/X_test.txt", "test/y_test.txt" and merge into variable "test_merged"
3. Merge the training and testing data into variable "all_merged". Set the names of the merged data with feature names read from "features.txt"
4. Read actvity_labels from file "activity_labels.txt" and use it to process the merged data as mentioned above
5. Set column names of the processed data
6. Do the data melting and casting. Write final result into the file "result.txt"
