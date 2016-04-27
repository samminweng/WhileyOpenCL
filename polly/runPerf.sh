#!/bin/bash
TIMEOUT="1800s"
export PATH_TO_POLLY_LIB="$HOME/polly/llvm_build/lib"
export CPPFLAGS="-Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias opt="opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
alias pollycc="clang -Xclang -load -Xclang ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

run(){
	executables=$1
	results=$2
	export OMP_NUM_THREADS=$num_threads
	if [[ $c_type == "diablevc" ]]
	then
		echo -e -n "Disable loop vectorization..." > $result
	else
		echo -e -n "Enable loop vectorization..." > $result
	fi

	echo -e -n "Compile C code using $opt with $OMP_NUM_THREADS threads..." >> $result

	### Repeat running the executables.
	for i in {1..10}
	do
		timeout $TIMEOUT perf stat $executables $parameter >>$result 2>> $result
		#echo "Beginning the $executables with  $parameter" >>$result
	        #start=`date +%s%N`
		#$executables $parameter >> $result
		#end=`date +%s%N`
		#runtime=$((end-start))
		#printf '\nParameter:%s\tExecutionTime:%s\tnanoseconds.\n' $parameter  $runtime >> $result
	done
	### Output the hardware info.
	cat /proc/cpuinfo >> $result
}


##
## Run Polly on the C code
##
compileProgram(){
	c_type=$1
	program=$2
	parameter=$3
	opt=$4
	num_threads=$5
	### Creating a static library ('Util.o') with GCC (http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html)
    	utildir="$PWD/../../../../tests/code"
	### cp "$program/$program.whiley" $utildir/Util.c $utildir/Util.h $workingdir
	cp $utildir/Util.c $utildir/Util.h $PWD
    	#clang -c Util.c -o Util.o ### Compile Util.c to Util.o (object file)
    	#ar -cvq libUtil.a Util.o
    	if [[ $c_type == *"autogenerate"* ]]
	then
		if [[ $c_type == *"copyonly"* ]]
		then
			### Translate Whiley program into copy-eliminated C code 
			./../../../../bin/wyopcl -code -copy "$program.whiley"
		else
			### Translate Whiley program into copy-eliminated + memory deallocated C code 
                        ./../../../../bin/wyopcl -code -copy -dealloc "$program.whiley"
		fi

	fi
   	###read -p "Press [Enter] to continue..."
    	mkdir -p "out"
    	### Compile C code into executables
	case "$opt" in
		"gcc")
			gcc -std=c99 -O3 $program.c Util.c -o "out/$program.$opt.enablevc.out"
			;;
		"clang")
			clang -O3 $program.c Util.c -o "out/$program.$opt.enablevc.out"
			;;
		"polly")
			###'-polly-process-unprofitable' option forces Polly to generate sequential code
			pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
	        		-S -emit-llvm -mllvm -polly-process-unprofitable\
	        		$program.c -o "llvm/$program.$opt.enablevc.ll"
			### Use 'llc' to compile LLVM code into assembly code
    			llc "llvm/$program.$opt.enablevc.ll" -o "assembly/$program.$opt.enablevc.s"
			### Use 'gcc' to compile .s file and link with 'libUtil.a'
    			pollycc "assembly/$program.$opt.enablevc.s" Util.c -o "out/$program.$opt.enablevc.out"

			#pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine\
			#	-mllvm -polly-process-unprofitable $program.c Util.c\
			#	 -o "out/$program.$opt.enablevc.out"
			;;
		"openmp")
			echo "Optimize C code using OpenMP code with $OMP_NUM_THREADS threads..." >> $result
			### '-polly-parallel-force' forces Polly to generate OpenMP code
			#pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine -mllvm -polly-parallel -lgomp\
                        #-mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
			#        $program.c Util.c -o "out/$program.$opt.enablevc.out"
			
			pollycc -O3 -mllvm -polly -mllvm -polly-vectorizer=stripmine -S -emit-llvm\
	        		-mllvm -polly-parallel -mllvm -polly-process-unprofitable -mllvm -polly-parallel-force\
	        		$program.c -o "llvm/$program.$opt.enablevc.ll"
			### Use 'llc' to compile LLVM code into assembly code
                        llc "llvm/$program.$opt.enablevc.ll" -o "assembly/$program.$opt.enablevc.s"
                        ### Use 'gcc' to compile .s file and link with 'libUtil.a'
                        pollycc "assembly/$program.$opt.enablevc.s" Util.c -o "out/$program.$opt.enablevc.out"

			;;
	esac
	###read -p "Press [Enter] to continue..."

	result="$PWD/../../perf/$c_type.$program.$opt.$parameter.$num_threads.enablevc.txt"
	run "./out/$program.$opt.enablevc.out" $result $opt $num_threads "enablevc"
}
#
# Execute benchmarks
#
exec(){
	c_type=$1
	program=$2
	parameter=$3
	cd "$program/impl/$c_type"
	compileProgram $c_type $program $parameter "gcc" 1
	compileProgram $c_type $program $parameter "clang" 1
	compileProgram $c_type $program $parameter "polly" 1
	compileProgram $c_type $program $parameter "openmp" 1
	compileProgram $c_type $program $parameter "openmp" 2
	compileProgram $c_type $program $parameter "openmp" 4
	cd ../../../
}
### Create the folder and/or clean up the files
init(){
	c_type=$1
	program=$2
	mkdir -p "$PWD/$program/perf"
	rm -rf "$PWD/$program/perf/"*.*
	mkdir -p "$PWD/$program/impl/$c_type/out" ## Create 'out' folder
	rm -rf "$PWD/$program/impl/$c_type/out/"*.*
	#read -p "Press [Enter] to continue..."
}
# ### Benchmark Autogenerate GCD
#init autogenerate GCD
#exec autogenerate GCD 1000
#exec autogenerate GCD 10000
#exec autogenerate GCD 20000
#exec autogenerate GCD 30000
#exec autogenerate GCD 40000
#exec autogenerate1 GCD 1000
#exec autogenerate1 GCD 10000
#exec autogenerate1 GCD 20000
#exec autogenerate1 GCD 30000
#exec autogenerate1 GCD 40000
# ### Benchmark Autogenerate CoinGame
#init autogenerate_copyonly CoinGame
#exec autogenerate_copyonly CoinGame 1000
#exec autogenerate_copyonly CoinGame 10000
#exec autogenerate_copyonly CoinGame 20000
#exec autogenerate_copyonly CoinGame 30000
#exec autogenerate_copyonly CoinGame 40000

