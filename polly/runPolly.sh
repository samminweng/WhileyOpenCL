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
	echo -e "------------------Start optimizing ${BOLD}${GREEN}$c_type $program C ${RESET} program with POlly--------------------"
	
	echo -e -n "1. Create LLVM-IR from C"
	### Compile source.c along with 'Util.c' to assembly code
	clang -g -S -emit-llvm $program.c -o $program.s
	
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

	echo -e -n "${REVERSE}Compare Polly Optimizations${RESET}"
	mkdir -p "out" # Store the executables.
	rm -rf "out"/*
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o

	echo -e -n "[1] Run ${BOLD}${GREEN} None Optimized ${RESET} executable. Press [Enter]" && read	
    opt -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
        -S -o $program.none.ll
 	runExecutables $program "none" $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN} -O3 Optimized ${RESET} executable. Press [Enter]" && read	
	### Use 'llc' to compile LLVM code into assembly code
    opt -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
     	-S -o $program.O3.ll
    runExecutables $program "O3" $parameter

	echo -e -n "[3] Test Loop Tiling Strategy.\n"
	echo -e -n "[3.a] Run ${BOLD}${GREEN} Enable Loop Tiling ${RESET} executable. Press [Enter]" && read
	opt -polly-vectorizer=none -polly-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.tiling.ll
	runExecutables $program "tiling" $parameter

	echo -e -n "[3.b] Run ${BOLD}${GREEN} Enable 2n Level Loop Tiling ${RESET} executable. Press [Enter]" && read
	opt -polly-vectorizer=none -polly-tiling -polly-2nd-level-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.2ndtiling.ll
	runExecutables $program "2ndtiling" $parameter
	#pollycc -O3 -mllvm -polly-optimizer=none -mllvm -polly-vectorizer=none MatrixMult.c -o "out/$program.tiling.out" 
	#time ./out/$program.tiling.out $parameter

	echo -e -n "[4] Test Vectorization Strategy:None, Stripmining, Polly internal Vectorizer.\n"
	echo -e -n "[4.a] Run ${BOLD}${GREEN} None Vectorization ${RESET} executable. Press [Enter]" && read
	opt -polly-vectorizer=none\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.nonevector.ll
	runExecutables $program "nonevector" $parameter

	echo -e -n "[4.b] Run ${BOLD}${GREEN} Strip mining ${RESET} executable. Press [Enter] " && read
	opt -polly-vectorizer=stripmine\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.stripmine.ll
	runExecutables $program "stripmine" $parameter

	echo -e -n "[4.c] Run ${BOLD}${GREEN} Polly Internal Vectorizer ${RESET} executable. Press [Enter] " && read	
	opt -polly-vectorizer=polly\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.pollyvector.ll
	runExecutables $program "pollyvector" $parameter
	#pollycc -O3 -mllvm -polly-optimizer=none -mllvm -polly-vectorizer=polly -mllvm -polly-tiling=false MatrixMult.c -o "out/$program.pollyvector.out"
	#time ./out/$program.pollyvector.out $parameter

	echo -e -n "[5] Run ${BOLD}${GREEN} Optimized Schedule of SCoPs ${RESET} executable. Press [Enter] " && read	
	opt -polly-opt-isl\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.optisl.ll
	runExecutables $program "optisl" $parameter

	echo -e -n "[6.a] Run ${BOLD}${GREEN}  (1st+2nd) Loop Tiling + Polly Vectorizer + Optimized Schedule ${RESET} executable. Press [Enter] " && read
	opt -polly-vectorizer=polly -polly-opt-isl -polly-tiling -polly-2nd-level-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.aggregated.ll
    runExecutables $program "aggregated" $parameter
	
	echo -e -n "[6.b] Run ${BOLD}${GREEN}Polly-optimized  ${RESET} executable. Press [Enter] " && read
	opt -polly\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.polly.ll
    runExecutables $program "polly" $parameter

	echo -e -n "Compare ${REVERSE}GCC vs. Polly${RESET}\n"
	echo -e -n "[1] Run ${BOLD}${GREEN}GCC -O3 ${RESET} executables. Press [Enter] " && read
	gcc -O3 $program.c Util.c -o $program.gcc.out
	mv $program.gcc.out "out/"
	time ./out/$program.gcc.out $parameter

	echo -e -n "[2] Run ${BOLD}${GREEN}Polly-optimized Seq ${RESET} executable. Press [Enter]" && read
	opt -polly\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.polly.ll
    runExecutables $program "polly" $parameter

	echo -e -n "[3] Run ${BOLD}${GREEN}Polly OpenMP ${RESET} executable with 2 threads. Press [Enter]" && read
	export OMP_NUM_THREADS=$num_threads
	opt -polly -polly-parallel\
		-O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.openmp.ll
	llc $program.openmp.ll -o $program.openmp.s
	clang $program.openmp.s libUtil.a -o "out/$program.openmp.out" -lgomp
	time ."/out/$program.openmp.out" $parameter

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
	cd $workingdir
	opt_polly $c_type $program $num_threads $parameter
	cd ../../../
}

exec handwritten VectorMult 2 1024X1024X10
exec handwritten MatrixMult 2 32