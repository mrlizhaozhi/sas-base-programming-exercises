options validvarname=v7;

/* Example: p34 */
filename exercise '~/cert/exercise.txt';
proc import datafile=exercise dbms=dlm out=exstress replace;
	delimiter='09'x;
	getnames=yes;
run;
proc print data=exstress;
run;

/* Example: p37 */
filename boots '~/cert/boots.xlsx';
proc import datafile=boots dbms=xlsx out=exboots replace;
	sheet=boot;
	getnames=yes;
run;
proc print data=exboots;
run;

/* Example: p38 */
filename dimfile '~/cert/delimiter.txt';
proc import datafile=dimfile dbms=dlm out=exdelimiter replace;
	delimiter='&'; 
	getnames=yes;
run;
proc print data=exdelimiter;
run;

/* Example: p39 */
filename state1 '~/cert/state_data.txt';
proc import datafile=state1 dbms=dlm out=exstate1 replace;
	delimiter=' ';
	getnames=yes;
run;
proc print data=exstate1;
run;

/* Example: p40 */
filename newhires '~/cert/new_hires.csv';
proc import datafile=newhires dbms=csv out=exnewhires replace;
	getnames=no;
run;
proc print data=exnewhires;
run;

/* Example: p41 */
options obs=max;
filename class '~/cert/class.txt';
proc import datafile=class dbms=tab out=exclass replace;
	delimiter='09'x;
	getnames=yes;
run;
proc print data=exclass;
run;

/* Example: p45 */
filename boot '~/cert/boot.csv';
proc import datafile=boot dbms=csv out=exboot replace;
	getnames=no;
run;
data boot;
	set work.exboot;
	where var1 ='South America' or var1='Canada';
run;

/* Example: p46 */
data admit50;
	set cert.admit;
	where sex = 'M' and age > 50;
run;
proc print data=admit50;
	title 'Male older than 50';
run;

/* Example: p47 */
data cert.drug1h(drop=placebo);
	set cert.cltrials(drop=triglyc uric);
	if placebo='YES';
run;
proc print data=cert.drug1h;
run;

/* Example: p52 */
filename stock '~/cert/stock.xlsx';
proc import datafile=stock dbms=xlsx out=exstock replace;
run;
data bstock;
	set exstock.'boots stock'n;
run;