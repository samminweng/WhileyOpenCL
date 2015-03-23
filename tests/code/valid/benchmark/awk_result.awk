#!/bin/awk -f
BEGIN {
	#File name
	filename="";
	FS="\t";
	#Initialize the arrays
	#Program types
	programs[""]="";
	#data types
	datatypes[""]="";
	#Store the array size and the value is the number of iterations.
	arraysizes[""]=0;
	#execution time 
	exec_times[""]=0;
		
}
{
	filename=FILENAME;
	#Get program type
	split(filename, a, ".");
	program=a[2];
	programs[program]=program;
	datatype=a[3];
	datatypes[datatype]=datatype;
	#Get arraysize
	split($1, a, ":");
	arraysize=a[2];
	#Get time
	split($2, a, ":");
	exec_time=a[2];
	#Increment the number of iteration
	arraysizes[arraysize]++;
	iteration = arraysizes[arrayize];
 	exec_times[program" "datatype" "arraysize" "iteration]= exec_time;
}
END {	
	#Print out the table header
	print "ProgramType,DataType,Arraysize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";	
	for(program in programs){
		if(program != ""){
			for(datatype in datatypes){
				if(datatype != ""){					
					#Sort the arraysizes
					numberofArraysizes=asorti(arraysizes, sortedArraysizes);	
					#Iterate the arraysizes array to get each arraysize
					for(n=1;n<numberofArraysizes;n++){
						arraysize=sortedArraysizes[n];
						if(arraysize != ""){
							str = program","datatype","arraysize;
							for(iteration=0;iteration<arraysizes[arraysize];iteration++){
								exec_time = exec_times[program" "datatype" "arraysize" "iteration];
								if(exec_time != ""){
									str = str "," exec_time;
								}
							}
							print str;
						}
					}	
				}
			}
		}
	}
}
