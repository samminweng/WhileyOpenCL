#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8

declare -a parameters=( 1000 10000 100000 1000000 )

## Compile C code into executable 
compile(){
	mkdir -p "out"
	## Clean up exectime
	rm -f "out/"*.*
	## Declare an array of GMP integers
	gcc -g -lgmp bubblesort_gmp.c -o "out/bubblesort_gmp.out"
	## Declare an array of 64bit integers
	gcc -g bubblesort.c -o "out/bubblesort_64bit.out"
}
## Run the seq/parallel cilk executable
run(){
	parameter=$1
	programtype=$2
	
	## Output result file
	result="exectime/bubblesort.$parameter.$programtype.txt"
	for i in {1..10}
	do
		echo "Run the bubblesort $testcase on $parameter using $compiler" >> $result
		echo "=== Begin $i iteration ===" >> $result
		#timeout $TIMEOUT perf stat out/"$executable.out" $parameter >>$result 2>> $result
		start=`date +%s%N`

		## Run the executable
		time "./out/bubblesort_$programtype.out" $parameter >> $result

		###########################################
		## Check exit code
		exitcode="$?"
		## Exit code of time out 
		if [ "$exitcode" == "124" ]
		then
			printf "\nOOT: Run out of time $TIMEOUT\n" >> $result
			break 1 ## Break the for loop
		fi
		##
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
		###############################################
		echo "=== Finish $i iteration ===" >> $result
		####### Wait until background process is completed
		wait ${!}
	done

	### Output the hardware info.
	cat /proc/cpuinfo >> $result
}


exec(){
	## Clean up exectime
	rm -f "exectime/"*.*

	testcase=$1
	## Compile the file into executable
	compile

	for param in "${parameters[@]}"
	do
		## Run bubblesort using 64 bit integers
		run $param "64bit"
		## Run bubblesort using GMP integers
		run $param "gmp"
	done
}

exec "bubblesort"