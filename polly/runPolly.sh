#!/bin/bash
export CPPFLAGS="-Xclang -load -Xclang ${POLLY_BUILD_DIR}/lib/LLVMPolly.so"
export OPTFLAGS="-load ${POLLY_BUILD_DIR}/lib/LLVMPolly.so"
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
	### Extract LLVM-IR from C code and use include option to include standard library C file. 
	read -p "Press [Enter] to extract pre-optimized LLVM-IR from C code"
	#clang -include Util.c -S -emit-llvm $program.c -o $program.s
	# ### opt, LLVM optimizer, takes LLVM as input and output optimized files or analysis results
	# opt $OPTFLAGS -S -polly-canonicalize $program.s > $program.preopt.ll
	clang $CPPFLAGS -O0 -mllvm -polly -S -emit-llvm $program.c -o $program.preopt.ll
	# ### Create dots files that highlight SCoPs 
	read -p "Press [Enter] to show the only blocks of SCoPs detected by Polly"
	clang $CPPFLAGS -O3 $program.c -mllvm -polly-dot-only
	# opt $OPTFLAGS -basicaa -dot-scops -disable-output $program.preopt.ll
	### Move all the dot files to 'dot' folder
	mkdir -p "dot-only"
	mv *.dot "dot-only/"
	cd "dot-only/"
	# ### Generate png files from dot files
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../
	read -p "Press [Enter] to Export the polyhedral representation to jscop (JSON format)"
	# ### Export JSCoPs
	clang $CPPFLAGS -O3 $program.c -mllvm -polly-export
	### Detect and analyze the LLVM
	# read -p "Press [Enter] to View the polyhedral representation of the SCoPs"
	# opt $OPTFLAGS -polly-detect $program.preopt.ll
	# ### Analyze the LLVM with dependency
	# # read -p "Press [Enter] to Show the dependences for the SCoPs"
	# # opt $OPTFLAGS -basicaa -polly-dependences -analyze $program.preopt.ll
	# ### Export JSCoPs
	# read -p "Press [Enter] to Export the polyhedral representation to jscop (JSON format)"
	# opt $OPTFLAGS -polly-export-jscop $program.preopt.ll
}

exec(){
	c_type=$1
	program=$2
	num_threads=$3
	parameter=$4
	utildir="$PWD/../tests/code"
	workingdir="$program/impl/$c_type"
	## copy *.whiley and Util.c Util.h to working folder
	cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cd $workingdir
	#read -p "Press [Enter] to generate C code for $program.whiley..."	
	generate_code $c_type $program
	exec_polly $c_type $program
	cd ../../../
}

exec copy_reduced_dealloc MatrixMult
exec copy_reduced_dealloc MatrixMult
