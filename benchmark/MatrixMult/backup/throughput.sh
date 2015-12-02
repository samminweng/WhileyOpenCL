#!/bin/bash
#
# The shell script of measuring the maximal throughput of generated Java and C code of Whiley program
#
CCodeBASE="4000"
CCodeINC="200"
JavaCodeBase="2000"
JavaCodeINC="200"
TIMEOUT="1800s"
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
# Run compiled C code or Java code, and set timeout of 30 minutes.
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
run_throughput (){
	NAME=$1
	CALL=$2
	CODE=$3
	OP=$4
	RESULT=$PWD/throughput.$NAME.$CALL.$CODE.$OP.txt
	SRC="$NAME"_"$CALL"
	DIR="$CALL/$CODE/$OP"	
	# make the folder
	mkdir -p $DIR
	# move C and Header files to working directory.
	cp "$SRC".whiley $DIR 
	# Change to working directory 
	cd $DIR
	generate_code	
	if [ "$CODE" = "JAVACode" ]
	then
		parameter=$JavaCodeBase
		inc=$JavaCodeINC
	else
		parameter=$CCodeBASE
		inc=$CCodeINC
	fi
	#parameters
	while true;
	do		
	    #Repeat running the programs
		for i in {1..3}
		do
		 	echo "Beginning the benchmarks of $OP $SRC $CODE program method on array size =" $parameter >> $RESULT
		 	start=`date +%s%N`
		 	echo $PWD
		 	run_code $parameter
		 	# # Check if the program completes the task.
		 	if [ "$?" = 0 ]
		 	then
		 	 	# Print out success messages.
		 	 	echo "Success in running $NAME $OP $SRC $CODE program on array size = " $parameter
		 	else
		 	 	# Print out error messages.
		 	 	echo "Errors in running $NAME $OP $SRC $CODE program on array size = " $parameter
		 	 	# Terminate the nested loop.
		 	 	break 2
		 	fi
		 	end=`date +%s%N`
		 	runtime=$((end-start))
		 	printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $RESULT
		done
		((parameter=parameter + inc))
		echo $parameter
		#read -p "Press [Enter] key to start backup..."
    done
    #Added the CPU info
	cat /proc/cpuinfo >> $RESULT
    #Return to the working directory
    cd ../../../
}

# Removes all the files inside folder
rm throughput.*.txt
#
# Get throughputs of the generated C code
run_throughput MatrixMult call_by_value CCode copy_reduced_noleaks
# Get throughputs of the generated Java code
run_throughput MatrixMult call_by_value JAVACode naive