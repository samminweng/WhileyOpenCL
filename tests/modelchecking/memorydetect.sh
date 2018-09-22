#!/bin/bash

runValgrind(){
    rm -rf log/* # Clear all the log files
    memorylog="memorylog.txt"
    rm -rf $memorylog
    touch $memorylog
    for folder in impl/*
    do
        # Get the code type
        codetype=$(echo $folder | cut -d "/" -f2)
        echo $codetype
        for subfolder in $folder/*
        do            
            #echo $subfolder
            # Get the test case
            testcase=$(echo $subfolder | cut -d "/" -f3)
            echo $testcase
            #read -p "Press enter to continue"
            # Compile the *.c 
            gcc -std=c11 -g -D DEBUG $subfolder/*.c -o $subfolder/$testcase.out
            # Run the valgrind
            valgrind --leak-check=full --log-file=log/$testcase.valgrind.log ./$subfolder/$testcase.out > log/$testcase.log
            # Put all output to a single file
            echo "=== Test report for $codetype $testcase ===" >> $memorylog
            echo "The Valgrind memory detector as below:" >> $memorylog
            cat log/$testcase.valgrind.log >> $memorylog
            echo "The deallocation macros are as below:" >> $memorylog
            cat log/$testcase.log >> $memorylog
            echo -e "\n\n" >> $memorylog
            #read -p "Press enter to continue"
        done
    done
}
runValgrind