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
										print str;
						 			}else{
						 				## Out of memory
					 					if(counts[key] == -1){
										    str = str"\tOOM";
										    print str;
					 					}else if(counts[key] == -2){
										    ## Out of time
										    str = str"\tOOT";
										    print str;
					 					}else{
										    str = str"\tNo data";
										    ## No data
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
 }

BEGIN {
	#File name
	filename = "";
	FS = "\n";
	## Test case name
	#testcases="Reverse newTicTacToe BubbleSort MergeSort MatrixMult";
	testcases="SobelEdge";

	## Program Type
	programs["Reverse"]="original";
	programs["newTicTacToe"]="original";
	programs["BubbleSort"]="original";
	programs["MergeSort"]="original";
	programs["MatrixMult"]="original";
	programs["CoinGame"]="original";
	#programs["SobelEdge"]="large large_64 large_generated";
	programs["SobelEdge"]="large";
	programs["LZ77"]="opt_compress opt_decompress";
	programs["Cashtill"]="original";

	# Code Generation
	codegens = "naive naivedealloc nocopy nocopydealloc";
	#codegens = "manual";
	# Pattern matching
	patterns["Reverse"] = "disabled";
	patterns["newTicTacToe"] = "disabled";
	patterns["BubbleSort"] = "disabled";
	patterns["MergeSort"] = "disabled";
	patterns["MatrixMult"] = "disabled";
	patterns["LZ77"] = "disabled enabled";
	patterns["SobelEdge"] = "disabled";
	patterns["Cashtill"] = "disabled";
	patterns["CoinGame"] = "disabled";

	# Compiler
	compilers["Reverse"] = "gcc";
	compilers["newTicTacToe"] = "gcc";
	compilers["BubbleSort"] = "gcc";
	compilers["MergeSort"] = "gcc";
	compilers["MatrixMult"] = "gcc";
	compilers["LZ77"] = "gcc";
	compilers["SobelEdge"] = "gcc";
	compilers["Cashtill"] = "gcc";
	compilers["CoinGame"] = "gcc";
	### Executive type
	exectypes["Reverse"] = "seq";
	exectypes["newTicTacToe"] = "seq";
	exectypes["BubbleSort"] = "seq";
	exectypes["MergeSort"] = "seq";
	exectypes["MatrixMult"] = "seq";
	exectypes["Cashtill"] = "seq";
	exectypes["LZ77"] = "seq";
	exectypes["CoinGame"] = "seq";
	exectypes["SobelEdge"] = "seq";
	### Parameter
	parameters["Reverse"]="100000000 200000000 300000000";
	parameters["newTicTacToe"]="100000 200000 300000";
	parameters["BubbleSort"]="100000 200000 300000";
	parameters["MergeSort"]="10000000 20000000 30000000";
	parameters["MatrixMult"]="1000 2000 3000";
	parameters["CoinGame"]="10000 20000 25000 30000 40000";
	#parameters["SobelEdge"]="image64x64 image64x128 image64x192 image64x256 image64x320 image64x384 image64x448 image64x512 image64x576 image64x640";
	parameters["SobelEdge"]="image2000x2000 image2000x4000 image2000x6000 image2000x8000 image2000x10000 image2000x12000 image2000x14000 image2000x16000 image2000x18000 image2000x20000" \
	    " image2000x22000 image2000x24000 image2000x26000 image2000x28000 image2000x30000 image2000x32000 image2000x34000 image2000x36000 image2000x38000 image2000x40000";
	#parameters["SobelEdge"]="image40959x2048 image40960x2048 image40961x2048";
	#parameters["SobelEdge"]="image16383x16384 image16384x16384 image16385x16384";
	#parameters["LZ77"]="medium1x medium5x medium7x medium10x medium25x medium50x medium75x medium100x medium120x medium125x medium150x medium175x medium200x " \
	#                   "medium225x medium250x medium275x medium300x medium325x medium350x medium375x medium400x";
	parameters["LZ77"]="medium10000x medium20000x medium30000x medium40000x medium50000x medium60000x medium70000x medium80000x medium90000x medium100000x";
	parameters["Cashtill"]="10000 20000 25000 30000 40000";

	# The number of threads
	threads["seq"]="1";

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
		##print "exec_times["time_key"]="exec_times[time_key];
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
	if($1 ~ /OOT:/){
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
