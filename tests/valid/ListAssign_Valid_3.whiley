

function update(int[][] ls) -> int[][]
requires |ls| > 0 && |ls[0]| > 0:
    //
    ls[0][0] = 10
    return ls

function f(int[][] ls) -> (int[][], int[][])
requires |ls| > 0 && |ls[0]| > 0:
    //
    int[][] nls = update(ls)
    return (ls, nls)

public export method test() -> void:
    int[][] nls
    int[][] ls = [[1, 2, 3, 4]]
    (ls, nls) = f(ls)
    assume ls == [[1,2,3,4]]
    assume nls == [[10,2,3,4]]    
