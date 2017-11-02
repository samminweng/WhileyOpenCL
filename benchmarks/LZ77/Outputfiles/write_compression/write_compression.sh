#!/bin/bash
write_compression(){
    rm -f ../Outputfiles/*.dat
    
    ## Compile .c to executable
    gcc *.c -o LZ77_compress_write.out
    for n in 1 5 10 25 50 75 100 125 150 175 200 10000 20000 30000 40000 50000 60000 70000 80000 90000 100000
    do
	infile="medium"$n"x.in"
	outfile="medium"$n"x.dat"
	./LZ77_compress_write.out ../../Inputfiles/$infile ../../Outputfiles/$outfile
    done
}
write_compression
