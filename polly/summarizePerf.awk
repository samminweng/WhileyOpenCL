#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase\tProgramType\tCodeGen\tCompiler\tParameter\tThread\t1st\t2nd\t3rd\t4th\t5th\t6th\t7th\t8th\t9th\t10th\tAverage";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		# Get Program Type
		program_total=split(programs[testcase], program_array, " ");
		for(pt=1;pt<=program_total;pt++){
			program = program_array[pt];
			# Get CodeGen 
			codegen_total=split(codegens, codegen_array, " ");
			for(c=1;c<=codegen_total;c++){
				codegen=codegen_array[c];
				## Compiler
				compilers_total=split(compilers, compiler_array, " ");
				for(cr=1;cr<=compilers_total;cr++){
					compiler = compiler_array[cr];
					th_total=split(threads, th_array, " ");
					for(th=1;th<=th_total;th++){
						thread=th_array[th];	
						# Get the parameter
						if(parameters[testcase]!=""){
							## Parameter
							par_total=split(parameters[testcase], par_array, " ");
							for(p=1;p<=par_total;p++){
								parameter = par_array[p];					 							
								key =testcase","program","codegen","compiler","parameter","thread;
								#print "key="key;
								#pause();
								# Check if there is any result.
								if(counts[key]>0){
									str = testcase"\t"program"\t"codegen"\t"compiler"\t"parameter"\t"thread;
									## Print out result, e.g. CPU utilization
				 					for(iteration=1;iteration<=10;iteration++){
				 						str = str"\t"results[key","iteration];
				 					}
				 					print str;
									#pause();
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
	FS = "\t";
	# Test case name
	#testcases="Fibonacci Reverse MergeSort BubbleSort newTicTacToe MatrixMult GCD CoinGame NQueens";
	testcases="Reverse newTicTacToe MergeSort BubbleSort MatrixMult";
	# Program Types
	programs["Reverse"]="original";
	programs["newTicTacToe"]="original";
	programs["MergeSort"]="original";
	programs["BubbleSort"]="original";
	programs["MatrixMult"]="original";
	#programs["Fibonacci"]="original";
	
	#programs["GCD"]="original cached";
	#programs["CoinGame"]="original single array";
	#programs["NQueens"]="original integer";
	# Code Generation
	#codegens="copyreduced_dealloc";
	codegens = "naive naive_dealloc copyreduced copyreduced_dealloc";
	# Compiler
	#compilers = "gcc clang polly openmp";
	compilers = "gcc";
	# Parameter
	parameters["Reverse"] = "1000000 10000000 100000000";
	parameters["newTicTacToe"] = "10000 100000 1000000";
	parameters["MergeSort"] = "100000 1000000 10000000";
	parameters["BubbleSort"] = "1000 10000 100000";
	parameters["MatrixMult"] = "100 1000 2000";
	#parameters["Fibonacci"] = "10 20 30 40 50";
	
	#parameters["GCD"] = "1000 10000 20000 30000 40000";
	#parameters["CoinGame"] = "1000 10000 20000 30000 40000";
	#parameters["NQueens"] = "1 2 4 6 8 10 12 14 15";
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
	#pause();
	if(match($1, /Performance counter stats/)){
		## Increment the iteration
		counts[key]++;
	}
	# Get the iteration
	iteration=counts[key];
	# Get the CPU utilization
	if(match($1, /CPUs utilized/)){
		# Get CPU utilization
		split($1, arr, "#");
		split(arr[2], arr, "CPUs utilized");
		sub(/ /, "", arr[1]);
		cpu_util= arr[1];
		# Add cpu_utilization
		cpu_key = key","iteration;
		cpu_utils[cpu_key]= cpu_util;
		### Debug code
		##print "cpu_utilizations["cpu_key"]="cpu_utils[cpu_key];
		##pause();
	}
	# Get the execution time
	if(match($1, /seconds time elapsed/)){
		# Get execution time
		split($1, arr, "seconds time elapsed");
		exec_time=arr[1];
		## Get the iteration
		time_key = key","iteration;
		exec_times[time_key]=exec_time;
		### Debug code
		#print "exec_times["time_key"]="exec_times[time_key];
		#pause();
	}
}
END {
	
	print "Execution Time";
	generateReport(exec_times);

	#print "CPU Utilization";
	#generateReport(cpu_utils);
}
