#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
# Run Polly from clang
#alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
### Get the root working directory
UTILDIR="$(dirname "$(pwd)")/tests/code"
BENCHMARKDIR="$(pwd)"

## Declare an associative array for sobeledge
declare -A images=( [small.pbm]=64 )
## Declare an associative array for pattern matching
declare -A patterns=( [LZ77]=compress )

## declare 4 kinds of code generation
declare -a codegens=("naive" "naive_dealloc" "nocopy" "nocopy_dealloc")
#declare -a codegens=("naive" "naive_dealloc" "nocopy")


### Create the folder and/or clean up the files
init(){
	testcase=$1
	dir="$BENCHMARKDIR/$testcase/exectime/GCC"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
}

### Generate C code
generateCode(){
	testcase=$1
	program=$2
	codegen=$3
	enabledpattern=$4

	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		codeDir="$BENCHMARKDIR/$testcase/impl/$program/patern/$codegen"
		pattern=$5
	else
		### Disable pattern transformation
		codeDir="$BENCHMARKDIR/$testcase/impl/$program/nopatern/$codegen"
	fi
	###echo $codeDir
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"
	### Copy Util.c Util.h to current folder
	cp $UTILDIR/Util.c $UTILDIR/Util.h "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Disable pattern transformation
	wyopcl=./../../../../../../bin/wyopcl
	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		wyopcl=$wyopcl" -pattern $pattern"	
	fi
	echo $codegen
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			### Translate Whiley program into naive C code
			$wyopcl -code $testcase"_"$program.whiley
			;;
		"naive_dealloc")
			### Translate Whiley program into naive + dealloc C code 
			$wyopcl -code -dealloc $testcase"_"$program.whiley
			;;
		"nocopy")
			## Translate Whiley programs into copy_reduced C code
			$wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"nocopy_dealloc")
			### Translate Whiley program into copy-eliminated + memory deallocated C code
			$wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley
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
	enabledpattern=$4
	parameter=$5
	compiler=$6
	num_threads=$7
	####Create 'out', 'llvm' and 'assembly' folder
    rm -rf "out" "llvm" "assembly"
	mkdir -p "out" "llvm" "assembly"
	### The executable file name
	if [ $enabledpattern == 1 ]
	then 
		executable="$testcase.$program.$codegen.enabledpattern.$compiler.$num_threads.$parameter.out"
	else
		executable="$testcase.$program.$codegen.disabledpattern.$compiler.$num_threads.$parameter.out"
	fi
	result="$BENCHMARKDIR/$testcase/exectime/GCC/$executable.txt"
    ### Compile C code into executables
	case "$compiler" in
		"gcc")
			gcc -std=c11 -O3 $testcase"_"$program.c Util.c -o "out/$executable"
			;;
		"clang")
			clang -O3 $testcase"_"$program.c Util.c -o "out/$executable"
			;;
		"polly")
			###'-polly-process-unprofitable' option forces Polly to generate sequential code
			pollycc -mllvm -polly-vectorizer=stripmine\
	        		-S -emit-llvm -mllvm -polly-process-unprofitable\
					-mllvm -polly-opt-outer-coincidence=yes\
	        		$testcase"_"$program.c -o "llvm/$executable.ll"
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm/$executable.ll" -o "assembly/$executable.s"
			### Use 'clang' to compile .s file and link with 'libUtil.a'
			clang "assembly/$executable.s" Util.c -o "out/$executable"
			;;
		"openmp")
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			### '-polly-parallel-force' forces Polly to generate OpenMP code
			export OMP_NUM_THREADS=$num_threads
			pollycc -mllvm -polly-vectorizer=stripmine -S -emit-llvm\
	        		-mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
					-mllvm -polly-opt-outer-coincidence=yes\
	        		$testcase"_"$program.c -o "llvm/$executable.ll"
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm/$executable.ll" -o "assembly/$executable.s"
			### Use 'clang' to compile .s file and link with 'Util.c'
			clang "assembly/$executable.s" Util.c -lgomp -o "out/$executable"
			###Export the number of threads for OpenMP code
			export OMP_NUM_THREADS=$num_threads
			;;
	esac
	
	echo "Run the $program $testcase on $parameter using $compiler and $num_threads threads..." > $result
	echo "Run the $program $testcase on $parameter using $num_threads threads..."
	for i in {1..10}
	do
		echo "Run the $program $testcase on $parameter using $compiler" >> $result
		echo "Begin $i iteration" >> $result
		#timeout $TIMEOUT perf stat out/"$executable.out" $parameter >>$result 2>> $result
		start=`date +%s%N`
		## LZ test case
		if [ $testcase = "LZ77" ]
		then
			timeout $TIMEOUT "out/$executable" "$BENCHMARKDIR/$testcase/$parameter" >> $result
		else
			if [ $testcase = "SobelEdge" ]
			then
				#echo $parameter
				size=${images[$parameter]}
				echo "Size = "$size 
				## Copy PBM image to folder
				cp "$BENCHMARKDIR/$testcase/image/$parameter" .
				##read -p "Press [Enter] to continue..."
				timeout $TIMEOUT "out/$executable" $parameter $size > "output.pbm"
				##read -p "Press [Enter] to continue..."
			else
				## Other cases
				timeout $TIMEOUT "out/$executable" $parameter >> $result
			fi
		fi
		end=`date +%s%N`
		exectime=$((end-start))
		printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		echo "Finish $i iteration" >> $result
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

	# ## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		## disabled the pattern
		enabledpattern=0
		# Generate C code with disabled pattern 
		generateCode $testcase $program $codegen $enabledpattern
		# Detect the leaks of generated C code using different compiler
		compileAndRun $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		## Get the pattern option 
		pattern=${patterns[$testcase]}
		if [ $pattern ]
		then
			# Enable the pattern matching
			enabledpattern=1
			# Generate C code with enabled pattern 
			generateCode $testcase $program $codegen $enabledpattern $pattern
			# Detect the leaks of generated C code using different compiler
			compileAndRun $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		fi
	done
	# #Return to the working directory
 	cd $BENCHMARKDIR
	###read -p "Press [Enter] to continue..."
}

