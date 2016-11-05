# Gnuplot script file for plotting data in file "matrixmult.dat"
reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "MatrixMult Test Case"
set xlabel "Problem Size"
set ylabel "Total Execution Time (Second)"
set xrange [1000:3000]
set yrange [0:46.8]
plot "matrixmult.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "matrixmult.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 2, \
	 "matrixmult.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 4, \
	 "matrixmult.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term eps
set output "matrixmult.eps"
replot
set term x11

set term pngcairo
set output "matrixmult.png"
replot
set term x11