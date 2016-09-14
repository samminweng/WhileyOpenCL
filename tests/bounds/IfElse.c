#include "IfElse.h"
long long f(long long x){
	long long r = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	//const %2 = 10 : int
	_2 = 10;
	//ifge %0, %2 goto blklab1 : int
	if(x>=_2){goto blklab1;}
	//const %3 = 1 : int
	_3 = 1;
	//return %3
	return _3;
	//goto blklab2
	goto blklab2;
//.blklab1
blklab1:;
	//const %4 = 10 : int
	_4 = 10;
	//ifle %0, %4 goto blklab3 : int
	if(x<=_4){goto blklab3;}
	//const %5 = 2 : int
	_5 = 2;
	//return %5
	return _5;
//.blklab3
blklab3:;
//.blklab2
blklab2:;
	//const %6 = 0 : int
	_6 = 0;
	//return %6
	return _6;
	//return
}

int main(int argc, char** args){
	long long a = 0;
	long long b = 0;
	long long _3 = 0;
	long long _4 = 0;
	void* _5;
	long long _7 = 0;
	long long _8 = 0;
	void* _9;
	//const %4 = 1 : int
	_4 = 1;
	//invoke (%3) = (%4) IfElse:f : function(int)->(int)
	{
		_3 = f(_4);
	}
	//assign %1 = %3  : int
	a = _3;
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(any)->()
	printf("%lld\n", a);
	//const %8 = 10 : int
	_8 = 10;
	//invoke (%7) = (%8) IfElse:f : function(int)->(int)
	{
		_7 = f(_8);
	}
	//assign %2 = %7  : int
	b = _7;
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %10 (%2) : method(any)->()
	printf("%lld\n", b);
	//return
	exit(0);
}

