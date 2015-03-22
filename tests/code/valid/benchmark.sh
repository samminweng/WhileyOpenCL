#
# Benchmarking shell script of While_Valid_1 program
#
#!/bin/bash
clear
cd benchmark/slow
cd longlong
#compile the source code
echo "Beginning the benchmarks of slow program"
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.slow.out $arraysize
done
echo "Benchmarks completed."
#Benchmark the transformed program.
cd ../fast
echo "Beginning the benchmarks of transformed program"
for i in {1..200}
do
#incrment is 5 million
incr=5000000
#Multiple the increment
arraysize=`expr $i \* $incr`
echo "$arraysize"
./While_Valid_1.fast.out $arraysize 
done