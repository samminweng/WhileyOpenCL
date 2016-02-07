#!/bin/bash
export CPPFLAGS="-Xclang -load -Xclang ${POLLY_BUILD_DIR}/lib/LLVMPolly.so"
export OPTFLAGS="-load ${POLLY_BUILD_DIR}/lib/LLVMPolly.so"
TIMEOUT="1800s"
#
# Generate the C code w.r.t. code optimization
#
generate_code(){
	c_type=$1
	program=$2
	utildir="$PWD/../tests/code"
	workingdir="$program/impl/$c_type"
	cp "$PWD/../$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	## copy *.whiley and Util.c Util.h to working folder
	cd $workingdir
	# Use wyopcl shell script to generate C code
	# The 'case esac' example is http://www.tutorialspoint.com/unix/case-esac-statement.htm 
	case "$c_type" in
		"naive")
			# Generate naive C code
		 	./../../../../bin/wyopcl -code "$program".whiley
		 	;;
		"naive_dealloc")
			# Generate naive C code
		 	./../../../../bin/wyopcl -code -dealloc "$program".whiley
		 	;;
		"copy_reduced")
			# Generate copy-eliminated C code
		 	./../../../../bin/wyopcl -code -copy "$program".whiley
			;;
		"copy_reduced_dealloc")
			# Generate copy-eliminated C code
		 	./../../../../bin/wyopcl -code -copy -dealloc "$program".whiley
			;;
	esac
	cd ../../../
}

runGCC(){
	c_type=$1
	program=$2
	parameter=$3
	cd "$program/impl/$c_type"
	result="$PWD/../../perf/$c_type.$program.$compiler.$parameter.txt"
	#read -p "Press [Enter] to run GCC compiler..."
	gcc -O3 Util.c $program.c -o $program.gcc.out
	echo "Run GCC-compiled code on $parameter X $parameter Matrix..." > $result
	timeout $TIMEOUT perf stat ./$program.gcc.out $parameter 2>> $result
	cat /proc/cpuinfo >> $result
	cd ../../../
}

runOpenMP(){
	c_type=$1
	program=$2
	parameter=$3
	num_threads=$4
	cd "$program/impl/$c_type"
	result="$PWD/../../perf/$c_type.$program.$compiler.$parameter.$num_threads.txt"
	export OMP_NUM_THREADS=$num_threads
	echo "Run OpenMP code on $parameter X $parameter Matrix with $OMP_NUM_THREADS threads..." > $result
	#read -p "Press [Enter] to run OpenMP code..."
	clang $CPPFLAGS -include Util.c -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o $program.openmp.out
	timeout $TIMEOUT perf stat ./$program.openmp.out $parameter 2>> $result
	cat /proc/cpuinfo >> $result
	cd ../../../
}

exec(){
	c_type=$1
	program=$2
	parameter=$3
	compiler=$4
	num_threads=$5
	mkdir -p "$PWD/$program/perf"
	#read -p "Press [Enter] to generate C code for $program.whiley..."	
	#generate_code $c_type $program
	case "$compiler" in
		"gcc")
			runGCC $c_type $program $parameter
			;;
		"openmp")
			runOpenMP $c_type $program $parameter $num_threads
			;;
	esac 
	
	#cd ../../../
}
exec handwritten MatrixMult 2000 gcc
exec handwritten MatrixMult 2000 openmp 1
exec handwritten MatrixMult 2000 openmp 2
exec handwritten MatrixMult 2000 openmp 4
exec handwritten MatrixMult 2000 openmp 8
exec handwritten2 MatrixMult 2000 gcc
exec handwritten2 MatrixMult 2000 openmp 1
exec handwritten2 MatrixMult 2000 openmp 2
exec handwritten2 MatrixMult 2000 openmp 4
exec handwritten2 MatrixMult 2000 openmp 8

exec copy_reduced_dealloc MatrixMult 2000 gcc
exec copy_reduced_dealloc MatrixMult 2000 openmp 1
exec copy_reduced_dealloc MatrixMult 2000 openmp 2
exec copy_reduced_dealloc MatrixMult 2000 openmp 4
exec copy_reduced_dealloc MatrixMult 2000 openmp 8
