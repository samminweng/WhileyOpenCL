#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase\tProgram\tCompiler\tPattern\tGenCode\tExecutable\tParameter\tThread\t1st\t2nd\t3rd\t4th\t5th\t6th\t7th\t8th\t9th\t10th\tAverage";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		# Get Program
		program_total=split(programs[testcase], program_array, " ");
		for(pt=1;pt<=program_total;pt++){
			program = program_array[pt];
			## Get Compiler
			compilers_total=split(compilers[testcase], compiler_array, " ");
			for(cr=1;cr<=compilers_total;cr++){
				compiler=compiler_array[cr];
				## Get pattern
				patterns_total=split(patterns[testcase], pattern_array, " ");
				for(pt=1; pt<=patterns_total;pt++){
					pattern=pattern_array[pt];
					# Get CodeGen
					codegen_total=split(codegens[testcase], codegen_array, " ");
					for(c=1;c<=codegen_total;c++){
						codegen=codegen_array[c];
						# Get Executable
						exec_total=split(executables[testcase], exec_array, " ");
						for(ex=1;ex<=exec_total;ex++){
							executable=exec_array[ex];
							# Get parameter
							par_total=split(parameters[testcase], par_array, " ");
							for(p=1;p<=par_total;p++){
								parameter=par_array[p];
								if(executable == "seq"){
									key=testcase","program","compiler","pattern","codegen","executable","parameter","1;

									if(counts[key]>0){
										str=testcase"\t"program"\t"compiler"\t"pattern"\t"codegen"\t"executable"\t"parameter"\t"1;
										## Print out result, e.g. CPU utilization
										for(iteration=1;iteration<=10;iteration++){
											str = str"\t"results[key","iteration];
										}
										print str;
									}

								}else{
									th_total=split(threads[executable], th_array, " ");
									for(th=1;th<=th_total;th++){
										thread=th_array[th];
										key=testcase","program","compiler","pattern","codegen","executable","parameter","thread;
										#print "key="key;
										#pause();
										# Check if there is any result.
										if(counts[key]>0){
											str=testcase"\t"program"\t"compiler"\t"pattern"\t"codegen"\t"executable"\t"parameter"\t"thread;
											## Print out result, e.g. CPU utilization
											for(iteration=1;iteration<=10;iteration++){
												str = str"\t"results[key","iteration];
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
	}
 }

BEGIN {
	#File name
	filename = "";
	FS = "\n";
	## Test case name
	#testcases="Reverse newTicTacToe BubbleSort MergeSort MatrixMult SobelEdge";
	testcases="MatrixMult";

	## Program Type
	programs["MatrixMult"]="original";

	# Pattern matching
	patterns["MatrixMult"] = "disabled";

	# Code Generation
	codegens["MatrixMult"] = "nocopy";

	# Compiler
	compilers["MatrixMult"] = "gcc polly";

	# Parameter
	parameters["MatrixMult"]="1000 2000 4000 6000 8000 10000";

	# Executable
	executables["MatrixMult"]="seq openmp";

	# The number of threads
	threads["seq"]="1";
	threads["openmp"]="1 2 3 4 5 6 7 8";

	# Results
	cpu_utils[""] = "";
	exec_times[""] = "";
	counts[""]=0;
	#if (!fn) fn="std.out"
}
{
	filename=FILENAME;
	split(filename, arr, "/");
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

	# Get executable
	executable = t_array[6];

	# Get parameter
	parameter = t_array[7];

	# Get the number of threads
	thread = t_array[8];


	key=testcase","program","compiler","pattern","codegen","executable","parameter","thread;
	##print "key="key;
	##pause();

	# Get the execution time
	if($1 ~ /ExecutionTime:/){
		##print $1;
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
}
END {

	print "Execution Time (nano second)";
	generateReport(exec_times);

}
