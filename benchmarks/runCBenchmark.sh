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
declare -A compilers=( [Reverse]="gcc" [newTicTacToe]="gcc" [BubbleSort]="gcc" \
					   [MergeSort]="gcc" [MatrixMult]="gcc polly openmp" \
					   [LZ77]="gcc" [SobelEdge]="gcc" [Cashtill]="gcc" \
					   [AppendArrayPattern]="gcc" )

## declare 4 kinds of code generation
declare -a codegens=("naive" "naive_dealloc" "nocopy" "nocopy_dealloc")
##declare -a codegens=("naive")

## Declare an associative array for pattern matching
declare -A patterns=( [LZ77]=compress [AppendArrayPattern]=comp )

## declare the number of threads
declare -a threads=( 1 2 3 4 )

### declare parameters
declare -A parameters=( [Reverse]="100000 1000000 10000000" [newTicTacToe]="1000 10000 100000" \
						[BubbleSort]="1000 10000 100000" [MergeSort]="1000 10000 100000" \
						[MatrixMult]="1000 2000 3000" \
						[LZ77]="input1x.in input2x.in input3x.in input4x.in input5x.in input6x.in input7x.in input8x.in input9x.in input10x.in" \
						[SobelEdge]="image32x32.pbm image64x64.pbm image128x128.pbm image256x256.pbm image512x512.pbm image1024x1024.pbm" \
						#[SobelEdge]="image32x32.pbm image64x64.pbm image128x128.pbm" \
						[Cashtill]="1000 1200 1400 1600 1800 2000" \
						#[Cashtill]="100 200 300"
						[AppendArrayPattern]="10000 20000 40000 60000 80000 100000" \
						#[AppendArrayPattern]="100 200 300" \
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
}

