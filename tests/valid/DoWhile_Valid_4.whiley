import whiley.lang.System

type Leaf is int

type Link is {LinkedList next}

type LinkedList is Leaf | Link

function dist(Link list) => Leaf:
    LinkedList iter = list
    int distance = 0
    do:
        iter = iter.next
        distance = distance + 1
    while iter is Link
    //
    return iter + distance

method main(System.Console sys) => void:
    LinkedList list = 123
    list = {next: list}
    list = {next: list}
    sys.out.println("DISTANCE: " ++ dist(list))
    list = {next: list}
    list = {next: list}
    sys.out.println("DISTANCE: " ++ dist(list))
