#!/bin/bash
## Use valgrind to detect memory leaks in our generated C code
basePath="$(pwd)"
runValgrind(){
    logFolder="$basePath/log"
    #read -p "Press enter to continue" 
    memorylog="$basePath/log_cbmc.txt"
    rm -rf $memorylog
    touch $memorylog
    failtestcases="$basePath/failtestcase.txt"
    rm -rf $failtestcases
    touch $failtestcases
    for folder in impl/*
    do
        #echo $folder
        # Get the code type
        testcase=$(echo $folder | cut -d "/" -f2)
        echo $testcase
        #read -p "Press enter to continue"
        for subfolder in $folder/*
        do   
            #echo $subfolder
            codetype=$(echo $subfolder | cut -d "/" -f3)
            echo $codetype
            #read -p "Press enter to continue"
            # Run cbmc to verify our C code
            cbmc $subfolder/*.c --memory-leak-check --pointer-check > $logFolder/$testcase.cbmc.log
            # Check exit status
            STATUS="${?}"
            if (( STATUS != 0))
            then 
                echo "Error!!! $codetype $testcase code fails." >> $failtestcases
            fi
            # Put all output to a single file
            echo "=== Test report for $category $testcase using CBMC ===" >> $memorylog
            cat $logFolder/$testcase.cbmc.log >> $memorylog
            echo -e "\n\n" >> $memorylog
            #read -p "Press enter to continue"
        done
    done
}
runValgrind