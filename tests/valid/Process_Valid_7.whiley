

type MyProc2 is &{any data}

method set(MyProc2 this, int d) :
    this->data = (any)d

method get(MyProc2 this) -> any:
    return this->data

method create(any data) -> MyProc2:
    return new {data: data}

public export method test() :
    MyProc2 p2 = create(false)
    set(p2,1)
    assume get(p2) == 1
