#!/bin/bash
generateInputs(){
    for n in 2 4 5 6 7 8 9 10 25 50 75 100 105 110 115 120 125 150 175 200 225 250 275 300 325 350 375 400
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
