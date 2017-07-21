#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
# Run Polly from clang
alias pollycc="clang -O3 -mllvm -polly"
### declare parameters
declare -a parameters=( "image32x32.pbm" "image64x64.pbm" "image128x128.pbm" "image256x256.pbm" \
                        "image512x512.pbm" "image1024x1024.pbm" )
## Declare an associative array for image size in sobeledge test case
declare -A widths=( [image32x32.pbm]=32 [image64x64.pbm]=64 [image128x128.pbm]=128 \
                    [image256x256.pbm]=256 [image512x512.pbm]=512 [image1024x1024.pbm]=1024 )
testcase="SobelEdge"
program="original"
compiler="pollycc"
pattern="disabledpattern"
codegen="nocopy"
declare -a codes=( "polly_openmp" "polly_seq" )
## declare the number of threads
declare -A threads=( [polly_seq]="1" [polly_openmp]="1 2 4 8 12 16" )
## BaseFolder
BASEDIR="$(dirname "$(pwd)")"

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
                if [ $code == 'polly_seq' ]
                then
                    pollycc $code/$testcase"_original.c" $code"/Util.c" $code"/WyRT.c" \
                    -o $code/out/$testcase"_original."$code".out"
                else
                    mkdir -p $code/"llvm"
                    mkdir -p $code/"assembly"
                    pollycc -S -emit-llvm -mllvm -polly-pattern-matching-based-opts=false -mllvm -polly-parallel\
                            -mllvm -polly-parallel-force -mllvm -polly-process-unprofitable $code/$testcase"_"$program.c \
                            -o $code/"llvm"/$testcase"_"$program.openmp.ll
                    llc $code/"llvm"/$testcase"_"$program.openmp.ll -o $code/"assembly"/$testcase"_"$program.openmp.s
                    ### Generate parallel executable
                    pollycc -lgomp $code/"assembly"/$testcase"_"$program.openmp.s $code/Util.c $code/WyRT.c \
                            -o $code/"out"/$testcase"_"$program.$code.out
                fi
                result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
                export OMP_NUM_THREADS=$thread
                echo "OMP_NUM_THREADS="$OMP_NUM_THREADS >> $result
                #read -p "Press [Enter] to continue..."$result
                for i in {1..10}
                do
                    echo "Run the $program $testcase on $parameter using $compiler" >> $result
                    echo "Begin $i iteration" >> $result
                    #read -p "Press [Enter] to continue..."
                    start=`date +%s%N`
                    echo $parameter
                    width=${widths[$parameter]}
                    echo "width = "$width
                    ## Copy PBM image to folder
                    inputfile=$BASEDIR/images/input/$parameter
                    outputfile=$BASEDIR/images/output/$code"_"$parameter
                    #read -p "Press [Enter] to continue..."$outputfile":"$inputfile
                    timeout $TIMEOUT $code/"out"/$testcase"_"$program.$code.out $width $inputfile > $outputfile
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
        done
    done
done
