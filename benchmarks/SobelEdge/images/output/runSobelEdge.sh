#!/bin/bash
runSobelEdge(){
    th=$1
    cd "Threshold"$th/
    
    rm *.pbm
    ./../../../../../bin/wyopcl -code -nocopy -dealloc SobelEdge_small.whiley
 
    ## Compile .c to executable
    gcc *.c -o SobelEdge_small.out
    width=64
    ## image size
    for n in 1 2 3 4 5 6 7 8 9 10
    do
	height=$((n*64))
	infile="image"$width"x"$height".pbm"
	outfile="output"$width"x"$height".pbm"
	./SobelEdge_small.out $height ../../input/$infile > $outfile
    done

    cd ../
}
runSobelEdge 500
runSobelEdge 800
runSobelEdge 1100
