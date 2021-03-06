## Getting and Cleaning Data - Course Project

![archived](https://img.shields.io/badge/lifecycle-archived-red.svg)

![github repo size](https://img.shields.io/github/repo-size/daczarne/GCD_CourseProject)
![github code size](https://img.shields.io/github/languages/code-size/daczarne/GCD_CourseProject)

![github languages](https://img.shields.io/github/languages/count/daczarne/GCD_CourseProject)
![top language](https://img.shields.io/github/languages/top/daczarne/GCD_CourseProject)

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

* Downloads the dataset if it does not already exist in the working directory
* Loads the activity and features information
* Loads the training and test datasets, keeping only those columns which contain mean or standard deviation information
* Loads the activity and subject data for each dataset, and merges those columns with the dataset
* Merges the two datasets
* Converts the activity and subject columns into factors
* Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair
* The end result is shown in the file Means_data.csv
