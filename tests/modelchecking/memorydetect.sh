#!/bin/bash

runValgrind(){
    rm log/* # Clear all the log files
    for folder in impl/*
    do
        echo $folder
        # Get the test case
        testcase=$(echo $folder | cut -d "/" -f2)
        echo $testcase    
        # Compile the *.c 
        gcc -g $folder/*.c -o $folder/$testcase.out
        # Run the valgrind
        valgrind --leak-check=full --log-file=log/$testcase.log ./$folder/$testcase.out 
        #read -p "Press enter to continue"
    done
    rm log.txt
    touch log.txt
    # Put all output to a single file
    for log in log/*
    do
        cat $log >> log.txt
    done

}
runValgrind