#!/bin/bash

# Repeat terminate the process of benchmarks
for i in {1..100}
do
	# Stop the process
	while killall -9 java
	do
		# Wait for one second
		sleep 0.5
	done
done