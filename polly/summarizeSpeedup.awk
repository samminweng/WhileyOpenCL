#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	#testcases="Fibonacci Reverse MergeSort newTicTacToe MatrixMult";
	testcases="Reverse MergeSort newTicTacToe MatrixMult";
	# Code Optimizations
	opts="naive naive_dealloc copy_reduced copy_reduced_dealloc";
	# Program
	program="CCode";
	# Polly optimiz
	polly_opts="gcc polly openmp vector"
	# Parameters
	parameters["Reverse"] = "1000 10000 100000 1000000 10000000 100000000";
	parameters["MergeSort"] = "1000 10000 100000 1000000";
	parameters["newTicTacToe"] = "1000 10000 100000 1000000";
	parameters["MatrixMult"] = "10 20 30 40 50";
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
	# Code optimization
	opt=arr[3];
	# Polly optimizaton
	polly_opt=arr[4];
	# Get array size
	parameter = arr[5];
	key=testcase","opt","polly_opt","parameter;
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
print "TestCase,Program,PollyOpt,Parameter,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	t_total=split(testcases, t_array, " ");
	for(t=1;t<=t_total;t++){
		testcase=t_array[t];
		opts_total=split(opts, o_array, " ");
		for(o=1;o<=opts_total;o++){
			opt=o_array[o];
			py_total=split(polly_opts, py_array, " ");
			for(py=1;py<=py_total;py++){
				polly_opt=py_array[py];
				# Get the arraysize
				if(parameters[testcase]!=""){
					s_total=split(parameters[testcase], s_array, " ");
					for(s=1;s<=s_total;s++){
						parameter=s_array[s];
						key=testcase","opt","polly_opt","parameter;
						str = testcase"\t"opt" C code\t"polly_opt"\t"parameter;
						# Check if there is the memory leak result.
						if(count[key]>0){
							## Print out execution time in nano-seconds
				 			for(iteration=0;iteration<10;iteration++){
				 				str = str"\t"exec_times[key","iteration];
				 			}
				 		}
				 		print str;
					}
				}
			}
		}
	}
}
