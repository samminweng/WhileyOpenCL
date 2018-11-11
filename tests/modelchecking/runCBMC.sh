#!/bin/bash
# Use C bounded model checking to verify the absence of memory leaks in our generated C code
runCBMC(){
    logFolder="log"
    
    failtestcases="failtestcase.txt"
    rm -rf $failtestcases
    touch $failtestcases
    for folder in impl/*
    do
        # Get the code type
        codetype=$(echo $folder | cut -d "/" -f2)
        echo $codetype
        echo $codetype
        memorylog="log_cbmc"$codetype".txt"
        echo $memorylog
        #read -p "Press enter to continue"  
        rm -rf $memorylog
        touch $memorylog
        #read -p "Press enter to continue"
        for category in $folder/*
        do
            #read -p "Press enter to continue"   
            for subfolder in $category
            do                            
                #echo $subfolder
                # Get the test case
                testcase=$(echo $subfolder | cut -d "/" -f3)
                echo $testcase
                #read -p "Press enter to continue"
                # Run cbmc to verify our C code
                # --object-bits n option increases the maximal number of objects 
                # Otherwise CBMC reports too many addressed objects: maximum number of objects is set to 2^n=256 (with n=8);
                # Note object-bits must be positive and less than the pointer width (64)
                cbmc $subfolder/*.c --memory-leak-check --pointer-check --object-bits 11 > $logFolder/$testcase.cbmc.log
                # Check exit status
                STATUS="${?}"
                if (( STATUS != 0))
                then 
                    echo "Error!!! $category $testcase code fails." >> $failtestcases
                fi
                # Put all output to a single file
                echo "=== Test report for $category $testcase using CBMC ===" >> $memorylog
                ## Write out the first and the last 10 lines of logs.
                head $logFolder/$testcase.cbmc.log >> $memorylog
                echo "... Please refer to $logFolder/$testcase.cbmc.log for more details ..." >> $memorylog
                tail $logFolder/$testcase.cbmc.log >> $memorylog
            done
        done
    done
}
runCBMC
