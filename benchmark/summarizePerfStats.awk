#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases="Fibonacci Reverse MergeSort newTicTacToe MatrixMult";
	# Program
	programs="CCode";
	# Optimizations
	opts["CCode"]="naive naive_dealloc copy_reduced copy_reduced_dealloc";
	# Parameter
	parameters["Fibonacci"] = "10 100 1000 10000 100000 1000000";
	parameters["Reverse"] = "1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000";
	parameters["MergeSort"] = "1000 10000 100000 1000000 10000000 100000000 1000000000";
	parameters["newTicTacToe"] = "1000 10000 100000 1000000 100000000 1000000000 10000000000";
	parameters["MatrixMult"] = "10 100 1000 10000";
	count[""]=0;
	ipcs[""]=0;
	cups[""]=0;
	css[""]=0;
	cpums[""]=0;
	branchmisses[""]=0;
	killset[""]="";
}
{
	filename=FILENAME;
	n=split(filename, arr, ".");
	# Get test case
	split(arr[1], t_array, "/");
	testcase=t_array[1];
	# Get program
	program=arr[2];
	# Get optimization
	op=arr[3];
	# Get parameter
	parameter = arr[4];
	key=testcase","program","op","parameter;
	if(match($1, /Killed/)){
		## add this test case to kill set
		killset[key]=key;
	}

	if(killset[key] != key){
		#Check that the record is IPC
		if(match($1, /insns per cycle/)){
			# Get IPC
			split($1, arr, "#");
			split(arr[2], arr, "insns per cycle");
			sub(/ /, "", arr[1]);
			ipc=arr[1];
			# Add ipc to ipcs
			ipcs[key]= ipc;	
			count[key",ipc"]++;
			# # Debug
			#print "ipcs["testcase","program","op","parameter"]=" ipcs[testcase","program","op","parameter];
		}
		# CPU utilized 
		if(match($1, /CPUs utilized/)){
			# Get IPC
			split($1, arr, "#");
			split(arr[2], arr, "CPUs utilized ");
			sub(/ /, "", arr[1]);
			cpu=arr[1];
			# Add cpu utilization to cpus
			cpus[key]= cpu;	
			count[key",cpu"]++;
		}

		# context-switches
		if(match($1, /context-switches/)){
			# Get IPC
			split($1, arr, "#");
			cs=arr[2];
			# Add cpu utilization to cpus
			css[key]=cs;	
			count[key",cs"]++;
		}

		# cpu-migrations
		if(match($1, /cpu-migrations/)){
			# Get IPC
			split($1, arr, "#");
			cpum=arr[2];
			# Add cpu utilization to cpus
			cpums[key]=cpum;	
			count[key",cpum"]++;
		}

		# branch-misses
		if(match($1, /branch-misses/)){
			# Get IPC
			split($1, arr, "#");
			branchmiss=arr[2];
			# Add cpu utilization to cpus
			branchmisses[key]=branchmiss;	
			count[key",branch-miss"]++;
		}
	}
	
}
END {
print "TestCase,Program,Optimization,Parameter,IPC(Instruction per cycle),CPU Utilized,Context-Switch,CPU-Migrations,Branch-Misses";
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
						# Check if there is the result.
						if(count[key",ipc"]>0){
							## Print out the value of ipc (instruction per cycle) 
				 			str = str"\t"ipcs[key];
				 		}else{
				 			## Print out message
				 			str = str"\tOutOfMemory";
				 		}
				 		# Check if there is the result.
						if(count[key",cpu"]>0){
							## Print out the value of ipc (instruction per cycle) 
				 			str = str"\t"cpus[key];
				 		}else{
				 			## Print out message
				 			str = str"\tOutOfMemory";
				 		}
				 		# Check if there is the result.
						if(count[key",cs"]>0){
							## Print out the value of ipc (instruction per cycle) 
				 			str = str"\t"css[key];
				 		}else{
				 			## Print out message
				 			str = str"\tOutOfMemory";
				 		}
				 		# Check if there is the result.
						if(count[key",cpum"]>0){
							## Print out the value of ipc (instruction per cycle) 
				 			str = str"\t"cpums[key];
				 		}else{
				 			## Print out message
				 			str = str"\tOutOfMemory";
				 		}
				 		# Check if there is the result.
						if(count[key",branch-miss"]>0){
							## Print out the value of branches-misses 
				 			str = str"\t"branchmisses[key];
				 		}else{
				 			## Print out message
				 			str = str"\tOutOfMemory";
				 		}

				 		print str;
					}
				}
			}
		}
	}
}
