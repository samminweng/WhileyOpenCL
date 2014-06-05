import whiley.lang.System

type edict is {int=>int} | {real=>real}

function f(int x) => edict:
    if x < 0:
        return {1=>2, 2=>3}
    else:
        return {1=>1.5, 2=>2.5}

public method main(System.Console sys) => void:
    edict d = f(-1)
    d[3] = 4
    sys.out.println("Dictionary=" ++ d)
    d = f(2)
    d[3] = 4
    sys.out.println("Dictionary=" ++ d)
