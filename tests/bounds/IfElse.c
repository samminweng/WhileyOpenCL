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
	void* _1;
	long long _3 = 0;
	long long _4 = 0;
	void* _5;
	long long _7 = 0;
	long long _8 = 0;
	void* _9;
	long long _11 = 0;
	long long _12 = 0;
	void* _13;
	long long _15 = 0;
	long long _16 = 0;
	void* _17;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	//fieldload %1 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %2 = %1 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %4 = 1 : int
	_4 = 1;
	//invoke (%3) = (%4) IfElse:f : function(int)->(int)
	{
		_3 = f(_4);
	}
	//indirectinvoke () = %2 (%3) : method(any)->()
	printf("%lld\n", _3);
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = 10 : int
	_8 = 10;
	//invoke (%7) = (%8) IfElse:f : function(int)->(int)
	{
		_7 = f(_8);
	}
	//indirectinvoke () = %6 (%7) : method(any)->()
	printf("%lld\n", _7);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = 11 : int
	_12 = 11;
	//invoke (%11) = (%12) IfElse:f : function(int)->(int)
	{
		_11 = f(_12);
	}
	//indirectinvoke () = %10 (%11) : method(any)->()
	printf("%lld\n", _11);
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 1212 : int
	_16 = 1212;
	//invoke (%15) = (%16) IfElse:f : function(int)->(int)
	{
		_15 = f(_16);
	}
	//indirectinvoke () = %14 (%15) : method(any)->()
	printf("%lld\n", _15);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = 1212 : int
	_20 = 1212;
	//neg %21 = %20 : int
	_21= -_20;
	//invoke (%19) = (%21) IfElse:f : function(int)->(int)
	{
		_19 = f(_21);
	}
	//indirectinvoke () = %18 (%19) : method(any)->()
	printf("%lld\n", _19);
	//return
	exit(0);
}

