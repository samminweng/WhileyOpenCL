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
						[LZ77]="input1x.in input2x.in input3x.in" \
						[SobelEdge]="image32x32.pbm image64x64.pbm image128x128.pbm" \
						[Cashtill]="100 200 300" \
						[AppendArrayPattern]="10 100 1000" \
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


##
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
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

	mkdir -p out
	prefix="$testcase.$program.$compiler.$codegen.$pattern"
	### The file of executable
	executable="$prefix.out"

	# Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.
	result="$BENCHMARKDIR/$testcase/leaks/$prefix.$parameter.$thread.txt"
	## read -p "Press [Enter] to continue...$parameter"

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
								detectleaks $testcase $program $compiler $codegen "disabledpattern" $parameter $thread
							done
						else
						 	detectleaks $testcase $program $compiler $codegen "disabledpattern" $parameter 1
						fi

						# ## Get the pattern option 
						func=${patterns[$testcase]}
						if [ $func ]
						then							
							## Run the executable
							detectleaks $testcase $program $compiler $codegen "enabledpattern" $parameter 1
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

# # # # ### Reverse test case##
#init Reverse
#exec Reverse original

# # # ### newTicTacToe test case ###
#init newTicTacToe
#exec newTicTacToe original

# # # ## # BubbleSort test case##
#init BubbleSort
#exec BubbleSort original

# # # ## # MergeSort test case##
#init MergeSort
#exec MergeSort original 

# # # # MatrixMult test case##
#init MatrixMult
#exec MatrixMult original
#exec MatrixMult original 8000
# exec MatrixMult transpose 100
# exec MatrixMult transpose 200
# exec MatrixMult transpose 300
# exec MatrixMult 2DArray 100
# exec MatrixMult 2DArray 200
# exec MatrixMult 2DArray 300

# #### Cashtill test case
#init Cashtill
#exec Cashtill original

# # # ###Sobel Edge test
#init SobelEdge
#exec SobelEdge original

# #### AppendArrayPattern test case
#init AppendArrayPattern
#exec AppendArrayPattern original

# # # ####LZ77 test case
#init LZ77
#exec LZ77 original

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

