import whiley.lang.*

// The 'test_apppend' function refers to 'append' function in Array.whiley (wyrt module)
function test_append(int[] lhs, int[] rhs) -> int[]:
    int[] rs = [0; |lhs| + |rhs|]
    int i = |lhs|
    //
    while i > 0:
        i = i - 1
        rs[i] = lhs[i]
    //
    while i < |rhs|:
        rs[i+|lhs|] = rhs[i]
        i = i + 1
    //
    return rs

public method main(System.Console console):
    ASCII.string r = ""
    r = test_append(r," This is a test ")
    console.out.println_s(r)