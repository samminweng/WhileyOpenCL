#!/bin/sh
# Variable declaration
program=WhileLoop
export PATH_TO_POLLY_LIB="/home/sam/polly/llvm_build/lib"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

runExe(){
	#echo "-->8. Code generate the SCoPs"
	case $1 in 
		"interchanged")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$1 \
     		-polly-codegen \
     		$program.preopt.ll | opt -O3 > $program.polly.$1.ll
     	;;
     	"interchanged+tiled")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$1 \
     		-polly-codegen \
     		$program.preopt.ll | opt -O3 > $program.polly.$1.ll
		;;
		"interchanged+tiled+vector")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$1 \
     		-polly-codegen \
     		$program.preopt.ll -polly-vectorizer=polly | opt -O3 > $program.polly.$1.ll
		;;
		"interchanged+tiled+vector+openmp")
		opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=$1 \
     		-polly-codegen \
     		$program.preopt.ll -polly-parallel | opt -O3 > $program.polly.$1.ll
		;;
		#Normal optimisation
		*)
		opt $program.preopt.ll | opt -O3 > $program.polly.normalopt.ll
		;;
	esac


	#echo "-->Create the "$1" executables"
	# Generate execution file from interchanged llvm code
	llc $program.polly.$1.ll -o $program.polly.$1.s && gcc $program.polly.$1.s \
    -o $program.polly.$1.exe
    #echo "-->Time the "$1" executables"
	start=`date +%s%N`
	./$program.polly.$1.exe
	end=`date +%s%N`
	runtime=$((end-start))
	echo "-->Program:" $1 "\tExecutionTime(nanoseconds): " $runtime | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' 
}


echo "-->1. Create LLVM code from C"
clang -S -emit-llvm $program.c -o $program.s

echo "-->2. Prepare LLVM-IR for Polly"
opt -S -polly-canonicalize $program.s > $program.preopt.ll

echo "-->3. Show the ScoPs dectected Polly"
opt -basicaa -polly-ast -analyze -q $program.preopt.ll

echo "-->4. Generate SCoPs in DOT files, viewd by Graphviz"
opt -basicaa -dot-scops -disable-output $program.preopt.ll

#echo "-->5. Display polyhedral representation of SCoPs."
#opt -basicaa -polly-scops -analyze $program.preopt.ll

#echo "-->6. Show the dependency of SCoPs."
#opt -basicaa -polly-dependences -analyze $program.preopt.ll

echo "-->7. Export the polyhedral representation to jscop files in JSON format."
opt -basicaa -polly-export-jscop $program.preopt.ll
echo "-->8. Code generate the SCoPs and Run the executables."

runExe normalopt
runExe interchanged
runExe interchanged+tiled
runExe interchanged+tiled+vector
runExe interchanged+tiled+vector+openmp