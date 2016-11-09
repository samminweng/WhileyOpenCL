set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set ylabel "Average Execution Time (Second)"
set style line 1 lw 3 ps 0.5 # Set thick lines
set style line 3 lw 3 ps 0.5 # Set thick lines
#set style line 2 lw 3 ps 0.5 # Set thick lines
########Matrix Mult test case
set title "MatrixMult Test Case"
set xlabel "Problem Size"
set xrange [1000:3000]
set yrange [0:46.8]
set term pngcairo
set output "matrixmult.png"
plot "./dat/matrixmult.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "./dat/matrixmult.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 4, \
	 "./dat/matrixmult.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 2, \
	 "./dat/matrixmult.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term x11
unset output

## Reverse test case
set title "Reverse Test Case"
set xlabel "Problem Size (log N)"
set xrange [100000:10000000]
set yrange [0:0.1]
set format x "10^{%T}" ## set power to base 10
set logscale x
set term pngcairo
set output "reverse.png"
plot "./dat/reverse.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 4, \
	 "./dat/reverse.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "./dat/reverse.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 2, \
	 "./dat/reverse.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term x11
unset output

### TicTacToe test case

set title "TicTacToe Test Case"
set xlabel "Problem Size (log N)"
set xrange [1000:100000]
set yrange [0:0.17]
set format x "10^{%T}" ## set power to base 10
set logscale x

set terminal pngcairo
set output "tictactoe.png"
plot "./dat/tictactoe.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "./dat/tictactoe.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 2, \
	 "./dat/tictactoe.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 4, \
	 "./dat/tictactoe.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term x11
unset output


### Merge Sort test case
set title "MergeSort Test Case"
set xlabel "Problem Size (log N)"
set xrange [1000:100000]
set yrange [0:0.065]
set format x "10^{%T}" ## set power to base 10
set logscale x

set terminal pngcairo 
set output "mergesort.png"
plot "./dat/mergesort.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 4, \
	 "./dat/mergesort.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "./dat/mergesort.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 2, \
	 "./dat/mergesort.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term x11
unset output


### Bubble Sort
set title "BubbleSort Test Case"
set xlabel "Problem Size (log N)"
set xrange [1000:100000]
set yrange [0:6.65]
set format x "10^{%T}" ## set power to base 10
set logscale x

set terminal pngcairo 
set output "bubblesort.png"
## Set line style
##set style line 3 lw 2
plot "./dat/bubblesort.dat" using 1:2 title 'Naive' with linespoints ls 1, \
	 "./dat/bubblesort.dat" using 1:3 title 'Naive + De-allocated' with linespoints ls 4, \
	 "./dat/bubblesort.dat" using 1:4 title 'Copy Eliminated' with linespoints ls 2, \
	 "./dat/bubblesort.dat" using 1:5 title 'Copy Eliminated + De-allocated' with linespoints ls 3
set term x11
unset output


