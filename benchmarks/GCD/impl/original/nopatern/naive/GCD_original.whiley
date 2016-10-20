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

method main(System.Console sys):
    int|null max = Int.parse(sys.args[0])
    if max != null:
        int n = max
        sys.out.print_s("N = ")
        sys.out.println(n)
        int sum = 0
        int i = 0
        while i < n:
            int j = 0
            while j < n:
                //sys.out.print_s("Number: ")
                //sys.out.print(i)
                //sys.out.print_s(" Number: ")
                //sys.out.print(j)
                //sys.out.print_s(" GCD:")
                //sys.out.println(gcd(i, j))
                sum = sum + gcd(i, j)
                j = j + 1
            i = i + 1
        sys.out.print_s("Sum: ")
        sys.out.println(sum)
        sys.out.println_s("Pass Euclid GCD test case")
        