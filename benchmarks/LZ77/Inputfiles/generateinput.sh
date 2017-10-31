#!/bin/bash
generateInputs(){
    for n in 2 4 5 10 25 50 75 100 125 150 175 200 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
    do 
	file="medium"$n"x.in"
	cat medium1x.in > $file
	for ((number=1;number < $n;number++)){
		echo $number
		cat medium1x.in >> $file
	}
    done
}

generateInputs
