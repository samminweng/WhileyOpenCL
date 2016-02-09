// This version uses closures within objects to capture self, and be more object-oriented.
import whiley.lang.*
type SizeGetter is function(null) -> int
type SizeSetter is function(int) -> Sized

////////////////////////////////////////////////////////////////
// a 'class' (a set of objects) with a settable 'size' field.
////////////////////////////////////////////////////////////////
type SizedData is {
    int size,
    ...
    }

type Sized is {
    SizeGetter getSize,
    SizeSetter setSize
    }

// This getter could also be used on subclass of SizedData.
function getSized(SizedData self) -> int:
    return self.size

// This setter is specific to the SizedData+Sized class.
function setSized(SizedData self, int s) -> Sized:
    // self.size = s
    SizedData self2 = {size: s}
    // debug("have set size")
    return { getSize: &(null dummy -> getSized(self2)),
             setSize: &(int siz2 -> setSized(self2, siz2))
           }

// An example of a Sized object.
// BUG: gives this error with Whiley 0.3.37
//./sum2.whiley:34: internal failure, unknown constant expression: wyc.lang.Expr$Lambda
//constant s1 is { getSize: &(null dummy -> getSized(d1)),
//                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//constant d1 is {size: 3}
//constant s1 is { getSize: &(null dummy -> getSized(d1)),
//                setSize: &(int siz2 -> setSized(d1, siz2))
//              }


////////////////////////////////////////////////////////////////
// a 'subclass' of Sized with more complex data.
////////////////////////////////////////////////////////////////
/*type MultiSizedData is {
    int size,
    int count,
    ...
    }

function getMSized(MultiSizedData s) -> int:
   return s.size * s.count

function setMSized(MultiSizedData self, int newSize) -> Sized:
   MultiSizedData self2 = { size: newSize, count: self.count }
   return { getSize: &(null dummy -> getMSized(self2)),
            setSize: &(int siz2 -> setMSized(self2, siz2))
          }*/


method testSuperClass(System.Console sys):
   sys.out.println_s("Testing Sized class.")
   SizedData d1 = {size: 3}
   Sized s1 = { getSize: &(null dummy -> getSized(d1)),
                setSize: &(int siz2 -> setSized(d1, siz2))
              }
   sys.out.println(getSized(d1))       // invoke
   sys.out.println(s1.getSize(null))   // invoke_indirect
   Sized s2 = s1.setSize(5)
   sys.out.println(s2.getSize(null))   // invoke_indirect

/*method testSubClass(System.Console sys):
   sys.out.println_s("Testing MultiSized subclass.")
   MultiSizedData md1 = {size: 3, count: 4}
   Sized m1 = { getSize: &(null dummy3 -> getMSized(md1)),
                setSize: &(int siz3 -> setMSized(md1, siz3))
              }
   sys.out.println(m1.getSize(null))   // invoke_indirect
   Sized m2 = m1.setSize(6)
   sys.out.println(m2.getSize(null))   // invoke_indirect*/



method main(System.Console sys):
    testSuperClass(sys)
    //testSubClass(sys)

