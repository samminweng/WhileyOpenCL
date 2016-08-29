type TName;
type Ref;
type Field a;
type String;  // model this as a primitive type
type HeapType = <a>[Ref, Field a] a;
const unique null : Ref;
var Heap : HeapType;
const unique System.Object : TName;
const unique Example : TName;
const unique String : TName;
axiom Example <: System.Object;
axiom String <: System.Object;
// function typeof (obj : Ref ) returns (class : name);
const unique alloc : Field bool;
var Example.x : Field int;
const Example.s : Field String;
// var Heap : [Ref , name]any;
function StringLength (s : String ) returns (len : int);
procedure Example..ctor(this : Ref, y : int);
  requires y > 0; modifies Heap; ensures true;
procedure Example.M(n : int);
  requires n > 0; modifies Heap; ensures true;
implementation Example.M(n : int) {
  var e : Ref; // where e == null || typeof(e) <: Example;
  var k : int;
  var i : int;
  var tmp : int;
  // PreLoopHeap : [Ref , name]any;
Start:
  assert n > 0;
  tmp := int(100/n) + 1;
  havoc e;
  assume e != null;
  // assume typeof(e) == Example;
  assume Heap[e,alloc] == false;
  Heap[e, alloc] := true;
  call Example..ctor(e,tmp);

  assert e != null;
  k := StringLength(Heap[e,Example.s]);
  i := 0;
  // PreLoopHeap := Heap;
  goto LoopHead;

LoopHead:
  goto LoopBody,AfterLoop;

LoopBody:
  assume i < n;
  assert e != null;
  Heap[e, Example.x] := Heap[e, Example.x] + i;
  i := i + 1;
  goto LoopHead;

AfterLoop:
  assume !(i < n);
  assert e != null; return;
  assert k == StringLength(Heap[e,Example.s]);
}
