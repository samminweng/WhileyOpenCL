#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
### declare parameters
#declare -a parameters=( "2000" "4000" )
declare -a parameters=( "2000" "4000" "6000" "8000" "10000" "12000" "14000" "16000" "18000" "20000" \
                        "22000" "24000" "26000" "28000" "30000" "32000" "34000" "36000" "38000" "40000" )
testcase="SobelEdge"
program="large"
compiler="gcc"
pattern="disabledpattern"
codegen="manual"
## BaseFolder
BASEDIR="$(dirname "$(pwd)")"
### remove all files inside the folder
rm -rf "../exectime/C"
mkdir -p "../exectime/C"
# Go through each parameter
for parameter in "${parameters[@]}"
do
    ## Compile all C files into executable
    executable=$program/"out"/$testcase"_"$program.$codegen.out
    mkdir -p "$program/out"
    gcc -O3 $program/*.c -o $executable
    thread=1
    result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.seq.image2000x$parameter.pbm.$thread.txt"
    #read -p "Press [Enter] to continue..."$result
    for i in {1..10}
    do
        echo "Run the $program $testcase on $parameter using $compiler" >> $result
        echo "Begin $i iteration" >> $result
        #read -p "Press [Enter] to continue..."
        start=`date +%s%N`
        echo $parameter
        height=$parameter
        echo "height = "$height
        #read -p "Press [Enter] to continue..."$outputfile":"$inputfile
        timeout $TIMEOUT $executable $height >> $result
        ## Get exit code
		exitcode="$?"
		## Exit code of time out
		if [ "$exitcode" == "124" ]
		then
			printf "\nOOT: Run out of time $TIMEOUT\n" >> $result
			break 1 ## Break the for loop
		fi
		## Check exit status
		if [ "$exitcode" = "0" ]
		then
			end=`date +%s%N`
			exectime=$((end-start))
			printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter $exectime >> $result
		else
			printf "\nOOM:Run out of memory\n" >> $result
			break 1 ## Break the for loop
		fi
		echo "Finish $i iteration" >> $result
		####### Wait until background process is completed
		wait ${!}
    done
    ### Output the hardware info.
    cat /proc/cpuinfo >> $result
done
