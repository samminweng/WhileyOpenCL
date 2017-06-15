#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase\tProgramType\tCompiler\tPattern\tParameter\tCodeGen\tExecutable\tThread\t1st\t2nd\t3rd\t4th\t5th\t6th\t7th\t8th\t9th\t10th\tAverage";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		# Get Program Type
		program_total=split(programs[testcase], program_array, " ");
		for(pa=1;pa<=program_total;pa++){
			program = program_array[pa];
			## Compiler
			compilers_total=split(compilers[testcase], compiler_array, " ");
			for(cr=1;cr<=compilers_total;cr++){
				compiler=compiler_array[cr];
				## Get pattern
				patterns_total=split(patterns[testcase], pattern_array, " ");
				for(pt=1; pt<=patterns_total;pt++){
					pattern=pattern_array[pt];
					# Get the parameter
					par_total=split(parameters[testcase], par_array, " ");
					for(p=1;p<=par_total;p++){
						parameter=par_array[p];
						# Get CodeGen
						codegen_total=split(codegens, codegen_array, " ");
						for(c=1;c<=codegen_total;c++){
							codegen=codegen_array[c];
							## Get executable type
							exectype_total=split(exectypes[testcase], exectype_array, " ");
							#print "exectype_total="exectype_total;
							for(ec=1;ec<=exectype_total;ec++){
								exectype=exectype_array[ec];
								th_total=split(threads[exectype], th_array, " ");
								for(th=1;th<=th_total;th++){
									thread=th_array[th];
									key=testcase","program","codegen","pattern","compiler","exectype","parameter","thread;
									#print "key="key;
									#pause();
									str=testcase"\t"program"\t"compiler"\t"pattern"\t"parameter"\t"codegen"\t"exectype"\t"thread;
									# Check if there is any result.
									if(counts[key]>0){
										## Print out result, e.g. CPU utilization
					 					for(iteration=1;iteration<=10;iteration++){
					 						str = str"\t"results[key","iteration];
					 					}
					 				}else{
					 					## Out of memory
				 						if(counts[key] == -1){
				 							str = str"\tOOM";
				 						}
				 						## Out of time
				 						if(counts[key] == -2){
				 							str = str"\tOOT";
				 						}
					 				}
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

BEGIN {
	#File name
	filename = "";
	FS = "\n";
	## Test case name
	#testcases="Reverse newTicTacToe BubbleSort MergeSort MatrixMult SobelEdge Cashtill LZ77";
	testcases="LZ77";

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
	##programs["LZ77"]="compress decompress optimised_decompress";
	programs["LZ77"]="compress";
	programs["Cashtill"]="original";

	# Code Generation
	##codegens = "naive naivedealloc nocopy nocopydealloc";
	codegens = "nocopydealloc";
	# Pattern matching
	patterns["Reverse"] = "disabled";
	patterns["newTicTacToe"] = "disabled";
	patterns["BubbleSort"] = "disabled";
	patterns["MergeSort"] = "disabled";
	patterns["MatrixMult"] = "disabled";
	#patterns["LZ77"] = "disabled enabled";
	patterns["LZ77"] = "enabled";
	patterns["SobelEdge"] = "disabled";
	patterns["Cashtill"] = "disabled";

	# Compiler
	compilers["Reverse"] = "gcc";
	compilers["newTicTacToe"] = "gcc";
	compilers["BubbleSort"] = "gcc";
	compilers["MergeSort"] = "gcc";
	compilers["MatrixMult"] = "gcc";
	compilers["LZ77"] = "gcc";
	compilers["SobelEdge"] = "gcc";
	compilers["Cashtill"] = "gcc";
	### Executive type
	exectypes["MergeSort"] = "seq cilkspawn cilkspawn_seq";
	exectypes["LZ77"] = "mapreduce_seq mapreduce_openmp cilk_reducer_seq cilk_reducer";
	### Parameter
	# Parameter
	parameters["Reverse"]="100000 1000000 10000000";
	parameters["newTicTacToe"]="1000 10000 100000";
	#parameters["MergeSort"]="1000 10000 100000";
	parameters["MergeSort"]="100000000 200000000 300000000";
	parameters["BubbleSort"]="1000 10000 100000";
	parameters["MatrixMult"]="1000 2000 3000";
	# parameters["Fibonacci"]="10 50 90";
	# parameters["GCD"]="100 150 200";
	# parameters["CoinGame"]="1000 2000 3000";
	parameters["SobelEdge"]="image32x32 image64x64 image128x128 image256x256 image512x512 image1024x1024";
	## Recursive function call
	# parameters["NQueens"]="8 10 12 14";
	# ### pattern transformation
	##parameters["LZ77"]="medium1x medium2x medium4x medium8x medium16x medium32x medium64x medium128x medium256x medium512x medium1024x";
	parameters["LZ77"]="large1x large2x large4x large8x large16x large32x large64x large128x large256x";
	parameters["Cashtill"]="1000 1200 1400 1600 1800 2000";

	# The number of threads
	threads["seq"]="1";
	threads["openmp"]="1 2 4 8";
	threads["mapreduce_seq"]="1";
	threads["mapreduce_openmp"]="1 2 4 8 12 16";
	threads["cilk_reducer_seq"]="1";
	threads["cilk_reducer"]="1 2 4 8 12 16";
	threads["cilkspawn"]="1 2 4 8 12 16";
	threads["cilkspawn_seq"]="1 2 4 8 12 16";
	# Results
	cpu_utils[""] = "";
	exec_times[""] = "";
	counts[""]=0;
	if (!fn) fn="std.out"
}
{
	filename=FILENAME;
	split(filename, arr, "/");
	split(arr[5], t_array, ".");
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
	## exectype
	exectype=t_array[6];
	# Get parameter
	parameter = t_array[7];

	# Get the number of threads
	if(testcase == "SobelEdge"){
		thread = t_array[9];
	}else{
		thread = t_array[8];
	}

	key=testcase","program","codegen","pattern","compiler","exectype","parameter","thread;
	##print "key="key;
	##pause();

	# Get the execution time
	if($1 ~ /ExecutionTime:/){
		##print $1;
		#print "key="key;
		#pause();
		## Increment the iteration
		counts[key]++;
		# Get the iteration
		iteration=counts[key];
		# Get execution time
		split($1, arr, "ExecutionTime:");
		##print "arr[2]="arr[2];
		#pause();
		split(arr[2], time_arr, " ");
		exec_time=time_arr[1];
		##print "exec_time"exec_time;
		##pause();
		## Get the iteration
		time_key = key","iteration;
		exec_times[time_key]=exec_time;
		### Debug code
		#print "exec_times["time_key"]="exec_times[time_key];
		##pause();
	}

	# Get out-of-memory error
	if($1 == "OOM:Run out of memory"){
		#print "key="key;
		counts[key] = -1;
		#print $1;
		#pause();
	}

	# Get out-of-time error
	if($1 == "OOT: Run out of time 3600s"){
		#print "key="key;
		counts[key] = -2;
		#print $1;
		#pause();
	}
}
END {
	print "Execution Time (nano second)";
	generateReport(exec_times);
}
