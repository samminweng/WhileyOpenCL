#!/bin/bash
#
# Counts the number of user instructions executed in generated C program
#
TIMEOUT="1800s"
# Large scaled parameters.
parameters=""
define_parameters(){
	case "$NAME" in
		"Fibonacci")
			parameters="10 100 1000 10000 100000 1000000"
			;;
		"Reverse")
			parameters="1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000"
			;;
		"MergeSort")
			parameters="1000 10000 100000 1000000 10000000 100000000 1000000000"
			;;
		"newTicTacToe")
			parameters="1000 10000 100000 1000000 10000000 100000000 1000000000 10000000000"
			;;
		"MatrixMult")
			parameters="10 100 1000 10000"
			;;
	esac
}

#
# Generate the C code
#
generate_code(){
	# Get the folder of Util.c and Util.h
	UTILDIR=$PWD/../../tests/code
	# Move Whiley files, Util.h and Util.c  to working directory.
	cp "$SRC".whiley $UTILDIR/Util.c $UTILDIR/Util.h $DIR
	# Change to working directory 
	cd $DIR
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
		"copy_reduced_dealloc")
			# Generate copy-eliminated C code
		 	./../../../../../bin/wyopcl -code -copy -dealloc "$SRC".whiley
			;;
	esac
	#compile the source C file with L2 optimization (-O2)
	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
	echo "Compile C Code"
	gcc -m64 -O -g $NAME.c Util.c -o "$SRC".out	
}

#
# Benchmarking the generated C code
#
run_benchmark (){
	NAME=$1
	CODE=$2
	OP=$3
	if [ "$CODE" = "JAVACode" ]
	then
		OP="naive"
	fi
	#read -p "Press Ok..$PWD"
	define_parameters
	cd $NAME
	# Set DIR folder
	RESULTDIR="$PWD/instructions"
	SRC="$NAME"
	DIR="impl/$CODE/$OP"
	# Make the folder
	mkdir -p $DIR
	mkdir -p $RESULTDIR
	generate_code
	#parameters
	for parameter in $parameters
	do
		OUT="$RESULTDIR/$NAME.$CODE.$OP.$parameter.txt"
		echo "Beginning the $MAME $OP $CODE program with array size =" $parameter > $OUT
		start=`date +%s%N`			
		#timeout $TIMEOUT perf stat -e instructions:u ./"$SRC".out $parameter 2> $OUT
		timeout $TIMEOUT perf stat ./"$SRC".out $parameter 2>> $OUT
		# Check if the program completes the task.
		if [ "$?" = 0 ]
		then
			# Print out success messages.
			echo "Success in running $NAME $OP $CODE program with array size = " $parameter
		else
			# Print out error messages.
			echo "Errors in running $NAME $OP $CODE program with array size = " $parameter
			break 2
		fi
		end=`date +%s%N`
		runtime=$((end-start))
		printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime  >> $OUT
		cat /proc/cpuinfo >> $OUT
    done
    cd ../../../../
}

# Measure the memory usage of the generated C code
### Reverse
run_benchmark Reverse CCode naive
run_benchmark Reverse CCode naive_dealloc
run_benchmark Reverse CCode copy_reduced
run_benchmark Reverse CCode copy_reduced_dealloc
# run_benchmark Reverse JAVACode
# ### MergeSort
run_benchmark MergeSort CCode naive
run_benchmark MergeSort CCode naive_dealloc
run_benchmark MergeSort CCode copy_reduced
run_benchmark MergeSort CCode copy_reduced_dealloc
# run_benchmark MergeSort JAVACode
# # ### newTicTacToe
run_benchmark newTicTacToe CCode naive
run_benchmark newTicTacToe CCode naive_dealloc
run_benchmark newTicTacToe CCode copy_reduced
run_benchmark newTicTacToe CCode copy_reduced_dealloc
# run_benchmark newTicTacToe JAVACode
# # ### MatrixMult
run_benchmark MatrixMult CCode naive
run_benchmark MatrixMult CCode naive_dealloc
run_benchmark MatrixMult CCode copy_reduced
run_benchmark MatrixMult CCode copy_reduced_dealloc
# run_benchmark MatrixMult JAVACode
# ### Fibonacci
run_benchmark Fibonacci CCode naive
run_benchmark Fibonacci CCode naive_dealloc
run_benchmark Fibonacci CCode copy_reduced
run_benchmark Fibonacci CCode copy_reduced_dealloc
#run_benchmark Fibonacci JAVACode