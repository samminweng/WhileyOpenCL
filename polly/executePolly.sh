#!/bin/bash
export PATH_TO_POLLY_LIB="$HOME/llvm_build/lib"
export OPTFLAGS="-load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

#
# Generate the C code w.r.t. code optimization
#
generate_code(){
	c_type=$1
	program=$2
	# Use wyopcl shell script to generate C code
	# The 'case esac' example is http://www.tutorialspoint.com/unix/case-esac-statement.htm 
	case "$c_type" in
		"naive")
			# Generate naive C code
		 	./../../../../bin/wyopcl -code "$program".whiley
		 	;;
		"naive_dealloc")
			# Generate naive C code
		 	./../../../../bin/wyopcl -code -dealloc "$program".whiley
		 	;;
		"copy_reduced")
			# Generate copy-eliminated C code
		 	./../../../../bin/wyopcl -code -copy "$program".whiley
			;;
		"copy_reduced_dealloc")
			# Generate copy-eliminated C code
		 	./../../../../bin/wyopcl -code -copy -dealloc "$program".whiley
			;;
	esac
}

exec_polly(){
	c_type=$1
	program=$2
	### Create LLVM-IR from C code and use include option to include standard library C file. 
	clang -include Util.c -S -emit-llvm $program.c -o $program.s
	### Translate LLVM-IR to canonical code
	opt $OPTFLAGS -S -polly-canonicalize $program.s > $program.preopt.ll
	read -p "Press [Enter] to show the SCoPs detected by Polly"
	opt $OPTFLAGS -basicaa -polly-ast -analyze -q $program.preopt.ll
	# ### Generate SCoPs in DOT/PNG files, viewd by Graphviz
	# opt $OPTFLAGS -basicaa -view-scops -disable-output $program.preopt.ll 
	# ### View the polyhedral representation of the SCoPs
	# opt $OPTFLAGS -basicaa -polly-scops -analyze $program.preopt.ll
	###Show the dependences for the SCoPs
	# opt $OPTFLAGS -basicaa -polly-dependences -analyze $program.preopt.ll
	### Export jscop files
	# opt $OPTFLAGS -basicaa -polly-export-jscop $program.preopt.ll
	# Import the changed jscop files and print the updated SCoP structure (optional)
	### Codegenerate the SCoPs
}

exec(){
	c_type=$1
	program=$2
	utildir="$PWD/../tests/code"
	workingdir="$program/impl/$c_type"
	## copy *.whiley and Util.c Util.h to working folder
	cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cd $workingdir
	read -p "Press [Enter] to generate C code for $program.whiley..."	
	generate_code $c_type $program
	read -p "Press [Enter] to optimize code using Polly..."
	exec_polly $c_type $program
	cd ../../../
}

exec naive MergeSort 