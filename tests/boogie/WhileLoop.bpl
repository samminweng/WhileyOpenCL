//// This is the Boogie translation of the Whiley program:
//function f(int limit) -> int
//requires limit <= 1000000:
//    int i=0
//    int sum=0
//    while i<limit where i >=0:
//        sum = sum + i
//        i=i+1
//    return sum
//
//method main(System.Console sys) -> void:
//    sys.out.println(f(5))    
//    sys.out.println(f(50000))

var result : int;
var sysout : int;

procedure f(limit : int);
  requires limit <= 1000000;
  modifies result;
  ensures result == 0; // >= 0;
implementation f(limit : int) {
  var i : int;
  var sum : int;
Start:
  i := 0;
  sum := limit;
  goto Loop,EndLoop;

Loop:
  assume i < limit;
  assert sum + i == limit;
  assert 0 <= i;
  sum := sum - 1;
  i := i + 1;
  goto Loop,EndLoop;

EndLoop:
  assume !(i < limit);
  assert 0 <= i;
  assert i <= limit;
  assert sum + i == limit;
  result := sum;
}

procedure main();
  requires true; modifies sysout, result; ensures true;
implementation main() {
  call f(2);
  sysout := result;
  assert sysout == 0;
  call f(50000);
  sysout := result;
  assert sysout == 0;
}
  