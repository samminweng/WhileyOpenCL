// Some testing of basic WVal (Whiley Value) examples.

// for test_arith_38.wyal
function isNat(n:WVal) returns (bool) { isInt(n) && toInt(n) >= 0 }

// for test_list_43
function invariant43(items:WVal) returns (bool) {
    (forall i:int :: toArray(items)[i] == fromInt(0))
}
	
// for test_list_50.wyal
function invariant50(items:WVal, item:WVal, n:WVal) returns (bool) {
    isArray(items)
    && (forall ii:int :: 0 <= ii && ii < arraylen(items) ==> isInt(toArray(items)[ii]))
    && isInt(item)
    && isInt(n)
    //&& 0 <= toInt(n) && toInt(n) < arraylen(items)
    && (exists i:WVal ::
            isInt(i)
            && toInt(n) <= toInt(i)
	    //&& 0 <= toInt(i) && toInt(i) < arraylen(items)
            && toInt(toArray(items)[toInt(i)]) == toInt(item)) 
}
    
procedure main() returns ();

implementation main() returns ()
{
    var a,b:WVal;
    var i,j:int;
    var n:WVal;
    var ws:WVal;
    var s1:[int]Unicode;
    var x : WVal;
    var y : WVal;

    //var k, sum, item, max : WVal;

    var xs : WVal;

    s1[0] := 68;   // 'D'
    s1[1] := 97;   // 'a'
    s1[2] := 118;  // 'v'
    s1[3] := 101;  // 'e'

    // Integers
    assume a != b;
    if (isInt(a) && isInt(b)) {
        assert toInt(a) != toInt(b);
    }
    a,b := fromInt(1), fromInt(2);
    // check that distinct int values give distinct WVals
    assert a != b;

    //assert i == j;

    // null values
    n := null;
    assert isNull(n);
    assert !isInt(n);
    assert !isBool(n);

    // Strings
    ws := fromString(s1,4);
    assert isString(ws);
    assert !isInt(ws);
    assert ws != null;
    assert strlen(ws) == 4;
    assert toString(ws)[3] == 101;

    // Examples suggested by David Pearce
    // and from https://github.com/Whiley/WhileyTheoremProver/tree/master/tests/valid
    
    // a < b
    assert toInt(a) < toInt(b);

    // test_arith_01.wyal:
    // x > 0 ==> x >= 0
    assume isInt(x);
    assume toInt(x) > 0;
    assert toInt(x) >= 0;

    // test_arith_22.wyal:
    // if: y <= 0 and 2*y >= 0 then: y == 0
    assume toInt(y) <= 0;
    assume 2 * toInt(y) >= 0;
    assert toInt(y) == 0;

    // test_arith_38.wyal:
    // type nat is type nat is (int n) where n >= 0
    // assert:
    // forall (nat k, nat sum, nat item, nat max):
    //    if:
    //        sum <= max * k
    //        max <= item
    //    then:
    //        sum <= item * k
    assert (forall k:WVal, sum:WVal, item:WVal, max:WVal ::
        isNat(k)
	&& isNat(sum)
	&& isNat(item)
	&& isNat(max)
	&& toInt(sum) <= toInt(max) * toInt(k) && toInt(max) <= toInt(item)
	==> toInt(sum) <= toInt(item) * toInt(k)
	);


    // test_list_06.wyal
    // forall ([int] xs):
    //  if:
    //    |xs| > 0
    //  then:
    //    exists (int v):
    //      xs[0] == v
    assert isArray(xs) &&
        arraylen(xs) > 0 &&
	(forall ii:int :: 0 <= ii && ii < arraylen(xs) ==> isInt(toArray(xs)[ii])) ==>
        (exists v:WVal :: isInt(v) && toInt(toArray(xs)[0]) == toInt(v));

    // test_list_50.wyal
    // define invariant([int] items, int item, int n) is:
    //   exists(int i):
    //      n < i && items[i] == item
    //
    // assert:
    //   forall([int] items, int item, int n):
    //      if:
    //          invariant(items,item,n)
    //          items[n] != item
    //      then:
    //          invariant(items,item,n+1)
    assert (forall items:WVal, item:WVal, nn:WVal ::
        invariant50(items, item, nn)
	//&& 0 <= toInt(nn) && toInt(nn) < arraylen(items)
        //&& isInt(toArray(items)[toInt(nn)])
        && toInt(toArray(items)[toInt(nn)]) != toInt(item)
        ==> invariant50(items, item, fromInt(toInt(nn) + 1))
    );

    // test_list_47
    // assert "loop invariant not restored":
    // forall ([int] items, [int] nitems, int i, int n):
    //     if:
    //         Array.<int>update(items,nitems,n)
    //         nitems[n] == 0
    //         items[i] != 0
    //     then:
    //         n != i ==> nitems[i] != 0
    assert (forall items:WVal, nitems:WVal, ii:WVal, nn:WVal ::
            isArray(items)
	    && isArray(nitems)
	    && isInt(ii)
	    && isInt(nn)
	    && nitems == arrayupdate(items, nn, fromInt(0))
	    && toInt(toArray(items)[toInt(ii)]) != 0
	    && toInt(nn) != toInt(ii)
	    ==> toInt(toArray(nitems)[toInt(nn)]) == 0
	     && toInt(toArray(nitems)[toInt(ii)]) != 0
	   );

    // test_list_43    [NOTE: this needs extensionality of Boogie map updates?]
    // define invariant([int] items) is:
    //   forall (int i):
    //      items[i] == 0
    // assert "loop invariant not restored":
    //   forall ([int] items, [int] nitems, int n):
    //       if:
    //           invariant(items)
    //           Array.<int>update(items,nitems,n)
    //           nitems[n] == 0
    //       then:
    //           invariant(nitems)
    assert (forall items:WVal, nitems:WVal, nn:WVal ::
        invariant43(items)
	&& arraylen(items) >= 0                           // NOTE: this is needed!!
	&& nitems == arrayupdate(items, nn, fromInt(0))
	==> arraylen(items) == arraylen(nitems)
	  && invariant43(nitems)
	);
}

