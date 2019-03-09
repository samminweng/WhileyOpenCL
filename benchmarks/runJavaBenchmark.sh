#!/bin/bash
TIMEOUT="900s"
BENCHMARKDIR="$(pwd)"
### declare parameters
declare -A parameters=( 
			[LZ77]="medium1x medium5x medium10x medium25x medium50x medium60x medium65x medium68x medium69x medium70x medium71x medium75x medium100x medium125x medium150x medium175x medium200x" \
			[Reverse]="500000 1000000 1500000" \
			[newTicTacToe]="500000 1000000 1500000" \
			[BubbleSort]="10000 20000 30000" \
			[MergeSort]="500000 600000 700000" \
			[MatrixMult]="500 1000 1500"
			#[LZ77]="medium10000x medium20000x medium30000x medium40000x medium50000x medium60000x medium70000x medium80000x medium90000x medium100000x"
		)


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
	codeDir=$BENCHMARKDIR/$testcase/impl/$program"_"Java
	echo $codeDir
	## Clean the folder
	rm -rf "$codeDir"
	mkdir -p "$codeDir"
	# copy the source whiley file to the folder
	cp $BENCHMARKDIR/$testcase/$testcase"_"$program.whiley "$codeDir"

	## Change to 'codeDIR'
	cd $codeDir

	### Whiley-to-Java compiler
	wyjc=./../../../../bin/wyjc
	
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
	### Output file 
	result="$BENCHMARKDIR/$testcase/exectime/Java/$testcase.$program.java.disabledpattern.naive.seq.$parameter.1.txt"
	### Output header
	echo "Run the $program $testcase on $parameter using $compiler..." > $result
	## Execute Java code
	wyj=./../../../../bin/wyj
	## Repeat 10 times
	for i in {1..10}
	do
		echo "Run the $program $testcase on $parameter using $compiler" >> $result
		echo "Begin $i iteration" >> $result
		start=`date +%s%N`
		case "$testcase" in
			"LZ77")
				timeout $TIMEOUT $wyj $testcase"_"$program "$BENCHMARKDIR/$testcase/files/compressedfiles/$parameter.dat" >> $result
				;;
			"Reverse")
				timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
				;;
			"newTicTacToe")
				timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
				;;	
			"BubbleSort")
				timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
				;;	
			"MergeSort")
				timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
				;;	
			"MatrixMult")
				timeout $TIMEOUT $wyj $testcase"_"$program $parameter >> $result
				;;	
		esac		
		## Get exit code
		exitcode="$?"
		## Exit code of time out
		if [ "$exitcode" == "124" ]
		then
			printf "\nOOT: Run out of time $TIMEOUT\n" >> $result
			break 1 ## Break the for loop
		fi
		## Check exit status
		if [ "$exitcode" = "0" ]
		then
			end=`date +%s%N`
			exectime=$((end-start))
			printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		else
			printf "\nOOM:Run out of memory\n" >> $result
			break 1 ## Break the for loop
		fi
		echo "Finish $i iteration" >> $result
		sleep 10s
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
	## Generate Java code
	generateCode $testcase $program

	for param_arr in "${parameters[$testcase]}"
	do
		for parameter in $param_arr
		do
			echo "parameter "$parameter
			## Run Java code
			runCode $testcase $program $parameter
		done
	done
	cd $BENCHMARKDIR
}

# LZ77 decompression
#init LZ77
#exec LZ77 opt_decompress

## Reverse test case
#init Reverse
#exec Reverse original

# ## TicTacToe test case
#init newTicTacToe
#exec newTicTacToe intarray

# ### MergeSort test case
#init MergeSort
#exec MergeSort original

##BubbleSort test case
#init BubbleSort
#exec BubbleSort original

# ## # MatrixMult test case
init MatrixMult
exec MatrixMult original
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

