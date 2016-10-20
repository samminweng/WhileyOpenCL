# Gnuplot script file for plotting data in file "mergesort.dat"
reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "MergeSort Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Total Execution Time (Second)"
set xrange [1000:100000]
set yrange [0:0.065]
set logscale x
plot "mergesort.dat" using 1:3 title 'Naive + De-allocated' with linespoints, \
	 "mergesort.dat" using 1:2 title 'Naive' with linespoints, \
	 "mergesort.dat" using 1:4 title 'Copy Reduced' with linespoints, \
	 "mergesort.dat" using 1:5 title 'Copy Reduced + De-allocated' with linespoints
set term png
set output "mergesort.png"
replot
set term x11