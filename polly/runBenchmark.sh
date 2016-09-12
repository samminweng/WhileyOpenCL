#!/bin/bash
TIMEOUT="3600s"
# Run Polly from clang
#alias opt="opt -O3 -polly"
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
	rm -f "impl/$program/$codegen/*.*"
	mkdir -p "impl/$program/$codegen"
	# copy the source whiley file to the folder
	cp $testcase"_"$program.whiley "impl/$program/$codegen/."
	#### Change folder to the corresponding implementation folder
	cd "impl/$program/$codegen"
	## Clean up previously generated C code
	rm -f *.c *.h
	### Copy Util.c Util.h to the folder of generated code
	cp $utildir/Util.c $utildir/Util.h .
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			echo "#############Generate naive $testcase#################"
			### Translate Whiley program into naive C code
			./../../../../..//bin/wyopcl -code $testcase"_"$program.whiley
			;;
	    	"naive_dealloc")
			echo "#############Generate naive_dealloc $testcase#################"
			### Translate Whiley program into naive + dealloc C code
			./../../../../../bin/wyopcl -code -dealloc $testcase"_"$program.whiley
	    		;;
		"copyreduced")
			echo "#############Generate copyreduced $testcase#################"
			## Translate Whiley programs into copy_reduced C code
			./../../../../../bin/wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			echo "#############Generate copyreduced_dealloc $testcase#################"
			### Translate Whiley program into copy-eliminated + memory deallocated C code
			./../../../../../bin/wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley
			;;
	esac
}

##
## Compile the program and run the executable with given parameters
##
compileAndRun(){
	testcase=$1
	program=$2
	codegen=$3
	parameter=$4
	compiler=$5
	num_threads=$6
	####Create 'out', 'llvm' and 'assembly' folder
    	rm -rf "out" "llvm" "assembly"
	mkdir -p "out" "llvm" "assembly"
	### The executable file name
	executable=$testcase.$program.$codegen.$compiler
    	### Compile C code into executables
	case "$compiler" in
		"gcc")
			##echo gcc -std=c99 -O3 $testcase"_"$program.c Util.c -o out/"$testcase.$program.$codegen.$compiler.out"
			gcc -std=c99 -O3 $testcase"_"$program.c Util.c -o out/$executable.out
			;;
		"clang")
			clang -O3 $testcase"_"$program.c Util.c -o out/$executable.out
			;;
		"polly")
			###'-polly-process-unprofitable' option forces Polly to generate sequential code
			pollycc -mllvm -polly-vectorizer=stripmine\
	        		-S -emit-llvm -mllvm -polly-process-unprofitable\
					-mllvm -polly-opt-outer-coincidence=yes\
	        		$testcase"_"$program.c -o "llvm"/$executable.ll
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm"/$executable.ll -o "assembly"/$executable.s
			### Use 'clang' to compile .s file and link with 'libUtil.a'
			clang "assembly"/$executable.s Util.c -o out/$executable.out
			;;
		"openmp")
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			### '-polly-parallel-force' forces Polly to generate OpenMP code
			export OMP_NUM_THREADS=$num_threads
			pollycc -mllvm -polly-vectorizer=stripmine -S -emit-llvm\
	        		-mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
					-mllvm -polly-opt-outer-coincidence=yes\
	        		$testcase"_"$program.c -o "llvm"/$executable.ll
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm"/$executable.ll -o "assembly"/$executable.s
			### Use 'clang' to compile .s file and link with 'Util.c'
			clang "assembly"/$executable.s Util.c -lgomp -o "out"/$executable.out
			;;
	esac
	###read -p "Press [Enter] to continue..."
	result="$basedir/polly/$testcase/exectime/$executable.$parameter.$num_threads.txt"
	export OMP_NUM_THREADS=$num_threads
	echo -e -n "Run the $program $testcase on $parameter using $compiler and $OMP_NUM_THREADS threads..." >> $result
	echo "Run the $program $testcase on $parameter using $OMP_NUM_THREADS threads..."
	for i in {1..10}
	do
		#echo "Begin $i iteration"
		#timeout $TIMEOUT perf stat out/"$executable.out" $parameter >>$result 2>> $result
		#echo "Finish $i iteration"
		echo "Run the $program $testcase on $parameter using $compiler" >>$result
		start=`date +%s%N`
		timeout $TIMEOUT out/"$executable.out" $parameter >> $result
		#timeout $TIMEOUT out/"$executable.out" $parameter >> $result
		end=`date +%s%N`
		exectime=$((end-start))
		printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $exectime >> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
}
#
# Execute benchmarks
#
exec(){
	testcase=$1
	program=$2
	parameter=$3

	## declare 4 kinds of code generation
	#declare -a codegens=("naive" "naive_dealloc" "copyreduced" "copyreduced_dealloc")
	## declare 3 kinds of code generation
	declare -a codegens=("naive_dealloc" "copyreduced" "copyreduced_dealloc")
	## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		## Generate C code
		generateCode $testcase $program $codegen
		##read -p "Complete code generation. Press [Enter] to continue..."
		compileAndRun $testcase $program $codegen $parameter "gcc" 1
		###read -p "Complete. Press [Enter] to continue..."
		#compileAndRun $testcase $program $codegen $parameter "clang" 1
		#compileAndRun $testcase $program $codegen $parameter "polly" 1
		#compileAndRun $testcase $program $codegen $parameter "openmp" 1
		#compileAndRun $testcase $program $codegen $parameter "openmp" 2
		#compileAndRun $testcase $program $codegen $parameter "openmp" 4
	done
	# Return to the working directory
	cd $basedir/polly
	###read -p "Press [Enter] to continue..."
}
### Create the folder and/or clean up the files
init(){
	testcase=$1
	testcase=$1
	dir="$basedir/polly/$testcase/exectime"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
}
# ############################################
# ###
# ###  Benchmark 3 kinds of generated code
# ###  (naive + de-allocated,
# ###   copy_reduced, copy_reduced + de-allocated)
# ###
# ###########################################
## # Reverse test case
init Reverse
exec Reverse original 100000
exec Reverse original 1000000
exec Reverse original 10000000

