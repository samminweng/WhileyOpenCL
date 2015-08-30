#!/bin/bash
#
# The shell script of benchmarking the generated Java code of Whiley program
#
version="v0.3.35"
WHILEY_CLASSPATH="./../../../bin/../lib/jasm-v0.1.7.jar:./../../../bin/../lib/wyrl-$version.jar:./../../../bin/../lib/wybs-$version.jar:./../../../bin/../lib/wycs-$version.jar:./../../../bin/../lib/wyil-$version.jar:./../../../bin/../lib/wyc-$version.jar:./../../../bin/../lib/wyjc-$version.jar:"
#Check if the shell script is run on Cygwin
if [ `uname -o` = "Cygwin" ]
then
	WHILEY_CLASSPATH="./../../../bin/../lib/jasm-v0.1.7.jar;./../../../bin/../lib/wyrl-$version.jar;./../../../bin/../lib/wybs-$version.jar;./../../../bin/../lib/wycs-$version.jar;./../../../bin/../lib/wyil-$version.jar;./../../../bin/../lib/wyc-$version.jar;./../../../bin/../lib/wyjc-$version.jar;"
fi
parameters="10 100 1000"

#
# Run the benchmarks of generated Java programs.
#
run_benchmark_java(){
    #Change the working directory
    cd "java"
	#read -p "Press [Enter] key to start backup..."
	#compile the Java file with Javac compiler and specified class path
	javac -classpath $WHILEY_CLASSPATH $1.java
	#array size
	for parameter in $parameters
    	do	
		echo "Beginning the benchmarks of $1 Java program with parameter = " $parameter	
		java -cp "$WHILEY_CLASSPATH" $1 $parameter
		#Rename the output 'result.txt'
		mv result.txt result.$1.$parameter.java.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.While_Valid_1.java.$parameter.txt
    	done
	#Remove the class
	rm While_Valid_1.class
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
run_benchmark_c sort fast
run_benchmark_c sort slow
#Benchmark the generated Java code
#run_benchmark_java sort
