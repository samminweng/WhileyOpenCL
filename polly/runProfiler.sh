#!/bin/bash
###
## Profile the generated C code using Gprof or Clang sample profiler
## 
###
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Generate C code
generateCode(){
	program=$1
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
	utildir="$PWD/../../../../tests/code"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $PWD
	#clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
	#ar -cvq libUtil.a Util.o
	if [[ $c_type == *"autogenerate"* ]]
	then
		if [[ $c_type == *"leakfree"* ]]
		then
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
            ./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"	
		else
			### Translate Whiley program into copy-eliminated C code 
			./../../../../bin/wyopcl -code -copy "$program.whiley"
		fi
	fi
	#echo -e -n "${GREEN}[*]Generate $program C code${RESET}" && read
}

runGProf(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	threads=$5
	mkdir -p "out"
	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "[*]Compile $program using GCC" && read
	gcc -O3 -g -std=c99 -Wall -pg $program.c Util.c -o "out/$program.$compiler.enablevc.out"

	## Execute the program
	echo -e -n "[*]Run $program executable to produce profile files" && read
	cd out
	time "./$program.$compiler.enablevc.out" $parameter

	## The analysis file 'gmon.out' is generated
	echo -e -n "[*]Run GProf" && read
	mkdir -p "$PWD/../../../prof"
	##gprof "./out/$program.$compiler.enablevc.out" gmon.out
	analysis="$c_type.$program.$compiler.$parameter.$threads.enablevc.txt"
	gprof "./$program.$compiler.enablevc.out" gmon.out > $analysis

	echo -e -n "[*]Show Profiled Analysis of $program compiled by GCC" && read
	cat $analysis | less

	echo -e -n "[*]Complete GProf Analysis ($analysis)" && read
	mv $analysis "$PWD/../../../prof"
	cd ..
}



###
## Run Clang sample profiler (http://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization)
###
runClangSampleProfiler(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	threads=$5
	mkdir -p "out"
	binary="$c_type.$program.$compiler.$parameter.$threads.enablevc.out"
	sampler="$c_type.$program.$compiler.$parameter.$threads.enablevc.sampler"
	analysis="$c_type.$program.$compiler.$parameter.$threads.enablevc.txt"
	perfdata="$c_type.$program.$compiler.$parameter.$threads.enablevc.perf.data"

	echo -e -n "[*]Build the code with source line info." && read
	clang -O3 -g NQueens.c Util.c -o "out/$binary"

	echo -e -n "[*]Run the executable with sampling profiler" && read
	time perf record "./out/$binary" $parameter

	echo -e -n "[*]Convert perf.data to LLVM's sampling profiler format using AutoFDO" && read
	create_llvm_prof --use_lbr=false --binary="./out/$binary" --out=$sampler
	
	echo -e -n "[*]Show Profiled Analysis of $program compiled by Clang" && read
	llvm-profdata show -sample $sampler -output=$analysis
	llvm-profdata show -sample $sampler
	
	echo -e -n "[*]Complete Clang Sample Profiling Analysis ($analysis)" && read
	## Clean up folder
	mkdir -p "$PWD/../../prof"
	mkdir -p "$PWD/../../prof/clang"
	mkdir -p "$PWD/../../prof/clang/out"
	mkdir -p "$PWD/../../prof/clang/sampler"
	mkdir -p "$PWD/../../prof/clang/perfdata"
	## Move binary file
	mv "out/$binary" "$PWD/../../prof/clang/out"
	## Move sample profiled data
	mv $sampler "$PWD/../../prof/clang/sampler"
	mv $analysis "$PWD/../../prof"
	## Move perf.data
	mv perf.data $perfdata
	mv $perfdata "$PWD/../../prof/clang/perfdata"

}

exec(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	threads=$5
	# change folder
	cd "$program/impl/$c_type"
	generateCode $program $compiler
	case "$compiler" in
		"gcc")
			runGProf $c_type $program $compiler $parameter $threads
			;;
		"clang")
			runClangSampleProfiler $c_type $program $compiler $parameter $threads
			;;
		*)
			echo -e -n "[*]Not implemented" && read
			;;
	esac

	cd ../../..
}

init(){
	program=$1
	rm -rf "$program/prof/*.*"
}

init NQueens
#exec autogenerate_leak NQueens gcc 13 1
#exec autogenerate_leakfree NQueens gcc 13 1

exec autogenerate_leak NQueens clang 12 1
exec autogenerate_leakfree NQueens clang 12 1
