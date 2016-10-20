# Gnuplot script file for plotting data in file "matrixmult.dat"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "MatrixMult Test Case"
set xlabel "Problem Size"
set ylabel "Total Execution Time (Second)"
set xrange [1000:3000]
plot "matrixmult.dat" using 1:2 title 'Naive' with linespoints, \
	 "matrixmult.dat" using 1:3 title 'Naive + De-allocated' with linespoints, \
	 "matrixmult.dat" using 1:4 title 'Copy Reduced' with linespoints, \
	 "matrixmult.dat" using 1:5 title 'Copy Reduced + De-allocated' with linespoints
set term png
set output "matrixmult.png"
replot
set term x11