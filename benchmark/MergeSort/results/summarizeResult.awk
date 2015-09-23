#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcase = "sort";
	# Call type
	calls["call_by_value"] = "call_by_value";
	calls["call_by_reference"] = "call_by_reference";
	# Program type
	programs["java"] = "java";
	programs["c"] = "c";
	# Optimization
	ops["slow"] = "slow";
	ops["fast"] = "fast";
	# Parameter
	arraysizes[""] = "";
	# Number of iteration
	count[""]=0;
	#execution time 
	exec_times[""]=0;		
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get call type
	call=arr[3];
	# Get program type
	program=arr[4];
	# Get optimization
	if(n==5){
		op = "slow";
	}else{
		op=arr[5];
	}	
	#Check that the record is the execution time
	if(match($1, "Parameter:")){
		# Get Parameter
		split($1, arr, ":");
		arraysize = arr[2];
		arraysizes[arraysize] = arraysize;
		# Get Execution time
		split($2, arr, ":");
		exec_time = arr[2];
		# Composite the key
		key = testcase","call","program","op","arraysize;
		#Count for the number of iteration
		iteration = count[key]++;
		# Add exec_times
		exec_times[key","iteration]= exec_time;		
		# Debug
		# print "exec_times["testcase","program","optimization","parameter","iteration"]=" exec_times[testcase","program","optimization","parameter","iteration];
	}
}
END {	
print "TestCase,CallType,ProgramType,CopyEliminate,ArraySize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	# Get Call Type
	for(call in calls){
		# Get program
		for(program in programs){
			# Get optimization
			for(op in ops){
				# Sort the arraysizes 
				total = asort(arraysizes);
				for(n=1;n<=total;n++){
					arraysize = arraysizes[n];
					key = testcase","call","program","op","arraysize;
					str = key;
					for(iteration=0;iteration<10;iteration++){
						exec_time = exec_times[key","iteration];
						if(exec_time != ""){
							#print exec_time;
							str = str "," exec_time;
						}
					}
					#Print aggregated results of the specific array size.
					print str;			
				}
			}
		}
	}	
}
