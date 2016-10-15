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
    int a = f(5)
    sys.out.println(a)
    // int b = f2(5)
    // sys.out.println(b)
    // assert a == b
    // int c = f(65537)// 2^16 (65536)
    // sys.out.println(c)
    // int d = f2(65537)
    // sys.out.println(d)
    // assert c == d


