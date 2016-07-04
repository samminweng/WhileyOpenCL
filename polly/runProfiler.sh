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
### Get the root working directory
basedir="$(dirname "$(pwd)")"
utildir="$basedir/tests/code"

### Generate C code
generateCode(){
	testcase=$1
	program=$2
	codegen=$3
	## change to 'testcase' folder
	cd "$basedir/polly/$testcase/" 
	# clean and create the folder
	rm -f "impl/$program/$codegen/*.*"
	mkdir -p "impl/$program/$codegen"
	# copy the source whiley file to the folder
	cp $testcase"_"$program.whiley "impl/$program/$codegen/."
	#read -p "Press [Enter] to continue..."
	#### Change folder to the corresponding implementation folder
	cd "impl/$program/$codegen"
	## Clean up previously generated C code
	rm -f *.c *.h
	### Copy Util.c Util.h to 
	cp $utildir/Util.c $utildir/Util.h .
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			### Translate Whiley program into naive C code 
	    	./../../../../..//bin/wyopcl -code $testcase"_"$program.whiley
	    	;;
	    "naive_dealloc")
			### Translate Whiley program into naive + dealloc C code 
	    	./../../../../../bin/wyopcl -code -dealloc $testcase"_"$program.whiley
	    	;;
	    "copyreduced")
			## Translate Whiley programs into copy_reduced C code
			./../../../../../bin/wyopcl -code -copy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
	    	./../../../../../bin/wyopcl -code -copy -dealloc $testcase"_"$program.whiley	
			;;
	esac
}
##
## Run 'Grof' to profile the generated code
##
runGProf(){
	testcase=$1
	program=$2
	codegen=$3
	compiler=$4
	parameter=$5
	threads=$6
	### executable file
	executables="$testcase.$program.$codegen.$compiler.$parameter.$threads.out"

	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "[*]Compile $program using GCC" && read
	## O3/O2 optimizes and inlines the function, and loses the track of function call 
	gcc -O3 -g -std=c99 -Wall -pg $testcase"_"$program.c Util.c -o "out/$executables"
	#gcc -O3 -fno-inline-small-functions -g -std=c99 -Wall -pg $program.c Util.c -o "out/$program.$compiler.enablevc.out"

	## Execute the program
	echo -e -n "[*]Run $program executable to produce profile files" && read
	time "./out/$executables" $parameter

	## The analysis file 'gmon.out' is generated
	echo -e -n "[*]Run GProf" && read
	##gprof "./out/$program.$compiler.enablevc.out" gmon.out
	analysis="$testcase.$program.$codegen.$compiler.$parameter.$threads.txt"
	gprof "./out/$executables" gmon.out > $analysis
	
	echo -e -n "[*]Show Profiled Analysis of $program compiled by GCC" && read
	cat $analysis | less

	echo -e -n "[*]Complete GProf Analysis ($analysis)" && read
	mv $analysis "$basedir/polly/$testcase/prof"
	## Delete gmon.out
	rm -f gmon.out
}

##
## Collect sample profile data for GCC executable
## https://gcc.gnu.org/wiki/AutoFDO/Tutorial
#runGCCProfiler(){
#	c_type=$1
#	program=$2
#	compiler=$3
#	parameter=$4
#	threads=$5
#	mkdir -p "out"
#	binary="$c_type.$program.$compiler.$parameter.$threads.enablevc.out"
#	gcov_out="$c_type.$program.$compiler.$parameter.$threads.enablevc.gcov"
#	
#	echo -e -n "[*]Build the code with enabled profiler" && read
#	gcc -O3 -fno-inline-small-functions -g -std=c99 -Wall -pg $program.c Util.c -o "out/$binary" -fprofile-generate
#
#	echo -e -n "[*]Run the executable to generate perf.data" && read
#	perf record "./out/$binary" $parameter
#
#	echo -e -n "[*]Convert perf.data into gcov format" && read
#	create_gcov --binary="./out/$binary" --profile=perf.data --gcov=$gcov_out
#
#	echo -e -n "[*]Complete GCOV Analysis" && read
#	mv $gcov_out "$PWD/../../../prof"
#
#}

