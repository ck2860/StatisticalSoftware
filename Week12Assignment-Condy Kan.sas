/*Condy Kan*/

/*1. Using proc means to calculate the max, min, and average age by medical center name.
*/
data week13q1; 
input ID 1-3 MedicalCenterName $15.
/Age Weight HR DX
/Comments $50.;
cards;
001 Mayo Clinic 
45 120 78 7
Patient has had a persistent cough for 3 weeks
003 HMC         
61 166 58 8 
Patient placed on beta-blockers on 7/1/2006
002 Mayo Clinic 
43 210 68 9 
Patient has been on antibiotics for 10 days
004 HMC         
55 288 88 9 
Patient advised to lose some weight
007 Mayo Clinic 
74 180 54 7 
This patient is always under high stress
050 HMC         
90 199 60 123 
Refer this patient to mental health for evaluation
;
run; 

title "PROC Means";
proc means data=week13q1 mean min max;
class age;
run;

/*2. Based on the results from question 1, use ODS statement to print out the HMC results.
*/
data week13q2; 
input ID 1-3 MedicalCenterName $15.
/Age Weight HR DX 
/Comments $50.;
cards;
003 HMC         
61 166 58 8 
Patient placed on beta-blockers on 7/1/2006
004 HMC         
55 288 88 9 
Patient advised to lose some weight
050 HMC         
90 199 60 123 
Refer this patient to mental health for evaluation
;
Run;

ods trace on;
proc means data= week13q2;
var age;
run;
ods trace off;
