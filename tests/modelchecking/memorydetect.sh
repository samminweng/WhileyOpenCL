#!/bin/bash

runValgrind(){
    rm -rf log/* # Clear all the log files
    rm -rf log.txt
    touch log.txt
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
        echo "=== Test report for $testcase ===" >> log.txt
        echo "The deallocation macros are as below:" >> log.txt
        cat log/$testcase.log >> log.txt
        echo "The Valgrind memory detector as below:" >> log.txt
        cat log/$testcase.valgrind.log >> log.txt
        echo -e "\n\n" >> log.txt
        #read -p "Press enter to continue"
    done
}
runValgrind