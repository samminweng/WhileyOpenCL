import whiley.lang.*
import whiley.io.File

// ========================================================
// Description
// ========================================================
// This matrix multiplication converts 2D array into 1D array
// by using 'row-major', i.e. 
//
constant N is 2000
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
// Initialize a Matrix and assign each element with its row 
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

//========================================================
// Print out a Matrix 
// ========================================================   
/*method print_mat(System.Console sys, Matrix a):
    int i = 0
    while i < N:
        int j = 0
        while j < N:
            sys.out.print(a.data[i*N+j])
            sys.out.print_s(" ")
            j = j + 1
        i = i + 1
        sys.out.println_s("")
*/
// ========================================================
// Initialize a Matrix and assign each element with its row 
// ========================================================   
function mat_mult(Matrix a, Matrix b) -> (Matrix r):
    int[] data = [0;N*N]
    int[] a_data = a.data
    int[] b_data = b.data
    int i = 0
    while i < N:
        int j = 0
        while j < N:
            int k = 0
            while k < N:
                // c[i][j] = c[i][j] + a[i][k] * b[k][j]
                data[i*N+j] = data[i*N+j] + a_data[i*N+k] * b_data[k*N+j]
                k = k + 1
            j = j + 1
        i = i + 1
    return matrix(N, N, data)
        

method main(System.Console sys):
    // Initialize matrix A
    Matrix A = init()
    sys.out.print_s("Matrix A[N] = ")
    sys.out.println(A.data[N])
    //print_mat(sys, A)
    // Initialize matrix B
    Matrix B = init()
    sys.out.print_s("Matrix B[N] = ")
    sys.out.println(B.data[N])
    //print_mat(sys, B)
    // Multiply A and B 
    Matrix C = mat_mult(A, B)
    int[] data = C.data
    sys.out.print_s("Matrix C[N] = ")
    sys.out.println(data[N])
    sys.out.println_s("Pass MatrixMult test case")