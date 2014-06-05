function abs(int|null x) => (int r)
// if we return an int, it cannot be negative
ensures x is int ==> (r == x || r == -x)
// return value cannot be negative
ensures r >= 0:
    //
    if x is int:
        if x >= 0:
            return x
        else:
            return -x
    else:
        return 0


method main(System.Console console):
    console.out.println("abs(1) = " ++ abs(1))
    console.out.println("abs(-1) = " ++ abs(-1))
    console.out.println("abs(null) = " ++ abs(null))