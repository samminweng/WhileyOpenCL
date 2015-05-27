#!/usr/bin/awk -f
BEGIN {
	#File name
	filename="";
	FS="\t";
	#Program types
	programs[""]="";
	#Compiler
	compilers[""]="";
	#Optimizations
	opts[""]="";
	#Store the array size and the value is the number of iterations.
	arraysizes[""]=0;
	iterations[""]=0;
	#execution time 
	exec_times[""]=0;		
}
{
	filename=FILENAME;
	
	n=split(filename, a, ".");
	#Get program type (slow, fast)
	program=a[3];
	programs[program]=program;
	#Get compiler
	compiler=a[4];
	compilers[compiler]=compiler;
	#Get optimization
	opt=a[5];
	opts[opt]=opt;
	#Get arraysize
	arraysize=a[6];
	arraysizes[arraysize]=arraysize;
	#Get execution time
	split($2, c, ":");
	# Convert nano-seconds to seconds.
	exec_time=c[2]/1000000000;
	#Increment the number of iteration
	iterations[program" "arraysize" "compiler" "opt]++;
	iteration = iterations[program" "arraysize" "compiler" "opt];
	#Count for the number of iteration
	exec_times[program" "arraysize" "compiler" "opt" "iteration]= exec_time;
	#Debug
}
END {	
	#Print out the table header
	print "Program,ArraySize,Compiler,Optimization,1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,Average";
	for(program in programs){
		if(program != ""){
			#Sort arraysizes list by its value.
			n = asort(arraysizes)
			for(i=1;i<=n;i++){
				arraysize=arraysizes[i];
				if(arraysize != 0){
					k=asort(compilers)
					for(j=1;j<=k;j++){
						compiler=compilers[j];
						#if(compiler != ""){
							n_o=asort(opts);
							for(o=1;o<=n_o;o++){
								opt = opts[o];
								if(opt != ""){
									if(exec_times[program" "arraysize" "compiler" "opt" "1] != ""){
										str = program","arraysize","compiler","opt;
										for(iteration=1;iteration<=10;iteration++){
											exec_time = exec_times[program" "arraysize" "compiler" "opt" "iteration];
											#print exec_time;
											str = str "," exec_time;					
										}
										#Print out the aggregated results of that program running on the specific array size.
										print str;
									}									
					    		}	
							}
						#}
					}

				}
			}
		}
	}		
}
