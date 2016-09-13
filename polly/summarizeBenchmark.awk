#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase\tProgramType\tParameter\tCompiler\tCodeGen\tThread\t1st\t2nd\t3rd\t4th\t5th\t6th\t7th\t8th\t9th\t10th\tAverage";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		# Get Program Type
		program_total=split(programs[testcase], program_array, " ");
		for(pt=1;pt<=program_total;pt++){
			program = program_array[pt];
			# Get the parameter
			if(parameters[testcase]!=""){
				## Parameter
				par_total=split(parameters[testcase], par_array, " ");
				for(p=1;p<=par_total;p++){
					parameter = par_array[p];	
					## Compiler
					compilers_total=split(compilers, compiler_array, " ");
					for(cr=1;cr<=compilers_total;cr++){
						compiler = compiler_array[cr];
						# Get CodeGen 
						codegen_total=split(codegens, codegen_array, " ");
						for(c=1;c<=codegen_total;c++){
							codegen=codegen_array[c];					 							
							th_total=split(threads, th_array, " ");
							for(th=1;th<=th_total;th++){
								thread=th_array[th];	
								key =testcase","program","codegen","compiler","parameter","thread;
								#print "key="key;
								#pause();
								str = testcase"\t"program"\t"parameter"\t"compiler"\t"codegen"\t"thread;
								# Check if there is any result.
								if(counts[key]>0){
									## Print out result, e.g. CPU utilization
				 					for(iteration=1;iteration<=10;iteration++){
				 						str = str"\t"results[key","iteration];
				 					}
				 				}else{
				 					## Print out 'NA' results
				 					for(iteration=1;iteration<=10;iteration++){
				 						str = str"\tNA";
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

BEGIN {
	#File name
	filename = "";
	FS = "\n";
	# Test case name
	testcases="Reverse newTicTacToe MergeSort BubbleSort MatrixMult Fibonacci GCD CoinGame SobelEdge LZ77 NQueens";

	# Program Types
	programs["Reverse"]="original";
	programs["newTicTacToe"]="original";
	programs["MergeSort"]="original";
	programs["BubbleSort"]="original";
	programs["MatrixMult"]="original transpose";
	programs["Fibonacci"]="original";
	programs["GCD"]="original cached";
	programs["CoinGame"]="original single array";
	programs["SobelEdge"]="original";
	programs["LZ77"]="original";
	programs["NQueens"]="original integer";

	# Code Generation
	codegens = "naive_dealloc copyreduced copyreduced_dealloc";
	# Compiler
	#compilers = "gcc clang polly openmp";
	compilers = "gcc";
	# Parameter
	parameters["Reverse"]="100000 1000000 10000000";
	parameters["newTicTacToe"]="1000 10000 100000";
	parameters["MergeSort"]="1000 10000 100000";
	parameters["BubbleSort"]="1000 10000 100000";
	parameters["MatrixMult"]="1000 2000 3000";
	parameters["Fibonacci"]="10 50 90";
	parameters["GCD"]="100 150 200";
	parameters["CoinGame"]="1000 2000 3000";
	parameters["SobelEdge"] = "256 512 1024";
	parameters["LZ77"]="1000 10000 50000";
	parameters["NQueens"]="8 10 12 14 15";

	# The number of threads
	#threads="1 2 4";
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
	split(arr[3], t_array, ".");
	# Test case
	testcase=t_array[1];
	# Program type
	program= t_array[2];
	# Codegen
	codegen=t_array[3];
	# Compiler 
	compiler=t_array[4];
	# Get parameter
	parameter = t_array[5];
	#pause();
	# Get threads
	if(compiler == "openmp"){
		# number of threads
		thread = t_array[6];
	}else{
		thread = 1;
	}
	key =testcase","program","codegen","compiler","parameter","thread;
	#print "key="key;
	
	# Get the execution time
	if($1 ~ /ExecutionTime:/){
		#print $1;
		#pause();
		## Increment the iteration
		counts[key]++;
		# Get the iteration
		iteration=counts[key];
		# Get execution time
		split($1, arr, "ExecutionTime:");
		#print "arr[2]="arr[2];
		#pause();
		split(arr[2], time_arr, " ");
		exec_time=time_arr[1];
		#print "exec_time"exec_time;
		#pause();
		## Get the iteration
		time_key = key","iteration;
		exec_times[time_key]=exec_time;
		### Debug code
		#print "exec_times["time_key"]="exec_times[time_key];
		#pause();
		
	}
}
END {
	
	print "Execution Time (nano second)";
	generateReport(exec_times);

}
