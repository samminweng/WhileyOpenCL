#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase,CodeType,CompilerOpt,Parameter,Threads,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		c_total=split(c_types, c_array, " ");
 		for(c=1;c<=c_total;c++){
 			c_type=c_array[c];
 			p_total=split(polly_opts, p_array, " ");
 			for(p=1;p<=p_total;p++){
 				polly_opt=p_array[p];
 				# Get the parameter
 				if(parameters[testcase]!=""){
 					par_total=split(parameters[testcase], par_array, " ");
 					for(par=1;par<=par_total;par++){
 						parameter=par_array[par];
 						th_total=split(threads, th_array, " ");
 						for(th=1;th<=th_total;th++){
 							thread=th_array[th];
 							key=testcase","c_type","polly_opt","parameter","thread;
 							# Check if there is any result.
 							if(counts[key]>0){
 								str = testcase"\t"c_type"\t"polly_opt"\t"parameter"\t"thread;
 								## Print out CPU utilization
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




BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	#testcases="Fibonacci Reverse MergeSort newTicTacToe MatrixMult";
	testcases="MatrixMult";
	# Code Optimizations
	c_types="handwritten handwritten2 copy_reduced_dealloc";
	# Polly optimiz
	polly_opts="gcc polly openmp"
	# Parameters
	#parameters["Reverse"] = "1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000";
	#parameters["MergeSort"] = "1000 10000 100000 1000000 10000000 100000000 1000000000";
	#parameters["newTicTacToe"] = "1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000";
	parameters["MatrixMult"] = "2000";
	threads="1 2 4 8";
	cpu_utils[""] = "";
	exec_times[""] = "";
	counts[""]=0;
	if (!fn) fn="std.out"
}
{
	filename=FILENAME;
	split(filename, arr, "/");
	# Get test case
	split(arr[3], t_array, ".");
	# Code type
	c_type=t_array[1];
	testcase=t_array[2];
	# Polly optimizaton
	polly_opt=t_array[3];
	# Get parameter
	parameter = t_array[4];
	# Get threads
	if(polly_opt == "openmp"){
		# number of threads
		thread = t_array[5];
	}else{
		thread = 1;
	}
	key=testcase","c_type","polly_opt","parameter","thread;
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
		#print "cpu_utilizations["cpu_key"]="cpu_utils[cpu_key];
		#pause();
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
	print "CPU Utilization";
	generateReport(cpu_utils);
	print "Execution Time";
	generateReport(exec_times);
}