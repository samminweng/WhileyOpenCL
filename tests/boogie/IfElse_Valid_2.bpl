//// This is the Boogie translation of the Whiley program:
// function f(int x) -> int:
//    if x < 10:
//        return 1
//    else:
//        if x > 10:
//            return 2
//    return 0
//
//method main(System.Console sys) -> void:
//    sys.out.println(f(1))
//    sys.out.println(f(10))

var result : int;
var sysout : int;

procedure f(x : int);
  requires true;
  modifies result;
  ensures (x < 10 ==> result == 1)
      &&  (x > 10 ==> result == 2)
      &&  (x == 10 ==> result == 0);
implementation f(x : int) {
Start:
  goto Branch1,Branch2,Branch3;

Branch1:
  assume x < 10;
  result := 1;
  goto End;

Branch2:
  assume x > 10;
  result := 2;
  goto End;

Branch3:
  assume !(x < 10);
  assume !(x > 10);
  result := 0;
  goto End;

End:
}

procedure main();
  requires true; modifies sysout, result; ensures true;
implementation main() {
  call f(1);
  sysout := result;
  assert sysout == 1;
  call f(10);
  sysout := result;
  assert sysout == 0;
}
  