#init autogenerate_copyfree 1000
#exec autogenerate_copyfree CoinGame 1000
#exec autogenerate_copyfree CoinGame 10000
#exec autogenerate_copyfree CoinGame 20000
#exec autogenerate_copyfree CoinGame 30000
#exec autogenerate_copyfree CoinGame 40000

### Benchmark Autogenerate NQueens
#init autogenerate_copyonly NQueens
#exec autogenerate_copyonly NQueens 1
#exec autogenerate_copyonly NQueens 2
exec autogenerate_copyonly NQueens 3
#exec autogenerate_copyonly NQueens 4
exec autogenerate_copyonly NQueens 5
#exec autogenerate_copyonly NQueens 6
exec autogenerate_copyonly NQueens 7
#exec autogenerate_copyonly NQueens 8
exec autogenerate_copyonly NQueens 9
#exec autogenerate_copyonly NQueens 10
exec autogenerate_copyonly NQueens 11
#exec autogenerate_copyonly NQueens 12
exec autogenerate_copyonly NQueens 13
#exec autogenerate_copyonly NQueens 14
#exec autogenerate_copyonly NQueens 15

#init autogenerate_copyfree NQueens
#exec autogenerate_copyfree NQueens 1
#exec autogenerate_copyfree NQueens 2 
#exec autogenerate_copyfree NQueens 4 
#exec autogenerate_copyfree NQueens 6 
#exec autogenerate_copyfree NQueens 8
#exec autogenerate_copyfree NQueens 10 
#exec autogenerate_copyfree NQueens 12 
#exec autogenerate_copyfree NQueens 14
#exec autogenerate_copyfree NQueens 15

### Benchmark Autogenerate1 and autogenerate2 MatrixMult
# ### Autogenerate1 MatrixMult
# init autogenerate1 MatrixMult
# init autogenerate2 MatrixMult
# exec autogenerate1 MatrixMult 200
# exec autogenerate1 MatrixMult 400
# exec autogenerate1 MatrixMult 600
# exec autogenerate1 MatrixMult 800
# exec autogenerate1 MatrixMult 1000
# exec autogenerate1 MatrixMult 1200
# exec autogenerate1 MatrixMult 1400
# exec autogenerate1 MatrixMult 1600
# exec autogenerate1 MatrixMult 1800
# exec autogenerate1 MatrixMult 2000
# exec autogenerate1 MatrixMult 2200
# exec autogenerate1 MatrixMult 2400
# exec autogenerate1 MatrixMult 2600
# exec autogenerate1 MatrixMult 2800
# exec autogenerate1 MatrixMult 3000
# ### Autogenerate2 MatrixMult
# exec autogenerate2 MatrixMult 200
# exec autogenerate2 MatrixMult 400
# exec autogenerate2 MatrixMult 600
# exec autogenerate2 MatrixMult 800
# exec autogenerate2 MatrixMult 1000
# exec autogenerate2 MatrixMult 1200
# exec autogenerate2 MatrixMult 1400
# exec autogenerate2 MatrixMult 1600
# exec autogenerate2 MatrixMult 1800
# exec autogenerate2 MatrixMult 2000
# exec autogenerate2 MatrixMult 2200
# exec autogenerate2 MatrixMult 2400
# exec autogenerate2 MatrixMult 2600
# exec autogenerate2 MatrixMult 2800
# exec autogenerate2 MatrixMult 3000
