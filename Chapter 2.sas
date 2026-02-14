/* Example: p7 */

title1 'June Billing';
data work.junefee;
	set cert.admitjune;
	where age>39;
run;
proc print data=work.junefee;
run;

/* Example: p8 */
data work.admit2;
	set cert.admit;
	where age>39;
proc print data=work.admit2;
run;

/* Example: p10 */
proc freq data=sashelp.cars;
	table origin*DriveTrain;
run;