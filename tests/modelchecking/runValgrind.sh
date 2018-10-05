#!/bin/bash
## Use valgrind to detect memory leaks in our generated C code
runValgrind(){
    logFolder="log"
    #read -p "Press enter to continue" 
    memorylog="log_valgrind.txt"
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
        #read -p "Press enter to continue"   
        for category in $folder/*
        do            
            for subfolder in $category
            do
                #echo $subfolder
                # Get the test case
                testcase=$(echo $subfolder | cut -d "/" -f3)
                echo $testcase
                #read -p "Press enter to continue"
                # Compile the *.c 
                gcc -std=c11 -g -D DEBUG $subfolder/*.c -o $subfolder/$testcase.out
                # Run the valgrind
                valgrind --leak-check=full --log-file=$logFolder/$testcase.valgrind.log ./$subfolder/$testcase.out > $logFolder/$testcase.log
                # Check exit status
                STATUS="${?}"
                if (( STATUS != 0))
                then 
                    echo "Error!!! $codetype $testcase code fails." >> $failtestcases
                fi
                # Put all output to a single file
                echo "=== Test report for $codetype $testcase ===" >> $memorylog
                echo "The Valgrind memory detector as below:" >> $memorylog
                cat $logFolder/$testcase.valgrind.log >> $memorylog
                echo "The deallocation macros are as below:" >> $memorylog
                cat $logFolder/$testcase.log >> $memorylog
                echo -e "\n\n" >> $memorylog
                #read -p "Press enter to continue"
            done
        done
    done
}
runValgrind