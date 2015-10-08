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
	# Optimization
	ops["slow"] = "slow";
	ops["fast"] = "fast";
	# Parameter
	arraysizes[""] = "";
	# Leak
	leaks[""]=0;
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get call type
	call=arr[2];
	# Get optimization
	op=arr[4];
	# Get array size
	arraysize = arr[5];
	arraysizes[arraysize]=arraysize;
	key = call","op","arraysize;
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
print "FunctionCallType\tProgramType\tArraysize\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
# Get Call Type
for(call in calls){
	for(op in ops){
	# Sort the arraysizes 
		total = asort(arraysizes);
		for(n=1;n<=total;n++){
			arraysize = arraysizes[n];
			# Slow program
			key = call","op","arraysize;
			str = call"\t"op"\t"arraysize"\t"leaks[key",definiteloss"]"\t"leaks[key",indirectloss"]"\t"leaks[key",possibleloss"]"\t"leaks[key",reachableloss"];
			print str;
		}
	}
}
# print "TestCase,CallType,ProgramType,CopyEliminate,ArraySize,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";

# 		# Get program
# 		for(program in programs){
# 			# Get optimization
# 			
# 				
# 				
# 					
# 					key = testcase","call","program","op","arraysize;
# 					
# 					for(iteration=0;iteration<10;iteration++){
# 						exec_time = exec_times[key","iteration];
# 						if(exec_time != ""){
# 							#print exec_time;
# 							str = str "," exec_time;
# 						}
# 					}
# 					#Print aggregated results of the specific array size.
# 								
# 				}
# 			}
# 		}
# 	}	
}
