import whiley.lang.System

/*
 * Implements Euclid's algorithm for finding the greatest common divisor of two numbers
 */
type nat is (int x) where x >= 0

function gcd(nat a, nat b) -> nat:
    if(a == 0):
        return b           
    while(b != 0) where a >= 0:
        if(a > b):
            a = a - b
        else:
            b = b - a
    return a

function gcd_array(int[] data, int n) -> int[]:
    int[] gcds = [0;n*n]
    int sum = 0
    int i = 0
    while i < n:
        int j = 0
        while j < n:
            int a = data[i]
            int b = data[j]
            int g = 0
            //gcds[i*n+j] = gcd(data[i], data[j])
            if(a == 0):
                g = b
            else:
                while(b != 0) where a>=0:
                    if(a > b):
                        a = a - b
                    else:
                        b = b - a
                g = a
            gcds[i*n+j] = gcds[i*n+j] + g
            j = j + 1
        i = i + 1
    return gcds

function init(int n) -> int[]:
    int[] data = [0;n]
    int i = 0    
    while i < n:
        data[i] = data[i] + i
        i = i + 1
    return data

method main(System.Console sys):
    int n = 1000
    int[] data = init(n)
    // int size = |data|, not sure how to translate it into C at the current stage 
    int[] gcds = gcd_array(data, n)
    int sum = 0
    int i = 0
    while i < n:
        int j = 0
        while j < n:
            //sys.out.print_s("Number: ")
            //sys.out.print(data[i])
            //sys.out.print_s(" Number: ")
            //sys.out.print(data[j])
            //sys.out.print_s(" GCD:")
            //sys.out.println(gcds[i*n+j])
            sum = sum + gcds[i*n+j]
            j = j + 1
        i = i + 1
    //assert sum == 235 // Sum of all divisors is 235 
    sys.out.print_s("SUM:")
    sys.out.println(sum)