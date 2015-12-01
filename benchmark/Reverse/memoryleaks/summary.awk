#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases["Reverse"] = "Reverse";
	# Optimization
	ops["naive"] = "naive";
	#ops["naive_noleaks"] = "naive_noleaks";
	ops["copy_reduced"] = "copy_reduced";
	#ops["copy_reduced_noleaks"] = "copy_reduced_noleaks";
	# Parameter
	arraysizes[""] = "";
	# Leak
	leaks[""]=0;
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get test case
	testcase=arr[2];
	# Get optimization
	op=arr[4];
	# Get array size
	arraysize = arr[5];
	arraysizes[arraysize]=arraysize;
	key = testcase","op","arraysize;
	# Get definite loss.
	if(match($1, "definitely lost:")){
		# Get Parameter
		split($1, arr, ":");
		# Get Leak bytes
		split(arr[2], arr, " ");
		definiteloss = arr[1];
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
		leaks[key",reachableloss"] = reachableloss;
		#print reachableloss;
	}

}
END {	

	print "Memory Leak (bytes)";
	print "TestCase\tOptimization\tArraysize\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
	for (testcase in testcases){
		
		# Get Optimization Type
		for(op in ops){
			# Sort the arraysizes 
			total = asort(arraysizes);
			for(n=1;n<=total;n++){
				arraysize = arraysizes[n];
				# Slow program
				key = testcase","op","arraysize;
				str = testcase"\t"op"\t"arraysize"\t"leaks[key",definiteloss"]"\t"leaks[key",indirectloss"]"\t"leaks[key",possibleloss"]"\t"leaks[key",reachableloss"];
				#print str;
			}
		}
	}
	
	
}