###
## Run Clang sample profiler (http://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization)
###
runClangSampleProfiler(){
	testcase=$1
	program=$2
	codegen=$3
	compiler=$4
	parameter=$5
	threads=$6
	### executable file
	executables="$testcase.$program.$codegen.$compiler.$parameter.$threads.out"
	### Sampler 
	sampler="$testcase.$program.$codegen.$compiler.$parameter.$threads.sampler"
	### Analysis results
	analysis="$testcase.$program.$codegen.$compiler.$parameter.$threads.txt"
	### Perf data
	perfdata="$testcase.$program.$codegen.$compiler.$parameter.$threads.perf.data"

	echo -e -n "[*]Run the executable with sampling profiler" && read
	time perf record "./out/$executables" $parameter

	echo -e -n "[*]Convert perf.data to LLVM's sampling profiler format using AutoFDO" && read
	create_llvm_prof --use_lbr=false --binary="./out/$executables" --out=$sampler
	
	echo -e -n "[*]Show Profiled Analysis of $program compiled by Clang" && read
	llvm-profdata show -sample $sampler -output=$analysis
	llvm-profdata show -sample $sampler
	
	echo -e -n "[*]Complete Clang Sample Profiling Analysis ($analysis)" && read
	
	## Move sample profiled data
	mv $analysis "$basedir/polly/$testcase/prof"
	## delete sampler 
	rm $sampler
	## delete perf.data
	rm -f perf.data

}

exec(){
	testcase=$1
	program=$2
	codegen="copyreduced_dealloc"
	compiler=$3
	parameter=$4
	threads=$5
	### Generate the code
	generateCode $testcase $program $codegen
	rm -rf "out"
	mkdir -p "out"
    executables="$testcase.$program.$codgen.$compiler.$parameter.$threads.out"

	case "$compiler" in
		"gcc")
			runGProf $testcase $program $codgen $compiler $parameter $threads
			##runGCCProfiler $c_type $program $compiler $parameter $threads
			;;
		"clang")
			echo -e -n "[*]Build the code with source line info using Clang" && read
        	## Specify '-gline-tables-only' option to Clang compiler
        	clang -O3 -gline-tables-only $testcase"_"$program.c Util.c -o "out/$executables"
			runClangSampleProfiler $testcase $program $codgen $compiler $parameter $threads
			;;
		"polly")
			echo -e -n "[*]Build the code with source line info using Polly" && read
            ## Specify '-gline-tables-only' option to Clang compiler
            pollycc -O3 -gline-tables-only -mllvm -polly -mllvm -polly-vectorizer=stripmine\
				-mllvm -polly-process-unprofitable -mllvm -polly-opt-outer-coincidence=yes\
				$testcase"_"$program.c Util.c -o "out/$executables"
            runClangSampleProfiler $testcase $program $codgen $compiler $parameter $threads
			;;
		*)
			echo -e -n "[*]Not implemented" && read
			;;
	esac
	# Return to the working directory
    cd $basedir/polly
}

### Create the folder and/or clean up the files
init(){
	testcase=$1
	testcase=$1
	profdir="$basedir/polly/$testcase/prof"
	mkdir -p "$profdir"
	### remove all files inside the folder
	rm -f "$profdir/"*.*
}

init CoinGame
#exec CoinGame original gcc 40000 1
exec CoinGame original clang 40000 1
# exec original CoinGame polly 40000 1

# exec single CoinGame gcc 40000 1
# exec single CoinGame clang 40000 1
# exec single CoinGame polly 40000 1

# exec array CoinGame gcc 40000 1
# exec array CoinGame clang 40000 1
# exec array CoinGame polly 40000 1

#init NQueens
#exec autogenerate_leak NQueens gcc 15 1
#exec autogenerate_leak NQueens clang 15 1
#exec autogenerate_leak NQueens polly 15 1

#exec autogenerate_leakfree NQueens gcc 15 1
#exec autogenerate_leakfree NQueens clang 15 1
#exec autogenerate_leakfree NQueens polly 15 1
