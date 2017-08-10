#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	##testcases="Reverse newTicTacToe BubbleSort MergeSort MatrixMult";
	testcases="Cashtill";
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
	programs["LZ77"]="original";
	programs["Cashtill"]="original";
	# Compiler
	compilers = "gcc";
	#compilers = "gcc clang polly openmp";
	# Pattern matching
	patterns["Reverse"] = "disabled";
	patterns["newTicTacToe"] = "disabled";
	patterns["BubbleSort"] = "disabled";
	patterns["MergeSort"] = "disabled";
	patterns["MatrixMult"] = "disabled";
	patterns["LZ77"] = "disabled enabled";
	patterns["SobelEdge"] = "disabled";
	patterns["Cashtill"] = "disabled";
	# Code Generation
	codegens="naive naivedealloc nocopy nocopydealloc";
	## Code type
	codes="seq";
	# Parameter
	parameters["Reverse"]="100000 1000000 10000000";
	parameters["newTicTacToe"]="1000 10000 100000";
	parameters["MergeSort"]="1000 10000 100000";
	parameters["BubbleSort"]="1000 10000 100000";
	parameters["MatrixMult"]="1000 2000 3000";
	# parameters["Fibonacci"]="10 20 30";
	# parameters["GCD"]="10 20 30";
	# parameters["CoinGame"]="100 200 300";
	parameters["SobelEdge"]="image32x32 image64x64 image128x128";
	# ## Recursive function call
	#
	# parameters["NQueens"]="8 9 10";
	parameters["Cashtill"]="100 200 300";
	# ### pattern transformation
	parameters["LZ77"]="medium1x medium2x medium4x";
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
	# Program type
	program=t_array[2];
	# Compiler
	compiler=t_array[3];
	# Pattern
	pattern=t_array[4];
	if(pattern == "disabledpattern"){
		pattern="disabled";
	}else{
		pattern="enabled";
	}
	# Codegen
	codegen=t_array[5];
	# executable type
	code=t_array[6];
	# Get parameter
	parameter=t_array[7];

	# Get the number of threads
	thread=t_array[8];
	# Generate key
	key=testcase","program","compiler","pattern","parameter","codegen","code","thread;
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
	print "TestCase\tProgramType\tCompiler\tPattern\tParameter\tCodeGen\tCode\tThread\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
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
				patterns_total=split(patterns[testcase], pattern_array, " ");
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
							# Get code type
							code_total=split(codes, code_array, " ");
							for(ct=1;ct<=code_total;ct++){
								code=code_array[ct];
								## Threads
								threads_total=split(threads, thread_array, " ");
								for(th=1;th<=threads_total;th++){
									thread=thread_array[th];
									# Constitute key
									key=testcase","program","compiler","pattern","parameter","codegen","code","thread;
									# FIll in the values
									str=testcase"\t"program"\t"compiler"\t"pattern"\t"parameter"\t"codegen"\t"code"\t"thread;
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
}
