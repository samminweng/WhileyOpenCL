#include "IfElse.h"
long long f(long long x){
	long long r = 0;
	short int _2 = 0;
	long long _3 = 0;
	short int _4 = 0;
	long int _5 = 0;
	long long _6 = 0;
	//const %2 = 10 : int
	_2 = 10;
	//ifge %0, %2 goto blklab1 : int
	if(x>=_2){goto blklab1;}
	//const %3 = 32767 : int
	_3 = 32767;
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
	//const %5 = 2147483647 : int
	_5 = 2147483647;
	//return %5
	return _5;
//.blklab3
blklab3:;
//.blklab2
blklab2:;
	//const %6 = 9223372036854775807 : int
	_6 = 9223372036854775807;
	//return %6
	return _6;
	//return
}

int main(int argc, char** args){
	short int a = 0;
	long long b = 0;
	long int c = 0;
	short int _4 = 0;
	short int _5 = 0;
	short int _6 = 0;
	void* _7;
	long long _9 = 0;
	short int _10 = 0;
	long long _11 = 0;
	void* _12;
	long int _14 = 0;
	short int _15 = 0;
	long int _16 = 0;
	void* _17;
	//const %5 = 1 : int
	_5 = 1;
	//invoke (%4) = (%5) IfElse:f : function(int)->(int)
	{
		_4 = f(_5);
	}
	//assign %1 = %4  : int
	a = _4;
	//assert
	{
		//const %6 = 32767 : int
		_6 = 32767;
		//ifeq %1, %6 goto blklab4 : int
		if(a==_6){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %8 (%1) : method(any)->()
	printf("%lld\n", a);
	//const %10 = 10 : int
	_10 = 10;
	//invoke (%9) = (%10) IfElse:f : function(int)->(int)
	{
		_9 = f(_10);
	}
	//assign %2 = %9  : int
	b = _9;
	//assert
	{
		//const %11 = 9223372036854775807 : int
		_11 = 9223372036854775807;
		//ifeq %2, %11 goto blklab5 : int
		if(b==_11){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%2) : method(any)->()
	printf("%lld\n", b);
	//const %15 = 11 : int
	_15 = 11;
	//invoke (%14) = (%15) IfElse:f : function(int)->(int)
	{
		_14 = f(_15);
	}
	//assign %3 = %14  : int
	c = _14;
	//assert
	{
		//const %16 = 2147483647 : int
		_16 = 2147483647;
		//ifeq %3, %16 goto blklab6 : int
		if(c==_16){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %18 (%3) : method(any)->()
	printf("%lld\n", c);
	//return
	exit(0);
}

