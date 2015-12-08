#!/bin/bash
# Set timeout limit
TIMEOUT="30"
# Parameters for checking memeory on Megatron using Valgrind and JAVA profiker. 
parameters=""

define_parameters(){
	case "$NAME" in
		"Reverse")
			parameters="1000 10000 100000 1000000 10000000 100000000"
			;;
		"MergeSort")
			parameters="1000 10000 100000 1000000"
			;;
		"TicTacToe")
			parameters="1000 10000 100000 1000000"
			;;
		"MatrixMult")
			parameters="10 20 30 40 50"
			;;
	esac
	
}

#
# Generate and compile Java code using Whiley compiler
#
# generate_Java_code(){
# 	DIR="$CALL/JavaCode"	
# 	# Make dir
# 	mkdir -p $DIR
# 	# move C and Header files to working directory.
# 	cp "$WHILEYSRC".whiley $DIR
# 	#Change the working directory
#     cd $DIR
# 	# Compile the sort whiley program
# 	./../../../../bin/wyjc "$WHILEYSRC".whiley
# }
#
# Profile generated Java programs.
#
# mem_java(){
# 	NAME=$1
# 	CALL=$2
# 	ROOTDIR=$PWD/mem/GC	
# 	WHILEYSRC="$NAME"_"$CALL"
# 	generate_Java_code
# 	#array size
# 	for arraysize in $arraysizes
#     do
#     	DIR=$ROOTDIR/$arraysize
#     	# Make a dir
#     	mkdir -p $DIR
#    		# Run Java program with profile enabled (-Xprof) 
# 		./../../../../bin/wyj $WHILEYSRC $arraysize > $DIR/$NAME.$CALL.Java.txt
# 		# Check if the program completes the task.
# 		check_exit $? "JAVA"
# 		if [ "$?" != 0 ]
# 		then
# 			# Terminate the nested loop.
# 			break 2
# 		fi
# 		#Added the CPU info
# 		cat /proc/cpuinfo >> $DIR/$NAME.$CALL.Java.txt
#     done
# 	#Return the original working directory
# 	cd ../../
# }

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
		# The 'case esac' example is http://www.tutorialspoint.com/unix/case-esac-statement.htm 
		case "$OP" in
			"naive")
				# Generate naive C code
			 	./../../../../../bin/wyopcl -code "$SRC".whiley
			 	;;
			"naive_dealloc")
				# Generate naive C code
			 	./../../../../../bin/wyopcl -code -dealloc "$SRC".whiley
			 	;;
			"copy_reduced")
				# Generate copy-eliminated C code
			 	./../../../../../bin/wyopcl -code -copy "$SRC".whiley
				;;
		esac
		#compile the source C file with L2 optimization (-O2)
		#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
		echo "Compile C Code"
		gcc -m64 -O -g $NAME.c Util.c -o "$SRC".out
	fi	
}

#
# Collects the memory usage of the generated C code
#
mem_c (){
	NAME=$1
	CODE=$2
	OP=$3
	# Define parameters
	define_parameters
	cd $NAME
	DIR=$PWD/memoryleaks
	SRC="$NAME"
	IMPLDIR="$PWD/impl/$CODE/$OP"
	# make the folder
	mkdir -p $DIR
	mkdir -p $IMPLDIR
	# Move Whiley files, Util.h and Util.c  to working directory.
	cp "$SRC".whiley $UTILDIR/Util.c $UTILDIR/Util.h $IMPLDIR
	# read -p "Press any key..."
	# # Change to working directory
	cd $IMPLDIR
	# Generate C code
	generate_code
	# Change the parameters
	for parameter in $parameters
	do
		MEMORYLEAKS=$DIR/valgrind.$NAME.$CODE.$OP.$parameter.leak.txt
		#  run valgrind to collect/detect memory leak in C code.
		#  Ref: http://valgrind.org/docs/manual/manual.html
		# Run Valgrind memcheck tool to find memory leak on Megatron, and write out results to output file.   
		valgrind --tool=memcheck --log-file="$MEMORYLEAKS" ./"$SRC".out $parameter
		# Run Valgrind full memcheck to see details of leaks memory
		#valgrind --leak-check=full --log-file="$MEMORYLEAKS".leak.full.txt ./"$WHILEYSRC".out $parameter
		# Find uninitialized memory
		#valgrind -v --leak-check=yes --log-file="$MEMORY".uninitialized.txt ./"$WHILEYSRC".out $parameter
		# Find cache miss
		#valgrind --tool=cachegrind --log-file="$MEMORY".cachemiss.txt ./"$WHILEYSRC".out $parameter
		# Generate call graph and 
		# valgrind --tool=callgrind --log-file="$MEMORY".callgrind.txt ./"$WHILEYSRC".out $parameter
		# Profile Heap memory using Massif
		#echo "Heap Memory Profiler"
		#valgrind --tool=massif --massif-out-file=$WHILEYSRC.massif.out ./"$WHILEYSRC".out $parameter
		# Print out the information gathered by massif
		#ms_print $WHILEYSRC.massif.out > $MEMORY.massif.txt
		#Added the CPU info
		#cat /proc/cpuinfo >> $MEMORY.massif.txt
    done
    # Return to the working directory
    cd ../../../../
}
# Get the folder of Util.c and Util.h
UTILDIR=$PWD/../tests/code
# Measure the memory usage of the generated C code
mem_c Reverse CCode naive
mem_c Reverse CCode naive_dealloc
# mem_c Reverse CCode copy_reduced
mem_c MergeSort CCode naive
mem_c MergeSort CCode naive_dealloc
# mem_c MergeSort CCode copy_reduced
mem_c TicTacToe CCode naive
mem_c TicTacToe CCode naive_dealloc
# mem_c TicTacToe CCode copy_reduced
# mem_c MatrixMult CCode naive
# mem_c MatrixMult CCode naive_dealloc
# mem_c MatrixMult CCode copy_reduced