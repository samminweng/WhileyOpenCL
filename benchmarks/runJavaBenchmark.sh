#!/bin/bash
TIMEOUT="3600s"
BENCHMARKDIR="$(pwd)"

### Create the folder and/or clean up the files
init(){
	testcase=$1
	dir="$BENCHMARKDIR/$testcase/exectime/Java"
	mkdir -p "$dir"
	### remove all files inside the folder
	rm -f "$dir/"*.*
}



### Generate Java code
generateCode(){
	testcase=$1
	program=$2
	### 
	codeDir="$BENCHMARKDIR/$testcase/impl/$program/Java"
	echo $codeDir
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Whiley-to-Java compiler
	wyjc=./../../../../../bin/wyjc
	
	echo $codegen
	## Translate Whiley programs into naive Java code
	$wyjc $testcase"_"$program.whiley
}

### Run Java code
runCode(){
	testcase=$1
	program=$2
	parameter=$3
	compiler=Java
	### The executable file name
	executable="$testcase.$program.naive.disabledpattern.$compiler.1.$parameter.out"
	### Output file 
	mkdir -p $BENCHMARKDIR/$testcase/exectime/Java
	result="$BENCHMARKDIR/$testcase/exectime/Java/$executable.txt"
	### Output header
	echo "Run the $program $testcase on $parameter using $compiler and 1 threads..." > $result
	## Execute Java code
		wyj=./../../../../../bin/wyj
	## Repeat 10 times
	for i in {1..10}
	do
		echo "Run the $program $testcase on $parameter using $compiler" >> $result
		echo "Begin $i iteration" >> $result
		start=`date +%s%N`
		timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
		end=`date +%s%N`
		exectime=$((end-start))
		printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		echo "Finish $i iteration" >> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
}

#
# Generate Java code and execute benchmarks
#
exec(){
	testcase=$1
	program=$2
	parameter=$3

	## Generate Java code
	generateCode $testcase $program
	## Run Java code
	runCode $testcase $program $parameter

	cd $BENCHMARKDIR
}

## Reverse test case
#init Reverse
#exec Reverse original 100000
#exec Reverse original 1000000 ### Too long running time
# exec Reverse original 10000000
# ## TicTacToe test case
# init newTicTacToe
# exec newTicTacToe original 1000
# exec newTicTacToe original 10000
# exec newTicTacToe original 100000

# ### MergeSort test case
# init MergeSort
# exec MergeSort original 1000
# exec MergeSort original 10000
# exec MergeSort original 100000

# ## # MatrixMult test case
# init MatrixMult
# exec MatrixMult original 1000 ## Too long running time
#exec MatrixMult original 2000
#exec MatrixMult original 3000

# # # ###Sobel Edge test
# init SobelEdge
# exec SobelEdge original 8
# exec SobelEdge original 16
# exec SobelEdge original 32
# exec SobelEdge original 64
# exec SobelEdge original 128
# exec SobelEdge original 256
# exec SobelEdge original 512
# exec SobelEdge original 1024