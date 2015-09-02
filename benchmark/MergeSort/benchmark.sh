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
	# Compile the sort whiley program
	./../../bin/wyjc sort.whiley
	# mv the *.class to java folder
	mv sort.class "java"/
    #Change the working directory
    cd "java"
    #Remove results files.
	rm result.*.txt
	#array size
	for parameter in $parameters
    do	
    	#Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $1 Java program with parameter = " $parameter
			start=`date +%s%N`	
			./../../../bin/wyj sort $parameter >> result.$1.slow.java.txt
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> result.$1.slow.java.txt
		done
    done
	#Added the CPU info
	cat /proc/cpuinfo >> result.$1.slow.java.txt
	#Return the original working directory
	cd ..
}

#
# Benchmarking the generated C code
#
run_benchmark_c (){    
	cd c/"$2"
	#compile the source C file with L2 optimization (-O2)
	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
	gcc -m64 -O2 $1.c Util.c -o $1.out
	#Remove results files.
	rm result.*.txt
	#parameters
	for parameter in $parameters
	do
	    #Repeat running the programs
		for i in {1..10}
		do
			echo "Beginning the benchmarks of $2 C program method with parameter =" $parameter
			start=`date +%s%N`	
			./$1.out $parameter >> result.$1.$2.c.txt
			end=`date +%s%N`
			runtime=$((end-start))
			printf 'Parameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> result.$1.$2.c.txt
		done
    done
    #Added the CPU info
	cat /proc/cpuinfo >> result.$1.$2.c.txt
	#remove the *.out files
	rm $1.out
    #Return to the working directory
    cd ../../
}

#
#Benchmark the generated C code
#run_benchmark_c sort fast
#run_benchmark_c sort slow
#Benchmark the generated Java code
run_benchmark_java sort
