import whiley.lang.*
import whiley.io.File

/*
 * Implements Euclid's algorithm for finding the greatest common divisor of two numbers
 */
type nat is (int x) where x >= 0

// Euclid's algorithm
function gcd(int a, int b) -> int:
    if(a == 0):
        return b           
    while(b != 0) where a >= 0:
        if(a > b):
            a = a - b
        else:
            b = b - a
    return a
// The constraint of this function is input data array is in acending order  
// its value is the array index, e.g. data = [0, 1, 2, 3, 4]
function gcd_cached(int a, int b, int n, int[] gcds) -> int:
    if(a == 0):
        return b
    else:
        if(b == 0):
            return a
        else:
            // Use the cached GCD results
            if(a > b):// a = 3 b =1
                a = a - b
            else:
                b = b - a
            // use cached gcd (a = 2 b = 1)  
            return gcds[a*n+b]  

method main(System.Console sys):
    int n = 10
    sys.out.print_s("N = ")
    sys.out.println(n)
    int[] gcds = [0;n*n] 
    int i = 0
    while i < n:
        int j = 0
        while j < n:
            gcds[i*n+j] = gcd_cached(i, j, n, gcds)
            // Check the cached gcd value
            assert gcds[i*n+j] == gcd(i, j)
            sys.out.print_s("Number: ")
            sys.out.print(i)
            sys.out.print_s(" Number: ")
            sys.out.print(j)
            sys.out.print_s(" GCD:")
            sys.out.println(gcds[i*n+j])
            j = j + 1
        i = i + 1
   
        