#!/bin/bash
# Run Polly from clang to optimize the LLVM-IR code
alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
alias cls='printf "\033c"' ## Clear the screen
### Get the root working directory
BASEDIR="$(pwd)"
declare -A codegens=( [MatrixMult]="nocopy" )
## declare 2 kinds of Polly code
declare -a pollycodes=("seq" "openmp")

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
	# The folder of generated Polly code
	cd "$BASEDIR/polly_seq"

	## Clean folder
	# Clean the folder of executable files
	rm -rf "out"/*
	mkdir -p "out"

	## clean the assembly code (*.s)
	rm -rf "assembly"/*
	mkdir -p "assembly"
	## clean the llvm code (*.ll)
	rm -rf "llvm"/*
	mkdir -p "llvm"

	## Analyze C code and export SCoP
	echo "[*] Export SCoP in DOTs"
	##pollycc -mllvm -polly-dot -mllvm -polly-only-func=_mat_mult_ $testcase"_"$program.c Util.c WyRT.c
	pollycc -mllvm -polly-dot -mllvm -polly-only-func=_mat_mult_ $testcase"_"$program.c Util.c WyRT.c
	folder_proc "dot" "dot"
	generate_png "dot"
	read -p "-----------------Press [Enter] to continue--------------------"

	## Export JSCoP file
	echo "[*]Export JSCoP"
	pollycc -mllvm -polly-export *.c
	folder_proc "jscop" "jscop"
	read -p "-----------------Press [Enter] to continue--------------------"

	## Point out the un-optimizable region
	echo "[*]Show the region Polly can NOT analyze and reasons"
	pollycc -Rpass-missed=polly-detect $testcase"_"$program.c Util.c WyRT.c
	read -p "-----------------Press [Enter] to continue--------------------"

	## Point out the optimizable region
	echo "[*]Show the regions Polly can analyze and assumption/restrictions"
	pollycc -fcolor-diagnostics -mllvm -polly-opt-outer-coincidence=yes\
			-Rpass-analysis=polly $testcase"_"$program.c Util.c WyRT.c
	read -p "-----------------Press [Enter] to continue--------------------"

	## Show SCoP for debugging
	echo "[*]Show the information of valid SCoP"
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-detect\
			$testcase"_"$program.c Util.c WyRT.c
	read -p "-----------------Press [Enter] to continue--------------------"

	## Show SCop for debuggin
	echo "[*]Show the representation of valid SCoP"
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-scops\
			$testcase"_"$program.c Util.c WyRT.c
	read -p "-----------------Press [Enter] to continue--------------------"

	## Show AST
	echo "[*]Show the optimized AST"
	pollycc -mllvm -polly-opt-outer-coincidence=yes -mllvm -debug-only=polly-ast\
			-mllvm -polly-process-unprofitable $testcase"_"$program.c Util.c WyRT.c
	read -p "-----------------Press [Enter] to continue--------------------"
}

runBenchmark(){
	testcase=$1
	program=$2
	parameter=$3

	# Change folder
	cd "$BASEDIR/polly_seq"
	mkdir -p out

	### Generate sequential executables using GCC
	echo "[1] Run  GCC -O3  executables"
	gcc -std=c11 -O3 $testcase"_"$program.c Util.c WyRT.c -o out/$testcase"_"$program.gcc.out
	start=`date +%s%N`
	./out/$testcase"_"$program.gcc.out $parameter
	end=`date +%s%N`
	exectime=$(((end-start)/1000000))
	printf '\nExecutionTime:%s\tmilliseconds\n' $exectime

	### Generate sequential executable using Clang
	echo "[2] Run  Clang -O3  executables"
	clang -O3 $testcase"_"$program.c Util.c WyRT.c -o out/$testcase"_"$program.clang.out
	start=`date +%s%N`
	./out/$testcase"_"$program.clang.out $parameter

	end=`date +%s%N`
	exectime=$(((end-start)/1000000))
	printf '\nExecutionTime:%s\tmilliseconds\n' $exectime

	## Run sequential code, produced by Polly
	echo "[3] Run Polly-Optimized Sequential executables"
	pollycc -mllvm -polly-pattern-matching-based-opts=false $testcase"_"$program.c Util.c WyRT.c -o "out"/$testcase"_"$program.polly.out
	## Clean folder
	#cleanPollyFolder
	## Generate LLVM-IR code from C code
	#pollycc -S -emit-llvm -mllvm -polly-vectorizer=stripmine\
	#		-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
	#		$testcase"_"$program.c -o "llvm"/$testcase"_"$program.polly.ll
	### Use 'llc' to compile LLVM code into assembly code
	#llc "llvm"/$testcase"_"$program.polly.ll -o "assembly"/$testcase"_"$program.polly.s
	### Use 'clang' to compile .s file and link with 'Util.c'
	#pollycc "assembly"/$testcase"_"$program.polly.s Util.c WyRT.c -o "out"/$testcase"_"$program.polly.out
	### Run the generated executables.
	start=`date +%s%N`
	./out/$testcase"_"$program.polly.out $parameter
	end=`date +%s%N`
	exectime=$(((end-start)/1000000))
	printf '\nExecutionTime:%s\tmilliseconds\n' $exectime

	## Run parallel OpenMP code, produced by Polly
	cd "$BASEDIR/polly_openmp"
	#mkdir -p out

	# Clean the folder of executable files
	rm -rf "out"/*
	mkdir -p "out"
	## clean the assembly code (*.s)
	rm -rf "assembly"/*
	mkdir -p "assembly"
	## clean the llvm code (*.ll)
	rm -rf "llvm"/*
	mkdir -p "llvm"
	## Generate OpenMP code with different Polly passes
	#pollycc -mllvm -polly-pattern-matching-based-opts=false -mllvm -polly-parallel -mllvm -polly-process-unprofitable \
	#pollycc -mllvm -polly-parallel-force -mllvm -polly-process-unprofitable -mllvm -polly-parallel \
	#				-lgomp $testcase"_"$program.c Util.c WyRT.c -o "out"/$testcase"_"$program.openmp.out

	#pollycc -S -emit-llvm -mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
	pollycc -S -emit-llvm -mllvm -polly-pattern-matching-based-opts=false -mllvm -polly-parallel\
			-mllvm -polly-parallel-force $testcase"_"$program.c -o "llvm"/$testcase"_"$program.openmp.ll
	llc "llvm"/$testcase"_"$program.openmp.ll -o "assembly"/$testcase"_"$program.openmp.s
	### Use 'gcc' to compile .s file and link with 'libUtil.a'
	pollycc -lgomp "assembly"/$testcase"_"$program.openmp.s Util.c WyRT.c  -o "out"/$testcase"_"$program.openmp.out
	read -p "-----------------Press [Enter] to continue--------------------"

	for ((thread=1; thread <= 5 ; thread++))
	do
		echo "[4] Run Polly-Optimized OpenMP executables with $thread threads"
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
	IFS=' '
	## Iterate each codegen
	for codegen in "${codegens[$testcase]}"
	do
		runPolly $testcase $program
		#runBenchmark $testcase $program $parameter
	done
	# Return to the working directory
    cd $BASEDIR
}
### Determine problem size from cmd line argument
exec MatrixMult original 1000
