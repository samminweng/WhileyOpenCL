#!/bin/bash
#
# Load polly to clang to optimize the LLVM-IR code
#
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

load_polly_clang(){
	c_type=$1
	program=$2
	### Extract LLVM-IR from C code and use include option to include standard library C file. 
	read -p "Press [Enter] to extract pre-optimized LLVM-IR from C code"
	#clang -include Util.c -S -emit-llvm $program.c -o $program.s
	# ### opt, LLVM optimizer, takes LLVM as input and output optimized files or analysis results
	# opt $OPTFLAGS -S -polly-canonicalize $program.s > $program.preopt.ll
	clang $CPPFLAGS -O0 -mllvm -polly -S -emit-llvm $program.c -o $program.preopt.ll
	### Create dots files that highlight SCoPs
	read -p "Press [Enter] to show the dot blocks of SCoPs detected by Polly"
	clang $CPPFLAGS -O3 $program.c -mllvm -polly-dot
	# opt $OPTFLAGS -basicaa -dot-scops -disable-output $program.preopt.ll
	### Move all the dot files to 'dot' folder
	mkdir -p "dot"
	mv *.dot "dot/"
	cd "dot/"
	# ### Generate png files from dot files
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../
	read -p "Press [Enter] to show the dot-only blocks of SCoPs detected by Polly"
	clang $CPPFLAGS -O3 $program.c -mllvm -polly-dot-only
	# opt $OPTFLAGS -basicaa -dot-scops -disable-output $program.preopt.ll
	### Move all the dot files to 'dot' folder
	mkdir -p "dot-only"
	mv *.dot "dot-only/"
	cd "dot-only/"
	# ### Generate png files from dot files
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../

	read -p "Press [Enter] to "
}
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
##
## Execute Polly Pass step by step
##
opt_polly(){
	c_type=$1
	program=$2
	
	read -p "Press [Enter] 1. Create LLVM-IR from C"
	clang -S -emit-llvm $program.c -o $program.s
	read -p "Press [Enter] 2. Prepare the LLVM-IR for Polly"
	opt -S -polly-canonicalize $program.s > $program.preopt.ll
	read -p "Press [Enter] 3. Show the SCoPs detected by Polly"
	opt -basicaa -polly-ast -analyze -q $program.preopt.ll

	read -p "Press [Enter] 4.1 Generate the detected SCoPs in DOT"
	# We only create .dot files, as directly -view-scops directly calls graphviz
	# which would require user interaction to continue the script.
	# opt -basicaa -view-scops -disable-output $program.preopt.ll
	opt -basicaa -dot-scops -disable-output $program.preopt.ll
	### Move all the dot files to 'dot' folder
	mkdir -p "dot"
	mv *.dot "dot/"
	cd "dot/"
	# ### Generate png files from dot files
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../
	
	read -p "Press [Enter] 4.2 Generate the detected SCoPs in DOT-only (no instructions)"
	# We only create .dot files, as directly -view-scops-only directly calls
	# graphviz which would require user interaction to continue the script.
	# opt -basicaa -view-scops-only -disable-output $program.preopt.ll
	opt -basicaa -dot-scops-only -disable-output $program.preopt.ll
	mkdir -p "dot-only"
	mv *.dot "dot-only/"
	cd "dot-only/"
	# ### Generate png files from dot files
	for i in `ls *.dot`; do dot -Tpng $i > $i.png; done
	cd ../
	
	# read -p "Press [Enter] 6. View the polyhedral representation of the SCoPs"
	# opt -basicaa -polly-scops -analyze $program.preopt.ll

	# read -p "Press [Enter] 7. Show the dependences for the SCoPs"
	# opt -basicaa -polly-dependences -analyze $program.preopt.ll

	read -p "Press [Enter] 5. Export jscop files"
	opt -basicaa -polly-export-jscop $program.preopt.ll

	# read -p "Press [Enter] 9. Import the updated jscop files and print the new SCoPs. (optional)"
	# opt -basicaa -polly-import-jscop -polly-ast -analyze matmul.preopt.ll
	# opt -basicaa -polly-import-jscop -polly-ast -analyze matmul.preopt.ll \
	#     -polly-import-jscop-postfix=interchanged
	# opt -basicaa -polly-import-jscop -polly-ast -analyze matmul.preopt.ll \
	#     -polly-import-jscop-postfix=interchanged+tiled
	# opt -basicaa -polly-import-jscop -polly-ast -analyze matmul.preopt.ll \
	#     -polly-import-jscop-postfix=interchanged+tiled+vector

	#read -p "Press [Enter] 10. Codegenerate the SCoPs"
	#opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged \
	#     -polly-codegen \
	#     matmul.preopt.ll | opt -O3 > matmul.polly.interchanged.ll
	# opt -basicaa -polly-import-jscop \
	#     -polly-import-jscop-postfix=interchanged+tiled -polly-codegen \
	#     matmul.preopt.ll | opt -O3 > matmul.polly.interchanged+tiled.ll
	# opt -basicaa -polly-import-jscop \
	#     -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen \
	#     matmul.preopt.ll -polly-vectorizer=polly\
	#     | opt -O3 > matmul.polly.interchanged+tiled+vector.ll
	# opt -basicaa -polly-import-jscop \
	#     -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen \
	#     matmul.preopt.ll -polly-vectorizer=polly -polly-parallel\
	#     | opt -O3 > matmul.polly.interchanged+tiled+vector+openmp.ll
	# opt matmul.preopt.ll | opt -O3 > matmul.normalopt.ll

	#read -p "Press [Enter] 11. Create the executables"
	#llc $program.polly.interchanged.ll -o $program.polly.interchanged.s && gcc $program.polly.interchanged.s \
	#     -o matmul.polly.interchanged.exe
	# llc matmul.polly.interchanged+tiled.ll -o matmul.polly.interchanged+tiled.s && gcc matmul.polly.interchanged+tiled.s \
	#     -o matmul.polly.interchanged+tiled.exe
	# llc matmul.polly.interchanged+tiled+vector.ll \
	#     -o matmul.polly.interchanged+tiled+vector.s \
	#     && gcc matmul.polly.interchanged+tiled+vector.s \
	#     -o matmul.polly.interchanged+tiled+vector.exe
	# llc matmul.polly.interchanged+tiled+vector+openmp.ll \
	#     -o matmul.polly.interchanged+tiled+vector+openmp.s \
	#     && gcc -lgomp matmul.polly.interchanged+tiled+vector+openmp.s \
	#     -o matmul.polly.interchanged+tiled+vector+openmp.exe
	# llc matmul.normalopt.ll -o matmul.normalopt.s && gcc matmul.normalopt.s \
	#     -o matmul.normalopt.exe

	# read -p "Press [Enter] 12. Compare the runtime of the executables"

	# read -p "Press [Enter] time ./matmul.normalopt.exe"
	# time -f "%E real, %U user, %S sys" ./matmul.normalopt.exe
	# read -p "Press [Enter] time ./matmul.polly.interchanged.exe"
	# time -f "%E real, %U user, %S sys" ./matmul.polly.interchanged.exe
	# read -p "Press [Enter] time ./matmul.polly.interchanged+tiled.exe"
	# time -f "%E real, %U user, %S sys" ./matmul.polly.interchanged+tiled.exe
	# read -p "Press [Enter] time ./matmul.polly.interchanged+tiled+vector.exe"
	# time -f "%E real, %U user, %S sys" ./matmul.polly.interchanged+tiled+vector.exe
	# read -p "Press [Enter] time ./matmul.polly.interchanged+tiled+vector+openmp.exe"
	# time -f "%E real, %U user, %S sys" ./matmul.polly.interchanged+tiled+vector+openmp.exe

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
	#load_polly_clang $c_type $program
	opt_polly $c_type $program
	cd ../../../
}
#exec handwritten MatrixMult
exec handwritten2 MatrixMult
#exec copy_reduced_dealloc MatrixMult
