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
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias cls='printf "\033c"' ## Clear the screen

### Create or clean up folder, and move files to that folder
folder_proc(){
	folder=$1
	ext=$2
	mkdir -p "$folder"
	#if [ -f "$folder/*.$ext" ];
	#then
	#	read -p "Press [Enter] to remove .$ext files in $folder"
	rm -rf "$folder"/*
	#fi
	## move to the specific folder
	mv -f *.$ext "$folder"/
	
}
# ### Generate png files from dot files
generate_png(){
	folder=$1
	cd "$folder/"
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../
}


### Compile LLVM-IR to executables
runExecutables(){
	program=$1
	opt=$2
	parameter=$3
	num_threads=$4
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o
	### Use 'llc' to compile LLVM code into assembly code
    llc $program.$opt.ll -o $program.$opt.s
    if [ $opt = "openmp" ]
    then
    	export OMP_NUM_THREADS=$num_threads
    	### Use 'gcc' to compile .s file and link with 'libUtil.a'
    	clang $program.$opt.s libUtil.a -lgomp -o "out/$program.$opt.out" 
	else
    	### Use 'gcc' to compile .s file and link with 'libUtil.a'
    	clang $program.$opt.s libUtil.a -o "out/$program.$opt.out"
    fi
    ### Run the generated executables.
	time ./out/$program.$opt.out $parameter
}

### Clean up files ###
cleanup(){
	## move files to folders respectively, e.g. 'jscop' 'llvm' and 'assembly' folder 
	### Move all the dot files to 'dot' folder
	folder_proc "dot" "dot"
	generate_png "dot"

	folder_proc "jscop" "jscop"
	folder_proc "llvm" "ll"
	folder_proc "assembly" "s"

}

##
## Execute Polly Pass step by step
##
opt_polly(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	mkdir -p "out" # Store the executables.
	rm -rf "out"/*
	
	echo -e "------------------Start optimizing ${BOLD}${GREEN}$c_type $program C ${RESET} program with POlly--------------------"
	
	echo -e -n "1. Create LLVM-IR from C"
	### Compile source.c along with 'Util.c' to assembly code
	clang -fno-vectorize -g -S -emit-llvm $program.c -o $program.s
	
	echo -e -n "2. Prepare LLVM-IR for Polly"
	opt -S -polly-canonicalize -polly-report $program.s > $program.preopt.ll
	
	echo -e -n "3. Detect SCoPs using Polly"
	opt -basicaa -polly-ast -analyze -q -polly-report -polly-show $program.preopt.ll -polly-detect-track-failures
	#opt -basicaa -polly-ast -analyze -q -polly-dependences-computeout=0 -polly-report -polly-show $program.preopt.ll
	
	echo -e -n "4. Generate detected SCoPs in DOT"
	opt -basicaa -dot-scops -disable-output -polly-report -polly-show $program.preopt.ll
	
	echo -e -n "5. Show the dependences of the SCoPs"
	opt -basicaa -polly-dependences -analyze -polly-report -polly-show $program.preopt.ll

	echo -e -n "6. Export jscop files"
	opt -basicaa -polly-export-jscop -polly-report -polly-show $program.preopt.ll

	echo -e -n "7. Generate polly-optimized LLVM using Polly"
	opt -S -O3 -polly -polly-codegen -polly-process-unprofitable -polly-report $program.preopt.ll -o $program.polly.ll

	echo -e -n "${REVERSE}Manual${RESET} Polly Optimizations\n"

    echo -e -n "${BOLD}${GREEN}[5]${RESET} Run ${GREEN}  Strip mining + (1st + 2nd) Loop tiling + Optimized Schedule of SCoPs ${RESET} executable. Press [Enter] " && read	
	opt -polly-opt-isl -polly-vectorizer=stripmine -polly-tiling -polly-2nd-level-tiling\
 	    -basicaa -polly-prepare -polly-codegen -polly-report $program.none.ll\
 	    -S -o $program.optisl.before.ll\
        &&opt -O3 $program.optisl.before.ll -S -o $program.optisl.ll
	runExecutables $program "optisl" $parameter

	echo -e -n "${REVERSE}Automatic ${RESET} Polly Optimization vs. GCC\n"
	echo -e -n "[1] Run ${BOLD}${GREEN}GCC -O3 ${RESET} executables. Press [Enter] " && read
	gcc -O3 $program.c Util.c -o $program.gcc.out
	mv $program.gcc.out "out/"
	time ./out/$program.gcc.out $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN}Polly Sequential ${RESET} executable. Press [Enter]" && read
	opt -O3 -polly\
	    -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.polly.ll
    runExecutables $program "polly" $parameter

	echo -e -n "[3] Run ${BOLD}${GREEN}Polly OpenMP ${RESET} executable with 2 threads. Press [Enter]" && read
	export OMP_NUM_THREADS=$num_threads
	opt -O3 -polly -polly-parallel\
		-basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.openmp.ll
	llc $program.openmp.ll -o $program.openmp.s
	clang $program.openmp.s libUtil.a -o "out/$program.openmp.out" -lgomp
	time ."/out/$program.openmp.out" $parameter

	echo -e -n "[4] Run ${BOLD}${GREEN}Polly Vector ${RESET} executable. Press [Enter]" && read
	opt -O3 -polly -polly-vectorizer=polly\
		-basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.vector.ll
	runExecutables $program "vector" $parameter

	echo -e "-----------------Press [Enter] to finish up--------------------"&& read
	cleanup
}
###
### Use Polly with Clang
###
clang_polly(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	mkdir -p "out" # Store the executables.
	rm -rf "out"/*

	echo -e -n "${GREEN}[*] Export SCoP in DOTs and JSCoP${RESET}" && read
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -polly-dot -mllvm -polly-show $program.c
	### Export JSCoP ###
	pollycc -g -O0 -mllvm -polly -S -emit-llvm $program.c -o $program.preopt.s && 
	opt -S -polly-canonicalize -polly-report $program.preopt.s > $program.preopt.ll &&
	opt -basicaa -polly-export-jscop $program.preopt.ll

	echo -e -n "${GREEN}[*]Show the region Polly can NOT analyze and reasons${RESET}" && read
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -Rpass-missed=polly $program.c

	echo -e -n "${GREEN}[*]Show the regions Polly can analyze and assumption/restrictions${RESET}" && read
	pollycc -fcolor-diagnostics -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -Rpass-analysis=polly $program.c 

	echo -e -n "${GREEN}[*]Show the information of valid SCoP${RESET}" && read 
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
		    -mllvm -debug-only=polly-detect $program.c

	echo -e -n "${GREEN}[*]Show the representation of valid SCoP${RESET}" && read 
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -debug-only=polly-scops $program.c

	echo -e -n "${GREEN}[*]Show the optimized AST${RESET}" && read 
	pollycc -g -O3 -mllvm -polly -o "out"/$program.polly.out\
	        -mllvm -debug-only=polly-ast $program.c

	### Generate executables
	echo -e -n "${GREEN}[*]Loop Vectorizer is diabled${RESET}" && read
	echo -e -n "[1] Run ${BOLD}${GREEN} Clang -O3 ${RESET} executables" && read
	pollycc -g -O3 -fno-vectorize $program.c -o "out"/$program.clang.out
	time ./out/$program.clang.out $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN} Polly-Optimized ${RESET} executables" && read
	#pollycc -g -O3 -fno-vectorize -mllvm -polly $program.c -o "out"/$program.polly.out
	#time ./out/$program.polly.out $parameter
	pollycc -g -O3 -fno-vectorize -mllvm -polly -S -emit-llvm $program.c -o $program.polly.ll
	runExecutables $program "polly" $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN} Polly-Optimized OpenMP ${RESET} executables with $num_threads threads" && read
	#pollycc -g -O3 -fno-vectorize -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out"/$program.openmp.out
	#time ./out/$program.openmp.out $parameter
	pollycc -g -O3 -fno-vectorize -mllvm -polly -S -emit-llvm\
	        -mllvm -polly-parallel -lgomp $program.c -o $program.openmp.ll
	runExecutables $program "openmp" $parameter 2

	echo -e "-----------------Press [Enter] to finish up--------------------"&& read
	cleanup
}


#### Execute the polly using Clang
exec(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	utildir="$PWD/../tests/code"
	workingdir="$program/impl/$c_type"
	## copy *.whiley and Util.c Util.h to working folder
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $workingdir
	cd $workingdir
	clang_polly $c_type $program $num_threads $parameter
	#opt_polly $c_type $program $num_threads $parameter
	cd ../../../
}

#exec handwritten VectorMult 2 1024X1024X10
exec handwritten MatrixAdd 2 10240X10240
#exec handwritten MatrixMult 2 512