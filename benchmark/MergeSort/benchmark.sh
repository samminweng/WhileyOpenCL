#!/bin/bash
#
# The shell script of benchmarking the generated Java code of Whiley program
#
#parameters="10000 100000 1000000 10000000"
parameters="10000 100000 1000000 10000000 100000000 1000000000"
TIMEOUT="1800s"
# Large scaled parameters.
#parameters="10 100 1000 10000 100000 1000000 10000000 100000000 200000000 300000000 400000000 500000000 600000000 700000000 800000000 900000000 1000000000"
#
# Generate the Java or C code
#
generate_code(){
	#echo "Current DIR" . $PWD
	if [ "$CODE" = "JAVACode" ]
	then
		echo "Compile whiley into Java Code"
		# Compile the sort whiley program
		./../../../../../bin/wyjc "$SRC".whiley
	else
		# Use wyopcl shell script to generate C code
		# if [ "$OP" = "slow" ]
		# then
		# 	# Generate naive C code
		# 	./../../../../../bin/wyopcl -code "$WHILEYSRC".whiley >> $RESULT
		# else
		# 	# Generate copy-eliminated C code
		# 	./../../../../../bin/wyopcl -code -copy "$WHILEYSRC".whiley >> $RESULT
		# fi
		#compile the source C file with L2 optimization (-O2)
		#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
		echo "Compile C Code"
		gcc -m64 *.c -o "$SRC".out
	fi	
}
#
# Run compiled C code or Java code with timeout of 30 minutes.
#
run_code (){
	if [ "$CODE" = "JAVACode" ]
	then
		# Run Java code
		timeout $TIMEOUT ./../../../../../bin/wyj $SRC $parameter >> $RESULT
	else
		# Set time out 
		timeout $TIMEOUT ./"$SRC".out $parameter >> $RESULT
	fi
}

#
# Benchmarking the generated C code
#
run_benchmark (){
	NAME=$1
	CALL=$2
	CODE=$3
	OP=$4
	RESULT=$PWD/result.$NAME.$CALL.$CODE.$OP.txt
	SRC="$NAME"_"$CALL"
	DIR="$CALL/$CODE/$OP"	
	# make the folder
	mkdir -p $DIR
	# move C and Header files to working directory.
	cp "$SRC".whiley $DIR 
	# Change to working directory 
	cd $DIR
	generate_code
	#parameters
	for parameter in $parameters
	do
	    #Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $OP $SRC $CODE program method on array size =" $parameter >> $RESULT
			start=`date +%s%N`
			echo $PWD
			run_code $parameter
			# Check if the program completes the task.
			if [ "$?" = 0 ]
			then
				# Print out success messages.
				echo "Success in running $NAME $OP $CODE program on array size = " $parameter
			else
				# Print out error messages.
				echo "Errors in running $NAME $OP $CODE program on array size = " $parameter
				# Terminate the nested loop.
				break 2
			fi
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $RESULT
		done
    done
    #Added the CPU info
	cat /proc/cpuinfo >> $RESULT
    #Return to the working directory
    cd ../../../
}


# Removes all the files inside folder
rm result.*.txt 
#rm -rf call_by_value
#rm -rf call_by_reference
#
#Benchmark the generated C code
#run_benchmark mergesort call_by_value CCode copy_reduced
run_benchmark mergesort call_by_value CCode copy_reduced_noleaks
#run_benchmark mergesort call_by_value CCode naive
run_benchmark mergesort call_by_value CCode naive_noleaks
#Benchmark the generated Java code
run_benchmark mergesort call_by_value JAVACode naive