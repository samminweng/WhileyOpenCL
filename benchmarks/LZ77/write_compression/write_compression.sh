#!/bin/bash
write_compression(){
    rm ../Outputfiles/*.dat
    
    ## Compile .c to executable
    gcc *.c -o LZ77_compress_write.out
    for n in 1 2 4 5 10 25 50 75 100 125 150 175 200 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
    do
	infile="medium"$n"x.in"
	outfile="medium"$n"x.dat"
	./LZ77_compress_write.out ../Inputfiles/$infile ../Outputfiles/$outfile
    done
}
write_compression
