#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
run_benchmark (){    
    cd $1/$2/$3
    #
    #compile the source C file with L2 optimization (-O2)
    #see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    gcc -m64 -O2 -o $1.out $1.$3.c
    #Increments
    Increments="1 10"
    #array size starts with 1 million
    base=1000000
    for i in $Increments
    do	
	#Multiple the increment
	arraysize=`expr $i \* $base`
	echo "Beginning the benchmarks of " $1 " program in " $2 " with " $3 " method on array size of " $arraysize	
	./While_Valid_1.out $arraysize
	#Rename the output 'result.txt'
	mv result.txt result.$1.$2.$3.$arraysize.txt
	#Added the CPU info
	cat /proc/cpuinfo >> result.$1.$2.$3.$arraysize.txt
    done
    #Return to the working directory
    cd ../../../
}

#
#Benchmark the slow program
#
run_benchmark While_Valid_1 c slow
