import whiley.lang.*
/**
*
This example tries to implement a method inside a class, as follows
    class Vector {
        int x;
        int y;
        public void reset(){
            x=1;
            y=1;
        }
    }
*
*/

type Vector is &{
    int x,
    int y,
    method reset(Vector)
}

method f(Vector v):
    (*v).x = 2
    (*v).y = 2
    return

method main(System.Console sys):
    Vector vector = new {x:0, y:0, reset:&f}
    assert (*vector).x == 0
    (*vector).reset(vector)
    assert (*vector).x == 2
