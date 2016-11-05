# Gnuplot script file for plotting data in file "tictactoe.dat"
reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "TicTacToe Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Total Execution Time (Second)"
set xrange [1000:100000]
set yrange [0:0.17]
set format x "10^{%T}" ## set power to base 10
set logscale x
plot "tictactoe.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "tictactoe.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 4, \
	 "tictactoe.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 2, \
	 "tictactoe.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3

set term eps
set output "tictactoe.eps"
replot
set term x11

set term pngcairo
set output "tictactoe.png"
replot
set term x11