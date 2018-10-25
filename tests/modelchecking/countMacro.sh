#!/bin/bash
# Use 'grep' to find the macros used in the impl folder
copy=`grep "FUNCTIONCALL_NO_COPY" impl/functioncall*/*/*.c | wc -l`
nocopy=`grep "FUNCTIONCALL_COPY" impl/functioncall*/*/*.c | wc -l`
echo -e "The number of FUNCTIONCALL_NO_COPY macro is $copy"
echo -e "The number of FUNCTIONCALL_COPY macro is $nocopy"
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
        echo -e "Case "$i"\t"$testcase" at line "$linenumber "\t" $code  >> $log
        i=$(( i + 1 ))
        #read -p "Press [Enter] to continue"
    done < <(grep -n "$macro" impl/functioncall*/*/*.c)
}

collectTestCases "FUNCTIONCALL_COPY"
collectTestCases "FUNCTIONCALL_NO_COPY"

 