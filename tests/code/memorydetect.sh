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
        # Go into each subfolders
        for subfolder in $folder/*
        do
            #echo $subfolder
            codetype=$(echo $subfolder | cut -d "/" -f3)
            echo $codetype
            #read -p "Press enter to continue"
            basefolder=$(pwd)
            cd $subfolder
            # Compile the *.c 
            gcc -std=c11 -g -D DEBUG *.c -o $testcase.out
            # Run the valgrind
            valgrind --leak-check=full --log-file=$basefolder/log/$testcase.$codetype.valgrind.log ./$testcase.out > $basefolder/log/$testcase.$codetype.log
             # Check exit status
            STATUS="${?}"
            if (( STATUS != 0))
            then 
                echo "Error!!! $codetype $testcase code fails."
                exit $STATUS
            fi
            # Put all output to a single file
            echo "=== Test report for the $codetype code of $testcase ===" >> $basefolder/$memorylog
            echo "The Valgrind memory detector as below:" >> $basefolder/$memorylog
            cat $basefolder/log/$testcase.$codetype.valgrind.log >> $basefolder/$memorylog
            echo "The deallocation macros are as below:" >> $basefolder/$memorylog
            cat $basefolder/log/$testcase.$codetype.log >> $basefolder/$memorylog
            echo -e "\n\n" >> $basefolder/$memorylog
            cd $basefolder
            #read -p "Press enter to continue"
        done
    done
}
runValgrind