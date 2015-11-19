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

type Matrix is {
    int width,
    int height,
    int[][] data
} where |data| == height && no { i in 0..height | |data[i]| != width }

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
// Main
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
function genMatrix(nat height, nat width) -> (Matrix r):
    int[][] rows = [[0;width];height]
    // Fill in Matrix
    int i = 0    
    while i < height:
        int j = 0
        while j < width:
            rows[i][j] = 1
            j = j + 1
        i = i + 1
    return matrix(width,height,rows)

method main(System.Console sys):
    int max = 10
    Matrix A = genMatrix(max, max)
    Matrix B = genMatrix(max, max)
    Matrix C = multiply(A,B)
    assert C.data[0][0] ==  max
    assert C.width == max
    assert C.height == max
    sys.out.println(C.data[0][0])
    sys.out.print_s("Pass MatrixMult test case")