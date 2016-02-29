#!/bin/bash
TIMEOUT="1800s"
export POLLY_BUILD_DIR="$HOME/polly/llvm_build"
export CPPFLAGS="-Xclang -load -Xclang ${POLLY_BUILD_DIR}/lib/LLVMPolly.so"


init(){
	program=$1
	pref_dir="$PWD/$program/perf"
	mkdir -p "$pref_dir"
	### remove all files inside the folder
	rm -f "$pref_dir/"*.*
	#read -p "Press [Enter] to continue..."

}

#
# Optimize C code using GCC vectorization Optimization '-ftree-vectorize', enabled by -O3
# https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
#
runGCC(){
	c_type=$1
	program=$2
	parameter=$3
	num_threads=$4
	result="$PWD/../../perf/$c_type.$program.$compiler.$parameter.$num_threads.txt"
	 ### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    gcc -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    ar -cvq libUtil.a Util.o
	# Run GCC vectorization 
	#read -p "Press [Enter] to run GCC Vectorization Optimization"
	#gcc -O3 -ftree-vectorizer-verbose=2 $program.c 2> $program.gcc.vectorize.txt
	mkdir -p "out"
	#read -p "Press [Enter] to run GCC compiler..."
	gcc -O3 -ftree-vectorize $program.c libUtil.a -o "out/$program.gcc.out"
	echo "Run GCC-compiled code on $parameter..." > $result
	
}
##
## Run polly to optimize the C code
##
runPolly(){
	compiler=$1
	c_type=$2
	program=$3
	parameter=$4
	num_threads=$5
	result="$PWD/../../perf/$c_type.$program.$compiler.$parameter.$num_threads.txt"
	mkdir -p "out" ## Create 'out' folder
	#read -p "Press [Enter] to run Polly code optimization..."
	case "$compiler" in
		"polly")
			echo "Run Polly-optimized code on $parameter with $num_threads threads..." > $result
			clang $CPPFLAGS -include Util.c -O3 -mllvm -polly $program.c -o "out/$program.$compiler.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Run OpenMP code on $parameter with $OMP_NUM_THREADS threads..." > $result
			clang $CPPFLAGS -include Util.c -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o "out/$program.$compiler.out"
			;;
		"vector")
			echo "Run Polly-optimized code on $parameter with $num_threads threads..." > $result
			clang $CPPFLAGS -include Util.c -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine $program.c -o "out/$program.$compiler.out"
			;;
	esac

	
}
#
# Execute benchmarks
#
exec(){
	c_type=$1
	program=$2
	parameter=$3
	compiler=$4
	num_threads=$5
	cd "$program/impl/$c_type"
	if [ "$compiler" = "gcc" ]
	then
		#read -p "Press [Enter] to Use GCC to optimize C code of $program..."
		runGCC $c_type $program $parameter $num_threads
	else
		#read -p "Press [Enter] to Use Polly to optimize C code of $program..."
		runPolly $compiler $c_type $program $parameter $num_threads
	fi
	### Repeat running the executables. 
	#read -p "Press [Enter] to Run $program executables..."
	for i in {1..10}
	do
	 	timeout $TIMEOUT perf stat "./out/$program.$compiler.out" $parameter >>$result 2>> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
	cd ../../../
}

init VectorMult
exec handwritten VectorMult 1024*1024*1024*16 gcc 1
exec handwritten VectorMult 1024*1024*1024*16 polly 1
exec handwritten VectorMult 1024*1024*1024*16 openmp 1
exec handwritten VectorMult 1024*1024*1024*16 openmp 2
exec handwritten VectorMult 1024*1024*1024*16 openmp 4
exec handwritten VectorMult 1024*1024*1024*16 openmp 8
exec handwritten VectorMult 1024*1024*1024*16 vector 1
# init MatrixMult
# ##### handwritten C code
# # exec handwritten MatrixMult 2048 gcc 1
# # exec handwritten MatrixMult 2048 polly 1
# # exec handwritten MatrixMult 2048 openmp 1
# # exec handwritten MatrixMult 2048 openmp 2
# # exec handwritten MatrixMult 2048 openmp 4
# # exec handwritten MatrixMult 2048 openmp 8
# #### new handwritten C code 
# exec handwritten2 MatrixMult 2048 gcc 1
# exec handwritten2 MatrixMult 2048 polly 1
# exec handwritten2 MatrixMult 2048 openmp 1
# exec handwritten2 MatrixMult 2048 openmp 2
# exec handwritten2 MatrixMult 2048 openmp 4
# exec handwritten2 MatrixMult 2048 openmp 8
#### Generated C code
# exec copy_reduced_dealloc MatrixMult 2000 gcc
# exec copy_reduced_dealloc MatrixMult 2000 polly
# exec copy_reduced_dealloc MatrixMult 2000 openmp 1
# exec copy_reduced_dealloc MatrixMult 2000 openmp 2
# exec copy_reduced_dealloc MatrixMult 2000 openmp 4
# exec copy_reduced_dealloc MatrixMult 2000 openmp 8
