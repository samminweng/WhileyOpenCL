#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases="Reverse newTicTacToe BubbleSort MergeSort MatrixMult SobelEdge";
	
	## Program Type
	programs["Reverse"]="original";
	programs["newTicTacToe"]="original";
	programs["BubbleSort"]="original";
	programs["MergeSort"]="original";
	programs["MatrixMult"]="original";
	# programs["MatrixMult"]="original transpose 2DArray";
	# programs["Fibonacci"]="original";
	# programs["GCD"]="original cached";
	# programs["CoinGame"]="original single array";	
	programs["SobelEdge"]="original";
	# ## Recursive function call
	# programs["NQueens"]="original integer";
	# ### Pattern transformation
	# programs["LZ77"]="original";

	# Code Generation
	codegens = "naive naive_dealloc nocopy nocopy_dealloc";

	# Pattern matching 
	patterns = "disabled enabled";
	# Compiler
	compilers = "gcc";
	#compilers = "gcc clang polly openmp";
	
	# Parameter
	parameters["Reverse"]="100000 1000000 10000000";
	parameters["newTicTacToe"]="1000 10000 100000";
	parameters["MergeSort"]="1000 10000 100000";
	parameters["BubbleSort"]="1000 10000 100000";
	parameters["MatrixMult"]="1000 2000 3000";
	# parameters["Fibonacci"]="10 20 30";
	# parameters["GCD"]="10 20 30";
	# parameters["CoinGame"]="100 200 300";
	parameters["SobelEdge"]="64 128 256";	
	# ## Recursive function call
	# 
	# parameters["NQueens"]="8 9 10";
	# ### pattern transformation
	# parameters["LZ77"]="small medium";
	

	# The number of threads
	#threads="1 2 4";
	threads="1";
	count[""]=0;
	# Leak
	leaks[""]=0;
}
{
	filename=FILENAME;
	split(filename, arr, "/");
	split(arr[3], t_array, ".");
	# Test case
	testcase=t_array[1];
	# implementation type
	program=t_array[2];
	# Codegen
	codegen=t_array[3];
	# Pattern
	pattern=t_array[4];
	if(pattern == "disabledpattern"){
		pattern="disabled";
	}else{
		pattern="enabled";
	}
	# Compiler 
	compiler=t_array[5];
	# Get the number of threads
	thread = t_array[6];
	# Get parameter
	parameter = t_array[7];
	key=testcase","program","codegen","pattern","compiler","parameter","thread;
	count[key]++;
	#print key "," count[key];
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
	print "TestCase\tProgramType\tCompiler\tPattern\tParameter\tCodeGen\tThread\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
	t_total=split(testcases, t_array, " ");
	for(t=1;t<=t_total;t++){
		testcase=t_array[t];
		# Get Program
		programs_total=split(programs[testcase], programs_array, " ");
		for(i=1;i<=programs_total;i++){
			program = programs_array[i];
			## Compiler
			compilers_total=split(compilers, compiler_array, " ");
			for(cr=1;cr<=compilers_total;cr++){
				compiler = compiler_array[cr];
				## Get pattern 
				patterns_total=split(patterns, pattern_array, " ");
				for(pt=1; pt<=patterns_total;pt++){
					pattern=pattern_array[pt];
					## Parameter
					par_total=split(parameters[testcase], par_array, " ");
					for(p=1;p<=par_total;p++){
						parameter=par_array[p];
						# Get CodeGen 
						codegen_total=split(codegens, codegen_array, " ");
						for(c=1;c<=codegen_total;c++){
							codegen=codegen_array[c];
							## Threads
							threads_total=split(threads, thread_array, " ");
							for(th=1;th<=threads_total;th++){
								thread=thread_array[th];
								# Constitute key
								key=testcase","program","codegen","pattern","compiler","parameter","thread;
								# FIll in the values
								str=testcase"\t"program"\t"compiler"\t"pattern"\t"parameter"\t"codegen"\t"thread;
								# Check if there is the memory leak result.
								if(count[key]>0){
									# FIll in the values
									str = str"\t"leaks[key",definiteloss"]+0"\t"leaks[key",indirectloss"]+0"\t"leaks[key",possibleloss"]+0"\t"leaks[key",reachableloss"]+0;
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