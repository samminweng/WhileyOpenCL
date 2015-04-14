#!/bin/bash
#
# Profiling the generated C code of While_Valid_1 program
#
run_perf(){
    cd $1/$2
    #Compile the C program
    #compile the source C file with L2 optimization (-O2)
    #see https://gcc.gnu.org/onlinedocs/gnat_ugn/Optimization-Levels.html#101
    gcc -m64 -O2 -o While_Valid_1.out While_Valid_1.$1.$2.c
    #perf event list
    #cpu-cycles OR cycles                               [Hardware event]
    #instructions                                       [Hardware event]
    #cache-references                                   [Hardware event]
    #cache-misses                                       [Hardware event]
    #branch-instructions OR branches                    [Hardware event]
    #branch-misses                                      [Hardware event]
    #bus-cycles                                         [Hardware event]
    #stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]
    #ref-cycles                                         [Hardware event]

    #cpu-clock                                          [Software event]
    #task-clock                                         [Software event]
    #page-faults OR faults                              [Software event]
    #context-switches OR cs                             [Software event]
    #cpu-migrations OR migrations                       [Software event]
    #minor-faults                                       [Software event]
    #major-faults                                       [Software event]
    #alignment-faults                                   [Software event]
    #emulation-faults                                   [Software event]
    #dummy                                              [Software event]
    eventlist="cycles,instructions,cache-references,cache-misses,branch-instructions,branch-misses,bus-cycles,stalled-cycles-frontend,ref-cycles,cpu-clock,task-clock,page-faults,context-switches,cpu-migrations,minor-faults,major-faults,alignment-faults,emulation-faults,dummy"
    #profile the program on the array size of 10 million
    arraysize=10000000
    #Use the perf
    echo "Profiling the " $1 " program with " $2 " type on array size of" $arraysize
    perf stat -r 5 -e $eventlist ./While_Valid_1.out $arraysize
    #return the working directory
    cd ../..
}
#
# Profile the slow program
#
run_perf slow longlong
#
# Profile the fast program
#
run_perf fast longlong
