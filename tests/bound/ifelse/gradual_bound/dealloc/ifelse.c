#include "ifelse.h"
int64_t _f_(int64_t x){
	int64_t r = 0;
	uint16_t _2 = 0;
	int64_t _3 = 0;
	uint16_t _4 = 0;
	int64_t _5 = 0;
	uint16_t _6 = 0;
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
	uint16_t x = 0;
	uint16_t y = 0;
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
	uint16_t _23 = 0;
	void* _24;
	//const %7 = 1 : int
	_7 = 1;
	//invoke (%6) = (%7) ifelse:f : function(int)->(int)
	{
		_6 = _f_(_7);
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
	//invoke (%11) = (%12) ifelse:f : function(int)->(int)
	{
		_11 = _f_(_12);
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
	//invoke (%16) = (%17) ifelse:f : function(int)->(int)
	{
		_16 = _f_(_17);
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
	//const %21 = 1 : int
	_21 = 1;
	//assign %4 = %21  : int
	x = _21;
	//const %22 = 10 : int
	_22 = 10;
	//assign %4 = %22  : int
	x = _22;
	//invoke (%23) = (%4) ifelse:f : function(int)->(int)
	{
		_23 = _f_(x);
	}
	//assign %5 = %23  : int
	y = _23;
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %25 (%5) : method(any)->()
	{
		printf("%"PRId64"\n", y);
	}
	//return
	exit(0);
}

