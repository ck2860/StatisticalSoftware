/*Condy Kan*/

/*1. Please sort the following data based on the requirments below

(studyid name $ sex $ age weight height)

1) sort by name, sex, age descending  
2) only select stduents with weight more than 130

Carol f 22 120 64
Julie f 55 125 63
Joe m 34 130 68
Kelsey f 43 130  67  
Ann f 29 . 65
Tracee f 21 110 .
Bob m 32 155 71  
Ed m 40 120 69
Karl m 35 160 68
Gayla f 40 130 68
John m 17 175 73

*/
data Q1;
input name $ sex $ age weight height;
cards;
Carol f 22 120 64
Julie f 55 125 63
Joe m 34 130 68
Kelsey f 43 130  67  
Ann f 29 . 65
Tracee f 21 110 .
Bob m 32 155 71  
Ed m 40 120 69
Karl m 35 160 68
Gayla f 40 130 68
John m 17 175 73
;
run;
proc sort data=Q1;
by descending name sex age;
where weight > 130;
run;
/*2. Please use inner, full, left, right, far left join, far right join to reorgaized the dataset below. 

Dataset1	
ID NAME SALARY	
1 Rick 623.3		 
2 Dan 515.2 		
3 Mike 611.5 		
4 Ryan 729.1 
5 Gary 843.25 
6 Tusar 578.6 
7 Pranab 632.8 
8 Rasmi 722.5 

Dataset2
ID DEPT
1 IT 
2 OPS
3 IT 
4 HR 
6 IT 
7 OPS

*/
data Dataset1;
input id name $ salary;
cards;
1 Rick 623.3		 
2 Dan 515.2 		
3 Mike 611.5 		
4 Ryan 729.1 
5 Gary 843.25 
6 Tusar 578.6 
7 Pranab 632.8 
8 Rasmi 722.5 
;
run;

data Dataset2;
input id dept $;
cards;
1 IT 
2 OPS
3 IT 
4 HR 
6 IT 
7 OPS
;
run;

data innerjoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if a and b;
run;

data fulljoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if a or b;
run;

data leftjoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if a;
run;

data rightjoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if b;
run;

data farleftjoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if a and not b;
run;


data farrighttjoin;
merge Dataset1(in=a) Dataset2(in=b);
by id;
if b and not a;
run;
/*3. Please print Acura Sedan cylinders=4 from sashelp.cars.Please use Proc sql
*/
proc sql;
create table class as
select * from sashelp.cars
where make= 'Acura' AND TYPE = 'Sedan' AND cylinders=4;
quit;

