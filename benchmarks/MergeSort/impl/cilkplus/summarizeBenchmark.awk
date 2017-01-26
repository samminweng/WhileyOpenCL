#!/usr/bin/awk -f
function pause(){
	print > fn
  	print "Continue: (y/n)..."
  	getline varexit < "-"
  	if (varexit ~ /^[nN]/) exit
}

function generateReport(results){
	print "TestCase\tParameter\tProgramType\tThread\t1st\t2nd\t3rd\t4th\t5th\t6th\t7th\t8th\t9th\t10th\tAverage";
 	t_total=split(testcases, t_array, " ");
 	for(t=1;t<=t_total;t++){
 		testcase=t_array[t];
 		# Get the parameter
		par_total=split(parameters[testcase], par_array, " ");
		for(p=1;p<=par_total;p++){
			parameter=par_array[p];
 			## ProgramType
			pt_total=split(programtypes[testcase], pt_array, " ");
			for(pt=1;pt<=pt_total;pt++){
				programtype=pt_array[pt];
				th_total=split(threads[programtype], th_array, " ");
				for(th=1;th<=th_total;th++){
					thread=th_array[th];
					key=testcase","parameter","programtype","thread;
					#print "key="key;
					#pause();
					str=testcase"\t"parameter"\t"programtype"\t"thread;
					# Check if there is any result.
					if(counts[key]>0){
						## Print out result, e.g. CPU utilization
	 					for(iteration=1;iteration<=10;iteration++){
	 						str = str"\t"results[key","iteration];
	 					}				 					
	 				}
	 				print str;				
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
	testcases="mergesort";
	
	### Parameter
	parameters["mergesort"]="1000 10000 100000 1000000 10000000 100000000";

	## Compiler
	programtypes["mergesort"] = "seq cilk";

	# The number of threads
	threads["seq"]="1";
	threads["cilk"]="1 2 3 4 5 6 7 8";
	# Results
	cpu_utils[""] = "";
	exec_times[""] = "";
	counts[""]=0;
	if (!fn) fn="std.out"
}
{
	filename=FILENAME;
	split(filename, arr, "/");
	split(arr[2], t_array, ".");
	# Test case
	testcase=t_array[1];
	# Program type
	parameter=t_array[2];
	# Compiler 
	programtype=t_array[3];
	# Thread
	thread=t_array[4];

	key=testcase","parameter","programtype","thread;
	###print "key="key;
	###pause();

	# Get the execution time
	if($1 ~ /ExecutionTime:/){
		## print $1;
		## pause();
		## Increment the counter
		counts[key]++;
		# Get the iteration
		iteration=counts[key];
		# Get execution time
		split($1, arr, "ExecutionTime:");
		split(arr[2], time_arr, " ");
		exec_time=time_arr[1];
		## print "exec_time = "exec_time;
		## pause();
		## Get the iteration
		time_key = key","iteration;
		exec_times[time_key]=exec_time;
		### Debug code
		##print "exec_times["time_key"]="exec_times[time_key];
		##pause();

	}

}
END {
	
	print "Execution Time (nano second)";
	generateReport(exec_times);

}
