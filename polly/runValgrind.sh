#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Get the root working directory
basedir="$(dirname "$(pwd)")"
utildir="$basedir/tests/code"
### Generate C code
generateCode(){
	testcase=$1
	program=$2
	c_type=$3
	## change to 'testcase' folder
	cd "$basedir/polly/$testcase/" 
	# clean and create the folder
	rm -rf "impl/$program/$c_type"
	mkdir -p "impl/$program/$c_type"
	# copy the source whiley file to the folder
	cp $testcase"_"$program.whiley "impl/$program/$c_type/."
	#read -p "Press [Enter] to continue..."
	#### Change folder to the corresponding implementation folder
	cd "impl/$program/$c_type"
	## Clean up previously generated C code
	rm -f *.c *.h
	### Copy Util.c Util.h to 
	cp $utildir/Util.c $utildir/Util.h .
	## Translate Whiley programs into naive C code
	case "$c_type" in
		"naive")
			### Translate Whiley program into naive C code 
	    	./../../../../..//bin/wyopcl -code $testcase"_"$program.whiley
	    	;;
	    "naive_leakfree")
			### Translate Whiley program into naive + leakfree C code 
	    	./../../../../../bin/wyopcl -code -dealloc $testcase"_"$program.whiley
	    	;;
	    "copyreduced")
			## Translate Whiley programs into copy_reduced C code
			./../../../../../bin/wyopcl -code -copy $testcase"_"$program.whiley
			;;
		"copyreduced_leakfree")
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
	    	./../../../../../bin/wyopcl -code -copy -dealloc $testcase"_"$program.whiley	
			;;
	esac
}
### Create the 'leak' folder and clean up the files
init(){
	testcase=$1
	leakdir="$basedir/polly/$testcase/leaks"
	mkdir -p "$leakdir"
	### remove all files inside the folder
	rm -f "$leakdir/"*.*
}
##
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
	testcase=$1
	program=$2
	c_type=$3
	parameter=$4
	compiler=$5
	num_threads=$6
	mkdir -p out
	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	#read -p "Press [Enter] to continue..."	
	result="$testcase.$program.$c_type.$compiler.$parameter.$num_threads.txt"
	echo -e -n "Start Detect leaks..." > $result
	case "$compiler" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -std=c99 -g -O3 $testcase"_"$program.c Util.c -o "out/$testcase.$program.$c_type.$compiler.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 $testcase"_"$program.c Util.c -o "out/$testcase.$program.$c_type.$compiler.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					$testcase"_"$program.c Util.c -o "out/$testcase.$program.$c_type.$compiler.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					-mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c -o "out/$testcase.$program.$c_type.$compiler.out"
			;;
	esac
	valgrind --tool=memcheck "--log-file=$result" ./out/"$testcase.$program.$c_type.$compiler.out" $parameter
	#valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all "--log-file=$result" ./out/"$program.$compiler.enableVC.out" $parameter
	# Added the CPU info
	cat /proc/cpuinfo >> $result
	# move result to leaks folder
	mv $result $basedir/polly/$testcase/leaks/.
}
# 
# Run Valgrind to detect memory leaks
#
exec(){
	testcase=$1
	program=$2
	c_type=$3
	parameter=$4
	generateCode $testcase $program $c_type
	# Detect the leaks of generated C code using different compiler
	detectleaks $testcase $program $c_type $parameter "gcc" 1
	#detectleaks $testcase $program $c_type $parameter "clang" 1
	#detectleaks $testcase $program $c_type $parameter "polly" 1
	#detectleaks $testcase $program $c_type $parameter "openmp" 1
	#detectleaks $testcase $program $c_type $parameter "openmp" 2
	#detectleaks $testcase $program $c_type $parameter "openmp" 4
    # Return to the working directory
    cd $basedir/polly
    #read -p "Press [Enter] to continue..."
}
# MatrixMult test case
init MatrixMult
exec MatrixMult original naive 15
exec MatrixMult original naive_leakfree 15
exec MatrixMult original copyreduced 15
exec MatrixMult original copyreduced_leakfree 15
exec MatrixMult transpose naive 15
exec MatrixMult transpose naive_leakfree 15
exec MatrixMult transpose copyreduced 15
exec MatrixMult transpose copyreduced_leakfree 15
### GCD test case
init GCD
exec GCD original naive 100
exec GCD original naive_leakfree 100
exec GCD original copyreduced 100
exec GCD original copyreduced_leakfree 100
exec GCD cached naive 100
exec GCD cached naive_leakfree 100
exec GCD cached copyreduced 100
exec GCD cached copyreduced_leakfree 100
# ### CoinGame test case
init CoinGame
exec CoinGame original naive 100
exec CoinGame original naive_leakfree 100
exec CoinGame original copyreduced 100
exec CoinGame original copyreduced_leakfree 100
exec CoinGame single naive 100
exec CoinGame single naive_leakfree 100
exec CoinGame single copyreduced 100
exec CoinGame single copyreduced_leakfree 100
exec CoinGame array naive 100
exec CoinGame array naive_leakfree 100
exec CoinGame array copyreduced 100
exec CoinGame array copyreduced_leakfree 100
# #### NQueen test case
init NQueens
exec NQueens original naive 8
exec NQueens original naive_leakfree  8
exec NQueens original copyreduced  8
exec NQueens original copyreduced_leakfree  8