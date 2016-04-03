import whiley.lang.*
import whiley.io.File

// ========================================================
// Description
// ========================================================
// This matrix multiplication maps 2D array into 1D array,
// and then multiplies two matrices to produce final matrix
// using 1D array
// 
type nat is (int x) where x >= 0
type Matrix is ({
    int width,
    int height,
    int[] data // data[i*width+j] := data[i][j]
} this)
// ========================================================
// Create and return a Matrix
// ========================================================
function matrix(nat width, nat height, int[] data) -> (Matrix r)
// Input array must match matrix height
requires |data| == width * height:
    return {
        width: width,
        height: height,
        data: data
    }
// ========================================================
// Initialize a Matrix and assign each element with its row 
// ========================================================   
function init(nat width, nat height) -> (Matrix r):
    int[] data = [0;width*height]
    // Fill in Matrix
    int i = 0    
    while i < height:
        int j = 0
        while j < width:
            data[i*width+j] = data[i*width+j] + i
            j = j + 1
        i = i + 1
    return matrix(width, height, data)

//========================================================
// Print out a Matrix 
// ========================================================   
method print_mat(System.Console sys, Matrix a):
    int i = 0
    nat width = a.width
    nat height = a.height
    while i < height:
        int j = 0
        while j < width:
            sys.out.print(a.data[i*width+j])
            sys.out.print_s(" ")
            j = j + 1
        i = i + 1
        sys.out.println_s("")

// ========================================================
// Transpose matrix B and multiplies it with matrix A 
// ========================================================   
function mat_mult(Matrix a, Matrix b) -> (Matrix c)
requires a.width == b.height
ensures c.width == b.width && c.height == a.height:
    nat width = b.width
    nat height = a.height
    int[] data = [0;width*height]
    int[] a_data = a.data
    int[] b_data = b.data
    // Transpose matrix b to matrix 'b_t'
    int[] b_t = [0;width*height]
    int i = 0
    int j = 0
    int k = 0
    i = 0
    while i < height:
        j = 0
        while j < width:
            // b_t[j][i] = b[i][j]
            b_t[j*width+i] = b_data[i*width+j] 
            j = j + 1
        i = i + 1
    // Multiply matrix a and b_t
    i = 0
    while i < height:
        j = 0
        while j < width:
            k = 0
            while k < width:
                // c[i][j] = c[i][j] + a[i][k] * b_t[i][k]
                data[i*width+j] = data[i*width+j] + a_data[i*width+k] * b_t[i*width+k]
                k = k + 1
            j = j + 1
        i = i + 1
    return matrix(width, height, data)
        

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        sys.out.print_s("max = ")
        sys.out.println(max)
        // Initialize matrix A
        Matrix A = init(max, max)
        // Initialize matrix B
        Matrix B = init(max, max)
        // Multiply A and B 
        Matrix C = mat_mult(A, B)
        assert A.data[(max-1)*max+max-1] == max-1
        assert B.data[(max-1)*max+max-1] == max-1
        // N=20, C[19][19] = 3610
        // N=200, C[199][199] = 3960100
        // N=2000, C[1999][1999] = 3996001000
        if max == 2000:
            assert C.data[(max-1)*max+max-1] == 3996001000
        //print_mat(sys, C)
        sys.out.print_s("Matrix C[max-1][max-1] = ")
        sys.out.println(C.data[(max-1)*max+max-1])
        sys.out.println_s("Pass MatrixMult2 test case")