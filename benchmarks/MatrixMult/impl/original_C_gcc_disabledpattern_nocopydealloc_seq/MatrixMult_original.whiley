import whiley.lang.*
import whiley.io.File

// Initialize a Matrix
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

// Initialize a Matrix and assign each element with its row
function mat_mult(int[] a, int[] b, int[] data, int width, int height) -> (int[] c):
    int i = 0
    while i < height:
        int j = 0
        while j < width:
            int k = 0
            int sub_total = 0
            while k < width:
                // c[i][j] = c[i][j] + a[i][k] * b[k][j]
                sub_total = sub_total + a[i*width+k] * b[k*width+j]
                k = k + 1
            data[i*width+j] = sub_total
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
        // Initialize matrix B
        int[] B = [0;width*height]
        B = init(B, width, height)
        int[] C = [0;width*height]
        C = mat_mult(A, B, C, width, height)
        sys.out.print_s("Matrix C[size-1][size-1] = ")
        sys.out.println(C[(size-1)*size+size-1])
        sys.out.println_s("Pass MatrixMult test case")
