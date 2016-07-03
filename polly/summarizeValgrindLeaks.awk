#!/usr/bin/awk -f
BEGIN {
	#File name
	filename = "";
	FS = "\t";
	# Test case name
	testcases="MatrixMult GCD CoinGame NQueens";
	# Implementation
	impls["MatrixMult"]="original transpose";
	impls["GCD"]="original cached";
	impls["CoinGame"]="original single array";
	impls["NQueens"]="original";
	# Code Generation
	codegens = "naive naive_leakfree copyreduced copyreduced_leakfree";
	# Compiler
	compilers = "gcc";
	# Parameter
	parameters["MatrixMult"] = "15";
	parameters["GCD"] = "100";
	parameters["CoinGame"] = "100";
	parameters["NQueens"] = "8";
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
	# implementation type
	impl= t_array[2];
	# Codegen
	codegen=t_array[3];
	# Compiler 
	compiler=t_array[4];
	# Get parameter
	parameter = t_array[5];
	key =testcase","impl","codegen","compiler","parameter;
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
	print "TestCase\tImplementation\tCodeGen\tCompiler\tParameter\tdefinite loss\tindirect loss\tpossible loss\treachable loss";
	t_total=split(testcases, t_array, " ");
	for(t=1;t<=t_total;t++){
		testcase=t_array[t];
		# Get implementation
		impl_total=split(impls[testcase], impl_array, " ");
		for(i=0;i<=impl_total;i++){
			impl = impl_array[i];
			# Get CodeGen 
			codegen_total=split(codegens, codegen_array, " ");
			for(c=1;c<=codegen_total;c++){
				codegen=codegen_array[c];
				compilers_total=split(compilers, compiler_array, " ");
				for(cr=1;cr<=compilers_total;cr++){
					compiler = compiler_array[cr];
					par_total=split(parameters[testcase], par_array, " ");
					for(p=1;p<=par_total;p++){
						parameter = par_array[p];
						# Constitute key
						key =testcase","impl","codegen","compiler","parameter;
						# Check if there is the memory leak result.
						if(count[key]>0){
							# FIll in the values
							str = testcase"\t"impl"\t"codegen"\t"compiler"\t"parameter"\t"leaks[key",definiteloss"]+0"\t"leaks[key",indirectloss"]+0"\t"leaks[key",possibleloss"]+0"\t"leaks[key",reachableloss"]+0;
							print str;
						}
					}
				}		
			}
		}
	}
}
