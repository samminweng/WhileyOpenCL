#!/bin/bash
generateInputs_medium(){
	multiply=$1
    ### Use medium1x as a base file to produce multiple-sized medium files
	file="medium"$multiply"x.in"
	for ((number=1;number <=$multiply;number++)){
		echo $number
		cat medium1x.in >> $file
	}
}

generateInputs_large(){
    ### Generate 10,000x file
	file="medium10000x.in"
	for ((number=1;number <=10000;number++)){
		echo $number
		cat medium1x.in >> $file
	}
    ### Use 10,000x file to produce 20,000x 30,000x 40,000x ....
    for n in 2 3 4 5 6 7 8 9 10
    do
    mag=$(( 10000*n ))
	file="medium"$mag"x.in"
	for ((number=1;number <=$n;number++)){
		echo $number
		cat medium10000x.in >> $file
	}
    done
}

generateInputs_medium 72
#generateInputs_large
