// Some testing of basic WVal (Whiley Value) examples.

// for test_arith_38.wyal
function isNat(n:WVal) returns (bool) { isInt(n) && toInt(n) >= 0 }

// for test_list_50.wyal
function myInvariant(items:WVal, item:WVal, n:WVal) returns (bool) {
    isArray(items)
    && (forall ii:int :: 0 <= ii && ii < arraylen(items) ==> isInt(toArray(items)[ii]))
    && isInt(item)
    && isInt(n)
    && 0 <= toInt(n) && toInt(n) < arraylen(items)
    && (exists i:WVal ::
            isInt(i)
            && toInt(n) <= toInt(i)
	    && 0 <= toInt(i) && toInt(i) < arraylen(items)
            && toInt(toArray(items)[toInt(i)]) == toInt(item)) 
}
    
procedure main() returns ();

implementation main() returns ()
{
    // test_list_50.wyal
    // define invariant([int] items, int item, int n) is:
    //   exists(int i):
    //      // n < i && items[i] == item        FALSE!!!
    //      n <= i && items[i] == item          OKAY
    //
    // assert:
    //   forall([int] items, int item, int n):
    //      if:
    //          invariant(items,item,n)
    //          items[n] != item
    //      then:
    //          invariant(items,item,n+1)
    assert (forall items:WVal, item:WVal, nn:WVal ::
        myInvariant(items, item, nn)
	&& 0 <= toInt(nn) && toInt(nn) < arraylen(items)
        && isInt(toArray(items)[toInt(nn)])
        && toInt(toArray(items)[toInt(nn)]) != toInt(item)
        ==> myInvariant(items, item, fromInt(toInt(nn) + 1))
    );
}

