/*Condy Kan*/

/*1. Using "Cars" data in the library SASHELP, get the entire dataset into your WORK folder*/
data q1;
	set sashelp.cars;
run;

/*2. Please bring these data into SAS (gender, age, height, weight)
M 50 68 15 
F 23 60 101 
M 65 72 220
F 35 65 133 
M 15 71 166
*/
data q2; 
input gender $ age height weight;
cards;
M 50 68 15
F 23 60 101
M 65 72 220
F 35 65 133
M 15 71 166
;
run;

/*3. Download mypractice.txt from mycourses and bring it into SAS */
data q3;
infile '/folders/myfolders/mypractice.txt';
input gender $ age height weight;
run;

/*4. Bring the following data into SAS 
"M",50,68,155 
"F",23,60,101 
"M",65,72,220
"F",35,65,133 
"M",15,71,166 
*/

data q4; 
infile cards delimiter ="" dsd;
input gender $ age height weight;
cards;
"M" 50 68 15
"F" 23 60 101
"M" 65 72 220
"F" 35 65 133
"M" 15 71 166
;
run;

/*5. Bring the following data into SAS (university name, location and number of programs)
Rochester Institute of Technology 
Rochester 
14534  103 
University of Rochester 
Rochester 
14528  102 
*/
data q5; 
input university_name $1-34 location $34-43 zipcode program;
cards;
Rochester Institute of Technology Rochester 14534 103
University of Rochester Rochester 14528 102
;
run;

/* 6. Bring the following data into SAS
Pittsford 14534 29265 Henritetta 14528 43557 */
data q6; 
input location $10. zipcode population @@;
cards;
Pittsford 14534 29265 Henritetta 14528 43557
;
run;

