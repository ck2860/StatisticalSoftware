/*Condy Kan*/

/*1. Please use medical center name to sort the dataset, within each medical center name sort by patient age. Use proc print to show the dataset.
*/
proc sort data=medical1;
by descending Medical_Center_Name Age;
run;
proc print Data=medical1;

/*2. Please use Flow option to print out all the comments, each line has at most 20 characters
*/
title "Question 2";
proc report data=medical1 nowd headline
split=' ' ls=74;
column ID Medical_Center_Name Age Weight HR Comments;
define ID / "Patient Number" width=3;
define Medical_Center_Name/ "Medical Center Name" width=11;
define Age / "Age" width = 2;
define HR / "Heart Rate" width=6;
define DX / "DX Code" width=4 right;
define Weight / width=6;
define Comments / width=30 flow;
run; 

/*3. Please use proc report to create a dataset shows the average age, broken down by clinic name
*/
proc chart data=medical1;
hbar Medical_Center_Name/discrete
sumvar=Age type=mean;
run;
