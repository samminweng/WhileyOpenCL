#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
# Run Polly from clang
alias pollycc="clang -O3 -mllvm -polly"
### Get the root working directory
UTILDIR="$(dirname "$(pwd)")/tests/code"
BENCHMARKDIR="$(pwd)"

## declare compiler used for compilation
declare -A compilers=( [Reverse]="gcc" [newTicTacToe]="gcc" [BubbleSort]="gcc" [MergeSort]="gcc" [MatrixMult]="gcc" \
					   [LZ77]="gcc" [SobelEdge]="gcc polly" [Cashtill]="gcc" \
					   [CoinGame]="polly gcc" )
## declare 4 kinds of code generation
#declare -a codegens=( "naive" "naivedealloc" "nocopy" "nocopydealloc" )
declare -a codegens=( "nocopy" )

## Declare an associative array for pattern matching
declare -A patterns=( [LZ77_compress]=compress )

## declare the number of threads
declare -a threads=( 1 2 4 6 8 )

### declare parameters
declare -A parameters=( [Reverse]="200000000 400000000 600000000 800000000 1000000000" \
						#[Reverse]="1000 10000 100000 1000000 10000000 100000000" \
						[newTicTacToe]="1000 10000 100000" [BubbleSort]="1000 10000 100000" [MergeSort]="1000 10000 100000" \
						[MatrixMult]="1000 2000 4000" \
						[LZ77]="input1x input2x input4x input8x input16x input32x input64x input128x input256x input512x input1024x" \
						#[LZ77]="input1024x" \
						[SobelEdge]="image32x32.pbm image64x64.pbm image128x128.pbm image256x256.pbm image512x512.pbm image1024x1024.pbm" \
						#[SobelEdge]="image32x32.pbm image64x64.pbm image128x128.pbm" \
						[Cashtill]="1000 1200 1400 1600 1800 2000" \
						#[Cashtill]="100 200 300"
						#[AppendArrayPattern]="10000 20000 40000 60000 80000 100000" \
						[CoinGame]="10000 12000 14000 16000 18000 20000 22000" \
					   )
## Declare an associative array for image size in sobeledge test case
declare -A widths=( [image32x32.pbm]=32 [image64x64.pbm]=64 [image128x128.pbm]=128 \
                    [image256x256.pbm]=256 [image512x512.pbm]=512 [image1024x1024.pbm]=1024 )

### Create the folder and/or clean up the files
init(){
	testcase=$1
	dir="$BENCHMARKDIR/$testcase/exectime/C"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
	## Remove all folder and file inside 'impl''
	rm -rf $BENCHMARKDIR/$testcase/impl
	mkdir -p $BENCHMARKDIR/$testcase/impl
}

### Generate C code
generateCode(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5
	code=$6
	### the folder of generated code
	### specify the executable type
	codeDir=$BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code
	### Shell script that generates C code
	wyopcl=./../../../../bin/wyopcl
	## Enable the pattern matching on the specified function
	if [ $pattern = "enabledpattern" ]
	then
		func=${patterns[$testcase"_"$program]}
		if [ -n "$func" ]
		then
			### Enable pattern transformation
			wyopcl=$wyopcl" -pattern $func"
		fi
	fi
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"
	### Copy Util.c Util.h to current folder
	cp $UTILDIR/Util.c $UTILDIR/Util.h $UTILDIR/WyRT.h $UTILDIR/WyRT.c "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			### Translate Whiley program into naive C code
			$wyopcl -code $testcase"_"$program.whiley
			;;
		"naivedealloc")
			### Translate Whiley program into naive + dealloc C code
			$wyopcl -code -dealloc $testcase"_"$program.whiley
			;;
		"nocopy")
			## Translate Whiley programs into copy_reduced C code
			$wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"nocopydealloc")
			### Translate Whiley program into copy-eliminated + memory deallocated C code
			$wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley
			;;
	esac
	#read -p "Complete 'generateCode' function Press [Enter] to continue..."
}


