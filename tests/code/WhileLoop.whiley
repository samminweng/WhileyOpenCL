import whiley.lang.System

function f(int limit) -> int
requires limit <= 1000000:
    int i=0
    int sum=0
    while i<limit where i >=0:
        sum = sum + i
        i=i+1
    return sum

public export method test() -> void:
    assert f(5) == 10    
    assert f(50000) == 1249975000
