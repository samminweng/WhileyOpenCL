#!/bin/sh
# Variable declaration
program=While_Valid_1
export PATH_TO_POLLY_LIB="/home/sam/polly/llvm_build/lib"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

runExe(){
	echo "----------------------"$1 $2" Optimization--------------------------------"
	#read -p "Press enter to generate and run the executables." nothing
	optimisation=$2
	#echo "Optimisation" $optimisation
	case $optimisation in 
		"interchanged")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$optimisation \
     		-polly-codegen \
     		$program.preopt.ll | opt -O3 > $program.polly.$optimisation.ll
     	# Generate execution file from interchanged llvm code
		llc $program.polly.$optimisation.ll -o $program.polly.$optimisation.s && \
		gcc $program.polly.$optimisation.s -o $program.$optimisation.exe
     	;;
     	"interchanged+tiled")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$optimisation \
     		-polly-codegen \
     		$program.preopt.ll | opt -O3 > $program.polly.$optimisation.ll
     	# Generate execution file from interchanged llvm code
		llc $program.polly.$optimisation.ll -o $program.polly.$optimisation.s && \
		gcc $program.polly.$optimisation.s -o $program.$optimisation.exe
		;;
		"interchanged+tiled+vector")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$optimisation \
     		-polly-codegen \
     		$program.preopt.ll -polly-vectorizer=polly | opt -O3 > $program.polly.$optimisation.ll
     	# Generate execution file from interchanged llvm code
		llc $program.polly.$optimisation.ll -o $program.polly.$optimisation.s && 
		gcc $program.polly.$optimisation.s -o $program.$optimisation.exe
		;;
		"interchanged+tiled+vector+openmp")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$optimisation \
     		-polly-codegen \
     		$program.preopt.ll -polly-parallel | opt -O3 > $program.polly.$optimisation.ll
     	# Generate execution file from interchanged llvm code
		llc $program.polly.$optimisation.ll -o $program.polly.$optimisation.s && \
		gcc $program.polly.$optimisation.s -o $program.$optimisation.exe
		;;
		#Normal optimisation
		"normalopt")
		opt $program.preopt.ll | opt -O3 > $program.polly.$optimisation.ll
		# Generate execution file from interchanged llvm code
		llc $program.polly.$optimisation.ll -o $program.polly.$optimisation.s && \
		gcc $program.polly.$optimisation.s -o $program.$optimisation.exe
		;;
		*)
		# Generate the assembly code using GCC
		gcc -O2 Util.c $program.c -o $program.$optimisation.exe
		;;
	esac
	
    #echo "-->Time the executables"
	start=`date +%s%N`
	./$program.$optimisation.exe 200000000
	end=`date +%s%N`
	runtime=$((end-start))
	echo "-->Program:" $1 $2 "\tExecutionTime(nanoseconds): " $runtime | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' 
}


echo "-->1. Create LLVM code from C"
# Use include option to include standard library C file. 
clang -include Util.c -S -emit-llvm $program.c -o $program.s

echo "-->2. Prepare LLVM-IR for Polly"
opt -S -polly-canonicalize $program.s > $program.preopt.ll

echo "-->3. Show the ScoPs dectected Polly"
opt -basicaa -polly-ast -analyze -q $program.preopt.ll

echo "-->4. Generate SCoPs in DOT/PNG files, viewd by Graphviz"
opt -basicaa -dot-scops -disable-output $program.preopt.ll
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "-->5. Display polyhedral representation of SCoPs."
opt -basicaa -polly-scops -analyze $program.preopt.ll

echo "-->6. Show the dependency of SCoPs."
opt -basicaa -polly-dependences -analyze $program.preopt.ll

echo "-->7. Export the polyhedral representation to jscop files in JSON format."
opt -basicaa -polly-export-jscop $program.preopt.ll

echo "--> 8. Import the updated jscop files and print the new SCoPs. (optional)"
opt -basicaa -polly-import-jscop -polly-ast -analyze $program.preopt.ll
opt -basicaa -polly-import-jscop -polly-ast -analyze $program.preopt.ll \
    -polly-import-jscop-postfix=interchanged
opt -basicaa -polly-import-jscop -polly-ast -analyze $program.preopt.ll \
    -polly-import-jscop-postfix=interchanged+tiled
opt -basicaa -polly-import-jscop -polly-ast -analyze $program.preopt.ll \
    -polly-import-jscop-postfix=interchanged+tiled+vector

runExe GCC O2
runExe polly normalopt
runExe polly interchanged
runExe polly interchanged+tiled
runExe polly interchanged+tiled+vector
runExe polly interchanged+tiled+vector+openmp