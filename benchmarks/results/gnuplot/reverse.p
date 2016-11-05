# Gnuplot script file for plotting data in file "reverse.dat"
reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Reverse Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Total Execution Time (Second)"
set xrange [100000:10000000]
set yrange [0:0.1]
set format x "10^{%T}" ## set power to base 10


set logscale x
plot "reverse.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 2, \
	 "reverse.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "reverse.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 4, \
	 "reverse.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
## Output a EPS file
set terminal eps 
set output "reverse.eps"
replot
set term x11
set output
## Output a PNG file
set term pngcairo
set output "reverse.png"
replot
set term x11
set output