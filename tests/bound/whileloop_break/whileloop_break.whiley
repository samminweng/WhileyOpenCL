import whiley.lang.System
// Illustrate the use of break statements within loops
// Refer to 'http://whiley.org/2014/05/02/loop-invariants-and-break-statements/'
function find(int limit, int item) -> int:
    int r=0
    while r<limit where 0<=r:
        if r == item:
            break
        r=r+1
    return r
    
method main(System.Console sys):
    int r = find(43, 10)
    sys.out.println(r)

