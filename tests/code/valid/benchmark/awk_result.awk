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
	iterations[""]=0;
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
	arraysizes[arraysize]=arraysize;
	iterations[program" "datatype" "arraysize]++;
	iteration = iterations[program" "datatype" "arraysize];
	#Count for the number of iteration
	exec_times[program" "datatype" "arraysize" "iteration]= exec_time;
	#Debug
	#print "program=" program "datatype=" datatype "arraysize=" arraysize "iteration=" iteration;
	#print "exec_time=" exec_times[program" "datatype" "arraysize" "iteration];
}
END {	
	#Print out the table header
	print "ProgramType,DataType,Arraysize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";	
	for(program in programs){
		if(program != ""){
			for(datatype in datatypes){
				if(datatype != ""){					
					#Sort the arraysize
					num = asort(arraysizes, indices);
					#Iterate the arraysizes array to get each arraysize
					for(i=1;i<=num;i++){
						arraysize = arraysizes[indices[i]];
						if(arraysize != ""){
							str = program","datatype","arraysize;
							for(iteration=1;iteration<=10;iteration++){
								exec_time = exec_times[program" "datatype" "arraysize" "iteration];
								if(exec_time != ""){
									#print exec_time;
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
