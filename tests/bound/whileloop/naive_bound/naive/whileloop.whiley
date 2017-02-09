import whiley.lang.System
// While-loop with increment
function f(int limit) -> int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit where i >=0:
        sum = sum + i
        i=i+1
    return sum

// // While-loop with decrement
// function f2(int limit) -> int:
//     int i = limit-1
//     int sum = 0
//     while i >=0:
//         sum = sum + i
//         i = i - 1
//     return sum
    
method main(System.Console sys):
    int a = f(50000)
    sys.out.println(a)
    assert a == 1249975000

