import whiley.lang.System

function P1(int limit) => int
requires limit <= 1000000:
    int i=limit-1
    int sum=0
    while i>0:
        sum = sum + i
        i=i-1
    return sum
    
function P2(int limit) => int
requires limit <= 1000000:
    int i=limit-1
    int sum=0
    while i>=0:
        sum = sum + i
        i=i-1
    return sum

function P3(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit:
        sum = sum + i
        i=i+1
    return sum

function P4(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<=limit:
        sum = sum + i
        i=i+1
    return sum

method main(System.Console sys):
    sys.out.println("P1 Loop Sum="++P1(5))
    sys.out.println("P2 Loop Sum="++P2(5))
    sys.out.println("P3 Loop Sum="++P3(5))
    sys.out.println("P4 Loop Sum="++P4(5))