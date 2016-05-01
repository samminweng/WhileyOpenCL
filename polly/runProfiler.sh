#!/bin/bash
###
## Profile the C code
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
	program=$1
	compiler=$1
	
	## Compile C code with -pg option to write profile information for gprof
	echo -e -n "${GREEN}[*]Compile $program using GCC${RESET}" && read
	gcc -std=c99 -O3 -Wall -pg $program.c Util.c -o "out/$program.$compiler.enablevc.out"

	## Execute the program
	echo -e -n "${GREEN}[*]Compile $program using GCC${RESET}" && read
	./"out/$program.$compiler.enablevc.out" $program.c Util.c
}

exec(){
	program=$1
	compiler=$2
	c_type=$3
	# change folder
	cd "$program/impl/$c_type"
	generateCode $program $compiler
	runGProf $program $compiler

}

exec NQueens gcc autogenerate_leak