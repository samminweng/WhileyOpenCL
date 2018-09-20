#!/bin/bash

runValgrind(){
    rm -rf log/* # Clear all the log files
    memorylog="memorylog.txt"
    rm -rf $memorylog
    touch $memorylog
    for folder in impl/*
    do
        echo $folder
        # Get the test case
        testcase=$(echo $folder | cut -d "/" -f2)
        echo $testcase    
        # Compile the *.c 
        gcc -std=c11 -g -D DEBUG $folder/*.c -o $folder/$testcase.out
        # Run the valgrind
        valgrind --leak-check=full --log-file=log/$testcase.valgrind.log ./$folder/$testcase.out > log/$testcase.log
        # Put all output to a single file
        echo "=== Test report for $testcase ===" >> $memorylog
        echo "The Valgrind memory detector as below:" >> $memorylog
        cat log/$testcase.valgrind.log >> $memorylog
        echo "The deallocation macros are as below:" >> $memorylog
        cat log/$testcase.log >> $memorylog
        echo -e "\n\n" >> $memorylog
        #read -p "Press enter to continue"
    done
}
runValgrind