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
#compile the source C file without optimization
#see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
gcc While_Valid_1.slow.int.c -O0 While_Valid_1.slow.int.out
#run the array size of 1 million
./While_Valid_1.slow.int.out 1000000
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.slow.int.out $arraysize
done
echo "Beginning the benchmarks of slow program with long long type"
cd ../longlong
#compile the source C file.
gcc While_Valid_1.slow.longlong.c -O0 While_Valid_1.slow.longlong.out
#run the array size of 1 million
./While_Valid_1.slow.longlong.out 1000000
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.slow.longlong.out $arraysize
done
#
# Benchmark the fast program
#
cd ../../fast
cd int
#compile the C file
gcc While_Valid_1.fast.int.c -O0 While_Valid_1.fast.int.out
#run the array size of 1 million
./While_Valid_1.fast.int.out 1000000
echo "Beginning the benchmarks of transformed program with integer type"
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.fast.int.out $arraysize 
done
cd ../longlong
#compile the C file
gcc While_Valid_1.fast.longlong.c -O0 While_Valid_1.fast.longlong.out
#run the array size of 1 million
./While_Valid_1.fast.longlong.out 1000000
echo "Beginning the benchmarks of transformed program with long long type"
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.fast.longlong.out $arraysize 
done