##
## Compile the program and
##
compile(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5
	code=$6
	### the folder of generated code
	codeDir=$BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code
	### The executable file name
	executable="$testcase.$program.$compiler.$pattern.$codegen.$code.out"

	## Change directory to codeDir
	cd $codeDir
	####Create 'out' folder
	rm -rf "out"
	mkdir -p "out"

	### Compile C code into executables
	case "$compiler" in
		"gcc")
			gcc -std=c11 -O3 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"clang")
			clang -O3 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"polly")
			if [ $code = "seq" ]
			then
				## Compile and optimize sequential code using Polly
				#pollycc -mllvm -polly-pattern-matching-based-opts=false -mllvm -polly-opt-outer-coincidence=yes $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
				pollycc $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			else
				echo "Generate OpenMP code ..."
				### Compile and generate parallel OpenMP code using Polly
				#pollycc -mllvm -polly-pattern-matching-based-opts=false -mllvm -polly-opt-outer-coincidence=yes -mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
				pollycc -mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			fi
			;;
	esac
	##read -p "Complete 'compile' function Press [Enter] to continue..."
}
## Run the executable with given parameters
run(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5
	parameter=$6
	thread=$7
	## Executable type (seq, openmp)
	code=$8
	### The file of executable
	executable="$testcase.$program.$compiler.$pattern.$codegen.$code.out"
	## File of execution time
	result="$BENCHMARKDIR/$testcase/exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
	### the folder of generated code
	codeDir=$BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code

	## Change folder
	cd $codeDir

	## Output the file of execution time
	mkdir -p "$BENCHMARKDIR/$testcase/exectime/C"

	echo "Run the $program $testcase on $parameter using $compiler and $thread threads..." > $result
	echo "Run the $program $testcase on $parameter using $thread threads..."
	for i in {1..10}
	do
		echo "Run the $program $testcase on $parameter using $compiler" >> $result
		echo "Begin $i iteration" >> $result
		#read -p "Press [Enter] to continue..."
		#timeout $TIMEOUT perf stat out/"$executable.out" $parameter >>$result 2>> $result
		start=`date +%s%N`
		case "$testcase" in
			"LZ77")
				#read -p "Press [Enter] to continue..."
				if [ $program = "compress" ]
				then
					timeout $TIMEOUT "out/$executable" "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.in" \
									 "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.dat" >> $result
				else
					timeout $TIMEOUT "out/$executable" "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.dat"  >> $result
				fi
				;;
			"SobelEdge")
				#echo $parameter
				width=${widths[$parameter]}
				echo "width = "$width
				## Copy PBM image to folder
				inputfile=$BENCHMARKDIR/$testcase/images/input/$parameter
				outputfile=$BENCHMARKDIR/$testcase/images/output/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code"_"$parameter
				##read -p "Press [Enter] to continue..."$outputfile":"$inputfile
				timeout $TIMEOUT "out/$executable" $width $inputfile > $outputfile
				;;
			"Cashtill")
				### Output the result to console without writing it to the file
				timeout $TIMEOUT "out/$executable" $parameter
				;;
			*)
				###Export the number of threads for OpenMP code
				if [ $code = "openmp" ]
				then
					export OMP_NUM_THREADS=$thread
					echo "OMP_NUM_THREADS="$OMP_NUM_THREADS
				fi
				## Other cases
				timeout $TIMEOUT "out/$executable" $parameter >> $result
				;;
		esac
		## Get exit code
		exitcode="$?"
		## Exit code of time out
		if [ "$exitcode" == "124" ]
		then
			printf "\nOOT: Run out of time $TIMEOUT\n" >> $result
			break 1 ## Break the for loop
		fi
		##
		## Check exit status
		if [ "$exitcode" = "0" ]
		then
			end=`date +%s%N`
			exectime=$((end-start))
			printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		else
			printf "\nOOM:Run out of memory\n" >> $result
			break 1 ## Break the for loop
		fi
		echo "Finish $i iteration" >> $result
		####### Wait until background process is completed
		wait ${!}
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
	#read -p "Complete 'run' function Press [Enter] to continue..."
}

#
# Execute benchmarks
#
exec(){
	testcase=$1
	program=$2
	for compiler_arr in "${compilers[$testcase]}"
	do
		for compiler in $compiler_arr
		do
			echo $compiler
			# ## Iterate each codegen
			for codegen in "${codegens[@]}"
			do
				echo $codegen
				str=${patterns[$testcase"_"$program]}
				echo $str
				# Test pattern is missing or not (non-empty string (-n))
				if [ -n "$str" ]
				then
					patternmatches="disabledpattern enabledpattern"
					#read -p "Found Pattern..."${patternmatches}
				else
					patternmatches="disabledpattern"
				fi
				#patternmatches="enabledpattern"
				#read -p "Press [Enter] to continue..."$patternmatches
				## Go through patternmatch setting
				for patternmatch in ${patternmatches}
				do
					echo $patternmatch
					# Generate sequential C code
					generateCode $testcase $program $compiler $codegen $patternmatch "seq"
					# Compile C code
					compile $testcase $program $compiler $codegen $patternmatch	"seq"
					## Run Polly
					if [ $compiler = "polly" ]
					then
						## Generate parallel code using Polly compiler
						echo $code
						# Generate C code
						generateCode $testcase $program $compiler $codegen $patternmatch "openmp"
						# Compile C code using different compiler
						compile $testcase $program $compiler $codegen $patternmatch "openmp"
					fi
					## Run the benchmarks with a variety of parameters
					for param_arr in "${parameters[$testcase]}"
					do
						for parameter in $param_arr
						do
							echo "parameter "$parameter
							## Run sequential executable
							run $testcase $program $compiler $codegen $pattern $parameter 1 "seq"
							if [ $compiler = "polly" ]
							then
								### Run OpenMP executable with multiple threads (1, 2, 3, 4)
								for thread in "${threads[@]}"
								do
									echo "thread = "$thread
									run $testcase $program $compiler $codegen $pattern $parameter $thread "openmp"
								done
							fi
						done
					done
				done
			done
		done
	done
	# #Return to the working directory
 	cd $BENCHMARKDIR
	###read -p "Press [Enter] to continue..."
}

# # ############################################
# # ###
# # ###  Benchmark the generated code
# # ###  (naive + de-allocated, copy_reduced, copy_reduced + de-allocated)
# # ###
# # ###########################################
# # # # ## # Reverse test case
#init Reverse
#exec Reverse original

# # # # # # # # # # newTicTacToe test case
#init newTicTacToe
#exec newTicTacToe original

# # # # # # # ## # BubbleSort test case
#init BubbleSort
#exec BubbleSort original

# # # # # # # ## # MergeSort test case
#init MergeSort
#exec MergeSort original

# # # # # # # MatrixMult test case
#init MatrixMult
#exec MatrixMult original
####exec MatrixMult original 12000 # Naive code runs out of memory
# # ### CoinGame test case ###
#init CoinGame
#exec CoinGame original
#exec CoinGame array

#### LZ77 test case
init LZ77
#exec LZ77 compress
#exec LZ77 decompress
exec LZ77 optimised_decompress

# # ###Sobel Edge test
#init SobelEdge
#exec SobelEdge original

# ### Cashtill test case
#init Cashtill
#exec Cashtill original



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
