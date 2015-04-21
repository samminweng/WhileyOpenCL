#!/bin/bash
#
# Profiling the generated C code using GPerfTools
#
run_perf(){
     #profile the program on the array size of 50 million
    arraysize=$4
    workingpath=$(pwd)/$1/$2/$3
    #Compile the C program with L2 optimization (-O2)
    #see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    #Linking the GPerfTools
    gcc -m64 -O2 -o $workingpath/While_Valid_1.$1.$2.$3.$arraysize.out $workingpath/While_Valid_1.$1.$2.$3.c -Wl,--no-as-needed -lprofiler -Wl,--as-needed
    #Use the GPerfTools
    echo "GPerfTools profiles the " $1 " program with " $2 " type and " $3 " append function on array size of" $arraysize
    #Run the program using the CPUPROFILE env to profile the CPU usage
    CPUPROFILE=/tmp/prof.$1.$2.$3.$arraysize.out $workingpath/While_Valid_1.$1.$2.$3.$arraysize.out $arraysize
    #Rename the result file (execution time)
    mv result.txt $workingpath/result.$1.$2.$3.$arraysize.txt
    #Use pprof to output the profiling results as a pdf
    pprof --pdf $workingpath/While_Valid_1.$1.$2.$3.$arraysize.out /tmp/prof.$1.$2.$3.$arraysize.out > $workingpath/$1.$arraysize.pdf
}
#
# Profile the slow program that uses the original append function
#arraysizes="10000000 50000000 80000000 120000000 150000000"
arraysizes="150000000"
for arraysize in $arraysizes
do
    #Run and profile the slow programs
    run_perf slow longlong original $arraysize
    #Run and profile the fast programs
    run_perf fast longlong original $arraysize
done



