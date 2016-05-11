import whiley.lang.*
import whiley.io.File

// ========================================================
// Description
// ========================================================
// This matrix multiplication maps 2D array into 1D array,
// and then multiplies two matrices to produce final matrix
// using 1D array
// 
//constant N is 2000
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
// Initialize a Matrix and assign each element with its row 
// ========================================================   
function mat_mult(Matrix a, Matrix b) -> (Matrix c)
requires a.width == b.height
ensures c.width == b.width && c.height == a.height:
    nat width = b.width
    nat height = a.height
    int[] data = [0;width*height]
    int[] a_data = a.data
    int[] b_data = b.data
    int i = 0
    while i < height:
        int j = 0
        while j < width:
            int k = 0
            while k < width:
                // c[i][j] = c[i][j] + a[i][k] * b[k][j]
                data[i*width+j] = data[i*width+j] + a_data[i*width+k] * b_data[k*width+j]
                k = k + 1
            j = j + 1
        i = i + 1
    return matrix(width, height, data)
        

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int size = max
        sys.out.print_s("size = ")
        sys.out.println(size)
        // Initialize matrix A
        Matrix A = init(size, size)
        // Initialize matrix B
        Matrix B = init(size, size)
        // Multiply A and B 
        Matrix C = mat_mult(A, B)
        assert A.data[(size-1)*size+size-1] == size-1
        assert B.data[(size-1)*size+size-1] == size-1
        // N=20, C[19][19] = 3610
        // N=200, C[199][199] = 3960100
        // N=2000, C[1999][1999] = 3996001000
        if size == 2000:
            assert C.data[(size-1)*size+size-1] == 3996001000
        //print_mat(sys, C)
        sys.out.print_s("Matrix C[size-1][size-1] = ")
        sys.out.println(C.data[(size-1)*size+size-1])
        sys.out.println_s("Pass MatrixMult test case")