# Gnuplot script file for plotting data in file "bubblesort.dat"
reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "BubbleSort Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Total Execution Time (Second)"
set xrange [1000:100000]
set yrange [0:6.65]
set logscale x
plot "bubblesort.dat" using 1:2 title 'Naive' with linespoints, \
	 "bubblesort.dat" using 1:3 title 'Naive + De-allocated' with linespoints, \
	 "bubblesort.dat" using 1:4 title 'Copy Reduced' with linespoints, \
	 "bubblesort.dat" using 1:5 title 'Copy Reduced + De-allocated' with linespoints
set term png
set output "bubblesort.png"
replot
set term x11