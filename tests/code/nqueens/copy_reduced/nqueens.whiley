import whiley.lang.*
import whiley.io.File

// N-Queen problem place n queens on a n X n board so that 
// no two queens are on the same row, column or diagonal.
// The position
type POS is ({int r,int c} this)

// Store 
type NQueen is ({
    // Total number of solutions
    int num_solutions,
    // The positions of placed queens
    POS[] queens
} this)

// Create a 'NQueen' structure  
function nqueen(int num_solutions, POS[] queens) -> (NQueen nq):
    return {
        num_solutions: num_solutions,
        queens: queens
    }
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
// Place the n-th queen on 'dim' X 'dim' board
function run(NQueen nq, int n, int dim) -> NQueen 
// The number of allocated queens is at most the number of queens
requires n <= |nq.queens|
// Dim matches the size of the array
requires dim == |nq.queens|:
    if dim == n:
        // Reaching this program point means the solution has no conflicts
        // in all cols and rows. Thus, it is counted as one feasible solution
        nq.num_solutions = nq.num_solutions + 1
        return nq
    else:
        // Find the feasible position that has no conflicts
        int col = 0
        while col < dim where n < |nq.queens| && dim == |nq.queens|:
            bool isSolution = true
            // Check if the n-th queen has any conflict with any existing queen' position
            int i = 0
            while i < n where n < |nq.queens| && i >= 0 && dim == |nq.queens|:
                // Get the placed queen's position 
                POS p = nq.queens[i]
                isSolution = isSolution && !conflict(p,n,col)
                i = i + 1
            // The position has no conflicts
            if isSolution == true:
                // Place the n-th queen on 'n' row and 'col' column  
                nq.queens[n] = {r:n, c:col}
                // Find the position for next ('n+1'-th) queen 
                nq = run(nq, n+1, dim)
            col = col + 1
        return nq

method main(System.Console sys):
    int n = 10
    POS[] queens = [{r:0, c:0}; n]
    int num_solutions = 0
    NQueen nq = nqueen(num_solutions, queens)
    nq = run(nq, 0, n)
    // Given n queens on an n × n board, the total number of solutions is listed as below link.
    // https://en.wikipedia.org/wiki/Eight_queens_puzzle
    assert nq.num_solutions == 724
    sys.out.println_s("N-Queen Problem on a N X N Board.")
    sys.out.print_s("N = ")
    sys.out.println(n)
    sys.out.print_s("Found ")
    sys.out.print(nq.num_solutions)
    sys.out.println_s(" solutions.")

/*function run(POS[] queens, int n, int dim) -> int 
// The number of allocated queens is at most the number of queens
requires n <= |queens|
// Dim matches the size of the array
requires dim == |queens|:
    //
    if dim == n:
        return 1 // Return one solution
    else:
        //POS[][] solutions = [[(0,0);0];0]
        int num_solutions = 0 // Count the total number of solutions
        int col = 0
        while col < dim where n < |queens| && dim == |queens|:
            bool isSolution = true
            int i = 0
            while i < n where n < |queens| && i >= 0 && dim == |queens|:
                POS p = queens[i]
                isSolution = isSolution && !conflict(p,n,col)
                //if conflict(p,n,col):
                //   solution = false
                //    break
                i = i + 1
            if isSolution == true:
                queens[n] = {r:n, c:col}
                num_solutions = num_solutions + run(queens, n+1, dim) 
                //solutions = append(solutions,run(queens,n+1,dim))
            col = col + 1
        return num_solutions


method main(System.Console sys):
    int n = 10
    POS[] queens = [{r:0, c:0}; n]
    int num_solutions = run(queens, 0, n)
    // Given n queens on an n × n board, the total number of solutions is listed as below link.
    // https://en.wikipedia.org/wiki/Eight_queens_puzzle
    assert num_solutions == 724
    sys.out.println_s("N-Queen Problem on a N X N Board.")
    sys.out.print_s("N = ")
    sys.out.println(n)
    sys.out.print_s("Found ")
    sys.out.print(num_solutions)
    sys.out.println_s(" solutions.")
*/