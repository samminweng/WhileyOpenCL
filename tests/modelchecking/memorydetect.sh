#!/bin/bash

runValgrind(){
    rm -rf log/* # Clear all the log files
    memorylog="memorylog.txt"
    rm -rf $memorylog
    touch $memorylog
    failtestcases="failtestcase.txt"
    rm -rf $failtestcases
    touch $failtestcases
    for folder in impl/*
    do
        # Get the code type
        codetype=$(echo $folder | cut -d "/" -f2)
        echo $codetype
        ## We run combined optimised code
        #if [ "$codetype" = "nocopy_dealloc" ]
        #then
            #read -p "Press enter to continue"   
            for subfolder in $folder/*
            do            
                #echo $subfolder
                # Get the test case
                testcase=$(echo $subfolder | cut -d "/" -f3)
                echo $testcase
                #read -p "Press enter to continue"
                # Compile the *.c 
                gcc -std=c11 -g -D DEBUG $subfolder/*.c -o $subfolder/$testcase.$codetype.out
                # Run the valgrind
                valgrind --leak-check=full --log-file=log/$testcase.$codetype.valgrind.log ./$subfolder/$testcase.$codetype.out > log/$testcase.$codetype.log
                # Check exit status
                STATUS="${?}"
                if (( STATUS != 0))
                then 
                    echo "Error!!! $codetype $testcase code fails." >> $failtestcases
                fi
                # Put all output to a single file
                echo "=== Test report for $codetype $testcase ===" >> $memorylog
                echo "The Valgrind memory detector as below:" >> $memorylog
                cat log/$testcase.$codetype.valgrind.log >> $memorylog
                echo "The deallocation macros are as below:" >> $memorylog
                cat log/$testcase.$codetype.log >> $memorylog
                echo -e "\n\n" >> $memorylog
                #read -p "Press enter to continue"
            done
        #fi
    done
}
runValgrind