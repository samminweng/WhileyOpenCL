#!/bin/bash
TIMEOUT="1800s"
alias opt="opt -O3 -polly"
alias pollycc="clang -O3 -mllvm -polly"
### Get the root working directory
basedir="$(dirname "$(pwd)")"
UTILDIR="$basedir/tests/code"

### Create the 'profile' folder and clean up the files
init(){
	testcase=$1
	profDir="$basedir/polly/$testcase/prof"
	mkdir -p "$profDir"
	### remove all files inside the folder
	rm -f "$profDir/"*.*
}


### Generate C code
generateCode(){
	testcase=$1
	program=$2
	codegen=$3
	enabledpattern=$4

	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		codeDir="$basedir/polly/$testcase/impl/$program/patern/$codegen"
		pattern=$5
	else
		### Disable pattern transformation
		codeDir="$basedir/polly/$testcase/impl/$program/nopatern/$codegen"
	fi
	#echo $codeDir
	#read -p "Press [Enter] to continue..."
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $basedir/polly/$testcase/$testcase"_"$program.whiley "$codeDir"
	### Copy Util.c Util.h to current folder
	cp $UTILDIR/Util.c $UTILDIR/Util.h "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Disable pattern transformation
	wyopcl=./../../../../../../bin/wyopcl
	if [ $enabledpattern == 1 ] 
	then
		### Enable pattern transformation
		wyopcl=$wyopcl" -pattern $pattern"	
	fi
	#echo $codegen
	## Translate Whiley programs into naive C code
	case "$codegen" in
		"naive")
			### Translate Whiley program into naive C code
			$wyopcl -code $testcase"_"$program.whiley
			;;
		"naive_dealloc")
			### Translate Whiley program into naive + dealloc C code 
			$wyopcl -code -dealloc $testcase"_"$program.whiley
			;;
		"copyreduced")
			## Translate Whiley programs into copy_reduced C code
			$wyopcl -code -nocopy $testcase"_"$program.whiley
			;;
		"copyreduced_dealloc")
			### Translate Whiley program into copy-eliminated + memory deallocated C code
			$wyopcl -code -nocopy -dealloc $testcase"_"$program.whiley
			;;
	esac
}

##
## Run Callgrind to profile the generated code
## http://valgrind.org/docs/manual/cl-manual.html
##
runcallgrind(){
	testcase=$1
	program=$2
	codegen=$3
	enabledpattern=$4
	parameter=$5
	compiler=$6
	num_threads=$7
	mkdir -p out
	if [ $enabledpattern == 1 ]
	then
		## Enable pattern transformation
		executable="$testcase.$program.$codegen.enabledpattern.$compiler.$num_threads.$parameter.out"
	else
		executable="$testcase.$program.$codegen.disabledpattern.$compiler.$num_threads.$parameter.out"
	fi
	## output file
	callgrind_report="callgrind.$executable.txt"

	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "[*]Compile $program using GCC" 
	## O3 optimizes and inlines the function, but loses the track of function call 
	gcc -O0 -std=c11 -Wall -pg -fno-inline-functions-called-once $testcase"_"$program.c Util.c -o "out/$executable"

	## Execute the program
	echo -e -n "[*]Run $program executable to produce profile files"
	## LZ test case
	if [ $testcase = "LZ77" ]
	then
		valgrind --tool=callgrind "./out/$executable" "$basedir/polly/$testcase/$parameter"
	else
		## Other cases
		valgrind --tool=callgrind "./out/$executable" $parameter
	fi

	## The ouput file 'callgrind.out.<pid> ' is generated
	echo -e -n "[*]Generate summary "
	callgrind_annotate callgrind.out.* > $callgrind_report
	
	#echo -e -n "[*]Show Profiled $program compiled by GCC"
	#cat $callgrind_report | less

	echo -e -n "[*]Complete GProf Analysis ($gprof_report)" 
	mv $callgrind_report "$basedir/polly/$testcase/prof"
	## Delete callgrind output file
	rm -f callgrind.out.*
}



##
## Run 'Grof' to profile the generated code
##
rungprof(){
	testcase=$1
	program=$2
	codegen=$3
	enabledpattern=$4
	parameter=$5
	compiler=$6
	num_threads=$7
	mkdir -p out
	if [ $enabledpattern == 1 ]
	then
		## Enable pattern transformation
		executable="$testcase.$program.$codegen.enabledpattern.$compiler.$num_threads.$parameter.out"
	else
		executable="$testcase.$program.$codegen.disabledpattern.$compiler.$num_threads.$parameter.out"
	fi
	## output file
	gprof_report="gprof.$executable.txt"

	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "[*]Compile $program using GCC" 
	## O3 optimizes and inlines the function, but loses the track of function call 
	gcc -O0 -std=c99 -Wall -pg -fno-inline-functions-called-once $testcase"_"$program.c Util.c -o "out/$executable"

	## Execute the program
	echo -e -n "[*]Run $program executable to produce profile files"
	## LZ test case
	if [ $testcase = "LZ77" ]
	then
		time "./out/$executable" "$basedir/polly/$testcase/$parameter"
	else
		## Other cases
		time "./out/$executable" $parameter
	fi

	## The analysis file 'gmon.out' is generated
	echo -e -n "[*]Run GProf"
	##gprof "./out/$program.$compiler.enablevc.out" gmon.out
	gprof "./out/$executable" gmon.out > $gprof_report
	
	#echo -e -n "[*]Show Profiled Analysis of $program compiled by GCC" 
	#cat $gprof_report | less

	echo -e -n "[*]Complete GProf Analysis ($gprof_report)" 
	mv $gprof_report "$basedir/polly/$testcase/prof"
	## Delete gmon.out
	rm -f gmon.out
}

