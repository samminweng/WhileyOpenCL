#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
### declare parameters
declare -a parameters=( "10000x" "20000x" "30000x" "40000x" "50000x" "60000x" "70000x" "80000x" "90000x" "100000x" )
#declare -a parameters=( "100x" "200x" )
testcase="LZ77"
#declare -a programs=( "opt_compress" "opt_decompress" )
declare -a programs=( "opt_compress" )
compiler="gcc"
pattern="disabledpattern"
codegen="manual"
## BaseFolder
BASEDIR="$(dirname "$(pwd)")"
### remove all files inside the folder
rm -rf "../exectime/C"
mkdir -p "../exectime/C"
for program in "${programs[@]}"
do
    echo $program
    # Go through each parameter
    for parameter in "${parameters[@]}"
    do
        echo $parameter
        mkdir -p $program/"out"
        # ## Compile all C files into executable
        executable=$program/"out"/$testcase"_"$program.$codegen.out
        gcc -O3 $program/*.c -o $executable
        thread=1
        result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.seq.medium$parameter.$thread.txt"
        # #read -p "Press [Enter] to continue..."$result
        for i in {1..10}
        do
            echo "Run the $program $testcase on $parameter using $compiler" >> $result
            echo "Begin $i iteration" >> $result
            #read -p "Press [Enter] to continue..."
            echo $parameter
            echo "parameter = "$parameter
            start=`date +%s%N`
            case "$program" in
                "compress")
                    timeout $TIMEOUT $executable "../Inputfiles/medium$parameter.in" >> $result
                    ;;
                "opt_compress")
                    timeout $TIMEOUT $executable "../Inputfiles/medium$parameter.in" >> $result
                    ;;
                "decompress")
                    timeout $TIMEOUT $executable "../Outputfiles/medium$parameter.dat" >> $result
                    ;;
                "opt_decompress")
                    timeout $TIMEOUT $executable "../Outputfiles/medium$parameter.dat" >> $result
                    ;;
            esac
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
    	 	sleep 5s
        done
        ### Output the hardware info.
        cat /proc/cpuinfo >> $result
    done
done
