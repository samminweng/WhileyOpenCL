reset
set grid                               # Add a grid
set autoscale                          # scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set style line 1 pt 6 lw 4 ps 3 pi -1 # Set thick lines
set style line 2 pt 2 lw 4 ps 3 pi -1 # Set thick lines
set style line 3 pt 5 lw 4 ps 3 pi -1 # Set thick lines
set style line 4 pt 9 lw 4 ps 3 pi -1 # Set thick lines
set style line 5 pt 7 lw 4 ps 3 pi -1 # Set thick lines
set style line 6 pt 1 lw 4 ps 3 pi -1 lt rgb "cyan" # Set thick lines

### Execution Time
set ytics auto
set title "MergeSort Test Case"
set xlabel "Problem Size (log N)"
set ylabel "Average Execution Time (Second)"
set xrange [1000:100000000]
set yrange [*:*]
set format x "10^{%T}" 
set logscale x ## set power to base 10
set key left top font 'Helvetica,24' ## Set key on left top corner
## Output a eps
set terminal postscript eps enhanced monochrome dashed font 'Helvetica,24'
set output './eps/exectime.eps'
plot "./dat/exectime.dat" using 1:3 title 'Cilk(1 Thread)' with linespoints ls 2, \
	 "./dat/exectime.dat" using 1:2 title 'Seq' with linespoints ls 1, \
	 "./dat/exectime.dat" using 1:4 title 'Cilk(2 Thread)' with linespoints ls 3, \
	 "./dat/exectime.dat" using 1:5 title 'Cilk(4 Thread)' with linespoints ls 4, \
	 "./dat/exectime.dat" using 1:6 title 'Cilk(8 Thread)' with linespoints ls 5

set term x11
unset output

### Relative Speedup
unset logscale x
unset format x
set xtics auto
set ytics auto
set title "MergeSort Test Case"
set xlabel "Threads"
set ylabel "Relative Speedup (vs. 1 thread)"
set xrange [1:8]
set yrange [0:4]
set ytics (1, 2, 3, 4)
set key left top Left font 'Helvetica,24' ## Set key on left top corner
## Output a eps
set terminal postscript eps enhanced monochrome dashed font 'Helvetica,24'
set output './eps/speedup.eps'
plot "./dat/speedup.dat" using 1:7 title 'ProblemSize(10^{8})' with linespoints ls 3, \
	 "./dat/speedup.dat" using 1:5 title 'ProblemSize(10^{6})' with linespoints ls 2, \
	 "./dat/speedup.dat" using 1:3 title 'ProblemSize(10^{4})' with linespoints ls 1, \

set term x11
unset output
