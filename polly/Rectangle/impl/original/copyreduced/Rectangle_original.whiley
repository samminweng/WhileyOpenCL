import whiley.lang.*

type Point is ({int x,int y} this)

type Rectangle is ({Point p1, Point p2} this)
	
// Update the 'p2' point
function updateRec(Rectangle rec, Point p) -> (Rectangle r):
    rec.p2 = p
    return rec

method main(System.Console sys):
    // Instantiate two points
    Point p1 = {x:0, y:0}
    Point p2 = {x:3, y:4}
    // Instantiate rectangle
    Rectangle rec = {p1:p1, p2:p2}
    // Update rectangle
    Point p3 = {x:6, y:8}
    rec = updateRec(rec, p3)
    assert rec.p2.x == 6
    assert rec.p2.y == 8
    sys.out.println_s("p2 point of rectangle")
    sys.out.print_s("p2.x is ")
    sys.out.println(rec.p2.x)
    sys.out.print_s("p2.y is ")
    sys.out.println(rec.p2.y)
    sys.out.println_s("Pass update retangle test case")