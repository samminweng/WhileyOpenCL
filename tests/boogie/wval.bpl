
// The set of ALL Whiley values.
type WVal;

type WField;      // field names for records and objects.
type WFuncName;   // names of functions
type WMethodName; // names of methods

// These typing predicates define various (disjoint) subsets of WVal
// For null, there is just one WVal constant.
const unique null:WVal;
function isNull(v:WVal) returns (bool) { v == null }
function isInt(WVal) returns (bool);
function isBool(WVal) returns (bool);
function isString(WVal) returns (bool);
function isArray(WVal) returns (bool);
function isRecord(WVal) returns (bool);
function isObject(WVal) returns (bool);
function isRef(WVal) returns (bool);      // TODO
function isFunction(WVal) returns (bool); // supports function closures too
function isMethod(WVal) returns (bool);   // supports method closures too

// Now make sure these subsets of WVal are disjoint.
axiom (forall v:WVal :: isNull(v) ==>
         !isInt(v) && !isBool(v) && !isString(v) && !isArray(v)
         && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isInt(v) ==>
         !isNull(v) && !isBool(v) && !isString(v) && !isArray(v)
         && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isBool(v) ==>
         !isNull(v) && !isInt(v) && !isString(v) && !isArray(v)
         && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isString(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isArray(v)
         && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isArray(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isRecord(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isArray(v) && !isObject(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isObject(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isArray(v) && !isRecord(v) && !isRef(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isRef(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isArray(v) && !isRecord(v) && !isObject(v) && !isFunction(v) && !isMethod(v));
axiom (forall v:WVal :: isFunction(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isArray(v) && !isRecord(v) && !isObject(v) && !isRef(v) && !isMethod(v));
axiom (forall v:WVal :: isMethod(v) ==>
         !isNull(v) && !isInt(v) && !isBool(v) && !isString(v)
         && !isArray(v) && !isRecord(v) && !isObject(v) && !isRef(v) && !isFunction(v));

// int injection and extraction functions
function toInt(WVal) returns (int);
function fromInt(int) returns (WVal);
axiom (forall i:int :: isInt(fromInt(i)));
axiom (forall i:int :: toInt(fromInt(i)) == i);
axiom (forall v:WVal :: isInt(v) ==> fromInt(toInt(v)) == v);

// Boogie recommends these axioms for Java-like modulo.
//axiom (forall x:int, y:int :: { x % y } { x / y } x % y == x - x / y * y);
//axiom (forall x:int, y:int :: {x % y}
//    (0 < y) ==> 0 <= x % y && x % y < y) &&
//    (y < 0) ==> y <  x % y && x % y <= 0)
//);

// bool injection and extraction functions
function toBool(WVal) returns (bool);
function fromBool(bool) returns (WVal);
axiom (forall b:bool :: isBool(fromBool(b)));
axiom (forall b:bool :: toBool(fromBool(b)) == b);
axiom (forall v:WVal :: isBool(v) ==> fromBool(toBool(v)) == v);

// string injection and extraction functions
type Unicode = int;
// const UnicodeMax int = 65536;
function toString(WVal) returns ([int]Unicode);
function strlen(WVal) returns (int);
function fromString([int]Unicode,int) returns (WVal);
axiom (forall s:[int]Unicode, len:int :: 0 <= len ==> isString(fromString(s,len)));
axiom (forall s:[int]Unicode, len:int :: 0 <= len ==> toString(fromString(s,len)) == s);
axiom (forall s:[int]Unicode, len:int :: 0 <= len ==> strlen(fromString(s,len)) == len);
axiom (forall v:WVal :: isString(v) ==> fromString(toString(v), strlen(v)) == v);
axiom (forall v:WVal :: isString(v) ==> strlen(v) >= 0);

// general array injection and extraction functions
function toArray(WVal) returns ([int]WVal);
function arraylen(WVal) returns (int);
function fromArray([int]WVal,int) returns (WVal);
function arrayupdate(a:WVal, i:WVal, v:WVal) returns (WVal) {
    fromArray(toArray(a)[toInt(i) := v], arraylen(a)) }
axiom (forall s:[int]WVal, len:int :: 0 <= len ==> isArray(fromArray(s,len)));
axiom (forall s:[int]WVal, len:int :: 0 <= len ==> toArray(fromArray(s,len)) == s);
axiom (forall s:[int]WVal, len:int :: 0 <= len ==> arraylen(fromArray(s,len)) == len);
axiom (forall v:WVal :: isArray(v) ==> fromArray(toArray(v), arraylen(v)) == v);
axiom (forall v:WVal :: isArray(v) ==> 0 <= arraylen(v));

// A few programs need extensionality of arrays.
// Boogie does not include this by default (page 12 KRML178).
// To avoid inconsistencies, we have just a very weak version of extensionality
// here, which is just enough to give extensionality on arrayupdate results.
// (If we required equality only in the domain of the array 0..len-1, this
//  would introduce an inconsistency with the above axioms:
//     a[0..100]==0 && a[101] == 1
//  && b[0..100]==0 && b[101] == 2
//  && wa = fromArray(a, 100)
//  && wb = fromArray(b, 100)
//  ==> wa == wb   // if we had a strong extensionality axiom, requiring only 0..100.
//   && wa != wb   // from a != b plus above axioms.
// )

axiom (forall a1:WVal, a2:WVal ::
    isArray(a1)
    && isArray(a2)
    && arraylen(a1) == arraylen(a2)
    && (forall i:int :: toArray(a1)[i] == toArray(a2)[i])
    ==> a1 == a2
    );
