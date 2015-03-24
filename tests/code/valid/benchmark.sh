#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
clear
cd benchmark/slow
echo "Beginning the benchmarks of slow program with long type"
#
# Benchmark the slow C code
#
cd long
#Increments
Increments="1 5 10 20 30 40 50 60 70 80 90 100 110 120"
#array size starts with 1 million
base=1000000
for i in $Increments
do
	#
	#compile the source C file without optimization (-O0)
	#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
	gcc -O0 While_Valid_1.slow.long.c -o While_Valid_1.slow.long.out
	#Multiple the increment
	arraysize=`expr $i \* $base`
	echo "$arraysize"		
	./While_Valid_1.slow.long.out $arraysize
	#Rename the output 'result.txt'
	mv result.txt result.slow.long.$arraysize.txt
	#Added the CPU info
	cat /proc/cpuinfo >> result.slow.long.$arraysize.txt
	#remove the output file
	rm While_Valid_1.slow.long.out
done
#############################################
echo "Beginning the benchmarks of slow program with long long type"
cd ../longlong
for i in $Increments
do
	#compile the source C file.
	gcc -O0 While_Valid_1.slow.longlong.c -o While_Valid_1.slow.longlong.out
	#Multiple the increment
    arraysize=`expr $i \* $base`
    echo "$arraysize"
    ./While_Valid_1.slow.longlong.out $arraysize
    #Rename the output 'result.txt' 
    mv result.txt result.slow.longlong.$arraysize.txt
    #Added the CPU info
	cat /proc/cpuinfo >> result.slow.longlong.$arraysize.txt
	#remove the output file
	rm While_Valid_1.slow.longlong.out
done
#
# Benchmark the fast program
#
echo "Beginning the benchmarks of fast program with long type"
cd ../../fast
cd long
for i in $Increments
do
	   #compile the C file
	   gcc -O0 While_Valid_1.fast.long.c -o While_Valid_1.fast.long.out
       #Multiple the increment
       arraysize=`expr $i \* $base`
       echo "$arraysize"
       ./While_Valid_1.fast.long.out $arraysize
       #Rename the output 'result.txt'
       mv result.txt result.fast.long.$arraysize.txt
       #Added the CPU info
	   cat /proc/cpuinfo >> result.fast.long.$arraysize.txt
	   #remove the output file
	   rm While_Valid_1.fast.long.out
done
#############################################
echo "Beginning the benchmarks of fast program with long long type"
cd ../longlong
for i in $Increments
do
        #compile the C file
		gcc -O0 While_Valid_1.fast.longlong.c -o While_Valid_1.fast.longlong.out
        #Multiple the increment
        arraysize=`expr $i \* $base`
        echo "$arraysize"
        ./While_Valid_1.fast.longlong.out $arraysize
        #Rename the output 'result.txt'
        mv result.txt result.fast.longlong.$arraysize.txt
        #Added the CPU info
	    cat /proc/cpuinfo >> result.fast.longlong.$arraysize.txt
	    #remove the output file
	    rm While_Valid_1.fast.longlong.out
done