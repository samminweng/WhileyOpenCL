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
	
	echo -e -n "${REVERSE}1. Create LLVM-IR from C${RESET}"
	### Compile source.c along with 'Util.c' to assembly code
	clang -g -S -emit-llvm $program.c -o $program.s
	
	echo -e -n "${REVERSE}2. Prepare LLVM-IR for Polly${RESET}"
	opt -S -polly-canonicalize -polly-report $program.s > $program.preopt.ll
	
	echo -e -n "${REVERSE}3. Detect SCoPs using Polly${RESET}"
	opt -basicaa -polly-ast -analyze -q -polly-report -polly-show $program.preopt.ll -polly-detect-track-failures
	#opt -basicaa -polly-ast -analyze -q -polly-dependences-computeout=0 -polly-report -polly-show $program.preopt.ll
	
	echo -e -n "${REVERSE}4. Generate detected SCoPs in DOT${RESET}" 
	opt -basicaa -dot-scops -disable-output -polly-report -polly-show $program.preopt.ll
	
	echo -e -n "${REVERSE}5. Show the dependences of the SCoPs${RESET}"
	opt -basicaa -polly-dependences -analyze -polly-report -polly-show $program.preopt.ll

	echo -e -n "${REVERSE}6. Export jscop files${RESET}"
	opt -basicaa -polly-export-jscop -polly-report -polly-show $program.preopt.ll

	echo -e -n "${REVERSE}7. Generate polly-optimized LLVM using Polly${RESET}"
	opt -S -O3 -polly -polly-codegen -polly-process-unprofitable -polly-report $program.preopt.ll -o $program.polly.ll

	echo -e -n "${REVERSE}9. Compare the runtime of the executables${RESET}" && read 
	mkdir -p "out" # Store the executables.
	rm -rf "out"/*
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o

	# echo -e -n "Press [Enter] 9.1 Run ${BOLD}${GREEN}GCC ${RESET} -O3 optimized executables" && read
	# gcc -O3 $program.c Util.c -o $program.gcc.out
	# mv $program.gcc.out "out/"
	# time ./out/$program.gcc.out $parameter

	echo -e -n "Press [Enter] 9.1 Run ${BOLD}${GREEN} None Optimized ${RESET} executable" && read	
    opt -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
        -S -o $program.none.ll
 	runExecutables $program "none" $parameter

	echo -e -n "Press [Enter] 9.2 Run ${BOLD}${GREEN} -O3 Optimized ${RESET} executable" && read	
	### Use 'llc' to compile LLVM code into assembly code
    opt -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
     	-S -o $program.O3.ll
    runExecutables $program "O3" $parameter

	echo -e -n "Press [Enter] 9.3 Test Loop Tiling Strategy" && read
	echo -e -n "Press [Enter] 9.3 (a) Run ${BOLD}${GREEN} Enable Loop Tiling ${RESET} executable" && read
	opt -polly-vectorizer=none -polly-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.tiling.ll
	runExecutables $program "tiling" $parameter

	echo -e -n "Press [Enter] 9.3 (b) Run ${BOLD}${GREEN} Enable 2n Level Loop Tiling ${RESET} executable" && read
	opt -polly-vectorizer=none -polly-tiling -polly-2nd-level-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.2ndtiling.ll
	runExecutables $program "2ndtiling" $parameter
	#pollycc -O3 -mllvm -polly-optimizer=none -mllvm -polly-vectorizer=none MatrixMult.c -o "out/$program.tiling.out" 
	#time ./out/$program.tiling.out $parameter

	echo -e -n "Press [Enter] 9.4 Test Vectorization Strategy:${REVERSE}${GREEN} None, Stripmining, Polly internal Vectorizer${RESET}" && read
	echo -e -n "Press [Enter] 9.4 (a) Run ${BOLD}${GREEN} None Vectorization ${RESET} executable" && read
	opt -polly-vectorizer=none\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.nonevector.ll
	runExecutables $program "nonevector" $parameter

	echo -e -n "Press [Enter] 9.4 (b) Run ${BOLD}${GREEN} Strip mining ${RESET} executable" && read
	opt -polly-vectorizer=stripmine\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.stripmine.ll
	runExecutables $program "stripmine" $parameter

	echo -e -n "Press [Enter] 9.4 (c) Run ${BOLD}${GREEN} Polly Internal Vectorizer ${RESET} executable" && read	
	opt -polly-vectorizer=polly\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.pollyvector.ll
	runExecutables $program "pollyvector" $parameter
	#pollycc -O3 -mllvm -polly-optimizer=none -mllvm -polly-vectorizer=polly -mllvm -polly-tiling=false MatrixMult.c -o "out/$program.pollyvector.out"
	#time ./out/$program.pollyvector.out $parameter

	echo -e -n "Press [Enter] 9.5 Run ${BOLD}${GREEN} Optimized Schedule of SCoPs ${RESET} executable" && read	
	opt -polly-opt-isl\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.optisl.ll
	runExecutables $program "optisl" $parameter

	echo -e -n "Press [Enter] 9.6 (a) Run ${BOLD}${GREEN}  (1st+2nd) Loop Tiling + Polly Vectorizer + Optimized Schedule ${RESET} executable" && read
	opt -polly-vectorizer=polly -polly-opt-isl -polly-tiling -polly-2nd-level-tiling\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.aggregated.ll
    runExecutables $program "aggregated" $parameter
	

	echo -e -n "Press [Enter] 9.6 (b) Run ${BOLD}${GREEN}Polly-optimized  ${RESET} executable" && read
	opt -polly\
	    -O3 -basicaa -polly-prepare -polly-codegen -polly-report $program.preopt.ll\
	    -S -o $program.polly.ll
    runExecutables $program "polly" $parameter

	# echo -e -n "Press [Enter] 9.4 Run ${BOLD}${GREEN}Polly Vectorized ${RESET} executables" && read
	# clang -g -S -emit-llvm $program.c -o $program.s
	# opt -S -polly-canonicalize $program.s > $program.preopt.ll
	# opt -S -O3 -polly -polly-codegen -polly-vectorizer=stripmine -polly-process-unprofitable -polly-report $program.preopt.ll -o $program.vector.ll
	# llc $program.vector.ll -o $program.vector.s
	# clang $program.vector.s libUtil.a -o "out/$program.vector.out"
	# ### clang -include Util.c $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine $program.c -o "out/$program.vector.out"
	# time ."/out/$program.vector.out" $parameter

	# echo -e -n "Press [Enter] 9.5 Run ${BOLD}${GREEN}Polly OpenMP ${RESET} executable with 2 threads..." && read
	# export OMP_NUM_THREADS=$num_threads
	# clang -g -S -emit-llvm $program.c -o $program.s
	# opt -S -polly-canonicalize $program.s > $program.preopt.ll
	# opt -S -O3 -polly -polly-codegen -polly-parallel -polly-process-unprofitable -polly-report $program.preopt.ll -o $program.openmp.ll
	# llc $program.openmp.ll -o $program.openmp.s
	# clang $program.openmp.s libUtil.a -o "out/$program.openmp.out" -lgomp
	# #clang -include Util.c $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out/$program.openmp.out"
	# time ."/out/$program.openmp.out" $parameter

	## move files to folders respectively, e.g. 'jscop' 'llvm' and 'assembly' folder 
	### Move all the dot files to 'dot' folder
	folder_proc "dot" "dot"
	generate_png "dot"

	folder_proc "jscop" "jscop"
	folder_proc "llvm" "ll"
	folder_proc "assembly" "s"
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