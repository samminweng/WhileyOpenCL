#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
## declare the number of threads
declare -a threads=( 1 2 4 6 8 )

### declare parameters
##declare -A parameters=( [LZ77]="input1x input2x input4x input8x input16x input32x input64x input128x input256x input512x input1024x" )
declare -A parameters=( [LZ77]="largest" )
program="compress"
compiler="gcc"
pattern="enabledpattern"
codegen="nocopydealloc"
code="openmp"
## Compile all C files into executable
mkdir -p out
gcc -O3 -fopenmp LZ77_compress.c Util.c WyRT.c -o out/LZ77_compress.openmp.out
# Go through each parameter
read -p "Press [Enter] to continue..."
### remove all files inside the folder
rm -f "../exectime/C/"*.*
param_arr=${parameters[$testcase]}
for parameter in $param_arr
do
    echo "parameter "$parameter
    ### Run OpenMP executable with multiple threads (1, 2, 4, 6, 8)
    for thread in "${threads[@]}"
    do
        export OMP_NUM_THREADS=$thread
        echo "OMP_NUM_THREADS="$OMP_NUM_THREADS
        result="../exectime/C/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
        for i in {1..10}
        do
            echo "Run the $program $testcase on $parameter using $compiler" >> $result
            echo "Begin $i iteration" >> $result
            ## Run the openmp code
            timeout $TIMEOUT "out/LZ77_compress.openmp.out" "../Inputfiles/$parameter.in" \
                             "../Inputfiles/$parameter.dat" >> $result

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

    done
done
