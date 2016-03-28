#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

run(){
	executables=$1
	results=$2
	export OMP_NUM_THREADS=$num_threads
	if [[ $c_type == "diableVC" ]]
	then
		echo -e -n "Disable loop vectorization..." > $result
	else
		echo -e -n "Enable loop vectorization..." > $result
	fi

	echo -e -n "Compile C code using $opt with $OMP_NUM_THREADS threads..." >> $result

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
	c_type=$1
	program=$2
	parameter=$3
	opt=$4
	num_threads=$5
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    	utildir="$PWD/../../../../tests/code"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $PWD
    	clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    	ar -cvq libUtil.a Util.o
    	if [[ $c_type == *"autogenerate"* ]]
	then
		### Translate Whiley program into C code 
		./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"
	fi
   	###read -p "Press [Enter] to continue..."
    	### Compile C code into executables
	case "$opt" in
		"gcc")
			gcc -O3 -fno-tree-vectorize $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			gcc -O3 $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
		"clang")
			clang -O3 -fno-vectorize $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			clang -O3 $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
		"polly")
			pollycc -O3 -fno-vectorize -mllvm -polly $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
		"openmp")
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			pollycc -O3 -fno-vectorize -mllvm -polly -mllvm -polly-parallel -lgomp $program.c libUtil.a -o "out/$program.$opt.disableVC.out"
			pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine -mllvm -polly-parallel -lgomp $program.c libUtil.a -o "out/$program.$opt.enableVC.out"
			;;
	esac
	###read -p "Press [Enter] to continue..."
	result="$PWD/../../perf/$c_type.$program.$opt.$parameter.$num_threads.disableVC.txt"
	run "./out/$program.$opt.disableVC.out" $result $opt $num_threads "diableVC"

	result="$PWD/../../perf/$c_type.$program.$opt.$parameter.$num_threads.enableVC.txt"
	run "./out/$program.$opt.enableVC.out" $result $opt $num_threads "enableVC"
}
#
# Execute benchmarks
#
exec(){
	c_type=$1
	program=$2
	parameter=$3
	cd "$program/impl/$c_type"
	compileProgram $c_type $program $parameter "gcc" 1
	compileProgram $c_type $program $parameter "clang" 1
	compileProgram $c_type $program $parameter "polly" 1
	compileProgram $c_type $program $parameter "openmp" 1
	compileProgram $c_type $program $parameter "openmp" 2
	compileProgram $c_type $program $parameter "openmp" 4
	cd ../../../
}
### Create the folder and/or clean up the files
init(){
	c_type=$1
	program=$2
	pref_dir="$PWD/$program/perf"
	mkdir -p "$pref_dir"
	### remove all files inside the folder
	rm -f "$pref_dir/"*.*
	mkdir -p "$PWD/$program/impl/$c_type/out" ## Create 'out' folder
	rm -rf "$PWD/$program/impl/$c_type/out/"*.*
	read -p "Press [Enter] to continue..."
}


### Autogenerate1 MatrixMult
init autogenerate1 MatrixMult
exec autogenerate1 MatrixMult 1000
exec autogenerate1 MatrixMult 2000
