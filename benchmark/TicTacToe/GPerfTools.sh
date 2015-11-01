#!/bin/bash
#
# Profiling the generated C code using GPerfTools
#
run_perf(){
     #profile the program on the array size of 150 million
    arraysize=$2
    program=$1
    workingpath=$(pwd)/"c"/$program
    #Compile the C program with L2 optimization (-O2)
    #see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    #Linking the GPerfTools
    gcc -m64 -O2 -o $workingpath/TicTacToe.$program.$arraysize.out $workingpath/Util.c $workingpath/TicTacToe$arraysize.c -Wl,--no-as-needed -lprofiler -Wl,--as-needed
    #Use the GPerfTools
    echo "GPerfTools profiles the " $program " program with " $2 " type and " $3 " append function on array size of" $arraysize
    #Run the program using the CPUPROFILE env to profile the CPU usage
    CPUPROFILE=/tmp/prof.TicTacToe.$program.$arraysize.out $workingpath/TicTacToe.$program.$arraysize.out
    #Use pprof to output the profiling results as a pdf
    pprof --pdf $workingpath/TicTacToe.$program.$arraysize.out /tmp/prof.TicTacToe.$program.$arraysize.out > TicTacToe.$program.$arraysize.pdf
    #Remove the Profile file, e.g. /tmp/prof...
    rm /tmp/prof.* $workingpath/TicTacToe.$program.$arraysize.out
}
#
# Profile the slow program that uses the original append function
#arraysizes="10000000 50000000 80000000 120000000 150000000"
arraysizes="100000000 200000000 300000000"
for arraysize in $arraysizes
do
    #Run and profile the slow programs
    run_perf slow $arraysize
    #Run and profile the fast programs
    run_perf optimized_slow $arraysize
done



