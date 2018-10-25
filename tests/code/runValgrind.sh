#!/bin/bash
## Use valgrind to detect memory leaks in our generated C code
basePath="$(pwd)"
runValgrind(){
    logFolder="$basePath/log"
    #read -p "Press enter to continue" 
    memorylog="$basePath/log_valgrind.txt"
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
            # Check 'ea_dealloc' and 'ea_nocopy_dealloc'
            if [ "$codetype" = "ea_dealloc" ] || [ "$codetype" = "ea_nocopy_dealloc" ]
            then
                #read -p "Press enter to continue"
                cd "impl/$testcase/$codetype"
                # Compile the *.c 
                gcc -std=c11 -g *.c -o $testcase.out
                # Run the valgrind
                valgrind --leak-check=full --log-file=$logFolder/$testcase.valgrind.log ./$testcase.out > $logFolder/$testcase.log
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
                echo -e "\n\n" >> $memorylog
                cd $basePath
                #read -p "Press enter to continue"
            fi
        done
    done
}
runValgrind