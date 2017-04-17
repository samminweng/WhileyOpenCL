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
//type Matrix is ({
//    int width,
//    int height,
//    int[] data // data[i*width+j] := data[i][j]
//} this)
// ========================================================
// Create and return a Matrix
// ========================================================
//function matrix(nat width, nat height, int[] data) -> (Matrix r)
// Input array must match matrix height
//requires |data| == width * height:
//    return {
//        width: width,
//        height: height,
//        data: data
//    }
// ========================================================
// Initialize a Matrix and assign each element with its row
// ========================================================
function init(int[] data, int width, int height) -> (int[] r):
    // Fill in Matrix
    int i = 0
    while i < height:
        int j = 0
        while j < width:
            data[i*width+j] = i
            j = j + 1
        i = i + 1
    return data

//========================================================
// Print out a Matrix
// ========================================================
method print_mat(System.Console sys, int[] a, int width, int height):
    int i = 0
    while i < height:
        int j = 0
        while j < width:
            sys.out.print(a[i*width+j])
            sys.out.print_s(" ")
            j = j + 1
        i = i + 1
        sys.out.println_s("")

// ========================================================
// Initialize a Matrix and assign each element with its row
// ========================================================
function mat_mult(int[] a, int[] b, int[] data, int width, int height) -> (int[] c):
    int i = 0
    while i < height:
        int j = 0
        while j < width:
            int k = 0
            while k < width:
                // c[i][j] = c[i][j] + a[i][k] * b[k][j]
                data[i*width+j] = a[i*width+k] * b[k*width+j]
                k = k + 1
            j = j + 1
        i = i + 1
    return data

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int size = max
        int width = size
        int height = size
        sys.out.print_s("size = ")
        sys.out.println(size)
        // Initialize matrix A
        int[] A = [0;width*height]
        A = init(A, width, height)
        //assert A.data[(size-1)*size+size-1] == size-1
        // Initialize matrix B
        int[] B = [0;width*height]
        B = init(B, width, height)
        // Initialize matrix C
         // Multiply A and B
        int[] C = [0;width*height]
        C = mat_mult(A, B, C, width, height)
        //assert B.data[(size-1)*size+size-1] == size-1
        // N=20, C[19][19] = 3610
        // N=200, C[199][199] = 3960100
        // N=2000, C[1999][1999] = 3996001000
        //if size == 2000:
        //    assert C.data[(size-1)*size+size-1] == 3996001000
        //print_mat(sys, C)
        sys.out.print_s("Matrix C[size-1][size-1] = ")
        sys.out.println(C[(size-1)*size+size-1])
        sys.out.println_s("Pass MatrixMult test case")
