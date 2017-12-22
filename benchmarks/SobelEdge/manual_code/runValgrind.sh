#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
testcase="SobelEdge"
program="large"
compiler="gcc"
codegen="manual"
pattern="disabledpattern"
code="seq"
thread=1
### declare parameters
declare -a parameters=( "2000" "4000" "6000" )

### Create the 'leak' folder
leakdir="../leaks"
mkdir -p "$leakdir"
## Compile the program
executable=$program/"out"/$testcase"_"$program.$codegen.out
gcc -g -std=c11 -O0 $program/$testcase"_"$program.c -o $executable
## Go through each parameter
for parameter in "${parameters[@]}"
do
	echo $parameter
	height=$parameter
	echo "height = "$height
	result="../leaks/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
	echo $result
	valgrind --tool=memcheck "--log-file=$result" $executable $height
done
