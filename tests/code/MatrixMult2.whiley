import whiley.lang.*
import whiley.io.File

// ========================================================
// Description
// ========================================================
// This matrix multiplication converts 2D array into 1D array
// by using 'row-major', i.e. 
//
constant N is 20
type nat is (int x) where x >= 0
type Matrix is ({
    int width,
    int height,
    int[] data // data[i*width+j] := data[i][j]
} this)
// ========================================================
// Create and return a Matrix
// ========================================================
function matrix(nat width, nat height, int[] data) -> (Matrix r):
    return {
        width: width,
        height: height,
        data: data
    }
// ========================================================
// Initialize a Matrix of given row and cols
// ========================================================   
function init() -> (Matrix r):
    int[] data = [0;N*N]
    // Fill in Matrix
    int i = 0    
    while i < N:
        int j = 0
        while j < N:
            data[i*N+j] = data[i*N+j] + i
            j = j + 1
        i = i + 1
    return matrix(N, N, data)
        

method main(System.Console sys):
    Matrix A = init()
    sys.out.print(A.data[N])
    sys.out.print_s("Pass MatrixMult test case")