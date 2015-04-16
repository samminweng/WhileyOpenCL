#!/bin/bash
#
# Profiling the generated C code using GPerfTools
#
run_perf(){
     #profile the program on the array size of 50 million
    arraysize=150000000
    workingpath=$(pwd)
    #Compile the C program with L2 optimization (-O2)
    #see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    #Linking the GPerfTools
    gcc -m64 -O2 -o While_Valid_1.$1.$2.$3.$arraysize.out $1/$2/$3/While_Valid_1.$1.$2.$3.c -Wl,--no-as-needed -lprofiler -Wl,--as-needed
    #Use the GPerfTools
    echo "GPerfTools profiles the " $1 " program with " $2 " type and " $3 " append function on array size of" $arraysize
    #Run the program using the CPUPROFILE env to profile the CPU usage
    CPUPROFILE=/tmp/prof.out $workingpath/While_Valid_1.$1.$2.$3.$arraysize.out $arraysize
    #Use pprof to show the profiling results
    pprof --gv $workingpath/While_Valid_1.$1.$2.$3.$arraysize.out /tmp/prof.out
}
#
# Profile the slow program that uses the original append function
#
run_perf slow longlong original
#
# Profile the slow program that uses the optimized append function
#
#run_perf slow longlong optimized
