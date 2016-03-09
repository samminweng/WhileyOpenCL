#!/bin/bash
### ANSI escape color code used for the highlighted texts 
GREEN="\e[32m" # Green color
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
	### Use 'llc' to compile LLVM code into assembly code
    llc $program.$opt.ll -o $program.$opt.s
    ### Use 'gcc' to compile .s file and link with 'libUtil.a'
    clang $program.$opt.s libUtil.a -o "out/$program.$opt.out"
    ### Run the generated executables.
	time ./out/$program.$opt.out $parameter
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
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o

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

	echo -e -n "${BOLD}${GREEN}[1]${RESET} Run ${GREEN} None Optimization ${RESET} executable. Press [Enter]" && read	
	### Use 'llc' to compile LLVM code into assembly code
    opt -basicaa -polly-codegen -polly-report $program.preopt.ll\
     	-S -o $program.before.none.ll\
     	&& opt -O3 $program.before.none.ll -S -o $program.none.ll
    runExecutables $program "none" $parameter

	echo -e -n "${BOLD}${GREEN}[2]${RESET} Run ${GREEN} [1] + Polly loop Vectorization ${RESET} executable. Press [Enter] " && read
	opt -polly-vectorizer=polly\
	    -basicaa -polly-codegen -polly-report $program.none.ll\
	    -S -o $program.pollyvector.before.ll\
	    &&opt -O3 $program.pollyvector.before.ll -S -o $program.pollyvector.ll
    runExecutables $program "pollyvector" $parameter

    echo -e -n "${BOLD}${GREEN}[3]${RESET} Run ${GREEN} [1] + Strip mining ${RESET} executable. Press [Enter] " && read
	opt -polly-vectorizer=stripmine\
	    -basicaa -polly-codegen -polly-report $program.none.ll\
	    -S -o $program.stripmine.before.ll\
	    &&opt -O3 $program.stripmine.before.ll -S -o $program.stripmine.ll
	runExecutables $program "stripmine" $parameter
	
	echo -e -n "${BOLD}${GREEN}[4]${RESET}  Run ${GREEN} [3] + (1st + 2nd) Loop tiling ${RESET} executable. Press [Enter] " && read
	opt -polly-vectorizer=stripmine -polly-tiling -polly-2nd-level-tiling\
	    -basicaa -polly-codegen -polly-report $program.none.ll\
	    -S -o $program.tiling.before.ll\
	    &&opt -O3 $program.tiling.before.ll -S -o $program.tiling.ll
    runExecutables $program "tiling" $parameter

    echo -e -n "${BOLD}${GREEN}[5]${RESET} Run ${GREEN} [4] + Optimized Schedule of SCoPs ${RESET} executable. Press [Enter] " && read	
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

	## move files to folders respectively, e.g. 'jscop' 'llvm' and 'assembly' folder 
	### Move all the dot files to 'dot' folder
	folder_proc "dot" "dot"
	generate_png "dot"

	folder_proc "jscop" "jscop"
	folder_proc "llvm" "ll"
	folder_proc "assembly" "s"
	echo -e "-----------------Press [Enter] to finish up--------------------"&& read
}

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
	opt_polly $c_type $program $num_threads $parameter
	cd ../../../
}

#exec handwritten VectorMult 2 1024X1024X10
exec handwritten MatrixAdd 2 1024
#exec handwritten MatrixMult 2 512