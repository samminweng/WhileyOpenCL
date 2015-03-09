import whiley.lang.System

function f(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit:
        sum = sum + i
        i=i+1
    return sum
    
function f2(int limit) => int
requires limit <= 1000000:
    int i=limit
    int sum=0
    while i>=0:
        sum = sum + i
        i=i-1
    return sum   
    

method main(System.Console sys):
    //sys.out.println("Sum="++f(5))    
    //sys.out.println("Sum="++f(50000))
    sys.out.println("Sum="++f2(5))
    sys.out.println("Sum="++f2(50000))
