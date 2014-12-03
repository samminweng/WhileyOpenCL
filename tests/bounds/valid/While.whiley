import whiley.lang.System

function f(int limit) => int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit:
        sum = sum + i
        i=i+1
    return sum

method main(System.Console sys):
    sys.out.println("Sum="++f(5))
