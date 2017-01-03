#!/bin/bash
TIMEOUT="1800s"
alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
### Get the root working directory
UTILDIR="$(dirname "$(pwd)")/tests/code"
BENCHMARKDIR="$(pwd)"

## Declare an associative array for image size in sobeledge test case
declare -A widths=( [image32x32.pbm]=32 [image64x64.pbm]=64 [image128x128.pbm]=128 \
	                [image256x256.pbm]=256 [image512x512.pbm]=512 )
## Declare an associative array for pattern matching
declare -A patterns=( [LZ77]=compress [AppendArrayPattern]=comp )

## declare 4 kinds of code generation
declare -a codegens=("naive" "naive_dealloc" "nocopy" "nocopy_dealloc")
##declare -a codegens=("naive_dealloc" "nocopy" "nocopy_dealloc")


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
	codegen=$3
	enabledpattern=$4
	
	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		codeDir="$BENCHMARKDIR/$testcase/impl/$program/C/pattern/$codegen"
		pattern=$5
	else
		### Disable pattern transformation
		codeDir="$BENCHMARKDIR/$testcase/impl/$program/C/nopattern/$codegen"
	fi
	#echo $codeDir
	#read -p "Press [Enter] to continue..."
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"
	### Copy Util.c Util.h WyRT.c WyRT.h to current folder
	cp $UTILDIR/Util.c $UTILDIR/Util.h $UTILDIR/WyRT.h $UTILDIR/WyRT.c "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Disable pattern transformation
	wyopcl=./../../../../../../../bin/wyopcl
	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		wyopcl=$wyopcl" -pattern $pattern"	
	fi
	#echo $codegen
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
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
	testcase=$1
	program=$2
	codegen=$3
	enabledpattern=$4
	parameter=$5
	compiler=$6
	num_threads=$7
	mkdir -p out
	if [ $enabledpattern == 1 ]
	then 
		executable="$testcase.$program.$codegen.enabledpattern.$compiler.$num_threads.$parameter.out"
	else
		executable="$testcase.$program.$codegen.disabledpattern.$compiler.$num_threads.$parameter.out"
	fi

	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	result="$BENCHMARKDIR/$testcase/leaks/$executable.txt"
	#read -p "Press [Enter] to continue..."
	echo -e -n "Start Detect leaks..." > $result
	case "$compiler" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -std=c11 -g -O3 $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 -D DEBUG $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					$testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
					-mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c WyRT.c -o "out/$executable"
			;;
	esac
	##read -p "Press [Enter] to continue...$parameter"

	## LZ test case
	if [ $testcase = "LZ77" ]
	then
		valgrind --tool=memcheck "--log-file=$result" "./out/$executable" "$BENCHMARKDIR/$testcase/$parameter"
	else
		if [ $testcase = "SobelEdge" ]
		then
			#echo $parameter
			width=${widths[$parameter]}
			echo "width = "$width
			## Copy PBM image to folder
			cp "$BENCHMARKDIR/$testcase/image/$parameter" .				
			mkdir -p "$BENCHMARKDIR/$testcase/image/output/$codegen"
			### Detect the memory leaks
			valgrind --tool=memcheck "--log-file=$result" "./out/$executable" $parameter $width > "$BENCHMARKDIR/$testcase/image/output/$codegen/output$widthx$width.pbm"
		else
			## Other cases
			valgrind --tool=memcheck "--log-file=$result" "./out/$executable" $parameter
		fi
	fi
	
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
	parameter=$3

	# ## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		## disabled the pattern
		enabledpattern=0
		# Generate C code with disabled pattern 
		generateCode $testcase $program $codegen $enabledpattern
		# Detect the leaks of generated C code using different compiler
		detectleaks $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		## Get the pattern option 
		pattern=${patterns[$testcase]}		
		if [ $pattern ]
		then
			###read -p "Press [Enter] to continue...$pattern"
			# Enable the pattern matching
			enabledpattern=1
			# Generate C code with enabled pattern 
			generateCode $testcase $program $codegen $enabledpattern $pattern
			# Detect the leaks of generated C code using different compiler
			detectleaks $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		fi
	done
	# #detectleaks $testcase $program $codegen $parameter "clang" 1
	# #detectleaks $testcase $program $codegen $parameter "polly" 1
	# #detectleaks $testcase $program $codegen $parameter "openmp" 1
	# #detectleaks $testcase $program $codegen $parameter "openmp" 2
	# #detectleaks $testcase $program $codegen $parameter "openmp" 4
	#Return to the working directory
 	cd $BENCHMARKDIR

    #read -p "Press [Enter] to continue..."
}

# # # # ### Reverse test case##
# init Reverse
# exec Reverse original 100000
# exec Reverse original 1000000
# exec Reverse original 10000000

# # # ### newTicTacToe test case ###
# init newTicTacToe
# exec newTicTacToe original 1000
# exec newTicTacToe original 10000
# exec newTicTacToe original 100000

# # # ## # MergeSort test case##
# init MergeSort
# exec MergeSort original 1000
# exec MergeSort original 10000
# exec MergeSort original 100000

# # # ## # BubbleSort test case##
# init BubbleSort
# exec BubbleSort original 1000
# exec BubbleSort original 10000
# exec BubbleSort original 100000

# # # # MatrixMult test case##
# init MatrixMult
# exec MatrixMult original 1000
# exec MatrixMult original 2000
# exec MatrixMult original 3000
#exec MatrixMult original 8000
# exec MatrixMult transpose 100
# exec MatrixMult transpose 200
# exec MatrixMult transpose 300
# exec MatrixMult 2DArray 100
# exec MatrixMult 2DArray 200
# exec MatrixMult 2DArray 300

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

# ### CoinGame test case ###
# init CoinGame
# exec CoinGame original 100
# exec CoinGame original 200
# exec CoinGame original 300
# exec CoinGame single 100
# exec CoinGame single 200
# exec CoinGame single 300
# exec CoinGame array 100
# exec CoinGame array 200
# exec CoinGame array 300

# # ### NQueen test case
# init NQueens
# exec NQueens original 8
# exec NQueens original 9
# exec NQueens original 10
# exec NQueens integer 8
# exec NQueens integer 9
# exec NQueens integer 10

# # # ###Sobel Edge test
# init SobelEdge
# exec SobelEdge original "image32x32.pbm"
# exec SobelEdge original "image64x64.pbm"
# exec SobelEdge original "image128x128.pbm"

# # # ####LZ77 test case
# init LZ77
# exec LZ77 original "small.in"
# exec LZ77 original "medium.in"
# #exec LZ77 original "large.in"

# # #### Cashtill test case
# init Cashtill
# exec Cashtill original 1
# exec Cashtill original 10
# exec Cashtill original 100

# #### AppendArrayPattern test case
init AppendArrayPattern
exec AppendArrayPattern original 10
exec AppendArrayPattern original 100
exec AppendArrayPattern original 1000