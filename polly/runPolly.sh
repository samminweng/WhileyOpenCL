#!/bin/bash
### ANSI escape color code used for the highlighted texts 
GREEN="\033[1m\e[32m" # Green color
BOLD="\033[1m" # Bold text
REVERSE="\e[7m" #invert the foreground and background colors
RESET="\e[0m"    # Text Reset
#
# Load polly to clang to optimize the LLVM-IR code
#
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias cls='printf "\033c"' ## Clear the screen

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


### Compile LLVM-IR to executables
runExecutables(){
	program=$1
	opt=$2
	parameter=$3
	num_threads=$4
	### Use 'llc' to compile LLVM code into assembly code
    #llc -print-machineinstrs=if-converter "llvm/$program.$opt.ll" -o "assembly/$program.$opt.s"
    llc "llvm/$program.$opt.ll" -o "assembly/$program.$opt.s"
    ####read -p "Press [Enter] to continue"
    if [[ $opt == *"openmp"* ]]
    then
    	export OMP_NUM_THREADS=2 ### Run the program using two threads.
    	### Use 'gcc' to compile .s file and link with 'libUtil.a'
    	pollycc "assembly/$program.$opt.s" Util.c -lgomp -o "out/$program.$opt.out" 
	else
    	### Use 'gcc' to compile .s file and link with 'libUtil.a'
    	pollycc "assembly/$program.$opt.s" Util.c -o "out/$program.$opt.out"
    fi
    ### Run the generated executables.
	time ./out/$program.$opt.out $parameter
}

### Clean up files ###
cleanup(){

	folder_proc "jscop" "jscop"
	folder_proc "dot" "dot"
	generate_png "dot"
}


###
### Use Polly with Clang
###
clang_polly(){
	c_type=$1
	program=$2
	parameter=$3
	mkdir -p "out" # Store the executables.
	rm -rf "out"/*

	mkdir -p "assembly" ## Store the assembly code (*.s)
	mkdir -p "llvm"  ## Store the llvm code (*.ll)
	### Compile Util.c to Util.o (object file)
	clang -c Util.c -o Util.o 
    	ar -cvq libUtil.a Util.o
	echo -e -n "${GREEN}[*] Export SCoP in DOTs and JSCoP${RESET}" && read
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -polly-dot -mllvm -polly-show $program.c libUtil.a
	
	### Export JSCoP	
	pollycc -S -emit-llvm $program.c -o "llvm/$program.preopt.ll.tmp" && ## compile C to llvm
	opt -S -polly-canonicalize -polly-report "llvm/$program.preopt.ll.tmp" > "llvm/$program.preopt.ll" &&
	opt -basicaa -polly-export-jscop "llvm/$program.preopt.ll" &&
	rm "llvm/$program.preopt.ll.tmp"
	## Move JSCoP and dot files to separate folders.
	cleanup

	echo -e -n "${GREEN}[*]Show the region Polly can NOT analyze and reasons${RESET}" && read
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -Rpass-missed=polly $program.c libUtil.a

	echo -e -n "${GREEN}[*]Show the regions Polly can analyze and assumption/restrictions${RESET}" && read
	pollycc -fcolor-diagnostics -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -Rpass-analysis=polly $program.c libUtil.a

	echo -e -n "${GREEN}[*]Show the information of valid SCoP${RESET}" && read 
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
		    -mllvm -debug-only=polly-detect $program.c libUtil.a

	echo -e -n "${GREEN}[*]Show the representation of valid SCoP${RESET}" && read 
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -debug-only=polly-scops $program.c libUtil.a

	echo -e -n "${GREEN}[*]Show the optimized AST${RESET}" && read
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -debug-only=polly-ast -mllvm -polly-process-unprofitable\
	        $program.c libUtil.a

	### Generate executables with enabled vectorizer
	echo -e -n "${GREEN}[*]Run Benchmark with Vectorizer enabled${RESET}" && read
	echo -e -n "[1] Run ${BOLD}${GREEN} GCC -O3 ${RESET} executables" && read
	gcc -std=c99 -O3 $program.c Util.c -o "out/$program.gcc.enablevc.out"
	time ./out/$program.gcc.enablevc.out $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN} Clang -O3 ${RESET} executables" && read
	clang -g -O3 $program.c Util.c -o "out"/$program.clang.enablevc.out
	time ./out/$program.clang.enablevc.out $parameter

	##-fno-vectorize
	echo -e -n "[3] Run ${BOLD}${GREEN} Polly-Optimized ${RESET} executables" && read
	pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
	        -S -emit-llvm -mllvm -polly-process-unprofitable\
	        $program.c -o "llvm/$program.polly.enablevc.ll"

	runExecutables $program "polly.enablevc" $parameter

	echo -e -n "[4] Run ${BOLD}${GREEN} Polly-Optimized OpenMP ${RESET} executables with 2 threads" && read
	pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine -S -emit-llvm\
	        -mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
	        $program.c -o "llvm/$program.openmp.enablevc.ll"
	runExecutables $program "openmp.enablevc" $parameter 2

	echo -e "-----------------Press [Enter] to finish up--------------------"&& read
	
}


#### Execute the polly using Clang
exec(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	utildir="$PWD/../tests/code"
	workingdir="$program/impl/$c_type"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $workingdir
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
	cd $workingdir
	
	if [[ $c_type == *"autogenerate"* ]]
	then
		if [[ $c_type == *"leakfree"* ]]
		then
			### Translate Whiley program into copy-eliminated and memory deallocated C code 
			./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"
		else
			### Translate Whiley program into copy-eliminated C code 
			./../../../../bin/wyopcl -code -copy "$program.whiley"
		fi
	fi

	clang_polly $c_type $program $num_threads $parameter
	cd ../../../
}

#exec autogenerate1 MatrixMult 100  ### Determine matrix size from cmd line argument
#exec autogenerate2 MatrixMult 100 
#exec autogenerate_original_copyonly GCD 10000  ### Use Euclid's algorithm
#exec autogenerate_original_copyfree GCD 10000  
#exec autogenerate_cached_copyonly GCD 10000 ### Cached the divisors
#exec autogenerate_cached_copyfree GCD 10000
#exec autogenerate_copyonly CoinGame 10000
#exec autogenerate_copyfree CoinGame 10000
#exec autogenerate_array_copyonly CoinGame 10000
#exec autogenerate_array_copyfree CoinGame 10000
exec autogenerate_leak NQueens 12
exec autogenerate_leakfree NQueens 12