### Generate C code
generateCode(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5
	
	### the folder of generated code
	codeDir="$BENCHMARKDIR/$testcase/impl/$program/C/$compiler/$pattern/$codegen"

	###echo $codeDir
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"
	### Copy Util.c Util.h to current folder
	cp $UTILDIR/Util.c $UTILDIR/Util.h $UTILDIR/WyRT.h $UTILDIR/WyRT.c "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Disable pattern transformation
	wyopcl=./../../../../../../../../bin/wyopcl
	if [ $pattern = "enabledpattern" ] 
	then
		func=${patterns[$testcase]}
		### Enable pattern transformation
		wyopcl=$wyopcl" -pattern $func"	
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
## Compile the program and 
##
compile(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5

	### the folder of generated code
	codeDir="$BENCHMARKDIR/$testcase/impl/$program/C/$compiler/$pattern/$codegen"
	cd $codeDir
	
	####Create 'out', 'llvm' and 'assembly' folder
	rm -rf "out" "llvm" "assembly"
	mkdir -p "out" "llvm" "assembly"
	### The executable file name
	executable="$testcase.$program.$compiler.$codegen.$pattern.out"
	
	### Compile C code into executables
	case "$compiler" in
		"gcc")
			gcc -std=c11 -O3 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"clang")
			clang -O3 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"polly")
			###'-polly-process-unprofitable' option forces Polly to generate sequential code
			pollycc -mllvm -polly-vectorizer=stripmine \
	        		-S -emit-llvm -mllvm -polly-process-unprofitable \
					-mllvm -polly-opt-outer-coincidence=yes \
	        		$testcase"_"$program.c -o "llvm/$executable.ll"
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm/$executable.ll" -o "assembly/$executable.s"
			### Use 'clang' to compile .s file and link with 'libUtil.a'
			clang "assembly/$executable.s" Util.c WyRT.c -o "out/$executable"
			;;
		"openmp")
			echo "Optimize C code using OpenMP code ..."
			### '-polly-parallel-force' forces Polly to generate OpenMP code
			pollycc -mllvm -polly-vectorizer=stripmine -S -emit-llvm \
	        		-mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force \
					-mllvm -polly-opt-outer-coincidence=yes \
	        		$testcase"_"$program.c -o "llvm/$executable.ll"
			### Use 'llc' to compile LLVM code into assembly code
			llc "llvm/$executable.ll" -o "assembly/$executable.s"
			### Use 'clang' to compile .s file and link with 'Util.c'
			clang "assembly/$executable.s" Util.c WyRT.c -lgomp -o "out/$executable"
			;;
	esac
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

	### the folder of generated code
	codeDir="$BENCHMARKDIR/$testcase/impl/$program/C/$compiler/$pattern/$codegen"
	cd $codeDir

	prefix="$testcase.$program.$compiler.$codegen.$pattern"
	### The file of executable
	executable="$prefix.out"
	
	## Output the file of execution time 
	mkdir -p "$BENCHMARKDIR/$testcase/exectime/C"
	result="$BENCHMARKDIR/$testcase/exectime/C/$prefix.$parameter.$thread.txt"

	###Export the number of threads for OpenMP code
	if [ $compiler = "openmp" ]
	then
		export OMP_NUM_THREADS=$thread
	fi
	
	echo "Run the $program $testcase on $parameter using $compiler and $thread threads..." > $result
	echo "Run the $program $testcase on $parameter using $thread threads..."
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
				width=${widths[$parameter]}
				echo "width = "$width
				## Copy PBM image to folder
				cp "$BENCHMARKDIR/$testcase/image/$parameter" .
				mkdir -p "$BENCHMARKDIR/$testcase/image/output/$codegen"
				##read -p "Press [Enter] to continue..."
				timeout $TIMEOUT "out/$executable" $parameter $width > "$BENCHMARKDIR/$testcase/image/output/$codegen/output$widthx$width.pbm"
				##read -p "Press [Enter] to continue..."
			else
				if [ $testcase = "Cashtill" ]
				then 
					### Output the result to console without writing it to the file
					timeout $TIMEOUT "out/$executable" $parameter
				else
					## Other cases
					timeout $TIMEOUT "out/$executable" $parameter >> $result
				fi
			fi
		fi
		## Check exit status
		if [ "$?" = "0" ]; then
			end=`date +%s%N`
			exectime=$((end-start))
			printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		fi
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

	for compiler_arr in "${compilers[$testcase]}"
	do
		for compiler in $compiler_arr
		do
			echo $compiler
			# ## Iterate each codegen
			for codegen in "${codegens[@]}"
			do
				echo $codegen		
				# Generate C code with disabled pattern 
				generateCode $testcase $program $compiler $codegen "disabledpattern" 
				# Detect the leaks of generated C code using different compiler
				compile $testcase $program $compiler $codegen "disabledpattern"

				# ## Get the pattern option 
				func=${patterns[$testcase]}
				if [ $func ]
				then
					echo $func
					# Generate C code with enabled pattern matching and transform 
					generateCode $testcase $program $compiler $codegen "enabledpattern"
					# Detect the leaks of generated C code using different compiler
					compile $testcase $program $compiler $codegen "enabledpattern"
				fi

				for param_arr in "${parameters[$testcase]}"
				do
					for parameter in $param_arr
					do
						echo "parameter "$parameter
						if [ $compiler = "openmp" ]
						then
							### Run the executable with multiple threads (1, 2, 3, 4)
							for thread in "${threads[@]}"
							do
								echo "thread " . $thread
								run $testcase $program $compiler $codegen "disabledpattern" $parameter $thread
							done
						else
						 	run $testcase $program $compiler $codegen "disabledpattern" $parameter 1
						fi

						# ## Get the pattern option 
						func=${patterns[$testcase]}
						if [ $func ]
						then							
							## Run the executable
							run $testcase $program $compiler $codegen "enabledpattern" $parameter 1
						fi
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
# # # ## # Reverse test case
# init Reverse
# exec Reverse original

# # # # # # # # newTicTacToe test case
# init newTicTacToe
# exec newTicTacToe original

# # # # # ## # BubbleSort test case
# init BubbleSort
# exec BubbleSort original

# # # # # ## # MergeSort test case
# init MergeSort
# exec MergeSort original

# # # # # MatrixMult test case
# init MatrixMult
# exec MatrixMult original
####exec MatrixMult original 12000 # Naive code runs out of memory
# # exec MatrixMult transpose 1000
# # exec MatrixMult transpose 2000
# # exec MatrixMult transpose 3000
# # exec MatrixMult 2DArray 1000
# # exec MatrixMult 2DArray 2000
# # exec MatrixMult 2DArray 3000

# # ###Sobel Edge test
#init SobelEdge
#exec SobelEdge original

# ### Cashtill test case
#init Cashtill
#exec Cashtill original

# #### AppendArrayPattern test case
#init AppendArrayPattern
#exec AppendArrayPattern original 

#### LZ77 test case
init LZ77
exec LZ77 original

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

