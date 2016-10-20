import whiley.lang.*
import whiley.io.File

// N-Queen problem place n queens on a n X n board so that 
// no two queens are on the same row, column or diagonal.
// The position
type POS is ({int r,int c} this)

// Check if the 'p' position conlicts (attacks) the position of 'row' and 'col'
// Return true if 'p' position shares the same 'row', 'col' and 'diagonal'. 
function conflict(POS p, int row, int col) -> bool:
    int r = p.r
    int c = p.c
    if r == row || c == col:
        return true
    int colDiff = Math.abs(c - col)
    int rowDiff = Math.abs(r - row)
    return colDiff == rowDiff
// Find the solutions (Return the number of solutions (an integer))
function run(POS[] queens, int n, int dim) -> int 
// The number of allocated queens is at most the number of queens
requires n <= |queens|
// Dim matches the size of the array
requires dim == |queens|:
    //
    if dim == n:
        return 1 // Return one solution
    else:
        // Count the total number of solutions
        int num_solutions = 0 
        int col = 0
        while col < dim where n < |queens| && dim == |queens|:
            bool isSolution = true
            int i = 0
            while i < n where n < |queens| && i >= 0 && dim == |queens|:
                POS p = queens[i]
                isSolution = isSolution && !conflict(p,n,col)
                i = i + 1
            if isSolution == true:
                queens[n] = {r:n, c:col}
                num_solutions = num_solutions + run(queens, n+1, dim)
            col = col + 1
        return num_solutions

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int n = max
        POS[] queens = [{r:0, c:0}; n]
        int num_solutions = run(queens, 0, n)
        sys.out.println_s("N-Queen Problem on a N X N Board.")
        sys.out.print_s("N = ")
        sys.out.println(n)
        sys.out.print_s("Found ")
        sys.out.print(num_solutions)
        sys.out.println_s(" solutions.")
