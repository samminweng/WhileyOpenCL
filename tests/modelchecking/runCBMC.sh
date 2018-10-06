#!/bin/bash
# Use C bounded model checking to verify the absence of memory leaks in our generated C code
runCBMC(){
    logFolder="log"
    memorylog="log_cbmc.txt"
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
                cbmc $subfolder/*.c --memory-leak-check --pointer-check > $logFolder/$testcase.cbmc.log
                # Check exit status
                STATUS="${?}"
                if (( STATUS != 0))
                then 
                    echo "Error!!! $category $testcase code fails." >> $failtestcases
                fi
                # Put all output to a single file
                echo "=== Test report for $category $testcase using CBMC ===" >> $memorylog
                head --lines=50 $logFolder/$testcase.cbmc.log >> $memorylog
                echo -e "\n .... Please refer to $logFolder/$testcase.cbmc.log ....\n" >> $memorylog
                tail $logFolder/$testcase.cbmc.log >> $memorylog
                #read -p "Press enter to continue"
            done
        done
    done
}
runCBMC