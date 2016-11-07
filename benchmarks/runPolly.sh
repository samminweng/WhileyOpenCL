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
	### Copy Util.c Util.h to 
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
			./../../../../../bin/wyopcl -code -copy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			echo "#############Generate copyreduced_dealloc $testcase#################"
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
	    	./../../../../../bin/wyopcl -code -copy -dealloc $testcase"_"$program.whiley	
			;;
	esac
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
###
### Run Polly to optimize the C code and generate efficient executables
###
runPolly(){
	testcase=$1
	program=$2
	codegen=$3
	parameter=$4

	# Clean the folder of executable files
	rm -rf "out"/*
	mkdir -p "out" 
	
	## clean the assembly code (*.s)
	rm -rf "assembly"/*
	mkdir -p "assembly"
	## clean the llvm code (*.ll)
	rm -rf "llvm"/*
	mkdir -p "llvm"  
	
	echo -e -n "[*] Export SCoP in DOTs" && read
	pollycc -g -o "out"/$testcase"_"$program.polly.out\
	        -mllvm -polly-dot -mllvm -polly-show $testcase"_"$program.c Util.c
	folder_proc "dot" "dot"
	generate_png "dot"

	echo -e -n "[*]Export JSCoP" && read	
	pollycc -S -emit-llvm $testcase"_"$program.c -o "llvm/$testcase_$program.preopt.ll.tmp" && 
	## compile C to llvm
	opt -S -polly-canonicalize -polly-report "llvm/$testcase_$program.preopt.ll.tmp" > "llvm/$testcase_$program.preopt.ll" &&
	opt -basicaa -polly-export-jscop "llvm/$testcase_$program.preopt.ll" &&
	rm "llvm/$testcase_$program.preopt.ll.tmp"
	folder_proc "jscop" "jscop"


	echo -e -n "[*]Show the region Polly can NOT analyze and reasons" && read
	#pollycc -g -mllvm -polly-opt-outer-coincidence=yes -o "out"/$testcase"_"$program.polly.out\
	pollycc -g -o "out"/$testcase"_"$program.polly.out\
	        -Rpass-missed=polly-detect $testcase"_"$program.c Util.c

	echo -e -n "[*]Show the regions Polly can analyze and assumption/restrictions" && read
	pollycc -fcolor-diagnostics -g\
			-mllvm -polly-opt-outer-coincidence=yes -o "out"/$testcase"_"$program.polly.out\
	        -Rpass-analysis=polly $testcase"_"$program.c Util.c

	echo -e -n "[*]Show the information of valid SCoP" && read 
	pollycc -g -mllvm -polly-opt-outer-coincidence=yes\
			-o "out"/$testcase"_"$program.polly.out -mllvm -debug-only=polly-detect\
			$testcase"_"$program.c Util.c

	echo -e -n "[*]Show the representation of valid SCoP" && read 
	pollycc -g -mllvm -polly-opt-outer-coincidence=yes\
			-o "out"/$testcase"_"$program.polly.out -mllvm -debug-only=polly-scops\
			$testcase"_"$program.c Util.c

	echo -e -n "[*]Show the optimized AST" && read
	pollycc -g -mllvm -polly-opt-outer-coincidence=yes\
			-o "out"/$testcase"_"$program.polly.out -mllvm -debug-only=polly-ast\
			-mllvm -polly-process-unprofitable\
	        $testcase"_"$program.c Util.c

	### Generate executables with enabled vectorizer
	echo -e -n "[1] Run  GCC -O3  executables" && read
	gcc -std=c99 -O3 $testcase"_"$program.c Util.c -o "out/$testcase"_"$program.gcc.out"
	time ./out/$testcase"_"$program.gcc.out $parameter

	echo -e -n "[2] Run  Clang -O3  executables" && read
	clang -g -O3 $testcase"_"$program.c Util.c -o "out"/$testcase"_"$program.clang.out
	time ./out/$testcase"_"$program.clang.out $parameter

	##-fno-vectorize
	echo -e -n "[3] Run  Polly-Optimized  executables" && read
	pollycc -g -mllvm -polly-vectorizer=stripmine\
	        -S -emit-llvm -mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
	        $testcase"_"$program.c -o "llvm"/$testcase"_"$program.polly.ll
	### Use 'llc' to compile LLVM code into assembly code
    llc "llvm"/$testcase"_"$program.polly.ll -o "assembly"/$testcase"_"$program.polly.s
    ### Use 'clang' to compile .s file and link with 'Util.c'
    pollycc "assembly"/$testcase"_"$program.polly.s Util.c -o "out"/$testcase"_"$program.polly.out
	### Run the generated executables.
	time ./out/$testcase"_"$program.polly.out $parameter


	echo -e -n "[4] Run  Polly-Optimized OpenMP  executables with 2 threads" && read
	pollycc -g -mllvm -polly-vectorizer=stripmine -S -emit-llvm\
	        -mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
	        -mllvm -polly-opt-outer-coincidence=yes\
	        $testcase"_"$program.c -o "llvm"/$testcase"_"$program.openmp.ll
	llc "llvm"/$testcase"_"$program.openmp.ll -o "assembly"/$testcase"_"$program.openmp.s
    ### Use 'gcc' to compile .s file and link with 'libUtil.a'
    pollycc "assembly"/$testcase"_"$program.openmp.s Util.c -lgomp -o "out"/$testcase"_"$program.openmp.out 
	### Run the program using two threads.
	export OMP_NUM_THREADS=2
	### Run the generated executables.
	time ./out/$testcase"_"$program.openmp.out $parameter

	echo -e "-----------------Press [Enter] to continue--------------------"&& read
	
}

#### Execute the polly to optimize the generated C code
exec(){
	testcase=$1
	program=$2
	parameter=$3

	## declare 4 kinds of code generation
	#declare -a codegens=("naive" "naive_dealloc" "copyreduced" "copyreduced_dealloc")
	declare -a codegens=("copyreduced_dealloc")
	## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		## Generate C code
		generateCode $testcase $program $codegen
		runPolly $testcase $program $codegen $parameter
	done
	# Return to the working directory
    cd $basedir/polly
}
### Determine problem size from cmd line argument
### MatrixMult test case
#exec MatrixMult original 2000
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
exec SobelEdge original 8


