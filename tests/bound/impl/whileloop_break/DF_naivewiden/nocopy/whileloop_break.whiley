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
    int a = find(43, 10) // 'item' variable is uint16_t
    sys.out.println(a)
    assert a == 10
    int b = find(65536, 10) // 'limit' variable is uint32_t because 65536 > uint16_t 
    sys.out.println(b)
    assert b == 10
