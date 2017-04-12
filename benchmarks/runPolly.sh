#!/bin/bash
### ANSI escape color code used for the highlighted texts 
#GREEN="\033[1m\e[32m" # Green color
#BOLD="\033[1m" # Bold text
#REVERSE="\e[7m" #invert the foreground and background colors
#RESET="\e[0m"    # Text Reset
# Run Polly from clang to optimize the LLVM-IR code
alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
alias cls='printf "\033c"' ## Clear the screen
### Get the root working directory
BASEDIR="$(dirname "$(pwd)")"
BENCHMARKDIR="$BASEDIR/benchmarks"
UTILDIR="$BASEDIR/tests/code"

### Generate C code
generateCode(){
	testcase=$1
	program=$2
	compiler=$3
	codegen=$4
	pollycode=$5
	# The folder of generated Polly code
	folder=$BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"disabledpattern"_"$codegen"_"$pollycode
	# clean and create the folder	
	rm -f "$folder/*.*"
	mkdir -p "$folder"
	#read -p "Press [Enter] to continue..."
	## Clean up previously generated C code and Whiley programs
	rm -f "$folder/*.*"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$folder/."	
	### Copy Util.c Util.h to 
	cp $UTILDIR/Util.c $UTILDIR/Util.h $UTILDIR/WyRT.c $UTILDIR/WyRT.h "$folder/."
	#### Change folder to the corresponding implementation folder
	cd "$folder"	
	#read -p "Press [Enter] to continue..."
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			echo "#############Generate naive $testcase#################"
			### Translate Whiley program into naive C code 
	    	./../../../../bin/wyopcl -code $testcase"_"$program.whiley
	    	;;
	    "naive_dealloc")
			echo "#############Generate naive_dealloc $testcase#################"
			### Translate Whiley program into naive + dealloc C code 
	    	./../../../../bin/wyopcl -code -dealloc $testcase"_"$program.whiley
	    	;;
	    "copyreduced")
			echo "#############Generate copyreduced $testcase#################"
			## Translate Whiley programs into copy_reduced C code
			./../../../../bin/wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			echo "#############Generate copyreduced_dealloc $testcase#################"
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
	    	./../../../../bin/wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley	
			;;
	esac
	#read -p "Press [Enter] to continue..."
}

