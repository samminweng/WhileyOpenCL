#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
### declare parameters
declare -a parameters=( "large1x" "large2x" "large4x" "large8x" "large16x" "large32x" "large64x" "large128x" "large256x" )
#declare -a parameters=( "large2x" "large4x" "large8x" "large16x" )
testcase="LZ77"
program="compress"
compiler="gcc"
pattern="enabledpattern"
codegen="nocopydealloc"
declare -a codes=( "mapreduce_seq" "mapreduce_openmp" "cilk_reducer" )
## declare the number of threads
declare -A threads=( [mapreduce_seq]="1" [mapreduce_openmp]="1 2 4 8" )
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
                if [ $code == 'mapreduce_openmp' ]
                then
                    $compiler -fopenmp -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" -o "$code/out/LZ77_compress.$code.out"
                else
                    $compiler -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" -o "$code/out/LZ77_compress.$code.out"
                fi
                result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
                export OMP_NUM_THREADS=$thread
                echo "OMP_NUM_THREADS="$OMP_NUM_THREADS >> $result
                #read -p "Press [Enter] to continue..."$result
                for i in {1..10}
                do
                    echo "Run the $program $testcase on $parameter using $compiler" >> $result
                    echo "Begin $i iteration" >> $result
                    start=`date +%s%N`
                    ## Run the openmp code
                    "$code/out/LZ77_compress.$code.out" "../Inputfiles/$parameter.in" \
                         "../Outputfiles/$parameter.$code.dat" >> $result

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
