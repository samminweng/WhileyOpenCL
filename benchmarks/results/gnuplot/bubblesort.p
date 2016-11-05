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
set format x "10^{%T}" ## set power to base 10
set logscale x
## Set line style
##set style line 3 lw 2
plot "bubblesort.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "bubblesort.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 2, \
	 "bubblesort.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 4, \
	 "bubblesort.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term eps
set output "bubblesort.eps"
replot
set term x11

set term pngcairo
set output "bubblesort.png"
replot
set term x11