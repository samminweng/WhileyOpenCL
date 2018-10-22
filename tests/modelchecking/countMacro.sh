#!/bin/bash
# Use 'grep' to find the macros used in the impl folder
caller=`grep "CALLER_DEALLOC(" impl/functioncall*/*/*.c | wc -l`
callee=`grep "CALLEE_DEALLOC(" impl/functioncall*/*/*.c | wc -l`
reset=`grep "RESET_DEALLOC(" impl/functioncall*/*/*.c | wc -l`
retain=`grep "RETAIN_DEALLOC(" impl/functioncall*/*/*.c | wc -l`
echo -e "The number of CALLER_DEALLOC macro is $caller"
echo -e "The number of CALLEE_DEALLOC macro is $callee"
echo -e "The number of RESET_DEALLOC macro is $reset"
echo -e "The number of RETAIN_DEALLOC macro is $retain"
# Put the test cases to log
log="log_testcases.txt"
rm $log
touch $log
collectTestCases(){
    macro=$1
    echo -e "=== Test cases for $macro ===" >> $log
    i=1
    while read -r line ; do
        #echo "Processing $line"
        file=$(echo $line | cut -d " " -f1)
        code=$(echo $line | cut -d ":" -f3)
        testcase=$(echo $file | cut -d "/" -f3)
        linenumber=$(echo $file | cut -d "/" -f4)
        linenumber=$(echo $linenumber | cut -d ":" -f2)
        echo -e "Case "$i"\t\t"$testcase" at line "$linenumber "\t\t" $code  >> $log
        i=$(( i + 1 ))
        #read -p "Press [Enter] to continue"
    done < <(grep -n "$macro(" impl/functioncall*/*/*.c)
}

collectTestCases "CALLER_DEALLOC"
collectTestCases "CALLEE_DEALLOC"
collectTestCases "RESET_DEALLOC"
collectTestCases "RETAIN_DEALLOC"

 