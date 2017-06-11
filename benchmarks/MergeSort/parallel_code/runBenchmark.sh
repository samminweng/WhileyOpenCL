#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
### declare parameters
##declare -a parameters=( 1000 10000 100000 )
declare -a parameters=( 100000000 200000000 300000000 )
testcase="MergeSort"
program="original"
compiler="gcc"
pattern="disabledpattern"
codegen="nocopydealloc"
declare -a codes=( "cilkspawn" "seq" "cilkspawn_seq" )
## declare the number of threads
declare -A threads=( [seq]="1" [cilkspawn]="1 2 4 8 12 16" [cilkspawn_seq]="1 2 4 8 12 16" )
### remove all files inside the folder
rm -rf "../exectime/C"
mkdir -p "../exectime/C"
# Go through each parameter
for parameter in "${parameters[@]}"
do
    for code in "${codes[@]}"
    do
        ### Run OpenMP executable with multiple threads (1, 2, 4, 6, 8)
        for thread_arr in "${threads[$code]}"
        do
            for thread in $thread_arr
            do
                echo $code
                echo "Thread = "$thread

                ## Compile all C files into executable
                mkdir -p "$code/out"
                if [ $code == 'seq' ]
                then
                    $compiler -O0 "$code/MergeSort_original.c" "$code/Util.c" "$code/WyRT.c" \
                    -o "$code/out/MergeSort_original.$code.out"
                else
                    $compiler -fcilkplus -O0 "$code/MergeSort_original.c" "$code/Util.c" "$code/WyRT.c" \
                    -o "$code/out/MergeSort_original.$code.out"
                fi
                result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
                export CILK_NWORKERS=$thread
                echo "CILK_NWORKERS="$CILK_NWORKERS >> $result
                #read -p "Press [Enter] to continue..."$result
                for i in {1..10}
                do
                    echo "Run the $program $testcase on $parameter using $compiler" >> $result
                    echo "Begin $i iteration" >> $result
                    start=`date +%s%N`
                    ## Run the openmp code
                    "$code/out/MergeSort_original.$code.out" $parameter >> $result
                    ## Get exit code
            		exitcode="$?"
            		## Exit code of time out
            		if [ "$exitcode" == "124" ]
            		then
            			printf "\nOOT: Run out of time $TIMEOUT\n" >> $result
            			break 1 ## Break the for loop
            		fi
            		##
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
        done
    done
done
