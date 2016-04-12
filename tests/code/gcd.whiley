import whiley.lang.System

/*
 * Implements Euclid's algorithm for finding the greatest common divisor of two numbers
 */
type nat is (int x) where x >= 0

function gcd(nat a, nat b) -> nat:
    if(a == 0):
        return b		   
    while(b != 0) where a > 0:
        if(a > b):
            a = a - b
        else:
            b = b - a
    return a

function init(int n) -> int[]:
    int[] data = [0;n]
    int i = 0    
    while i < n:
        data[i] = data[i] + i
        i = i + 1
    return data

method main(System.Console sys):
    int size = 5
    int[] data = init(size)
    // int size = |data|, not sure how to translate it into C at the current stage 
    int i = 0
    while i < size:
        int j = i+1
        while j < size:
            sys.out.print_s("Number: ")
            sys.out.print(data[i])
            sys.out.print_s(" Number: ")
            sys.out.print(data[j])
            sys.out.print_s(" GCD:")
            // Inline 'gcd' function to form a nested loop
            int a = data[i]
            int b = data[j]
            int gcd = 0
            if(a == 0):
                gcd = b
            else:
                while(b != 0) where a >= 0:
                    if(a > b):
                        a = a - b
                    else:
                        b = b - a
                gcd = a
            sys.out.println(gcd)
            j = j + 1
        i = i + 1