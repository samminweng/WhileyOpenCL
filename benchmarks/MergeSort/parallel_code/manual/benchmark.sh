#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8

## declare the number of threads
declare -a threads=( 1 2 4 8 )
declare -a parameters=( 1000 10000 100000 1000000 10000000 100000000 )

## Compile C code into sequential or parallel Cilk executable
compile(){
	mkdir -p "out"
	## Clean up exectime
	rm -f "out/"*.*
	### Sequential code
	gcc -g mergesort_seq.c -o "out/mergesort_seq.out"
	### Pure cilk code
	gcc -g -fcilkplus mergesort_cilk.c -o "out/mergesort_cilk.out"
	### Cilk + pipeline slice function
	gcc -g -fcilkplus mergesort_cilkpipeline.c -o "out/mergesort_cilkpipeline.out"
	### Seq + cilk code
	gcc -g -fcilkplus mergesort_seqcilk.c -o "out/mergesort_seqcilk.out"
	### Seq + cilk + pipeline
	gcc -g -fcilkplus mergesort_seqcilkpipeline.c -o "out/mergesort_seqcilkpipeline.out"
}
## Run the seq/parallel cilk executable
run(){
	parameter=$1
	programtype=$2
	thread=$3
	if [ "$programtype" != "seq" ]
	then
		## Run the executable
		export CILK_NWORKERS=$thread
	fi

	## Output result file
	result="exectime/mergesort.$parameter.$programtype.$thread.txt"
	for i in {1..10}
	do
		echo "Run the $program $testcase on $parameter using $compiler" >> $result
		echo "=== Begin $i iteration ===" >> $result
		#timeout $TIMEOUT perf stat out/"$executable.out" $parameter >>$result 2>> $result
		start=`date +%s%N`

		## Run the executable
		time "./out/mergesort_$programtype.out" $parameter >> $result

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
		## Run Sequential mergesort
		run $param "seq" 1
		## Run Cilk parallel file
		for thread in "${threads[@]}"
		do
			echo "thread = "$thread
			### Run cilk code
			run $param "cilk" $thread
			### Run cilk + pipeline code
			run $param "cilkpipeline" $thread
			### Run seq + cilk code
			run $param "seqcilk" $thread
			### Run seq + cilk + pipeline code
			run $param "seqcilkpipeline" $thread
		done
	done

	## Rmove all *.out files
	rm -f "out/"*.*
}

exec "mergesort"
