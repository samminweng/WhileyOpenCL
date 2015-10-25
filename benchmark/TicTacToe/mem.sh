#!/bin/bash

arraysizes="10"
# Parameters for checking memeory on Megatron using Valgrind and JAVA profiker. 
#arraysizes="100000 1000000 2000000 4000000 6000000 8000000 10000000 12000000 14000000 16000000 18000000 20000000"
#
# Generate and compile Java code using Whiley compiler
#
generate_Java_code(){
	DIR="$CALL/JavaCode"	
	# Make dir
	mkdir -p $DIR
	# move C and Header files to working directory.
	cp "$WHILEYSRC".whiley $DIR
	#Change the working directory
    cd $DIR
	# Compile the sort whiley program
	./../../../../bin/wyjc "$WHILEYSRC".whiley
}
#
# Profile generated Java programs.
#
mem_java(){
	NAME=$1
	CALL=$2
	ROOTDIR=$PWD/mem/GC	
	WHILEYSRC="$NAME"_"$CALL"
	generate_Java_code
	#array size
	for arraysize in $arraysizes
    do
    	DIR=$ROOTDIR/$arraysize
    	# Make a dir
    	mkdir -p $DIR
   		# Run Java program with profile enabled (-Xprof) 
		./../../../../bin/wyj $WHILEYSRC $arraysize > $DIR/$NAME.$CALL.Java.txt
		# Check if the program completes the task.
		check_exit $? "JAVA"
		if [ "$?" != 0 ]
		then
			# Terminate the nested loop.
			break 2
		fi
		#Added the CPU info
		cat /proc/cpuinfo >> $DIR/$NAME.$CALL.Java.txt
    done
	#Return the original working directory
	cd ../../
}


# #
# # Translates the Whiley program into C code using our code generator
# # and compile it using 'gcc'
# #
# generate_c_code (){
# 	# Use wyopcl shell script to generate C code
# 	if [ "$OP" = "slow" ]
# 	then
# 		# Generate naive C code
# 		./../../../../../bin/wyopcl -code "$WHILEYSRC".whiley
# 	else
# 		# Generate copy-eliminated C code
# 		./../../../../../bin/wyopcl -code -copy "$WHILEYSRC".whiley
# 	fi
# }
#
# The shell script of benchmarking the generated Java code of Whiley program
#
check_exit (){
	EXITVALUE=$1
	# Check if the program completes the task.
	if [ "$EXITVALUE" = 0 ]
	then
		# Print out success messages.
		echo "Success in running $NAME $OP program on array size = " $arraysize
	else
		# Print out error messages.
		echo "Errors in running $NAME $OP program on array size = " $arraysize
		# Terminate the nested loop.
		break 2
	fi
}
#
# Collects the memory usage of the generated C code
#
mem_c (){
	NAME=$1
	CALL=$2
	CODE=$3
	OP=$4
	ROOTDIR=$PWD/mem/valgrind
	WHILEYSRC="$NAME"
	DIR="$CALL/$CODE/$OP"
	# make the folder
	mkdir -p $DIR
	# move C and Header files to working directory.
	#cp "$WHILEYSRC".whiley Util.c Util.h $DIR 
	# # Change to working directory
	cd $DIR
	#generate_c_code
	# Compile the C files with debugging info enabled (-g option) and turned-off optimization.
	gcc -m64 -O -g *.c -o "$WHILEYSRC".out
	# Change the arraysize
	for arraysize in $arraysizes
	do
		DIR=$ROOTDIR/$arraysize
		# make dir
		mkdir -p $DIR
		MEMORY=$DIR/$NAME.$CALL.c.$OP.$arraysize
		#  run valgrind to collect/detect memory leak in C code.
		#  Ref: http://valgrind.org/docs/manual/manual.html
		# Run Valgrind memcheck tool to find memory leak on Megatron, and write out results to output file.   
		valgrind --tool=memcheck --log-file="$MEMORY".leak.txt ./"$WHILEYSRC".out $arraysize 
		# Run Valgrind full memcheck to see details of leaks memory
		valgrind --leak-check=full --log-file="$MEMORY".leak.full.txt ./"$WHILEYSRC".out $arraysize
		# Find uninitialized memory
		#valgrind -v --leak-check=yes --log-file="$MEMORY".uninitialized.txt ./"$WHILEYSRC".out $arraysize
		# Find cache miss
		#valgrind --tool=cachegrind --log-file="$MEMORY".cachemiss.txt ./"$WHILEYSRC".out $arraysize
		# Generate call graph and 
		# valgrind --tool=callgrind --log-file="$MEMORY".callgrind.txt ./"$WHILEYSRC".out $arraysize
		# Profile Heap memory using Massif
		#echo "Heap Memory Profiler"
		#valgrind --tool=massif --massif-out-file=$WHILEYSRC.massif.out ./"$WHILEYSRC".out $arraysize
		check_exit $? $NAME $OP "C"
		if [ "$?" != 0 ]
		then
			# Terminate the nested loop.
			break 2
		fi
		# Print out the information gathered by massif
		#ms_print $WHILEYSRC.massif.out > $MEMORY.massif.txt
		#Added the CPU info
		#cat /proc/cpuinfo >> $MEMORY.massif.txt
    done
    # Return to the working directory
    cd ../../../
}
# Measure the memory usage of the generated C code
rm -rf $PWD/mem/valgrind
#mem_c TicTacToe call_by_value CCode copy_reduced
#mem_c TicTacToe call_by_value CCode copy_reduced_noleaks
#mem_c TicTacToe call_by_value CCode naive
mem_c TicTacToe call_by_value CCode naive_noleaks