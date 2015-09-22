#!/bin/bash
#
# The shell script of benchmarking the generated Java code of Whiley program
#
# parameters="10 100 1000"
# Large scaled parameters.
parameters="10 100 1000 10000 100000 1000000 10000000 20000000 30000000 40000000 50000000 60000000 70000000 80000000 90000000 100000000"
#
# Run the benchmarks of generated Java programs.
#
run_benchmark_java(){
	NAME=$1
	CALL=$2
	OUT="$NAME"_"$CALL".out
	RESULT=$PWD/result.$NAME.$CALL.java.txt
	WHILEYSRC="$NAME"_"$CALL"
	DIR="$CALL/JavaCode"	
	# Make dir
	mkdir -p $DIR >> $RESULT
	# move C and Header files to working directory.
	cp "$WHILEYSRC".whiley $DIR >> $RESULT
	#Change the working directory
    cd $DIR >> $RESULT  
	# Compile the sort whiley program
	./../../../../bin/wyjc "$WHILEYSRC".whiley >> $RESULT
	#array size
	for parameter in $parameters
    do	
    	#Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $WHILEYSRC Java program on array size = " $parameter >> $RESULT
			start=`date +%s%N`	
			./../../../../bin/wyj $WHILEYSRC $parameter >> $RESULT
			# Check if the program completes the task.
			if [ "$?" = 0 ]
			then
				# Print out success messages.
				echo "Success in running $WHILEYSRC Java program on array size = " $parameter
			else
				# Print out error messages.
				echo "Errors in running $WHILEYSRC Java program on array size = " $parameter
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
	#Return the original working directory
	cd ../../ >> $RESULT
}

#
# Benchmarking the generated C code
#
run_benchmark_c (){
	NAME=$1
	CALL=$2
	OP=$3
	RESULT=$PWD/result.$NAME.$CALL.c.$OP.txt
	WHILEYSRC="$NAME"_"$CALL"
	DIR="$CALL/CCode/$OP"	
	# make the folder
	mkdir -p $DIR >> $RESULT
	# move C and Header files to working directory.
	cp "$WHILEYSRC".whiley Util.c Util.h $DIR >> $RESULT
	# Change to working directory 
	cd $DIR	>> $RESULT
	# Use wyopcl shell script to generate C code
	if [ "$OP" = "slow" ]
	then
		# Generate naive C code
		./../../../../../bin/wyopcl -code "$WHILEYSRC".whiley >> $RESULT
	else
		# Generate copy-eliminated C code
		./../../../../../bin/wyopcl -code -copy "$WHILEYSRC".whiley >> $RESULT
	fi
	#compile the source C file with L2 optimization (-O2)
	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
	gcc -m64 *.c -o "$WHILEYSRC".out >> $RESULT
	#parameters
	for parameter in $parameters
	do
	    #Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $OP $WHILEYSRC C program method on array size =" $parameter >> $RESULT
			start=`date +%s%N`	
			./"$WHILEYSRC".out $parameter >> $RESULT
			# Check if the program completes the task.
			if [ "$?" = 0 ]
			then
				# Print out success messages.
				echo "Success in running $OP $WHILEYSRC C program on array size =" $parameter 
			else
				# Print out error messages.
				echo "Errors in running $OP $WHILEYSRC C program on array size =" $parameter 
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
    cd ../../../ >> $RESULT
}


# Removes all the files inside folder
rm result.*.txt 
rm -rf call_by_value
rm -rf call_by_reference
#
#Benchmark the generated C code
run_benchmark_c sort call_by_value fast
run_benchmark_c sort call_by_value slow
run_benchmark_c sort call_by_reference fast
run_benchmark_c sort call_by_reference slow
#Benchmark the generated Java code
run_benchmark_java sort call_by_value
run_benchmark_java sort call_by_reference