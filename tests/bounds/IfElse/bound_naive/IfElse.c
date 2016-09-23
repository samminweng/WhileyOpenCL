#include "IfElse.h"
int64_t f(int64_t x){
	int64_t r = 0;
	uint16_t _2 = 0;
	uint16_t _3 = 0;
	uint16_t _4 = 0;
	uint32_t _5 = 0;
	uint64_t _6 = 0;
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
	uint64_t a = 0;
	uint64_t b = 0;
	uint64_t c = 0;
	uint64_t d = 0;
	uint64_t _5 = 0;
	uint16_t _6 = 0;
	int64_t _7 = 0;
	void* _8;
	uint64_t _10 = 0;
	uint16_t _11 = 0;
	int64_t _12 = 0;
	void* _13;
	uint64_t _15 = 0;
	uint16_t _16 = 0;
	int64_t _17 = 0;
	void* _18;
	uint64_t _20 = 0;
	uint16_t _21 = 0;
	void* _22;
	uint64_t _24 = 0;
	uint16_t _25 = 0;
	int16_t _26 = 0;
	void* _27;
	//const %6 = 1 : int
	_6 = 1;
	//invoke (%5) = (%6) IfElse:f : function(int)->(int)
	{
		_5 = f(_6);
	}
	//assign %1 = %5  : int
	a = _5;
	//assert
	{
		//const %7 = 32767 : int
		_7 = 32767;
		//ifeq %1, %7 goto blklab4 : int
		if(a==_7){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %9 = %8 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %9 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %11 = 10 : int
	_11 = 10;
	//invoke (%10) = (%11) IfElse:f : function(int)->(int)
	{
		_10 = f(_11);
	}
	//assign %2 = %10  : int
	b = _10;
	//assert
	{
		//const %12 = 9223372036854775807 : int
		_12 = 9223372036854775807;
		//ifeq %2, %12 goto blklab5 : int
		if(b==_12){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//const %16 = 11 : int
	_16 = 11;
	//invoke (%15) = (%16) IfElse:f : function(int)->(int)
	{
		_15 = f(_16);
	}
	//assign %3 = %15  : int
	c = _15;
	//assert
	{
		//const %17 = 2147483647 : int
		_17 = 2147483647;
		//ifeq %3, %17 goto blklab6 : int
		if(c==_17){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %19 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", c);
	}
	//const %21 = 1212 : int
	_21 = 1212;
	//invoke (%20) = (%21) IfElse:f : function(int)->(int)
	{
		_20 = f(_21);
	}
	//assign %4 = %20  : int
	d = _20;
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %23 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//const %25 = 1212 : int
	_25 = 1212;
	//neg %26 = %25 : int
	_26= -_25;
	//invoke (%24) = (%26) IfElse:f : function(int)->(int)
	{
		_24 = f(_26);
	}
	//assign %4 = %24  : int
	d = _24;
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %28 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//return
	exit(0);
}

