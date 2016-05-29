

type Proc is &{int state}

method get(Proc _this) -> int:
    return _this->state

method f(Proc x) -> int[]:
    return [1, 2, 3, get(x)]

public export method test() :
    Proc proc = new {state: 1}
    assume f(proc) == [1,2,3,1]
