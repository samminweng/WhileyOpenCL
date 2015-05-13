#!/usr/bin/awk -f
BEGIN {
	#File name
	filename="";
	FS="\t";
	#Initialize the arrays
	testcases[""]="";
	#Program types
	programs[""]="";
	#Method type
	methods[""]="";
	#Store the array size and the value is the number of iterations.
	arraysizes[""]=0;
	iterations[""]=0;
	#execution time 
	exec_times[""]=0;		
}
{
	filename=FILENAME;
	#Get program type
	n=split(filename, a, ".");
	testcase=a[2];
	testcases[testcase]=testcase;
	program=a[3];
	programs[program]=program;
	if(n == 6){
		method=a[4];	
	}else{
		method="slow";
	}
	methods[method]=method;
	#Get arraysize
	split($1, b, ":");
	arraysize=b[2];
	#Get time
	split($2, c, ":");
	exec_time=c[2];
	#Increment the number of iteration
	arraysizes[arraysize]=arraysize;
	iterations[testcase" "program" "method" "arraysize]++;
	iteration = iterations[testcase" "program" "method" "arraysize];
	#Count for the number of iteration
	exec_times[testcase" "program" "method" "arraysize" "iteration]= exec_time/1000000000;
	#Debug
	#print "program=" program "datatype=" datatype "arraysize=" arraysize "iteration=" iteration;
	#print "exec_time=" exec_times[program" "datatype" "arraysize" "iteration];
}
END {	
	#Print out the table header
	print "TestCase,Program,Method,ArraySize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";	
	for(testcase in testcases){
		if(testcase != ""){ 
			for(program in programs){
				if(program != ""){
					for(method in methods){
						if(method != ""){
							#Iterate the arraysizes array to get each arraysize
							for(arraysize in arraysizes){
					    			#arraysize = arraysizes[indices[i]];
					    			if(arraysize != ""){
									str = testcase","program","method","arraysize;
									for(iteration=1;iteration<=10;iteration++){
										exec_time = exec_times[testcase" "program" "method" "arraysize" "iteration];
										if(exec_time != ""){
											#print exec_time;
											str = str "," exec_time;
										}										
									}
									#Print out the aggregated results for that program running on the specific array size.
									print str;
					    			}	
							}
						}
					}
				}
			}
		}
	}
}