# # ############################################
# # ###
# # ###  Benchmark 2 kinds of generated code
# # ###  (naive + de-allocated, copy_reduced, copy_reduced + de-allocated)
# # ###
# # ###########################################
# # ## # Reverse test case
# init Reverse
# exec Reverse original 100000
# exec Reverse original 1000000
# exec Reverse original 10000000

# # # # # newTicTacToe test case
# init newTicTacToe
# exec newTicTacToe original 1000
# exec newTicTacToe original 10000
# exec newTicTacToe original 100000

# # # ## # MergeSort test case
# init MergeSort
# exec MergeSort original 1000
# exec MergeSort original 10000
# exec MergeSort original 100000

# # ## # BubbleSort test case
# init BubbleSort
# exec BubbleSort original 1000
# exec BubbleSort original 10000
# exec BubbleSort original 100000

# # # MatrixMult test case
# init MatrixMult
# exec MatrixMult original 1000
# exec MatrixMult original 2000
# exec MatrixMult original 3000
#exec MatrixMult original 8000
##exec MatrixMult original 12000 # Naive code runs out of memory
# # # exec MatrixMult transpose 1000
# # # exec MatrixMult transpose 2000
# # # exec MatrixMult transpose 3000
# # # exec MatrixMult 2DArray 1000
# # # exec MatrixMult 2DArray 2000
# # # exec MatrixMult 2DArray 3000

# # ## Fibonacci test case
# # init Fibonacci
# # exec Fibonacci original 10
# # exec Fibonacci original 50
# # exec Fibonacci original 90

# # ## Greatest Common Divisor (GCD) test case ##
# # init GCD
# # exec GCD original 100
# # exec GCD original 150
# # exec GCD original 200
# # exec GCD cached 100
# # exec GCD cached 150
# # exec GCD cached 200

# # ### CoinGame test case ###
# # init CoinGame
# # exec CoinGame original 1000
# # exec CoinGame original 2000
# # exec CoinGame original 3000
# # exec CoinGame single 1000
# # exec CoinGame single 2000
# # exec CoinGame single 3000
# # exec CoinGame array 1000
# # exec CoinGame array 2000
# # exec CoinGame array 3000


# # ###Sobel Edge test
init SobelEdge
exec SobelEdge original "small.pbm"
# exec SobelEdge original 128
# exec SobelEdge original 256
# exec SobelEdge original 512
# exec SobelEdge original 1024


# ## NQueen test case
# init NQueens
# exec NQueens original 8
# exec NQueens original 10
# exec NQueens original 12
# exec NQueens original 14

# exec NQueens integer 8
# exec NQueens integer 10
# exec NQueens integer 12
# exec NQueens integer 14

#### LZ77 test case
#init LZ77
#exec LZ77 original "small.in"
#exec LZ77 original "medium.in"
#exec LZ77 original "large.in"
