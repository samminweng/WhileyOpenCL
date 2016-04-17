import whiley.lang.*
import whiley.io.File

/*
 * Implements Euclid's algorithm for finding the greatest common divisor of two numbers
 */
type nat is (int x) where x >= 0
// Euclid's algorithm
function gcd(nat a, nat b) -> nat:
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
function gcd_cached(int n) -> int[]:
    int[] gcds = [0;n*n]
    int i = 0
    while i < n:
        int j = 0
        while j < n:
            int a = i
            int b = j
            if(a == 0):
                gcds[i*n+j] = b
            else:
                if(b == 0):
                    gcds[i*n+j] = a
                else:
                    // Use the cached GCD results
                    if(a > b):// a = 3 b =1
                        a = a - b
                    else:
                        b = b - a
                    gcds[i*n+j] = gcds[a*n+b]
            j = j + 1
        i = i + 1
    return gcds

/*function init(int n) -> int[]:
    int[] data = [0;n]
    int i = 0    
    while i < n:
        data[i] = data[i] + i
        i = i + 1
    return data
*/
method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int n = max
        sys.out.print_s("N = ")
        sys.out.println(n)
        // int size = |data|, not sure how to translate it into C at the current stage 
        int[] gcds = gcd_cached(n)
        // Verify the results of cached gcd
        int i = 0
        while i < n:
            int j = 0
            while j < n:
                sys.out.print_s("Number: ")
                sys.out.print(i)
                sys.out.print_s(" Number: ")
                sys.out.print(j)
                sys.out.print_s(" GCD:")
                sys.out.println(gcds[i*n+j])
                // Check the cached gcd value
                assert gcds[i*n+j] == gcd(i, j)
                j = j + 1
            i = i + 1 
        