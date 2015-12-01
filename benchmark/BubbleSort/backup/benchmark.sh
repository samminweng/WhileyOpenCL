#!/bin/bash
#
# The shell script of benchmarking the generated Java code of Whiley program
#
#parameters="1000000"
# Large scaled parameters.
parameters="10 100 1000 10000"

check_exit (){
	EXITVALUE=$1
	# Check if the program completes the task.
	if [ "$EXITVALUE" = 0 ]
	then
		# Print out success messages.
		echo "Success in running $NAME $OP program on array size = " $parameter
	else
		# Print out error messages.
		echo "Errors in running $NAME $OP program on array size = " $parameter
	fi
}

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
			 	./../../../../../bin/wyopcl -code "$SRC".whiley >> $RESULT
			 	;;
			"copy_reduced")
				# Generate copy-eliminated C code
			 	./../../../../../bin/wyopcl -code -copy "$SRC".whiley >> $RESULT
				;;
		esac
		#compile the source C file with L2 optimization (-O2)
		#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
		echo "Compile C Code"
		gcc -m64 *.c -o "$SRC".out
	fi	
}

run_code (){
	if [ "$CODE" = "JAVACode" ]
	then
		# Run Java code
		./../../../../../bin/wyj $SRC $parameter >> $RESULT
	else
		./"$SRC".out $parameter >> $RESULT
	fi
}

#
# Benchmarking the generated C code
#
run_benchmark (){
	NAME=$1
	CODE=$2
	OP=$3
	RESULT=$PWD/result.$NAME.$CODE.$OP.txt
	SRC="$NAME"
	DIR="Impl/$CODE/$OP"	
	# make the folder
	mkdir -p $DIR
	# move C and Header files to working directory.
	cp "$SRC".whiley $DIR 
	# Change to working directory 
	cd $DIR
	generate_code
	read -p "Press any key..."
	#parameters
	for parameter in $parameters
	do
	    #Repeat running the programs
		for i in {1..10}
		#for i in {1..1}
		do
			echo "Beginning the benchmarks of $OP $SRC $CODE program method on array size =" $parameter >> $RESULT
			start=`date +%s%N`
			echo $PWD
			run_code $parameter
			# Check if the program completes the task.
			check_exit $?
			if [ "$?" != 0 ]
			then
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
#
#Benchmark the generated C code
run_benchmark bubblesort CCode copy_reduced
#run_benchmark bubblesort call_by_value CCode copy_reduced_noleaks
run_benchmark bubblesort CCode naive
#run_benchmark bubblesort call_by_value CCode naive_noleaks
#Benchmark the generated Java code
#run_benchmark bubblesort call_by_value JAVACode naive
#run_benchmark_java sort call_by_reference