import whiley.lang.System

function f({(int, any)} xs) => int:
    if xs is {(int, string)}:
        return 1
    else:
        return -1

method main(System.Console sys) => void:
    {(int,any)} s1 = {(1, "Hello")}
    {(int,any)} s2 = {(1, "Hello"), (1, "World")}
    {(int,any)} s3 = {(1, "Hello"), (2, "Hello")}
    {(int,any)} s4 = {(1, 1), (2, 2)}
    {(int,any)} s5 = {(1, 1), (2, "Hello")}
    sys.out.println(Any.toString(f(s1)))
    sys.out.println(Any.toString(f(s2)))
    sys.out.println(Any.toString(f(s3)))
    sys.out.println(Any.toString(f(s4)))
    sys.out.println(Any.toString(f(s5)))
