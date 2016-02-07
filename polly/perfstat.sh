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
	for i in {1..10}
	do
		timeout $TIMEOUT perf stat ./$program.gcc.out $parameter 2>> $result
	done
	cat /proc/cpuinfo >> $result
	cd ../../../
}

runPolly(){
	compiler=$1
	c_type=$2
	program=$3
	parameter=$4
	num_threads=$5
	cd "$program/impl/$c_type"
	result="$PWD/../../perf/$c_type.$program.$compiler.$parameter.$num_threads.txt"
	#read -p "Press [Enter] to run Polly code optimization..."
	case "$compiler" in
		"openmp")
			export OMP_NUM_THREADS=$num_threads
			echo "Run OpenMP code on $parameter X $parameter Matrix with $OMP_NUM_THREADS threads..." > $result
			clang $CPPFLAGS -include Util.c -O3 -mllvm -polly -mllvm -polly-parallel -lgomp $program.c -o $program.$compiler.out
			;;
		"polly")
			echo "Run Polly-optimized code on $parameter X $parameter Matrix with $OMP_NUM_THREADS threads..." > $result
			clang $CPPFLAGS -include Util.c -O3 -mllvm -polly $program.c -o $program.$compiler.out
			;;
	esac
	### Repeat running the executables. 
	for i in {1..10}
	do
		timeout $TIMEOUT perf stat ./$program.$compiler.out $parameter 2>> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
	cd ../../../
}



createfolder(){
	program=$1
	pref_dir="$PWD/$program/perf"
	mkdir -p 
	### remove all files inside the folder
	rm "$pref_dir/"*.*
	###read -p "Press [Enter] to continue..."
}

exec(){
	c_type=$1
	program=$2
	parameter=$3
	compiler=$4
	num_threads=$5
	
	if [ "$compiler" = "gcc" ]
	then
		#read -p "Press [Enter] to Use GCC to optimize C code of $program..."
		runGCC $c_type $program $parameter
	else
		#read -p "Press [Enter] to Use Polly to optimize C code of $program..."
		runPolly $compiler $c_type $program $parameter $num_threads
	fi
}

createfolder MatrixMult
##### handwritten C code
exec handwritten MatrixMult 2000 gcc
exec handwritten MatrixMult 2000 polly
exec handwritten MatrixMult 2000 openmp 1
exec handwritten MatrixMult 2000 openmp 2
exec handwritten MatrixMult 2000 openmp 4
exec handwritten MatrixMult 2000 openmp 8
#### new handwritten C code 
exec handwritten2 MatrixMult 2000 gcc
exec handwritten2 MatrixMult 2000 polly
exec handwritten2 MatrixMult 2000 openmp 1
exec handwritten2 MatrixMult 2000 openmp 2
exec handwritten2 MatrixMult 2000 openmp 4
exec handwritten2 MatrixMult 2000 openmp 8
#### Generated C code
exec copy_reduced_dealloc MatrixMult 2000 gcc
exec copy_reduced_dealloc MatrixMult 2000 polly
exec copy_reduced_dealloc MatrixMult 2000 openmp 1
exec copy_reduced_dealloc MatrixMult 2000 openmp 2
exec copy_reduced_dealloc MatrixMult 2000 openmp 4
exec copy_reduced_dealloc MatrixMult 2000 openmp 8
