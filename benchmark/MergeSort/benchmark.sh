#!/bin/bash
#
# The shell script of benchmarking the generated Java code of Whiley program
#
parameters="10 100 1000"
# Large scaled parameters.
#parameters="10 100 1000 10000 100000 1000000 10000000 20000000 30000000 40000000 50000000 60000000 70000000 80000000 90000000 100000000 150000000 200000000"
#
# Run the benchmarks of generated Java programs.
#
run_benchmark_java(){
	NAME=$1
	CALL=$2
	OUT="$NAME"_"$CALL".out
	RESULT=result.$NAME.$CALL.java.txt
	WHILEYSRC="$NAME"_"$CALL"
	#Remove files inside the folders.
	rm $CALL/"java"/*.*
	# move C and Header files to working directory.
	cp "$WHILEYSRC".whiley $CALL/"java"
	#Change the working directory
    cd $CALL/"java"   
	# Compile the sort whiley program
	./../../../../bin/wyjc "$WHILEYSRC".whiley
	#array size
	for parameter in $parameters
    do	
    	#Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $WHILEYSRC Java program with parameter = " $parameter
			start=`date +%s%N`	
			./../../../../bin/wyj $WHILEYSRC $parameter >> $RESULT
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $RESULT
		done
    done
	#Added the CPU info
	cat /proc/cpuinfo >> $RESULT
	#Return the original working directory
	cd ../../
}

#
# Benchmarking the generated C code
#
run_benchmark_c (){
	NAME=$1
	CALL=$2
	OP=$3
	RESULT=result.$NAME.$CALL.c.$OP.txt
	WHILEYSRC="$NAME"_"$CALL"
	# Removes all the files inside folder
	rm "$CALL"/c/"$OP"/*.*
	# move C and Header files to working directory.
	cp "$WHILEYSRC".whiley Util.c Util.h $CALL/c/$OP
	# Change to working directory 
	cd "$CALL"/c/"$OP"	
	# Use wyopcl shell script to generate C code
	if [ "$OP" = "slow" ]
	then
		# Generate naive C code
		./../../../../../bin/wyopcl -code "$WHILEYSRC".whiley
	else
		# Generate copy-eliminated C code
		./../../../../../bin/wyopcl -code -copy "$WHILEYSRC".whiley
	fi
	#compile the source C file with L2 optimization (-O2)
	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
	gcc -O2 *.c -o "$WHILEYSRC".out
	
	#parameters
	for parameter in $parameters
	do
	    #Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $WHILEYSRC C program method with parameter =" $parameter
			start=`date +%s%N`	
			./"$WHILEYSRC".out $parameter >> $RESULT
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $RESULT
		done
    done
    #Added the CPU info
	cat /proc/cpuinfo >> $RESULT
	#remove the *.out files
	rm "$WHILEYSRC".out "$WHILEYSRC".wyil
    #Return to the working directory
    cd ../../../
}

#
#Benchmark the generated C code
run_benchmark_c sort call_by_value fast
run_benchmark_c sort call_by_value slow
run_benchmark_c sort call_by_reference fast
run_benchmark_c sort call_by_reference slow
#Benchmark the generated Java code
run_benchmark_java sort call_by_value
run_benchmark_java sort call_by_reference