#include "ifelse.h"
int64_t _f_(int64_t x){
	int64_t r;
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
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
	int64_t a;
	int64_t b;
	int64_t c;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	void* _7;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	void* _12;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	void* _17;
	//const %5 = 1 : int
	_5 = 1;
	//invoke (%4) = (%5) ifelse:f : function(int)->(int)
	{
		_4 = _f_(_5);
	}
	//assign %1 = %4  : int
	// isCopyEliminated = true
	a = _4;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %8 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %10 = 10 : int
	_10 = 10;
	//invoke (%9) = (%10) ifelse:f : function(int)->(int)
	{
		_9 = _f_(_10);
	}
	//assign %2 = %9  : int
	// isCopyEliminated = true
	b = _9;
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//const %15 = 11 : int
	_15 = 11;
	//invoke (%14) = (%15) ifelse:f : function(int)->(int)
	{
		_14 = _f_(_15);
	}
	//assign %3 = %14  : int
	// isCopyEliminated = true
	c = _14;
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %18 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", c);
	}
	//return
	exit(0);
}

