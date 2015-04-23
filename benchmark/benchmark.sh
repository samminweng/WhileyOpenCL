#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
run_benchmark_c (){    
	cd "$1"/c/"$2"
    	#compile the source C file with L2 optimization (-O2)
    	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    	gcc -m64 -O2 -o $1.out $1.$2.c
    	#array size
	arraysizes="1000 10000 100000 1000000 10000000"
	for arraysize in $arraysizes
    	do	
		echo "Beginning the benchmarks of " $1 " program in c with " $2 " method on array size of " $arraysize	
		./$1.out $arraysize
		#Rename the output 'result.txt'
		mv result.txt result.$1.c.$2.$arraysize.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.$1.c.$2.$arraysize.txt
    	done
    	#Return to the working directory
    	cd ../../../
}
#
# The shell script of benchmarking the generated Java code of While_Valid_1 program
#
run_benchmark_java(){
        #Change the working directory
        cd "$1"/"java"
	WHILEY_CLASSPATH="./../../../bin/../lib/jasm-v0.1.7.jar:./../../../bin/../lib/wyrl-v0.3.33.jar:./../../../bin/../lib/wybs-v0.3.33.jar:./../../../bin/../lib/wycs-v0.3.33.jar:./../../../bin/../lib/wyil-v0.3.33.jar:./../../../bin/../lib/wyc-v0.3.33.jar:./../../../bin/../lib/wyjc-v0.3.33.jar:"
	#Check if the shell script is run on Cygwin
	if [ `uname -o` = "Cygwin" ]
	then
	    WHILEY_CLASSPATH="./../../../bin/../lib/jasm-v0.1.7.jar;./../../../bin/../lib/wyrl-v0.3.33.jar;./../../../bin/../lib/wybs-v0.3.33.jar;./../../../bin/../lib/wycs-v0.3.33.jar;./../../../bin/../lib/wyil-v0.3.33.jar;./../../../bin/../lib/wyc-v0.3.33.jar;./../../../bin/../lib/wyjc-v0.3.33.jar;"
	fi
	#read -p "Press [Enter] key to start backup..."
	#compile the Java file with Javac compiler and specified class path
	javac -classpath $WHILEY_CLASSPATH $1.java
	#array size
	arraysizes="1000 10000 100000 1000000 10000000"
	for arraysize in $arraysizes
    	do	
		echo "Beginning the benchmarks of " $1 " program in Java with on array size of " $arraysize	
		java -cp "$WHILEY_CLASSPATH" $1 $arraysize
		#Rename the output 'result.txt'
		mv result.txt result.$1.java.$arraysize.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.$1.java.$arraysize.txt
    	done
	#Return the original working directory
	#cd ../..
}
#
#Benchmark the generated C code
#run_benchmark_c While_Valid_1 slow
#run_benchmark_c While_Valid_1 optimized_slow
#run_benchmark_c While_Valid_1 fast
#Benchmark the generated Java code
run_benchmark_java While_Valid_1
