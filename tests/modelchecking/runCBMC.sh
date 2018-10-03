#!/bin/bash
# Use C bounded model checking to verify the absence of memory leaks in our generated C code
runCBMC(){
    logFolder="cbmc_log"
    rm -rf $logFolder/* # Clear all the log files
    memorylog="cbmc_log.txt"
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
        #read -p "Press enter to continue"   
        for subfolder in $folder/*
        do            
            #echo $subfolder
            # Get the test case
            testcase=$(echo $subfolder | cut -d "/" -f3)
            echo $testcase
            #read -p "Press enter to continue"
            # Run cbmc to verify our C code
            cbmc $subfolder/*.c --memory-leak-check > $logFolder/$testcase.$codetype.log
            # Check exit status
            STATUS="${?}"
            if (( STATUS != 0))
            then 
                echo "Error!!! $codetype $testcase code fails." >> $failtestcases
            fi
            # Put all output to a single file
            echo "=== Test report for $codetype $testcase using CBMC ===" >> $memorylog
            cat $logFolder/$testcase.$codetype.log >> $memorylog
            #read -p "Press enter to continue"
        done
    done
}
runCBMC