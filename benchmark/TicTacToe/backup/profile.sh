#!/bin/bash


sizes="100000"
#
# Profiling C program using Linux GCC profile tool
# http://www.thegeekstuff.com/2012/08/gprof-tutorial/
#
run_gprof(){
	NAME=$1
	CALL=$2
	CODE=$3
	OP=$4
	ProfDIR=$PWD/profile
	mkdir -p $ProfDIR
	DIR="$CALL/$CODE/$OP"
	cd $DIR
	for size in $sizes
	do
		# Compile c program with enabled profiling.
		gcc -Wall -pg *.c -o "$NAME.out"
		# Execute the file
		"./$NAME.out" $size
		# Run gprof tool
		gprof -a "$NAME.out" "gmon.out" > "$ProfDIR/Analysis.$CODE.$OP.$size.txt"
		# Delete output files
		rm *.out 
	done
	cd ../../../
}

rm -rf $PWD/profile
run_gprof TicTacToe call_by_value CCode copy_reduced_noleaks
run_gprof TicTacToe call_by_value CCode naive_noleaks