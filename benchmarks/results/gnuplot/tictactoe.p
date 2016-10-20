# Gnuplot script file for plotting data in file "force.dat"
# This file is called   force.p
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "TicTacToe Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Total Execution Time (Second)"
set xrange [1000:100000]
set xrange [0:0.17]
set logscale x
plot "tictactoe.dat" using 1:2 title 'Naive' with linespoints, \
	 "tictactoe.dat" using 1:3 title 'Naive + De-allocated' with linespoints, \
	 "tictactoe.dat" using 1:4 title 'Copy Reduced' with linespoints, \
	 "tictactoe.dat" using 1:5 title 'Copy Reduced + De-allocated' with linespoints
set term png
set output "tictactoe.png"
replot
set term x11