# # # newTicTacToe test case
init newTicTacToe
exec newTicTacToe original 1000
exec newTicTacToe original 10000
exec newTicTacToe original 100000

## # MergeSort test case
init MergeSort
exec MergeSort original 1000
exec MergeSort original 10000
exec MergeSort original 100000

## # BubbleSort test case
init BubbleSort
exec BubbleSort original 1000
exec BubbleSort original 10000
exec BubbleSort original 100000

## MatrixMult test case
init MatrixMult
exec MatrixMult original 1000
exec MatrixMult original 2000
exec MatrixMult original 3000
#exec MatrixMult original 8000
# exec MatrixMult original 12000 # Naive code runs out of memory
exec MatrixMult transpose 1000
exec MatrixMult transpose 2000
exec MatrixMult transpose 3000


## Fibonacci test case
init Fibonacci
exec Fibonacci original 10
exec Fibonacci original 50
exec Fibonacci original 90

## Greatest Common Divisor (GCD) test case ##
init GCD
exec GCD original 100
exec GCD original 150
exec GCD original 200
exec GCD cached 100
exec GCD cached 150
exec GCD cached 200

### CoinGame test case ###
init CoinGame
exec CoinGame original 1000
exec CoinGame original 2000
exec CoinGame original 3000

exec CoinGame single 1000
exec CoinGame single 2000
exec CoinGame single 3000

exec CoinGame array 1000
exec CoinGame array 2000
exec CoinGame array 3000


###Sobel Edge test
init SobelEdge
exec SobelEdge original 256
exec SobelEdge original 512
exec SobelEdge original 1024

## LZ77 test case
init LZ77
exec LZ77 original 1000
exec LZ77 original 10000
exec LZ77 original 50000

## NQueen test case
init NQueens
exec NQueens original 8
exec NQueens original 10
exec NQueens original 12
exec NQueens original 14
exec NQueens original 15

exec NQueens integer 8
exec NQueens integer 10
exec NQueens integer 12
exec NQueens integer 14
exec NQueens integer 15