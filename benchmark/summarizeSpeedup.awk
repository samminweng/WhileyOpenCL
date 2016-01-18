#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases["Reverse"] = "Reverse";
	testcases["MergeSort"] = "MergeSort";
	testcases["TicTacToe"] = "TicTacToe";
	testcases["newTicTacToe"] = "newTicTacToe";
	testcases["MatrixMult"] = "MatrixMult";
	# Program
	programs["CCode"] = "CCode";
	programs["JAVACode"] = "JAVACode";
	# Optimization
	ops["naive"] = "naive";
	ops["naive_dealloc"] = "naive_dealloc";
	ops["copy_reduced"] = "copy_reduced";
	ops["copy_reduced_dealloc"] = "copy_reduced_dealloc";
	# Parameter
	arraysizes[""] = "";
	count[""]=0;	
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get test case
	split(arr[1], t, "/");
	testcase=t[1];
	# Get program
	program=arr[2];
	if(match(program, "CCode")){
		# Get optimization
		op=arr[3];
	}else{
		op="naive";
	}

	# Get array size
	arraysize = arr[4];
	arraysizes[arraysize]=arraysize;
	key=testcase","program","op","arraysize;
	#Check that the record is the execution time
	if(match($1, "Parameter:")){
		# Get Parameter
		split($1, arr, ":");
		arraysize = arr[2];
		# Get Execution time
		split($2, arr, ":");
		exec_time = arr[2];
		#Count for the number of iteration
		iteration = count[key]++;
		# Add exec_times
		exec_times[key","iteration]= exec_time;	
		# Debug
		#print "exec_times["testcase","program","op","arraysize","iteration"]=" exec_times[testcase","program","op","arraysize","iteration];
	}
	
}
END {
print "TestCase,Program,Optimization,ArraySize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	for(testcase in testcases){
		for(program in programs){
			for(op in ops){
				# Sort the arraysizes 
				total = asort(arraysizes);
				for(n=1;n<=total;n++){
					arraysize = arraysizes[n];
					key=testcase","program","op","arraysize;
					# Check if there is the memory leak result.
					if(count[key]>0){
						str = testcase"\t"program"\t"op"\t"arraysize;
						for(iteration=0;iteration<10;iteration++){
							str = str"\t"exec_times[key","iteration];
						}
						print str;
					}
				}
			}
		}
	}
}
