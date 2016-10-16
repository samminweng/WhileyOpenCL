import whiley.lang.*
import whiley.io.File

// Author: David J. Pearce

// ========================================================
// Description
// ========================================================

// This is a very naive implementation of matrix multiplication.  It does
// not perform any optimisations, and does not represent matrices in any
// special manner (e.g. sparse representations, etc).
//
// In the future, it would be interesting to consider chain
// multiplication problem:
//
// http://en.wikipedia.org/wiki/Matrix_chain_multiplication
//

// ========================================================
// Benchmark Code
// ========================================================

type nat is (int x) where x >= 0

type Matrix is ({
    int width,
    int height,
    int[][] data
} this) where (|this.data| == this.height && no { i in 0..this.height | |this.data[i]| != this.width })

function matrix(nat width, nat height, int[][] data) -> (Matrix r)
// Input array must match matrix height
requires |data| == height
// Elements of input array must match matrix width
requires no { i in 0..height | |data[i]| != width }
//
ensures r.width == width && r.height == height && r.data == data:
    //
    return {
        width: width,
        height: height,
        data: data
    }

function multiply(Matrix A, Matrix B) -> (Matrix C)
// Must be possible to multiply matrices
requires A.width == B.height
// Specify dimensions of result
ensures C.width == B.width && C.height == A.height:
    //
    int[][] C_data = [[0;B.width];A.height]
    nat i = 0
    //
    // NOTE: the following loops can be more elegantly written using
    // "for" statements.  However, for the moment I use "while"
    // statements as these work better with verification.
    //
    while i < A.height:
        nat j = 0
        while j < B.width:
            int r = 0
            nat k = 0
            while k < A.width:
                r = r + (A.data[i][k] * B.data[k][j])
                k = k + 1
            C_data[i][j] = r
            j = j + 1
        i = i + 1
    //
    return matrix(B.width,A.height,C_data)
// ========================================================
// Print a matrix
// ========================================================
method printMat(System.Console sys, Matrix A):
    int i = 0
    while i < A.height:
        int j = 0
        while j < A.width:
            sys.out.print(A.data[i][j])
            sys.out.print_s(" ")
            j = j + 1
        i = i + 1
        sys.out.println_s("")

// ========================================================
// Generate a Matrix with given row and cols
// ========================================================   
function init(nat height, nat width) -> (Matrix r):
    int[][] rows = [[0;width];height]
    // Fill in Matrix
    int i = 0    
    while i < height:
        int j = 0
        while j < width:
            rows[i][j] = i
            j = j + 1
        i = i + 1
    return matrix(width,height,rows)
// ========================================================
// Main
// ========================================================
method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int size = max
        sys.out.print_s("size = ")
        sys.out.println(size)
        Matrix A = init(size, size)
        Matrix B = init(size, size)
        Matrix C = multiply(A,B)
        sys.out.print_s("Matrix C[size-1][size-1] = ")
        sys.out.println(C.data[size-1][size-1])
        sys.out.println_s("Pass MatrixMult test case")
