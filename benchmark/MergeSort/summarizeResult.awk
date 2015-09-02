#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcase = "sort";
	# Program type
	programs["java"] = "java";
	programs["c"] = "c";
	program = "";
	# Optimization
	ops["slow"] = "slow";
	ops["fast"] = "fast";
	optimization = "";
	# Parameter
	params[""] = "";
	parameter=0;
	# Number of iteration
	count[""]=0;
	#execution time 
	exec_times[""]=0;		
}
{
	filename=FILENAME;
	#Get program type
	if( index(filename, "java") > 0){
		program = "java";
	}else{
		program = "c";
	}
	n=split(filename, arr, ".");
	optimization=arr[3];
	#Check that the record is the execution time
	if(match($1, "Parameter:")){
		#Get Parameter
		split($1, p, ":");
		parameter = p[2];
		params[parameter] = parameter;
		#Get Execution time
		split($2, e, ":");
		exec_time = e[2];
		#Count for the number of iteration
		iteration = count[testcase","program","optimization","parameter]++;
		# Add exec_times
		exec_times[testcase","program","optimization","parameter","iteration]= exec_time;		
		# Debug
		# print "exec_times["testcase","program","optimization","parameter","iteration"]=" exec_times[testcase","program","optimization","parameter","iteration];
	}
}
END {	
	print "TestCase,Program,Optimization,ArraySize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	# Get program
	for(program in programs){
		# Get optimization
		for(optimization in ops){
			# Get and sort parameters
			num_of_ops = asort(params);
			for(n=1;n<=num_of_ops;n++){
				parameter = params[n];
				str = testcase","program","optimization","parameter;
				for(iteration=0;iteration<10;iteration++){
					exec_time = exec_times[testcase","program","optimization","parameter","iteration];
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
