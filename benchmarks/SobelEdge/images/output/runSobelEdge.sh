#!/bin/bash
runSobelEdge(){
    th=$1
    cd "Threshold"$th/impl
    ./../../../../../../bin/wyopcl -code -nocopy -dealloc SobelEdge_original.whiley
 
    ## Compile .c to executable
    gcc *.c -o SobelEdge_original.out
    ## image size
    for size in 64 128 256 2048
    do
	infile="image"$size"x"$size".pbm"
	outfile="image"$size"x"$size".pbm"
	./SobelEdge_original.out $size ../../../input/$infile > ../$outfile
    done

    cd ../..
}
runSobelEdge 64
runSobelEdge 128
runSobelEdge 200
