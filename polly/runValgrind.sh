#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Generate C code
generateCode(){
	program=$1
	mkdir -p "out"
	rm -rf "out/"*.*
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
	utildir="$PWD/../../../../tests/code"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h .
	#clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
	#ar -cvq libUtil.a Util.o
	if [[ $c_type == *"autogenerate"* ]]
	then
		if [[ $c_type == *"leakfree"* ]]
		then
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
		        ./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"	
		else
			### Translate Whiley program into copy-eliminated C code 
			./../../../../bin/wyopcl -code -copy "$program.whiley"
		fi
	fi
	#clang -c Util.c -o Util.o 
    #ar -cvq libUtil.a Util.o
	#echo -e -n "Generate $program C code...." && read
}
### Create the folder and/or clean up the files
init(){
	program=$1
	dir="$PWD/$program/leaks"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
}
##
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	num_threads=$5
	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	#read -p "Press [Enter] to continue..."	
	result="$c_type.$program.$compiler.$parameter.$num_threads.enableVC.txt"
	echo -e -n "Start Detect leaks..." > $result
	case "$compiler" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -std=c99 -g -O3 $program.c Util.c -o "out/$program.$compiler.enableVC.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 $program.c Util.c -o "out/$program.$compiler.enableVC.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					$program.c Util.c -o "out/$program.$compiler.enableVC.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					-mllvm -polly-parallel -lgomp $program.c Util.c -o "out/$program.$compiler.enableVC.out"
			;;
	esac
	valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all "--log-file=$result" ./out/"$program.$compiler.enableVC.out" $parameter
	# Added the CPU info
	cat /proc/cpuinfo >> $result
	# move result to leaks folder
	mv $result ../../leaks/
}
# 
# Run Valgrind to detect memory leaks
#
exec(){
	c_type=$1
	program=$2
	parameter=$3
	# change folder
	cd "$program/impl/$c_type"
	# read -p "Press [Enter] to continue..."
	generateCode $program
	# read -p "Press [Enter] to continue..."	
	# Detect the leaks of generated C code using different compiler
	detectleaks $c_type $program "gcc" $parameter 1
	detectleaks $c_type $program "clang" $parameter 1
	detectleaks $c_type $program "polly" $parameter 1
	detectleaks $c_type $program "openmp" $parameter 1
	detectleaks $c_type $program "openmp" $parameter 2
	detectleaks $c_type $program "openmp" $parameter 4
    # Return to the working directory
    cd ../../../
}
## MatrixMult test case
##init MatrixMult
##exec autogenerate_original_leakfree MatrixMult 200
##exec autogenerate_original_leakfree MatrixMult 400
### GCD test case
##init GCD
##exec autogenerate_original_leakfree GCD 1000
##exec autogenerate_original_leakfree GCD 2000
##exec autogenerate_cached_leakfree GCD 1000
##exec autogenerate_cached_leakfree GCD 2000
### CoinGame test case
init CoinGame
exec autogenerate_leakfree CoinGame 1000
exec autogenerate_leakfree CoinGame 2000
exec autogenerate_single_leakfree CoinGame 1000
exec autogenerate_single_leakfree CoinGame 2000
exec autogenerate_array_leakfree CoinGame 1000
exec autogenerate_array_leakfree CoinGame 2000
