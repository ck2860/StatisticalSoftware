/*Condy Kan*/

/*1. The following raw data give information about hotels in Kyoto, Japan. The hotel name is followed by the nightly rate for two pepple in yen and the distance from Kyoto Station 
in kilometers. 

The Grand West Arashiyama 32200 9.5
Kyoto Sharagam            48000 3.3
The Palace Side Hotel     10200 3.8
Rinn Fushimiinari         41000 2.9
Rinn Nijo Castle          18000 3.3
Suiran Kyoto              102000 11.0
*/

/*a. Please create a SAS data set and give the USD value of the nightly rate. Note: 1 Yen*0.0089= 0.0089 USD*/
data Week10q1; 
input Hotel_Name $35.
/Yen Distance;
cards;
The Grand West Arashiyama
32200 9.5
Kyoto Sharagam
48000 3.3
The Palace Side Hotel
10200 3.8
Rinn Fushimiinari
41000 2.9
Rinn Nijo Castle
18000 3.3
Suiran Kyoto              
102000 11.0
;
run; 

data test;
	set WORK.WEEK10Q1;
	USD = Yen*0.0089;
run;
/*b. Please convert Kilometers to Miles */
data test;
	set WORK.WEEK10Q1;
	USD = Yen*0.0089;
	Miles = Distance*0.621371;
run;

/* 2. The following dataset give information about EmployID, Name, Salary, Department DateofJoinDepartment
1 Rick 623.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
*/

/*a. Please USE if else statement to categorize salary. (salary less than 600 is low; between 600 to 700 is Medium; greater than 700 is high)*/
data Week10q2;
input EmployID Name $ Salary Department $ DateofJoinDepartment $ date7.;
cards;
1 Rick 623.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
run;

data test;
	set WORK.WEEK10Q2;
	if Salary < 600 then status='Low';
	else if 600<Salary<700 then status='Medium';
	else if Salary> 700 then status='High';
run;

/*b. Please print all the employee from IT department */
data test;
	set WORK.WEEK10Q2;
	where Department ='IT';
run;
/*c. Please use proc format to name 'IT' as 'Information Technology' and ops' as 'operations' */
proc format;
value $depfmt
'IT' ='Information Technology'
'OPS' ='Operations';
run;

data test;
	set WORK.WEEK10Q2;
	Department = put (Department, depfmt.);
run;

/* 3. Please use a do loop to calculate what your account balance will be after your next 6 pay cheques of $1,000 are deposited to your account. */
data myTable;
do i=1 to 6;
x=i*1000;
output;
end;
run;
