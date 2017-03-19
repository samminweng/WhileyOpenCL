import whiley.lang.System
// Illustrate the use of break statements within loops
// Refer to 'http://whiley.org/2014/05/02/loop-invariants-and-break-statements/'
function find(int[] items, int item) -> (int r)
ensures 0 <= r && r <= |items|:
    int i=0
    while i<|items| where 0<=i:
        if items[i] == item:
            break
        i=i+1
    return i
    
method main(System.Console sys):
    int[] ys = [3,4,7,1,2]
    int i = find(ys, 1)
    sys.out.println(i)

