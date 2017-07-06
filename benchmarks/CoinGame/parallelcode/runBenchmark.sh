#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
alias pollycc="clang -O3 -mllvm -polly"
### declare parameters
declare -a parameters=( "10000" "20000" "30000" "40000")
##declare -a codes=( "polly_seq" "polly_openmp" "gcc_seq" "worksharing_openmp" "cilk_for" )
declare -a codes=( "polly_seq" )
declare -A compilers=( [polly_seq]="pollycc" [polly_openmp]="pollycc" \
                       [gcc_seq]="gcc" [worksharing_openmp]="gcc" [cilk_for]="gcc" )
testcase="CoinGame"
program="original"
pattern="disabledpattern"
codegen="nocopydealloc"
## declare the number of threads
declare -A threads=( [polly_seq]="1" [polly_openmp]="1 2 4 8" \
                     [gcc_seq]="1" [worksharing_openmp]="1 2 4 8" [cilk_for]="1 2 4 8" )
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
                compiler="${compilers[$code]}"
                echo $compiler
                echo $code
                echo "Thread = "$thread
                ## Compile all C files into executable
                mkdir -p "$code/out"
                case "$code" in
                    "polly_seq")
                        pollycc "$code/CoinGame_original.c" "$code/Util.c" "$code/WyRT.c" \
                                -o "$code/out/CoinGame_original.$code.out"
                    ;;
                    "polly_openmp")
                        pollycc -mllvm -polly-parallel -lgomp "$code/CoinGame_original.c" "$code/Util.c" "$code/WyRT.c" \
                                -o "$code/out/CoinGame_original.$code.out"
                    ;;
                    "gcc_seq")
                        gcc -O0 "$code/CoinGame_original.c" "$code/Util.c" "$code/WyRT.c" \
                                  -o "$code/out/CoinGame_original.$code.out"
                    ;;
                    "worksharing_openmp")
                        gcc -fopenmp -O0 "$code/CoinGame_original.c" "$code/Util.c" "$code/WyRT.c" \
                                  -o "$code/out/CoinGame_original.$code.out"
                    ;;
                    "cilk_for")
                        gcc -fcilkplus -O0 "$code/CoinGame_original.c" "$code/Util.c" "$code/WyRT.c" \
                              -lcilkrts -o "$code/out/CoinGame_original.$code.out"
                    ;;
                esac
                result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
                for i in {1..10}
                do
                    echo "Run the $program $testcase on $parameter using $compiler" >> $result
                    echo "Begin $i iteration" >> $result
                    start=`date +%s%N`
                    case "$code" in
                        "polly_seq")
                            ## Run the sequential code
                            "$code/out/CoinGame_original.$code.out" $parameter >> $result
                            ;;
                        "polly_openmp")
                            export OMP_NUM_THREADS=$thread
                            echo "OMP_NUM_THREADS="$OMP_NUM_THREADS >> $result
                            ## Run the parallel code
                            "$code/out/CoinGame_original.$code.out" $parameter >> $result
                            ;;
                        "gcc_seq")
                            "$code/out/CoinGame_original.$code.out" $parameter >> $result
                            ;;
                        "worksharing_openmp")
                            export OMP_NUM_THREADS=$thread
                            echo "OMP_NUM_THREADS="$OMP_NUM_THREADS >> $result
                            ## Run the parallel code
                            "$code/out/CoinGame_original.$code.out" $parameter >> $result
                            ;;
                        "cilk_for")
                            export CILK_NWORKERS=$thread
                            echo "CILK_NWORKERS="$CILK_NWORKERS >> $result
                            ## Run the parallel code
                            "$code/out/CoinGame_original.$code.out" $parameter >> $result
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
