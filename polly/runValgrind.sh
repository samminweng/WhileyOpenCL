#!/bin/bash
TIMEOUT="5s"
# export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
# export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
# alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
# alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
### Get the root working directory
basedir="$(dirname "$(pwd)")"
utildir="$basedir/tests/code"
### Generate C code
generateCode(){
	testcase=$1
	program=$2
	codegen=$3
	## change to 'testcase' folder
	cd "$basedir/polly/$testcase/" 
	# clean and create the folder
	rm -rf "impl/$program/$codegen"
	mkdir -p "impl/$program/$codegen"
	# copy the source whiley file to the folder
	cp $testcase"_"$program.whiley "impl/$program/$codegen/."
	#read -p "Press [Enter] to continue..."
	#### Change folder to the corresponding implementation folder
	cd "impl/$program/$codegen"
	## Clean up previously generated C code
	rm -f *.c *.h
	### Copy Util.c Util.h to current folder
	cp $utildir/Util.c $utildir/Util.h .
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			### Translate Whiley program into naive C code
			./../../../../..//bin/wyopcl -code $testcase"_"$program.whiley
	    		;;
		"naive_dealloc")
			### Translate Whiley program into naive + dealloc C code 
	    		./../../../../../bin/wyopcl -code -dealloc $testcase"_"$program.whiley
	    		;;
		"copyreduced")
			## Translate Whiley programs into copy_reduced C code
			./../../../../../bin/wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			### Translate Whiley program into copy-eliminated + memory deallocated C code
			./../../../../../bin/wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley
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
	codegen=$3
	parameter=$4
	compiler=$5
	num_threads=$6
	mkdir -p out
	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	#read -p "Press [Enter] to continue..."	
	executable="$testcase.$program.$codegen.$compiler.out"
	result="$testcase.$program.$codegen.$compiler.$parameter.$num_threads.txt"
	echo -e -n "Start Detect leaks..." > $result
	case "$compiler" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -std=c99 -g -O3 $testcase"_"$program.c Util.c -o "out/$executable"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 -D DEBUG $testcase"_"$program.c Util.c -o "out/$executable"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					$testcase"_"$program.c Util.c -o "out/$executable"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					-mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c -o "out/$executable"
			;;
	esac
	valgrind --tool=memcheck "--log-file=$result" ./out/"$executable" $parameter
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
	parameter=$3

	## declare 4 kinds of code generation
	declare -a codegens=("naive" "naive_dealloc" "copyreduced" "copyreduced_dealloc")
	## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		# Generate C code
		generateCode $testcase $program $codegen
		# Detect the leaks of generated C code using different compiler
		detectleaks $testcase $program $codegen $parameter "gcc" 1
	done
	
	#detectleaks $testcase $program $codegen $parameter "clang" 1
	#detectleaks $testcase $program $codegen $parameter "polly" 1
	#detectleaks $testcase $program $codegen $parameter "openmp" 1
	#detectleaks $testcase $program $codegen $parameter "openmp" 2
	#detectleaks $testcase $program $codegen $parameter "openmp" 4
    # Return to the working directory
    cd $basedir/polly
    #read -p "Press [Enter] to continue..."
}


# # # newTicTacToe test case
#init newTicTacToe
#exec newTicTacToe original 1000
#exec newTicTacToe original 10000
#exec newTicTacToe original 100000

# # Reverse test case
#init Reverse
#exec Reverse original 100000
#exec Reverse original 1000000
#exec Reverse original 10000000

# # MergeSort test case
#init MergeSort
#exec MergeSort original 1000
#exec MergeSort original 10000
#exec MergeSort original 100000

# # BubbleSort test case
#init BubbleSort
#exec BubbleSort original 10
#exec BubbleSort original 10000
#exec BubbleSort original 100000

# MatrixMult test case
#init MatrixMult
#exec MatrixMult original 1000
#exec MatrixMult original 2000
#exec MatrixMult original 3000

### Fibonacci 
init Fibonacci
exec Fibonacci original 10



## Sobel Edge Detection test case
#init SobelEdge
#exec SobelEdge original 8
#exec SobelEdge original 64
#exec SobelEdge original 128
#exec SobelEdge original 256
#exec SobelEdge original 512
#exec SobelEdge original 1024
#exec SobelEdge original 2048

##
