#!/bin/bash
#
# Load polly to clang to optimize the LLVM-IR code
#
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

### Create or clean up folder, and move files to that folder
folder_proc(){
	folder=$1
	ext=$2
	mkdir -p "$folder"
	#if [ -f "$folder/*.$ext" ];
	#then
	#	read -p "Press [Enter] to remove .$ext files in $folder"
	rm "$folder"/*
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

##
## Execute Polly Pass step by step
##
opt_polly(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	
	read -p "Press [Enter] 1. Create LLVM-IR from C"
	### Compile source.c along with 'Util.c' to assembly code
	clang -S -emit-llvm $program.c -o $program.s
	read -p "Press [Enter] 2. Prepare the LLVM-IR for Polly"
	opt -S -polly-canonicalize $program.s > $program.preopt.ll
	read -p "Press [Enter] 3. Show the SCoPs detected by Polly"
	opt -basicaa -polly-ast -analyze -q $program.preopt.ll
	#opt -basicaa -polly-ast -analyze -q $program.preopt.ll
	
	read -p "Press [Enter] 4. Generate the detected SCoPs in DOT"
	opt -basicaa -dot-scops -disable-output $program.preopt.ll
	
	#read -p "Press [Enter] 4.2 Generate the detected SCoPs in DOT-only (no instructions)"
	#opt -basicaa -dot-scops-only -disable-output $program.preopt.ll
	
	read -p "Press [Enter] 5. Show the dependences for the SCoPs"
	opt -basicaa -polly-dependences -analyze $program.preopt.ll

	read -p "Press [Enter] 6. Export jscop files"
	opt -basicaa -polly-export-jscop $program.preopt.ll

	read -p "Press [Enter] 7. Codegenerate the SCoPs"
	opt -S -O3 -polly -polly-process-unprofitable $program.preopt.ll -o $program.polly.ll

	read -p "Press [Enter] 8. Create the polly-optimized executables"
	mkdir -p "out" # Store the executables.
    ### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o
    ### Use 'llc' to compile LLVM code into assembly code 
    llc $program.polly.ll -o $program.polly.s
    ### Use 'gcc' to compile .s file and link with 'libUtil.a'
    clang $program.polly.s libUtil.a -o "out/$program.polly.out"

	read -p "Press [Enter] 9. Compare the runtime of the executables"

	read -p "Press [Enter] to run GCC -O3 optimized executables"
	gcc -O3 $program.c Util.c -o $program.gcc.out
	mv $program.gcc.out "out/"
	time ./out/$program.gcc.out $parameter

	read -p "Press [Enter] to run Polly-optimized executable"
	#clang -include Util.c $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-ignore-aliasing $program.c -o "out/$program.polly.out"
	time ./out/$program.polly.out $parameter

	read -p "Press [Enter] to Run Vector code"
	opt -S -O3 -polly -polly-codegen -polly-vectorizer=stripmine -polly-process-unprofitable $program.preopt.ll -o $program.vector.ll
	llc $program.vector.ll -o $program.vector.s
	clang $program.vector.s libUtil.a -o "out/$program.vector.out"
	### clang -include Util.c $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine $program.c -o "out/$program.vector.out"
	time ."/out/$program.vector.out" $parameter

	read -p "Press [Enter] to Run OpenMP executable with 2 threads..."
	export OMP_NUM_THREADS=$num_threads
	opt -S -O3 -polly -polly-codegen -polly-parallel -polly-process-unprofitable $program.preopt.ll -o $program.openmp.ll
	llc $program.openmp.ll -o $program.openmp.s
	clang $program.openmp.s libUtil.a -o "out/$program.openmp.out" -lgomp
	#clang -include Util.c $CPPFLAGS -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out/$program.openmp.out"
	time ."/out/$program.openmp.out" $parameter

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
	cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cd $workingdir
	opt_polly $c_type $program $num_threads $parameter
	cd ../../../
}

exec handwritten VectorMult 2
exec handwritten2 VectorMult 2