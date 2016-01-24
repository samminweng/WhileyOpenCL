#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases="Fibonacci Reverse MergeSort newTicTacToe MatrixMult";
	# Optimization
	opts = "naive naive_dealloc copy_reduced copy_reduced_dealloc";
	# Parameter
	parameters["Fibonacci"] = "100 1000 10000";
	parameters["Reverse"] = "1000 10000 100000 1000000 10000000 100000000";
	parameters["MergeSort"] = "1000 10000 100000 1000000";
	parameters["newTicTacToe"] = "1000 10000 100000 1000000";
	parameters["MatrixMult"] = "10 20 30 40 50";
	count[""]=0;
	# Leak
	leaks[""]=0;
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get test case
	testcase=arr[2];
	# Get optimization
	opt=arr[4];
	# Get parameter
	parameter = arr[5];
	count[testcase","parameter]++;
	key = testcase","opt","parameter;
	# Get definite loss.
	if(match($1, "definitely lost:")){
		# Get Parameter
		split($1, arr, ":");
		# Get Leak bytes
		split(arr[2], arr, " ");
		definiteloss = arr[1];
		gsub(/,/, "", definiteloss);
		leaks[key",definiteloss"] = definiteloss;
		#print definiteloss;
	}

	# Get indirectly loss
	if(match($1, "indirectly lost:")){
		# Get Parameter
		split($1, arr, ":");
		# Get Leak bytes
		split(arr[2], arr, " ");
		indirectloss = arr[1];
		gsub(/,/, "", indirectloss);
		leaks[key",indirectloss"] = indirectloss;
		#print indirectloss;
	}

	# Get indirectly loss
	if(match($1, "possibly lost:")){
		# Get Parameter
		split($1, arr, ":");
		# Get Leak bytes
		split(arr[2], arr, " ");
		possibleloss = arr[1];
		gsub(/,/, "", possibleloss);
		leaks[key",possibleloss"] = possibleloss;
		#print possibleloss;
	}


	# Get reachable loss
	if(match($1, "still reachable:")){
		# Get Parameter
		split($1, arr, ":");
		# Get Leak bytes
		split(arr[2], arr, " ");
		reachableloss = arr[1];
		gsub(/,/, "", reachableloss);
		leaks[key",reachableloss"] = reachableloss;
		#print reachableloss;
	}

}
END {	

	print "Memory Leak (bytes)";
	print "TestCase\tOptimization\tArraysize\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
	t_total=split(testcases, t_array, " ");
	for(t=1;t<=t_total;t++){
		testcase=t_array[t];
		# Get Optimization Type
		opts_total=split(opts, opt_array, " ");
		for(o=1;o<=opts_total;o++){
			opt=opt_array[o];
			s_total=split(parameters[testcase], s_array, " ");
			for(s=1;s<=s_total;s++){
				parameter = s_array[s];
				# Check if there is the memory leak result.
				if(count[testcase","parameter]>0){
					# Slow program
					key = testcase","opt","parameter;
					# FIll in zero values
					str = testcase"\t"opt"\t"parameter"\t"leaks[key",definiteloss"]+0"\t"leaks[key",indirectloss"]+0"\t"leaks[key",possibleloss"]+0"\t"leaks[key",reachableloss"]+0;
					print str;
				}
			}
		}
	}
	
	
}