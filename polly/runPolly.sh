#!/bin/bash
# Variable declaration
export PATH_TO_POLLY_LIB="$HOME/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
TIMEOUT="1800s"

# Large scaled parameters.
parameters=""
define_parameters(){
	program=$1
	case "$program" in
		"Fibonacci")
			parameters="10 100 1000 10000 100000 1000000"
			;;
		"Reverse")
			parameters="1000 10000 100000 1000000 10000000 100000000"
			#parameters="1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000"
			;;
		"MergeSort")
			parameters="1000 10000 100000 1000000 10000000 100000000 1000000000"
			;;
		"newTicTacToe")
			parameters="1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000"
			;;
		"MatrixMult")
			parameters="10 100 1000 10000"
			;;
	esac
}

run_benchmark (){
	# Set DIR folder
	code_opt=$1
	program=$2
	polly_opt=$3
	speedup=$4
	#parameters
	for parameter in $parameters
	do
		OUT="$speedup.$parameter.txt"
		echo "Benchmark the $MAME $OP $CODE program on array size =" $parameter > $OUT
	    #Repeat running the programs
		for i in {1..10}
		do	
			start=`date +%s%N`
			timeout $TIMEOUT ./"$program.$polly_opt".out $parameter >> $OUT
			# Check if the program completes the task.
			if [ "$?" = 0 ]
			then
				# Print out success messages.
				echo "Success in running programs on array size = " $parameter >> $OUT
			else
				# Print out error messages.
				echo "Errors in running programs on array size = " $parameter >> $OUT
				break 2
			fi
			end=`date +%s%N`
			runtime=$((end-start))
			printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $OUT
		done
		 #Added the CPU info
		cat /proc/cpuinfo >> $OUT
    done
}
##
## Load polly to optimize C file
##
loadPollyToClang(){
	code_opt=$1
	program=$2
	polly_opt=$3
	## Create 'speedup' folder
	mkdir -p "$PWD/$program/speedups/"
	speedup="$PWD/$program/speedups/$program.ccode.$code_opt.$polly_opt"
	define_parameters $program
	# Optimize the C code
	cd "$program/impl/$code_opt/"
	## Extract the pre-optimized LLVM-IR file
	clang $CPPFLAGS -O0 -mllvm -polly -S -emit-llvm $program.c
	case "$polly_opt" in
		"polly")
			#read -p "Press [Enter] to use polly to optimize $code_opt $program..."		
			clang $CPPFLAGS -O3 -mllvm -polly Util.c $program.c -o $program.$polly_opt.out
		;;
		"openmp")
			#read -p "Press [Enter] to use polly to generate OpenMP code for $code_opt $program..."
			clang $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-parallel -lgomp Util.c $program.c -o $program.$polly_opt.out
		;;
		"vector")
			#read -p "Press [Enter] to use polly to generate Vector code for $code_opt $program..."
			clang $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine Util.c $program.c -o $program.$polly_opt.out
		;;
		"gcc")
			#read -p "Press [Enter] to use GCC to optimize $code_opt $program..."
			gcc -O3 Util.c $program.c -o $program.$polly_opt.out
		;;
	esac
	run_benchmark $code_opt $program $polly_opt $speedup
	cd ../../../
}
### Reverse Test case
loadPollyToClang naive Reverse gcc
loadPollyToClang naive Reverse polly
loadPollyToClang naive Reverse openmp
loadPollyToClang naive Reverse vector
loadPollyToClang naive_dealloc Reverse gcc
loadPollyToClang naive_dealloc Reverse polly
loadPollyToClang naive_dealloc Reverse openmp
loadPollyToClang naive_dealloc Reverse vector
loadPollyToClang copy_reduced Reverse gcc
loadPollyToClang copy_reduced Reverse polly
loadPollyToClang copy_reduced Reverse openmp
loadPollyToClang copy_reduced Reverse vector
loadPollyToClang copy_reduced_dealloc Reverse gcc
loadPollyToClang copy_reduced_dealloc Reverse polly
loadPollyToClang copy_reduced_dealloc Reverse openmp
loadPollyToClang copy_reduced_dealloc Reverse vector