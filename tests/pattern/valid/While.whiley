import whiley.lang.System

function f1(int limit) => int
requires limit <= 1000000:
    int i=limit-1
    int sum=0
    while 0<i:
        sum = sum + i
        i=i-1
    return sum
    
function f2(int limit) => int
requires limit <= 1000000:
    int i=limit-1
    int sum=0
    while i>=0:
        sum = sum + i
        i=i-1
    return sum

function f3(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit:
        sum = sum + i
        i=i+1
    return sum

function f4(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<=limit:
        sum = sum + i
        i=i+1
    return sum

method main(System.Console sys):
    sys.out.println("f1 Loop Sum="++f1(5))
    sys.out.println("f2 Loop Sum="++f2(5))
    sys.out.println("f3 Loop Sum="++f3(5))
    sys.out.println("f4 Loop Sum="++f4(5))