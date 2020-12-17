/*Condy Kan*/

/*1. Please import demographics.txt, firstvisit.txt, 3monthvisit.txt and 6month.txt into SAS
*/
data Demographics;
infile '/folders/myfolders/Demographics.txt' delimiter='09'x dsd;
input subject screen dov: mmddyy8. dob: mmddyy8. sex $ race ethnicity;
format dov mmddyy8.;
format dob mmddyy8.;
run;

data Firstvisit; 
infile '/folders/myfolders/Firstvisit.txt' delimiter='09'x;
input subject screen dov mmddyy8. sbp dbp pulse temp weight pain;
format dov date9.;
run;

data ThreeMonth; 
infile '/folders/myfolders/3monthvisit.txt' delimiter='09'x;
input subject screen dov mmddyy8. sbp dbp pulse temp weight pain;
format dov date9.;
run;

data SixMonth; 
infile '/folders/myfolders/6monthvisit.txt' delimiter='09'x;
input subject screen dov mmddyy8. sbp dbp pulse temp weight pain;
format dov date9.;
run;

/*2. Please create a new dataset name it as pspatient (Pass Screen Patient) based on firstvisit.txt(screen =1 means pass initial screen, screen=0 means fail initial screen)
*/
data pspatient;
	set firstvisit;
	if screen = 1 then status='Pass Initial Screen';
	else if screen=0 then status='Fail Initial Screen';
run;

/*3. Please merge demographics.txt with pspatient dataset, name it as pspatientdemo (Pass Screen PatientDemographic) This merged dataset only contains demographic information for the patients who passed the screen test.
*/
proc sql; 
create table pspatientdemo as 
select *
from pspatient as A inner join Demographics as B 
on A.subject = B.subject where A.screen = 1; 
quit;

/*4. Please create a Bar Chart for Sex and Ethnicity Distribution based on pspatientdemo dataset
*/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.PSPATIENTDEMO;
	hbar sex / group=ethnicity groupdisplay=cluster;
	xaxis grid;
run;

ods graphics / reset;

/*5. Please investigate patterns in pain level across males and females based on the pspatientdemo dataset.
*/
title "Patterns in Pain Level";
proc freq data=pspatientdemo;
tables sex * pain /nocol;
run;

/*6. Please print out the patients who had the same pain measurements during these 3 visits.
*/
proc sql; 
select A.subject, B.subject, C.subject, A.pain, b.pain, c.pain
from firstvisit as A, threemonth as B, sixmonth as C
where A.subject = B.subject AND A.subject = C.subject
AND A.pain=B.pain AND A.pain=C.pain;
quit;

/*7. Please create one table for first time visit Diastolic Blood Pressure (dpb) summary statistic*/
data MergedFirstTimeDemo;
merge firstvisit(in=a) Demographics(in=b);
by subject;
if a and b;
run;


proc format;
value blood_pressure 
low -< 120 = 'Acceptable (120 or below)' 120 - high = 'High';
run;
proc means data=MergedFirstTimeDemo n mean stddev median min max maxdec=1;
title "First Time Visit Diastolic Blood Pressure (dpb) summary statistic";
class sex sbp;
format sbp blood_pressure.;
var dbp pulse;
run;

/*8. Create one table for 3 month visit Diastolic Blood Pressure (dpb) summary statistic.*/
data MergedThreeMonthDemo;
merge ThreeMonth (in=a) Demographics(in=b);
by subject;
if a and b;
run;

proc format;
value blood_pressure 
low -< 120 = 'Acceptable (120 or below)' 120 - high = 'High';
run;
proc means data=MergedThreeMonthDemo n mean stddev median min max maxdec=1;
title "3 Month Visit Diastolic Blood Pressure (dpb) summary statistic";
class sex sbp;
format sbp blood_pressure.;
var dbp pulse;
run;

/*9. Create one table for 6 month visit Diastolic Blood Pressure (dpb) summary statistic.*/
data MergedSixMonthDemo;
merge SixMonth (in=a) Demographics(in=b);
by subject;
if a and b;
run;

proc format;
value blood_pressure 
low -< 120 = 'Acceptable (120 or below)' 120 - high = 'High';
run;
proc means data=MergedSixMonthDemo n mean stddev median min max maxdec=1;
title "6 Month Visit Diastolic Blood Pressure (dpb) summary statistic";
class sex sbp;
format sbp blood_pressure.;
var dbp pulse;
run;

/*10. Please plot a line chart to show the trend of the pain measurement.*/
proc sql; 
create table painlevel as 
select A.pain as firstVisitPain, b.pain as threemonthpain, c.pain as sixmonthpain
from firstvisit as A, threemonth as B, sixmonth as C
where A.subject = B.subject AND A.subject = C.subject;
quit; 

Proc Means Data=painlevel mean;
Var firstVisitPain threemonthpain sixmonthpain;
Output Out = outstat mean=first mean=month3 mean=month6;
Run;

data class;
input Visit $ PainLevel;
cards;
First 2.9473684
Threemonth 2.3157895
Sixmonth 2.2368421
;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=WORK.CLASS;
	vline Visit / response=PainLevel stat=mean;
	xaxis discreteorder=data;
	yaxis grid;
run;

ods graphics / reset;
