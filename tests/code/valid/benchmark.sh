#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
clear
cd benchmark/slow
echo "Beginning the benchmarks of slow program with integer type"
#
# Benchmark the slow C code
#
cd int
#
#compile the source C file without optimization (-O0)
#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
gcc -O0 While_Valid_1.slow.int.c -o While_Valid_1.slow.int.out
#Increments
Increments="1 5 10 50 100 200 300 400 500 1000"
#array size starts with 1 million
base=1000000
for iteration in {1..10}
do
	for i in $Increments
	do
		#Multiple the increment
		arraysize=`expr $i \* $base`
		echo "$arraysize"
		./While_Valid_1.slow.int.out $arraysize
		#Rename the output 'result.txt'
		cat result.txt >> result.slow.int.$arraysize.txt
	done
done
echo "Beginning the benchmarks of slow program with long long type"
cd ../longlong
#compile the source C file.
gcc -O0 While_Valid_1.slow.longlong.c -o While_Valid_1.slow.longlong.out
for iteration in {1..10}
do
        for i in $Increments
        do
                #Multiple the increment
                arraysize=`expr $i \* $base`
                echo "$arraysize"
                ./While_Valid_1.slow.longlong.out $arraysize
                #Rename the output 'result.txt'
                cat result.txt >> result.slow.longlong.$arraysize.txt
        done
done
#
# Benchmark the fast program
#
echo "Beginning the benchmarks of fast program with integer type"
cd ../../fast
cd int
#compile the C file
gcc -O0 While_Valid_1.fast.int.c -o While_Valid_1.fast.int.out
for iteration in {1..10}
do
        for i in $Increments
        do
                #Multiple the increment
                arraysize=`expr $i \* $base`
                echo "$arraysize"
                ./While_Valid_1.fast.int.out $arraysize
                #Rename the output 'result.txt'
                cat result.txt >> result.fast.int.$arraysize.txt
        done
done

echo "Beginning the benchmarks of fast program with long long type"
cd ../longlong
#compile the C file
gcc -O0 While_Valid_1.fast.longlong.c -o While_Valid_1.fast.longlong.out
for iteration in {1..10}
do
        for i in $Increments
        do
                #Multiple the increment
                arraysize=`expr $i \* $base`
                echo "$arraysize"
                ./While_Valid_1.fast.int.out $arraysize
                #Rename the output 'result.txt'
                cat result.txt >> result.fast.int.$arraysize.txt
        done
done

