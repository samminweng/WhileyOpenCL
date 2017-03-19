import whiley.lang.System
// Illustrate the use of break statements within loops
// Refer to 'http://whiley.org/2014/05/02/loop-invariants-and-break-statements/'
function find(int limit, int item) -> (int r):
    int i=0
    while i<limit where 0<=i:
        if i == item:
            break
        i=i+1
    return i
    
method main(System.Console sys):
    int i = find(43, 10)
    sys.out.println(i)

