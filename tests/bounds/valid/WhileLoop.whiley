import whiley.lang.System

function f(int limit) -> int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit where i >=0:
        sum = sum + i
        i=i+1
    return sum
    
method main(System.Console sys):
    sys.out.println(f(5))    
    //sys.out.println(f(50000))