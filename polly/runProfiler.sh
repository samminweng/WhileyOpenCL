#!/bin/bash
###
## Profile the C code
## 
### ANSI escape color code used for the highlighted texts 
GREEN="\033[1m\e[32m" # Green color
BOLD="\033[1m" # Bold text
REVERSE="\e[7m" #invert the foreground and background colors
RESET="\e[0m"    # Text Reset
###
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
### Generate C code
generateCode(){
	program=$1
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
	utildir="$PWD/../../../../tests/code"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $PWD
	#clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
	#ar -cvq libUtil.a Util.o
	if [[ $c_type == *"autogenerate"* ]]
	then
		if [[ $c_type == *"leakfree"* ]]
		then
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
            ./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"	
		else
			### Translate Whiley program into copy-eliminated C code 
			./../../../../bin/wyopcl -code -copy "$program.whiley"
		fi
	fi
	#echo -e -n "${GREEN}[*]Generate $program C code${RESET}" && read
}

runGProf(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	threads=$5
	mkdir -p "out"
	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "${GREEN}[*]Compile $program using GCC${RESET}" && read
	gcc -g -std=c99 -Wall -pg $program.c Util.c -o "out/$program.$compiler.enablevc.out"

	## Execute the program
	echo -e -n "${GREEN}[*]Run $program executable to produce profile files${RESET}" && read
	cd out
	"./$program.$compiler.enablevc.out" $parameter

	## The analysis file 'gmon.out' is generated
	echo -e -n "${GREEN}[*]Run GProf${RESET}" && read
	mkdir -p "$PWD/../../../prof"
	##gprof "./out/$program.$compiler.enablevc.out" gmon.out
	analysis="$c_type.$program.$compiler.$parameter.$threads.enablevc.txt"
	gprof "./$program.$compiler.enablevc.out" gmon.out > $analysis
	mv $analysis "$PWD/../../../prof"
	echo -e -n "${GREEN}[*]Output GProf Analysis ($analysis) ${RESET}" && read
	cd ..
}

exec(){
	c_type=$1
	program=$2
	compiler=$3
	parameter=$4
	threads=$5
	# change folder
	cd "$program/impl/$c_type"
	generateCode $program $compiler
	runGProf $c_type $program $compiler $parameter $threads

	cd ../../..
}

exec autogenerate_leak NQueens gcc 12 1
exec autogenerate_leakfree NQueens gcc 12 1