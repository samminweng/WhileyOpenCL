#include "IfElse.h"
int64_t f(int64_t x){
	int64_t r = 0;
	uint16_t _2 = 0;
	uint16_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
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
	uint16_t a = 0;
	uint16_t b = 0;
	uint16_t c = 0;
	uint16_t d = 0;
	uint16_t e = 0;
	uint16_t _6 = 0;
	uint16_t _7 = 0;
	int64_t _8 = 0;
	void* _9;
	uint16_t _11 = 0;
	uint16_t _12 = 0;
	int64_t _13 = 0;
	void* _14;
	uint16_t _16 = 0;
	uint16_t _17 = 0;
	int64_t _18 = 0;
	void* _19;
	uint16_t _21 = 0;
	uint16_t _22 = 0;
	int64_t _23 = 0;
	void* _24;
	uint16_t _26 = 0;
	uint16_t _27 = 0;
	int16_t _28 = 0;
	int64_t _29 = 0;
	void* _30;
	//const %7 = 1 : int
	_7 = 1;
	//invoke (%6) = (%7) IfElse:f : function(int)->(int)
	{
		_6 = f(_7);
	}
	//assign %1 = %6  : int
	a = _6;
	//assert
	{
		//const %8 = 1 : int
		_8 = 1;
		//ifeq %1, %8 goto blklab4 : int
		if(a==_8){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %10 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %12 = 10 : int
	_12 = 10;
	//invoke (%11) = (%12) IfElse:f : function(int)->(int)
	{
		_11 = f(_12);
	}
	//assign %2 = %11  : int
	b = _11;
	//assert
	{
		//const %13 = 0 : int
		_13 = 0;
		//ifeq %2, %13 goto blklab5 : int
		if(b==_13){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %15 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//const %17 = 11 : int
	_17 = 11;
	//invoke (%16) = (%17) IfElse:f : function(int)->(int)
	{
		_16 = f(_17);
	}
	//assign %3 = %16  : int
	c = _16;
	//assert
	{
		//const %18 = 2 : int
		_18 = 2;
		//ifeq %3, %18 goto blklab6 : int
		if(c==_18){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %20 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", c);
	}
	//const %22 = 1212 : int
	_22 = 1212;
	//invoke (%21) = (%22) IfElse:f : function(int)->(int)
	{
		_21 = f(_22);
	}
	//assign %4 = %21  : int
	d = _21;
	//assert
	{
		//const %23 = 2 : int
		_23 = 2;
		//ifeq %4, %23 goto blklab7 : int
		if(d==_23){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %25 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//const %27 = 1212 : int
	_27 = 1212;
	//neg %28 = %27 : int
	_28= -_27;
	//invoke (%26) = (%28) IfElse:f : function(int)->(int)
	{
		_26 = f(_28);
	}
	//assign %5 = %26  : int
	e = _26;
	//assert
	{
		//const %29 = 1 : int
		_29 = 1;
		//ifeq %5, %29 goto blklab8 : int
		if(e==_29){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %31 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//return
	exit(0);
}

