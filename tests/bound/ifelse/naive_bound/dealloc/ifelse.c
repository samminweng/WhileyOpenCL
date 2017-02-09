#include "ifelse.h"
int64_t _f_(int64_t x){
	int64_t r = 0;
	uint16_t _2 = 0;
	uint16_t _3 = 0;
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
	uint16_t d = 0;
	uint16_t e = 0;
	uint16_t x = 0;
	uint16_t y = 0;
	uint16_t _8 = 0;
	uint16_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	uint16_t _13 = 0;
	uint16_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	uint16_t _18 = 0;
	uint16_t _19 = 0;
	int64_t _20 = 0;
	void* _21;
	uint16_t _23 = 0;
	uint16_t _24 = 0;
	int64_t _25 = 0;
	void* _26;
	uint16_t _28 = 0;
	uint16_t _29 = 0;
	int16_t _30 = 0;
	int64_t _31 = 0;
	void* _32;
	uint16_t _34 = 0;
	uint16_t _35 = 0;
	uint16_t _36 = 0;
	void* _37;
	//const %9 = 1 : int
	_9 = 1;
	//invoke (%8) = (%9) ifelse:f : function(int)->(int)
	{
		_8 = _f_(_9);
	}
	//assign %1 = %8  : int
	a = _8;
	//assert
	{
		//const %10 = 1 : int
		_10 = 1;
		//ifeq %1, %10 goto blklab4 : int
		if(a==_10){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %12 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %14 = 10 : int
	_14 = 10;
	//invoke (%13) = (%14) ifelse:f : function(int)->(int)
	{
		_13 = _f_(_14);
	}
	//assign %2 = %13  : int
	b = _13;
	//assert
	{
		//const %15 = 0 : int
		_15 = 0;
		//ifeq %2, %15 goto blklab5 : int
		if(b==_15){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %17 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//const %19 = 11 : int
	_19 = 11;
	//invoke (%18) = (%19) ifelse:f : function(int)->(int)
	{
		_18 = _f_(_19);
	}
	//assign %3 = %18  : int
	c = _18;
	//assert
	{
		//const %20 = 2 : int
		_20 = 2;
		//ifeq %3, %20 goto blklab6 : int
		if(c==_20){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %22 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", c);
	}
	//const %24 = 1212 : int
	_24 = 1212;
	//invoke (%23) = (%24) ifelse:f : function(int)->(int)
	{
		_23 = _f_(_24);
	}
	//assign %4 = %23  : int
	d = _23;
	//assert
	{
		//const %25 = 2 : int
		_25 = 2;
		//ifeq %4, %25 goto blklab7 : int
		if(d==_25){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %27 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//const %29 = 1212 : int
	_29 = 1212;
	//neg %30 = %29 : int
	_30= -_29;
	//invoke (%28) = (%30) ifelse:f : function(int)->(int)
	{
		_28 = _f_(_30);
	}
	//assign %5 = %28  : int
	e = _28;
	//assert
	{
		//const %31 = 1 : int
		_31 = 1;
		//ifeq %5, %31 goto blklab8 : int
		if(e==_31){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %33 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//const %34 = 1 : int
	_34 = 1;
	//assign %6 = %34  : int
	x = _34;
	//const %35 = 10 : int
	_35 = 10;
	//assign %6 = %35  : int
	x = _35;
	//invoke (%36) = (%6) ifelse:f : function(int)->(int)
	{
		_36 = _f_(x);
	}
	//assign %7 = %36  : int
	y = _36;
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %38 (%7) : method(any)->()
	{
		printf("%"PRId64"\n", y);
	}
	//return
	exit(0);
}

