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
					   [MergeSort]="gcc" [MatrixMult]="gcc" \
					   [Cashtill]="gcc" [CoinGame]="gcc"\
					   [LZ77]="gcc" [SobelEdge]="gcc" )

## declare 4 kinds of code generation
declare -a codegens=("naive" "naivedealloc" "nocopy" "nocopydealloc")

## Declare an associative array for pattern matching
declare -A patterns=( [LZ77_compress]=compress [LZ77_original_opt]=compress )

## declare the number of threads
declare -a threads=( 1 )

### declare parameters
declare -A parameters=( [Reverse]="100000 1000000 10000000" [newTicTacToe]="100000 200000 300000" \
			[BubbleSort]="1000 10000 100000" [MergeSort]="1000 10000 100000" \
			[MatrixMult]="1000 2000 3000" \
			[LZ77]="medium1x medium2x medium4x" \
			[SobelEdge]="image64x64.pbm image128x128.pbm image256x256.pbm" \
			[Cashtill]="100 200 300" \
			##[CoinGame]="25000"
			[CoinGame]="100 1000 10000"
		    )
## Declare an associative array for image size in sobeledge test case
declare -A widths=( [image32x32.pbm]=32 [image64x64.pbm]=64 [image128x128.pbm]=128 \
                    [image256x256.pbm]=256 [image512x512.pbm]=512 [image1024x1024.pbm]=1024 )

### Create the 'leak' folder and clean up the files
init(){
	testcase=$1
	leakdir="$BENCHMARKDIR/$testcase/leaks"
	mkdir -p "$leakdir"
	### remove all files inside the folder
	rm -f "$leakdir/"*.*
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
	##read -p "Complete 'generateCode' function Press [Enter] to continue..."
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
			## Include debug messages
			gcc -g -std=c11 -O0 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"clang")
			clang -O0 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
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

##
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pattern=$5
	code=$6
	thread=$7
	parameter=$8
	### the folder of generated code
	codeDir=$BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code
	cd $codeDir

	mkdir -p out
	### The file of executable
	executable="$testcase.$program.$compiler.$pattern.$codegen.$code.out"

	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	result="$BENCHMARKDIR/$testcase/leaks/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
	## read -p "Press [Enter] to continue...$parameter"

	## Test case
	case "$testcase" in
		"LZ77")
			case "$program" in
				"original")
					valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.in"
					;;
				"original_opt")
					valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.in"
					;;
				"compress")
					valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/Inputfiles/$parameter.in"
					;;
				"decompress")
					valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/Outputfiles/$parameter.dat"
					;;
				"opt_decompress")
					valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/Outputfiles/$parameter.dat"
					;;
			esac
			;;
		"SobelEdge")
			#echo $parameter
			width=${widths[$parameter]}
			echo "width = "$width
			## Copy PBM image to folder
			inputfile=$BENCHMARKDIR/$testcase/images/input/$parameter
			outputfile=$BENCHMARKDIR/$testcase/images/output/$program"_"C"_"$compiler"_"$pattern"_"$codegen"_"$code"_"$parameter
			##read -p "Press [Enter] to continue..."$outputfile":"$inputfile
			valgrind --tool=memcheck "--log-file=$result" "out/$executable" $width $inputfile
			;;
		*)
			## Other cases
			valgrind --tool=memcheck "--log-file=$result" "./out/$executable" $parameter
			;;
	esac

	#valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all "--log-file=$result" ./out/"$program.$compiler.enableVC.out" $parameter
	# Added the CPU info
	cat /proc/cpuinfo >> $result
}
#
# Run Valgrind to detect memory leaks
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
				generateCode $testcase $program $compiler $codegen "disabledpattern" "seq"
				# Detect the leaks of generated C code using different compiler
				compile $testcase $program $compiler $codegen "disabledpattern" "seq"

				# ## Get the pattern option
				func=${patterns[$testcase"_"$program]}
				if [ $func ]
				then
					echo $func
					# Generate C code with enabled pattern matching and transform
					generateCode $testcase $program $compiler $codegen "enabledpattern" "seq"
					# Detect the leaks of generated C code using different compiler
					compile $testcase $program $compiler $codegen "enabledpattern" "seq"
				fi

				for param_arr in "${parameters[$testcase]}"
				do
					for parameter in $param_arr
					do
						echo "parameter "$parameter
						detectleaks $testcase $program $compiler $codegen "disabledpattern" "seq" 1 $parameter
						# ## Get the pattern option
						func=${patterns[$testcase"_"$program]}
						if [ $func ]
						then
							## Run the executable
							detectleaks $testcase $program $compiler $codegen "enabledpattern" "seq" 1 $parameter
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

# # # # # # # ### Reverse test case##
#init Reverse
#exec Reverse original
# # #
# # # # # # ### newTicTacToe test case ###
# init newTicTacToe
# exec newTicTacToe original
# # #
# # # # # # ## # BubbleSort test case##
#init BubbleSort
#exec BubbleSort original
# # #
# # # # # # ## # MergeSort test case##
#init MergeSort
#exec MergeSort original
# # #
# # # # # # # MatrixMult test case##
#init MatrixMult
#exec MatrixMult original

# #### Cashtill test case
#init Cashtill
#exec Cashtill original

# ### CoinGame test case ###
#init CoinGame
#exec CoinGame original

# # # ###Sobel Edge test
init SobelEdge
exec SobelEdge original

# # # ####LZ77 test case
#init LZ77
#exec LZ77 original
#exec LZ77 original_opt
#exec LZ77 compress
#exec LZ77 decompress
#exec LZ77 opt_decompress
# ### Fibonacci test case###
# init Fibonacci
# exec Fibonacci original 10
# exec Fibonacci original 20
# exec Fibonacci original 30

# ### GCD (Greatest Common Divisor) test case###
# init GCD
# exec GCD original 10
# exec GCD original 20
# exec GCD original 30
# exec GCD cached 10
# exec GCD cached 20
# exec GCD cached 30

# # ### NQueen test case
# init NQueens
# exec NQueens original 8
# exec NQueens original 9
# exec NQueens original 10
# exec NQueens integer 8
# exec NQueens integer 9
# exec NQueens integer 10
