#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
### declare parameters
#declare -a parameters=( "large1x" "large2x" "large4x" "large8x" "large16x" "large32x" "large64x" "large128x" "large256x" )
declare -a parameters=( "large256x" )
testcase="LZ77"
program="compress"
compiler="gcc"
pattern="enabledpattern"
codegen="nocopydealloc"
#declare -a codes=( "mapreduce_seq" "mapreduce_openmp" "cilk_reducer" "cilk_reducer_seq" )
declare -a codes=( "cilk_reducer" )
## declare the number of threads
#declare -A threads=( [mapreduce_seq]="1" [mapreduce_openmp]="1 2 4 8" [cilk_reducer]="1 2 4 8" [cilk_reducer_seq]="1" )
declare -A threads=( [mapreduce_seq]="1" [mapreduce_openmp]="2 4 8" [cilk_reducer]="1 2 4 8" [cilk_reducer_seq]="1" )
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
                result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
                ## Compile all C files into executable
                mkdir -p "$code/out"
                case "$code" in
                    "mapreduce_openmp")
                        export OMP_NUM_THREADS=$thread
                        echo "OMP_NUM_THREADS="$OMP_NUM_THREADS >> $result
                        $compiler -fopenmp -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" \
                                  -o "$code/out/LZ77_compress.$code.out"
                        ;;
                    "mapreduce_seq")
                        $compiler -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" \
                                  -o "$code/out/LZ77_compress.$code.out"
                        ;;
                    "cilk_reducer")
                        export CILK_NWORKERS=$thread
                        echo "CILK_NWORKERS="$CILK_NWORKERS >> $result
                        ## -lcilkrts links cilk plus runtime
                        $compiler -fcilkplus -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" \
                                  -lcilkrts -o "$code/out/LZ77_compress.$code.out"
                        ;;
                    "cilk_reducer_seq")
                        $compiler -O0 "$code/LZ77_compress.c" "$code/Util.c" "$code/WyRT.c" \
                                  -o "$code/out/LZ77_compress.$code.out"
                esac
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
