#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Generate C code
generateCode(){
	program=$1
	generator=$2
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
		## Translate Whiley programs into naive C code
		if [[ $generator == *"naive"* ]]
		then
			if [[ $generator == *"leakfree"* ]]
			then
				### Translate Whiley program into naive + leakfree C code 
		    	./../../../../bin/wyopcl -code "$program.whiley"
		    else
		    	### Translate Whiley program into naive C code 
		    	./../../../../bin/wyopcl -code "$program.whiley"
		    fi
		fi

		## Translate Whiley programs into copy_reduced C code
		if [[ $generator == *"copyreduced"* ]]
		then

			if [[ $generator == *"leakfree"* ]]
			then
				### Translate Whiley program into copy-eliminated + memory deallocated C code 
		    	./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"	
			else
				### Translate Whiley program into copy-eliminated C code 
				./../../../../bin/wyopcl -code -copy "$program.whiley"
			fi
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
	generator=$2
	program=$3
	compiler=$4
	parameter=$5
	num_threads=$6
	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	#read -p "Press [Enter] to continue..."	
	result="$c_type.$generator.$program.$compiler.$parameter.$num_threads.enableVC.txt"
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
	valgrind --tool=memcheck "--log-file=$result" ./out/"$program.$compiler.enableVC.out" $parameter
	#valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all "--log-file=$result" ./out/"$program.$compiler.enableVC.out" $parameter
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
	generator=$2
	program=$3
	parameter=$4
	# change folder
	cd "$program/impl/$c_type"
	# read -p "Press [Enter] to continue..."
	generateCode $program $generator
	# read -p "Press [Enter] to continue..."	
	# Detect the leaks of generated C code using different compiler
	detectleaks $c_type $generator $program "gcc" $parameter 1
	detectleaks $c_type $generator $program "clang" $parameter 1
	detectleaks $c_type $generator $program "polly" $parameter 1
	detectleaks $c_type $generator $program "openmp" $parameter 1
	detectleaks $c_type $generator $program "openmp" $parameter 2
	detectleaks $c_type $generator $program "openmp" $parameter 4
    # Return to the working directory
    cd ../../../
}
## MatrixMult test case
init MatrixMult
exec autogenerate_original naive MatrixMult 15
exec autogenerate_original naive_leakfree MatrixMult 15
exec autogenerate_original copyreduced MatrixMult 15
exec autogenerate_original copyreduced_leakfree MatrixMult 15
exec autogenerate_transpose naive MatrixMult 15
exec autogenerate_transpose naive_leakfree MatrixMult 15
exec autogenerate_transpose copyreduced MatrixMult 15
exec autogenerate_transpose copyreduced_leakfree MatrixMult 15
### GCD test case
init GCD
exec autogenerate_original naive GCD 100
exec autogenerate_original naive_leakfree GCD 100
exec autogenerate_original copyreduced GCD 100
exec autogenerate_original copyreduced_leakfree GCD 100
exec autogenerate_cached naive GCD 100
exec autogenerate_cached naive_leakfree GCD 100
exec autogenerate_cached copyreduced GCD 100
exec autogenerate_cached copyreduced_leakfree GCD 100

### CoinGame test case
init CoinGame
exec autogenerate naive CoinGame 100
exec autogenerate naive_leakfree CoinGame 100
exec autogenerate copyreduced CoinGame 100
exec autogenerate copyreduced_leakfree CoinGame 100
exec autogenerate_single naive CoinGame 100
exec autogenerate_single naive_leakfree CoinGame 100
exec autogenerate_single copyreduced CoinGame 100
exec autogenerate_single copyreduced_leakfree CoinGame 100
exec autogenerate_array naive CoinGame 100
exec autogenerate_array naive_leakfree CoinGame 100
exec autogenerate_array copyreduced CoinGame 100
exec autogenerate_array copyreduced_leakfree CoinGame 100
#### NQueen test case
init NQueens
exec autogenerate naive NQueens 10
exec autogenerate naive_leakfree NQueens 10
exec autogenerate copyreduced NQueens 10
exec autogenerate copyreduced_leakfree NQueens 10
