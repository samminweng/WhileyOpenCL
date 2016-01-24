#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases="Fibonacci Reverse MergeSort newTicTacToe MatrixMult";
	# Program
	programs="JAVACode CCode";
	# Optimizations
	opts["CCode"]="naive naive_dealloc copy_reduced copy_reduced_dealloc";
	opts["JAVACode"] = "naive";
	# Parameter
	parameters["Fibonacci"] = "10 100 1000 10000 100000 1000000";
	parameters["Reverse"] = "1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000";
	parameters["MergeSort"] = "1000 10000 100000 1000000 10000000 100000000 1000000000";
	parameters["newTicTacToe"] = "1000 10000 100000 1000000 100000000 1000000000 10000000000";
	parameters["MatrixMult"] = "10 100 1000 10000";
	count[""]=0;	
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get test case
	split(arr[1], t_array, "/");
	testcase=t_array[1];
	# Get program
	program=arr[2];
	if(match(program, "CCode")){
		# Get optimization
		op=arr[3];
	}else{
		op="naive";
	}

	# Get array size
	parameter = arr[4];
	key=testcase","program","op","parameter;
	#Check that the record is the execution time
	if(match($1, "Parameter:")){
		# Get Parameter
		split($1, arr, ":");
		parameter = arr[2];
		# Get Execution time
		split($2, arr, ":");
		exec_time = arr[2];
		#Count for the number of iteration
		iteration = count[key]++;
		# Add exec_times
		exec_times[key","iteration]= exec_time;	
		# Debug
		#print "exec_times["testcase","program","op","parameter","iteration"]=" exec_times[testcase","program","op","parameter","iteration];
	}
	
}
END {
print "TestCase,Program,Optimization,Parameter,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	t_total=split(testcases, t_array, " ");
	for(t=1;t<=t_total;t++){
		testcase=t_array[t];
		p_total=split(programs, p_array, " ");
		for(p=1;p<=p_total;p++){
			program=p_array[p];
			opts_total=split(opts[program], o_array, " ");
			for(o=1;o<=opts_total;o++){
				op=o_array[o];
				# Get the arraysize
				if(parameters[testcase]!=""){
					s_total=split(parameters[testcase], s_array, " ");
					for(s=1;s<=s_total;s++){
						parameter=s_array[s];
						key=testcase","program","op","parameter;
						str = testcase"\t"program"\t"op"\t"parameter;
						# Check if there is the memory leak result.
						if(count[key]>0){
							## Print out execution time in nano-seconds
				 			for(iteration=0;iteration<10;iteration++){
				 				str = str"\t"exec_times[key","iteration];
				 			}
				 		}else{
				 			## Print out TIMEOUT messages.
				 			for(iteration=0;iteration<10;iteration++){
				 				str = str"\tTIMEOUT";
				 			}
				 		}
				 		print str;
					}
				}
			}
		}
	}
}
