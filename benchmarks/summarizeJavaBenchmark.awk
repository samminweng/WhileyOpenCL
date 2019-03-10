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
			compilers_total=split(compilers, compiler_array, " ");
			for(cr=1;cr<=compilers_total;cr++){
				compiler=compiler_array[cr];
				## Get pattern
				patterns_total=split(patterns, pattern_array, " ");
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
							exectype_total=split(exectypes, exectype_array, " ");
							#print "exectype_total="exectype_total;
							for(ec=1;ec<=exectype_total;ec++){
								exectype=exectype_array[ec];
								th_total=split(threads, th_array, " ");
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
	testcases="Reverse newTicTacToe BubbleSort MatrixMult";
	## Program Type
	programs["LZ77"]="opt_decompress";
	programs["Reverse"]="original";
	programs["newTicTacToe"]="intarray";
	programs["BubbleSort"]="original";
	programs["MergeSort"]="original";
	programs["MatrixMult"]="original";
	# Code Generation
	codegens="naive";
	# Pattern matching
	patterns="disabled";
	# Compiler
	compilers="java";
	### Executive type
	exectypes="seq";
	### Parameter
	parameters["LZ77"]="medium1x medium5x medium10x medium25x medium50x medium60x medium65x medium68x medium69x "\
					   "medium70x medium71x medium75x medium100x medium125x medium150x medium175x medium200x";
	parameters["Reverse"]="500000 1000000 1500000";
	parameters["newTicTacToe"]="500000 1000000 1500000";
	parameters["BubbleSort"]="10000 20000 30000";
	parameters["MergeSort"]="100000 200000 300000";
	parameters["MatrixMult"]="500 1000 1500";
	#parameters["LZ77"]="medium10000x medium20000x medium30000x medium40000x medium50000x medium60000x medium70000x medium80000x medium90000x medium100000x";
	# The number of threads
	threads="1";
	# Results
	cpu_utils[""] = "";
	exec_times[""] = "";
	counts[""]=0;
	if (!fn) fn="std.out"
}
{
	filename=FILENAME;
	split(filename, arr, "/");
	#print "arr[4]="arr[4];
	split(arr[4], t_array, ".");
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
