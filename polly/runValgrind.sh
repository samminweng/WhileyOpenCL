#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Create the folder and/or clean up the files
init(){
	program=$1
	c_type=$2
	dir="$PWD/$program/leaks"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
	mkdir -p "$PWD/$program/impl/$c_type/out" ## Create 'out' folder
	rm -rf "$PWD/$program/impl/$c_type/out/"*.*
	#read -p "Press [Enter] to continue..."
}
##
## Run Polly on the C code and collects the memory usage of the generated C code
##
detectleaks(){
	program=$1
	c_type=$2
	parameter=$3
	opt=$4
	num_threads=$5
        result="$PWD/../../leaks/$c_type.$program.$opt.$parameter.$num_threads.disableVC.txt"
	#read -p "Press [Enter] to continue..."
	echo -e -n "Disable loop vectorization..." > $result
	case "$opt" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -g -O3 -fno-tree-vectorize $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 -fno-vectorize $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -O3 -fno-vectorize\
			        -mllvm -polly $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -O3 -fno-vectorize\
			        -mllvm -polly -mllvm -polly-parallel -lgomp $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			;;
	esac
	#  Ref: http://valgrind.org/docs/manual/manual.html
	# Run Valgrind memcheck tool to detect memory leaks, and write out results to output file.   
	### Repeat running the executables.
	valgrind --tool=memcheck "--log-file=$result" ./out/"$program.$opt.disableVC.out" $parameter
	# Added the CPU info
	cat /proc/cpuinfo >> $result
	#read -p "Press [Enter] to continue..."	
	result="$PWD/../../leaks/$c_type.$program.$opt.$parameter.$num_threads.enableVC.txt"
	echo -e -n "Enable loop vectorization..." > $result
	case "$opt" in
		"gcc")
			echo -e -n "Compile C code using GCC -O3..." >> $result
			gcc -g -O3 $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
		"clang")
			echo -e -n "Compile C code using Clang -O3..." >> $result
			clang -g -O3 $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
		"polly")
			echo "Optimize C code using Polly..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine $program.c libUtil.a\
			 		-o "out/$program.$opt.enableVC.out"
			;;
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -g -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
					-mllvm -polly-parallel -lgomp $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
	esac
	valgrind --tool=memcheck "--log-file=$result" ./out/"$program.$opt.enableVC.out" $parameter
	# Added the CPU info
	cat /proc/cpuinfo >> $result
}
# Get the folder of Util.c and Util.h
#
# Execute benchmarks
#
exec(){
	program=$1
	c_type=$2
	parameter=$3
	opt=$4
	num_threads=$5
	######Copy Util.c Util.h to working dir
	utildir="$PWD/../tests/code"
	cp $utildir/Util.c $utildir/Util.h "$program/impl/$c_type"

	cd "$program/impl/$c_type"
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
        clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
        ar -cvq libUtil.a Util.o
	# Translate Whiley into C code
	./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"
	#read -p "Press [Enter] to continue..."	
	# Generate C code
	detectleaks $program $c_type $parameter $opt $num_threads
    # Return to the working directory
    cd ../../../
}

init MatrixMult autogenerate
exec MatrixMult autogenerate 2000X2000 gcc 1
exec MatrixMult autogenerate 2000X2000 clang 1
exec MatrixMult autogenerate 2000X2000 polly 1
exec MatrixMult autogenerate 2000X2000 openmp 1
exec MatrixMult autogenerate 2000X2000 openmp 2
exec MatrixMult autogenerate 2000X2000 openmp 4
