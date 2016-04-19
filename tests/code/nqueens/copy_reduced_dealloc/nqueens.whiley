import whiley.lang.*
import whiley.io.File

// N-Queen problem place n queens on a n X n board so that 
// no two queens are on the same row, column or diagonal.
// 
type POS is ({int r,int c} this)


function conflict(POS p, int row, int col) -> bool:
    int r = p.r
    int c = p.c
    if r == row || c == col:
        return true
    int colDiff = Math.abs(c - col)
    int rowDiff = Math.abs(r - row)
    return colDiff == rowDiff


function run(POS[] queens, int n, int dim) -> int 
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
            bool solution = true
            int i = 0
            while i < n where n < |queens| && i >= 0 && dim == |queens|:
                POS p = queens[i]
                if conflict(p,n,col):
                    solution = false
                    break
                i = i + 1
            if solution == true:
                queens[n] = {r:n, c:col}
                num_solutions = num_solutions + run(queens, n+1, dim) 
                //solutions = append(solutions,run(queens,n+1,dim))
            col = col + 1
        return num_solutions

method main(System.Console sys):
    int n = 10
    POS[] init = [{r:0, c:0}; n]
    int num_solutions = run(init, 0, n)
    // Given n queens on an n × n board, the total number of solutions is listed as below link.
    // https://en.wikipedia.org/wiki/Eight_queens_puzzle
    assert num_solutions == 724
    sys.out.println_s("N-Queen Problem on a N X N Board.")
    sys.out.print_s("N = ")
    sys.out.println(n)
    sys.out.print_s("Found ")
    sys.out.print(num_solutions)
    sys.out.println_s(" solutions.")