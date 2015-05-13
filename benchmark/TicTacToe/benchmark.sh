#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
run_benchmark_c (){    
	cd c/"$2"    	
    	#array size
	arraysizes="100 1000 10000 100000 1000000 10000000"
	for arraysize in $arraysizes
    	do
		
		#Generate the C code using the code generator
		#./../../../../bin/wyopcl -code $1$arraysize.whiley
		#compile the source C file with L2 optimization (-O2)
		#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    		gcc -m64 -O2 $1$arraysize.c Util.c -o $1$arraysize.out
    		#Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of " $1 " program in c with " $2 " method on array size of " $arraysize
			#Run the compiled class
			start=`date +%s%N`
			./$1$arraysize.out
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Arraysize:%s\tExecutionTime:%s\tnanoseconds.\n' $arraysize  $runtime >> result.txt
		done
		#Rename the output 'result.txt'
		mv result.txt result.$1.c.$2.$arraysize.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.$1.c.$2.$arraysize.txt
    	done
	# remove all out files
	rm *.out
	# remove all WyIL files
	rm *.wyil


    	#Return to the working directory
    	cd ../../
}
#
# The shell script of benchmarking the generated Java code of While_Valid_1 program
#
run_benchmark_java(){
	cd "java"
	#array size
	arraysizes="100 1000 10000 100000"
	for arraysize in $arraysizes
    	do	
		#compile Whiley program
		./../../../bin/wyjc TicTacToe$arraysize.whiley
		for i in {1..10}
		do
			echo "Beginning the benchmarks of " $1 " program in Java with on array size of " $arraysize	
			#Run the compiled class
			start=`date +%s%N`
			./../../../bin/wyj TicTacToe$arraysize
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Arraysize:%s\tExecutionTime:%s\tnanoseconds.\n' $arraysize  $runtime >> result.txt  
		done		
		#Rename the output 'result.txt'
		mv result.txt result.$1.java.$arraysize.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.$1.java.$arraysize.txt
    	done
	#Remove all the classes
	rm *.class
	#Return the original working directory
	cd ..
}
#
#Benchmark the generated C code
#run_benchmark_c TicTacToe slow
#run_benchmark_c TicTacToe optimized_slow
#Benchmark the generated Java code
#run_benchmark_java TicTacToe
