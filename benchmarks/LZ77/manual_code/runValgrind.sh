#!/bin/bash
TIMEOUT="3600s"
## Set shell script to UTF-8
export LANG=C.UTF-8
testcase="LZ77"
declare -a programs=( "compress" "decompress" "opt_compress" "opt_decompress" )
compiler="gcc"
codegen="manual"
pattern="disabledpattern"
code="seq"
thread=1
### declare parameters
#declare -a parameters=( "medium1x medium5x medium10x medium25x medium50x medium75x medium100x medium125x" \
# 						"medium150x medium175x medium200x" \
#						"medium225x medium250x medium275x medium300x medium325x medium350x medium375x medium400x" )
declare -a parameters=( "medium1x" "medium2x" "medium4x" )
### Create the 'leak' folder
leakdir="../leaks"
mkdir -p "$leakdir"
## Go through each prorgam
for program in "${programs[@]}"
do
	echo $program
	## Compile the program
	mkdir -p $program/"out"
	executable=$program/"out"/$testcase"_"$program.$codegen.out
	gcc -g -std=c11 -O0 $program/$testcase"_"$program.c -o $executable
	## Go through each parameter
	for parameter in "${parameters[@]}"
	do
		echo $parameter
		result="../leaks/$testcase.$program.$compiler.$pattern.$codegen.$code.$parameter.$thread.txt"
		echo $result
		case "$program" in
			"compress")
				valgrind --tool=memcheck "--log-file=$result" $executable "../Inputfiles/"$parameter.in
				;;
			"decompress")
				valgrind --tool=memcheck "--log-file=$result" $executable "../Outputfiles/"$parameter.dat
				;;
			"opt_compress")
				valgrind --tool=memcheck "--log-file=$result" $executable "../Inputfiles/"$parameter.in
				;;
			"opt_decompress")
				valgrind --tool=memcheck "--log-file=$result" $executable "../Outputfiles/"$parameter.dat
				;;
		esac
	done
done