### Create or clean up folder, and move files to that folder
folder_proc(){
	folder=$1
	ext=$2
	mkdir -p "$folder"	
	rm -rf "$folder"/*	
	## move to the specific folder
	mv -f *.$ext "$folder"/
}
# ### Generate png files from dot files
generate_png(){
	folder=$1
	cd "$folder"
	for i in * 
	do 
		dot -Tpng $i > $i.png
	done
	cd ../
}
## Clean out folder
cleanPollyFolder(){
	# Clean the folder of executable files
	rm -rf "out"/*
	mkdir -p "out" 
	
	## clean the assembly code (*.s)
	rm -rf "assembly"/*
	mkdir -p "assembly"
	## clean the llvm code (*.ll)
	rm -rf "llvm"/*
	mkdir -p "llvm"
}

###
### Run Polly to optimize the C code and generate efficient executables
###
runPolly(){
	testcase=$1
	program=$2

	## Clean folder
	cleanPollyFolder
	
	## Analyze C code and export SCoP
	echo "[*] Export SCoP in DOTs"
	pollycc -mllvm -polly-dot $testcase"_"$program.c Util.c WyRT.c
	folder_proc "dot" "dot"
	generate_png "dot"
	
	## Export JSCoP file
	echo "[*]Export JSCoP"
	pollycc -mllvm -polly-export $testcase"_"$program.c Util.c WyRT.c
	folder_proc "jscop" "jscop"

	## Point out the un-optimizable region
	echo "[*]Show the region Polly can NOT analyze and reasons"
	pollycc -Rpass-missed=polly-detect $testcase"_"$program.c Util.c WyRT.c
	
	## Point out the optimizable region
	echo "[*]Show the regions Polly can analyze and assumption/restrictions" 
	pollycc -fcolor-diagnostics -mllvm -polly-opt-outer-coincidence=yes\
			-Rpass-analysis=polly $testcase"_"$program.c Util.c WyRT.c
	
	## Show SCoP for debugging
	echo "[*]Show the information of valid SCoP" 
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-detect\
			$testcase"_"$program.c Util.c WyRT.c
	
	## Show SCop for debuggin
	echo "[*]Show the representation of valid SCoP" 
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-scops\
			$testcase"_"$program.c Util.c WyRT.c
	
	## Show AST
	echo "[*]Show the optimized AST"
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-ast\
			-mllvm -polly-process-unprofitable $testcase"_"$program.c Util.c WyRT.c

	echo -e "-----------------Press [Enter] to continue--------------------"&& read
	
}

runBenchmark(){
	testcase=$1
	program=$2
	parameter=$3

	## Clean folder
	cleanPollyFolder
	### Generate sequential executables using GCC
	#read -p "[1] Run  GCC -O3  executables"
	#start=`date +%s%N` 
	#gcc -std=c11 -O3 $testcase"_"$program.c Util.c WyRT.c -o out/$testcase"_"$program.gcc.out
	#./out/$testcase"_"$program.gcc.out $parameter
	#end=`date +%s%N`
	#exectime=$(((end-start)/1000000))
	#printf '\nExecutionTime:%s\tmilliseconds\n' $exectime

	### Generate sequential executable using Clang
	#read -p "[2] Run  Clang -O3  executables"
	#clang -O3 $testcase"_"$program.c Util.c WyRT.c -o out/$testcase"_"$program.clang.out
	#start=`date +%s%N`
	#./out/$testcase"_"$program.clang.out $parameter
	#end=`date +%s%N`
	#exectime=$(((end-start)/1000000))
	#printf '\nExecutionTime:%s\tmilliseconds\n' $exectime

	## Run sequential code, produced by Polly
	echo "[3] Run Polly-Optimized Sequential executables"
	cd $BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"disabledpattern"_"$codegen"_seq"
	## Generate LLVM-IR code from C code
	pollycc -S -emit-llvm -mllvm -polly-vectorizer=stripmine\
			-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
			$testcase"_"$program.c -o "llvm"/$testcase"_"$program.polly.ll
	### Use 'llc' to compile LLVM code into assembly code
	llc "llvm"/$testcase"_"$program.polly.ll -o "assembly"/$testcase"_"$program.polly.s
	### Use 'clang' to compile .s file and link with 'Util.c'
	pollycc "assembly"/$testcase"_"$program.polly.s Util.c WyRT.c -o "out"/$testcase"_"$program.polly.out
	### Run the generated executables.
	start=`date +%s%N`
	./out/$testcase"_"$program.polly.out $parameter
	end=`date +%s%N`
	exectime=$(((end-start)/1000000))
	printf '\nExecutionTime:%s\tmilliseconds\n' $exectime
	
	## Run parallel OpenMP code, produced by Polly
	cd $BENCHMARKDIR/$testcase/impl/$program"_"C"_"$compiler"_"disabledpattern"_"$codegen"_openmp"
	thread=4
	echo "[4] Run Polly-Optimized OpenMP executables with $thread threads"	
	## Generate OpenMP code
	pollycc -mllvm -polly-parallel -mllvm -polly-parallel -lgomp $testcase"_"$program.c Util.c WyRT.c -o "out"/$testcase"_"$program.openmp.out 
	#pollycc -S -emit-llvm -mllvm -polly-vectorizer=stripmine\
	#pollycc -S -emit-llvm\
			#-mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
			#-mllvm -polly-opt-outer-coincidence=yes\
	#		$testcase"_"$program.c -o "llvm"/$testcase"_"$program.openmp.ll
	#llc "llvm"/$testcase"_"$program.openmp.ll -o "assembly"/$testcase"_"$program.openmp.s
	### Use 'gcc' to compile .s file and link with 'libUtil.a'
	#pollycc -lgomp "assembly"/$testcase"_"$program.openmp.s Util.c WyRT.c  -o "out"/$testcase"_"$program.openmp.out 
	
	for ((i=1; i <= 10 ; i++))
	do
		### Run the generated executables.
		start=`date +%s%N`
		### Run the program using two threads.
		export OMP_NUM_THREADS=$thread
		./out/$testcase"_"$program.openmp.out $parameter
		end=`date +%s%N`
		exectime=$(((end-start)/1000000))
		printf '\nExecutionTime:%s\tmilliseconds\n' $exectime
	done
}



#### Execute the polly to optimize the generated C code
exec(){
	testcase=$1
	program=$2
	parameter=$3
	compiler="polly"
	## declare 4 kinds of code generation
	#declare -a codegens=("naive" "naive_dealloc" "copyreduced" "copyreduced_dealloc")
	declare -a codegens=("nocopy_dealloc")
	## declare 2 kinds of Polly code
	declare -a pollycodes=("seq" "openmp")
	## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		#echo $testcase $program $compiler $codegen $pollycode $parameter
		## Generate sequential C code
		generateCode $testcase $program $compiler $codegen "seq"
		generateCode $testcase $program $compiler $codegen "openmp"
		runPolly $testcase $program
		runBenchmark $testcase $program $parameter
		
	done
	# Return to the working directory
    cd $BENCHMARKDIR
}
### Determine problem size from cmd line argument
### MatrixMult test case
exec MatrixMult original 2000
#exec MatrixMult transpose 2000 

### GCD test case
### Use Euclid's algorithm
#exec GCD original 10000  
#exec GCD cached 10000

### CoinGame Test Case
#exec CoinGame original 30000
#exec CoinGame single 30000
#exec CoinGame array 30000

### NQueens Test Case
##exec NQueens original 13

### SobelEdge Test Case
#exec SobelEdge original 8



