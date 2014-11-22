README for Getting and Cleaning Data Course Project
November 2014
============

The completed tidy data set is found in the file 'tidyoutput.txt'

The codebook for the tidy data set is found in the file 'tidycodebook.md'

The tidy data set was created using the script 'run_analysis.R'  

The script assumes that the data found in the zip file 'https://d396qusza40orc.cloudfront.net/
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' has been extracted into a folder titled 
'dataset' in the same working directory as the script.

The script reads in the following six files from the training and test datasets, and merges
them into a single dataset:
dataset/test/X_test.txt
dataset/train/X_train.txt
dataset/test/y_test.txt
dataset/train/y_train.txt
dataset/test/subject_test.txt
dataset/train/subject_train.txt

The column labels for the original dataset are found in 'dataset/features.txt'.  These are 
imported and used as the column labels for the tidy data set.

The subsetting and aggregation requires the 'reshape' library.  The final tidy data set contains the
average of each of the variables (see codebook for list) for each subject and activity combination.
(There are 30 subjects and six activities).

The final file is written to 'tidyoutput.txt' in the current working directory.
