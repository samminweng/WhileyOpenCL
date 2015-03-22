#!/bin/awk -f
BEGIN {
	FS="\t";
	#Initialize the arrays
	#Store the array size and the value is the number of iterations.
	arraysizes[""]=0;
	#execution time 
	exec_times[""]=0;	
}
{
	#Get arraysize
	split($1, a, ":");
	arraysize=a[2];
	#Get iteration
	split($2, a, ":");
	iteration=a[2];
	#Get time
	split($3, a, ":");
	exec_time=a[2];
	#Increment the number of iteration
	arraysizes[arraysize]++;
 	exec_times[arraysize" "iteration]= exec_time;
	
}
END {
	#Print out the table header
	print "Arraysize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average"	
	#Sort the arraysizes
	numberofArraysizes=asorti(arraysizes, sortedArraysizes);	
	#Iterate the arraysizes array to get each arraysize
	for(n=1;n<numberofArraysizes;n++){
		arraysize=sortedArraysizes[n];	
		if(arraysize != ""){
			str = arraysize;
			for(iteration=0;iteration<=arraysizes[arraysize];iteration++){
				str = str "," exec_times[arraysize" "iteration];
			}
			print str;
		}
	}

}
