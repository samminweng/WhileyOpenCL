#!/bin/bash
#
# The shell script of benchmarking the generated C code of While_Valid_1 program
#
run_benchmark (){
	#Increments
	Increments="1 5 10 20 30 40 50 60 70 80 90 100 110 120 150 180 200"
	#array size starts with 1 million
	base=1000000
	for i in $Increments
	do	
		#Multiple the increment
		arraysize=`expr $i \* $base`
		echo $arraysize		
		./While_Valid_1.out $arraysize
		#Rename the output 'result.txt'
		mv result.txt result.$1.$2.$arraysize.txt
		#Added the CPU info
		cat /proc/cpuinfo >> result.$1.$2.$arraysize.txt
	done
}
echo "Beginning the benchmarks of slow program with long type"
cd slow/long
#
#compile the source C file without optimization (-O0)
#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
gcc -m64 -O2 -o While_Valid_1.out While_Valid_1.slow.long.c
run_benchmark slow long
#############################################
echo "Beginning the benchmarks of slow program with long long type"
cd ../../slow/longlong
gcc -m64 -O2 -o While_Valid_1.out While_Valid_1.slow.longlong.c
run_benchmark slow longlong
#
# Benchmark the fast program
#
echo "Beginning the benchmarks of fast program with long type"
cd ../../fast
cd long
gcc -m64 -O2 -o While_Valid_1.out While_Valid_1.fast.long.c
run_benchmark fast long
#############################################
echo "Beginning the benchmarks of fast program with long long type"
cd ../../fast/longlong/
gcc -m64 -O2 -o While_Valid_1.out While_Valid_1.fast.longlong.c
run_benchmark fast longlong