# ##
# ## Collect sample profile data using 'perf'
# ## https://perf.wiki.kernel.org/index.php/Tutorial
# runperf(){
# 	testcase=$1
# 	program=$2
# 	codegen=$3
# 	enabledpattern=$4
# 	parameter=$5
# 	compiler=$6
# 	num_threads=$7
# 	mkdir -p out

# 	if [ $enabledpattern == 1 ]
# 	then
# 		## Enable pattern transformation
# 		executable="$testcase.$program.$codegen.enabledpattern.$compiler.$num_threads.$parameter.out"
# 	else
# 		executable="$testcase.$program.$codegen.disabledpattern.$compiler.$num_threads.$parameter.out"
# 	fi
# 	perf_report="perf.$executable.txt"
# 	#gcov_out="$executable.gcov"
	
# 	echo -e -n "[*]Build the code with enabled profiler" 
# 	gcc -O0 -std=c99 -Wall -pg -fno-inline-functions-called-once $testcase"_"$program.c Util.c -o "out/$executable" -fprofile-generate

# 	echo -e -n "[*]Run the executable to generate perf.data" 
# 	## LZ test case
# 	if [ $testcase = "LZ77" ]
# 	then
# 		# Sample the instructions at user level
# 		perf record -e instructions:u "./out/$executable" "$basedir/polly/$testcase/$parameter"
# 	else
# 		## Other cases
# 		perf record -e instructions:u "./out/$executable" $parameter
# 	fi

# 	echo -e -n "[*]Sample analysis on perf.data"
# 	perf report -k "./out/$executable"

# 	echo -e -n "[*]Complete Profiling" && read
# 	perf report -k "./out/$executable" --stdio > $perf_report
# 	mv $perf_report "$basedir/polly/$testcase/prof"


# 	# echo -e -n "[*]Convert perf.data into gcov format" && read
# 	# create_gcov --binary="./out/$executable" --profile=perf.data --gcov=$gcov_out

# 	# echo -e -n "[*]Complete GCOV Analysis" && read
# 	# mv $gcov_out "$basedir/polly/$testcase/prof"

# }

# ###
# ## Run Clang sample profiler (http://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization)
# ###
# runClangSampleProfiler(){
# 	testcase=$1
# 	program=$2
# 	codegen=$3
# 	compiler=$4
# 	parameter=$5
# 	threads=$6
# 	### executable file
# 	executables="$testcase.$program.$codegen.$compiler.$parameter.$threads.out"
# 	### Sampler 
# 	sampler="$testcase.$program.$codegen.$compiler.$parameter.$threads.sampler"
# 	### Analysis results
# 	analysis="$testcase.$program.$codegen.$compiler.$parameter.$threads.txt"
# 	### Perf data
# 	perfdata="$testcase.$program.$codegen.$compiler.$parameter.$threads.perf.data"

# 	echo -e -n "[*]Run the executable with sampling profiler" && read
# 	time perf record "./out/$executables" $parameter

# 	echo -e -n "[*]Convert perf.data to LLVM's sampling profiler format using AutoFDO" && read
# 	create_llvm_prof --use_lbr=false --binary="./out/$executables" --out=$sampler
	
# 	echo -e -n "[*]Show Profiled Analysis of $program compiled by Clang" && read
# 	llvm-profdata show -sample $sampler -output=$analysis
# 	llvm-profdata show -sample $sampler
	
# 	echo -e -n "[*]Complete Clang Sample Profiling Analysis ($analysis)" && read
	
# 	## Move sample profiled data
# 	mv $analysis "$basedir/polly/$testcase/prof"
# 	## delete sampler 
# 	rm $sampler
# 	## delete perf.data
# 	rm -f perf.data

# }

# 
# Profile the c program
#
exec(){
	testcase=$1
	program=$2
	parameter=$3

	## Declare an associative array for pattern matching
	declare -A patterns=( [LZ77]=compress )

	## Profile two kinds of code generation
	declare -a codegens=("naive_dealloc" "copyreduced_dealloc")

	# ## Iterate each codegen
	for codegen in "${codegens[@]}"
	do
		## disabled the pattern
		enabledpattern=0
		# Generate C code with disabled pattern 
		generateCode $testcase $program $codegen $enabledpattern
		# Profile the generated C code 
		rungprof $testcase $program $codegen $enabledpattern $parameter "gcc" 1		
		##runcallgrind $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		# Get the pattern option 
		pattern=${patterns[$testcase]}
		if [ $pattern ]
		then
			
			# Enable the pattern matching
			enabledpattern=1
			# Generate C code with enabled pattern 
			generateCode $testcase $program $codegen $enabledpattern $pattern
			# Profile the generated C code 
			rungprof $testcase $program $codegen $enabledpattern $parameter "gcc" 1
			###runcallgrind $testcase $program $codegen $enabledpattern $parameter "gcc" 1
		fi
	done
	# #detectleaks $testcase $program $codegen $parameter "clang" 1
	# #detectleaks $testcase $program $codegen $parameter "polly" 1
	# #detectleaks $testcase $program $codegen $parameter "openmp" 1
	# #detectleaks $testcase $program $codegen $parameter "openmp" 2
	# #detectleaks $testcase $program $codegen $parameter "openmp" 4
	# #Return to the working directory
 	cd $basedir/polly

    #read -p "Press [Enter] to continue..."
}

# ####LZ77 test case
init LZ77
exec LZ77 original "large.in"
