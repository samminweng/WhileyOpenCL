#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

init(){
	program=$1
	c_type=$2
	pref_dir="$PWD/$program/perf"
	mkdir -p "$pref_dir"
	### remove all files inside the folder
	rm -f "$pref_dir/"*.*
	mkdir -p "$PWD/$program/impl/$c_type/out" ## Create 'out' folder
	rm -rf "$PWD/$program/impl/$c_type/out/"*.*
	read -p "Press [Enter] to continue..."
}

run(){
	executables=$1
	results=$2
	### Repeat running the executables.
	for i in {1..10}
	do
	 	timeout $TIMEOUT perf stat $executables $parameter >>$result 2>> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
}
##
## Run Polly on the C code
##
compileProgram(){
	opt=$1
	c_type=$2
	program=$3
	parameter=$4
	num_threads=$5	
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o
    result="$PWD/../../perf/$c_type.$program.$opt.$parameter.$num_threads.disableVC.txt"
	echo -e -n "Disable loop vectorization..." > $result
	case "$opt" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -O3 -fno-tree-vectorize $program.c -o "out/$program.$opt.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -O3 -fno-vectorize $program.c -o "out/$program.$opt.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -O3 -fno-vectorize\
			        -mllvm -polly $program.c -o "out/$program.$opt.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -O3 -fno-vectorize\
			        -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out/$program.$opt.out"
			;;
	esac
	run "./out/$program.$opt.out" $result
	
	result="$PWD/../../perf/$c_type.$program.$opt.$parameter.$num_threads.enableVC.txt"
	echo -e -n "Enable loop vectorization..." > $result
	case "$opt" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -O3 $program.c -o "out/$program.$opt.vector.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -O3 $program.c -o "out/$program.$opt.vector.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -O3 -mllvm -polly $program.c -o "out/$program.$opt.vector.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out/$program.$opt.vector.out"
			;;
	esac
	run "./out/$program.$opt.vector.out" $result
}
#
# Execute benchmarks
#
exec(){
	program=$1
	c_type=$2
	parameter=$3
	opt=$4
	num_threads=$5
	cd "$program/impl/$c_type"
	compileProgram $opt $c_type $program $parameter $num_threads
	
	cd ../../../
}


#### Handwritten MatrixAdd
# init MatrixAdd handwritten
# exec MatrixAdd handwritten 2000X2000 gcc 1
# exec MatrixAdd handwritten 2000X2000 clang 1
# exec MatrixAdd handwritten 2000X2000 polly 1
# exec MatrixAdd handwritten 2000X2000 openmp 1
# exec MatrixAdd handwritten 2000X2000 openmp 2
# exec MatrixAdd handwritten 2000X2000 openmp 4

#### Handwritten MatrixMult
init MatrixMult handwritten
exec MatrixMult handwritten 2000X2000 gcc 1
exec MatrixMult handwritten 2000X2000 clang 1
exec MatrixMult handwritten 2000X2000 polly 1
exec MatrixMult handwritten 2000X2000 openmp 1
exec MatrixMult handwritten 2000X2000 openmp 2
exec MatrixMult handwritten 2000X2000 openmp 4
#### Handwritten MatrixMult 2
# exec MatrixMult handwritten2 2000X2000 gcc 1
# exec MatrixMult handwritten2 2000X2000 clang 1
# exec MatrixMult handwritten2 2000X2000 polly 1
# exec MatrixMult handwritten2 2000X2000 openmp 1
# exec MatrixMult handwritten2 2000X2000 openmp 2
# exec MatrixMult handwritten2 2000X2000 openmp 4