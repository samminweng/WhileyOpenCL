/**
 * An example program appends one item to an array using arraylist-like behaviour
 */
import * from whiley.io.File
import * from whiley.lang.System
import whiley.lang.*

type nat is (int x) where x >= 0
// Function opt_append checks the items_length before the appending.
// If full, then double array size to store the item. Otherwise, have an in-place array.
// items: input array, inspos: index which the item is inserted to, item: array item
function opt_append(byte[] items, nat inspos, byte item) -> (byte[] output)
    requires inspos <= |items|
    ensures output[inspos] == item
    ensures all {i in 0..inspos-1 | output[i] == items[i]}
    ensures |output| >= inspos +1:
    if inspos < |items|:
        items[inspos] = item // Update the array without an array
        return items
    else:
        byte[] nitems = [0b; |items|*2+1]// Create a new array and double its size
        int index = 0
        while index < |items|
            where index>=0 && index <= |items| && all {i in 0..index-1 | nitems[i] == items[i]}:
            nitems[index] = items[index]
            index = index + 1
        nitems[index] = item
        return nitems

method main(System.Console sys):
    byte[] b = [0b;3] // Create a byte array of size 3
    nat inspos = 3 // Specify the index that the new item is inserted
    byte item = Int.toUnsignedByte(1)
    byte[] a = opt_append(b, inspos, item) // Double the array size
    assert b[2] == 00000000b
    assert a[2] == b[2]
    assert a[3] == 00000001b
    assert |b| == 3
    assert |a| == 7
    sys.out.print_s("a[3]=")
    sys.out.println(a[3])
    sys.out.print_s("Array a: ")
    sys.out.print(|a|)
    sys.out.println_s("bytes")
