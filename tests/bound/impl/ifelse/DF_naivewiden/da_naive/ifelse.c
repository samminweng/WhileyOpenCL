#include "ifelse.h"
//	domain(_0)	= [1..11]	
int64_t _f_(uint16_t x){
	int64_t r; //domain(_1)	= [empty..empty]	
	uint16_t _2; //domain(_2)	= [10..10]	
	uint16_t _3; //domain(_3)	= [1..1]	
	uint16_t _4; //domain(_4)	= [10..10]	
	uint16_t _5; //domain(_5)	= [2..2]	
	uint16_t _6; //domain(_6)	= [0..0]	
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

//
int main(int argc, char** args){
	uint16_t a; //domain(_1)	= [1..1]	
	uint16_t b; //domain(_2)	= [0..0]	
	uint16_t c; //domain(_3)	= [2..2]	
	uint16_t _4; //domain(_4)	= [1..1]	
	uint16_t _5; //domain(_5)	= [1..1]	
	int64_t _6; //domain(_6)	= [empty..empty]	
	void* _7;
	uint16_t _9; //domain(_9)	= [0..0]	
	uint16_t _10; //domain(_10)	= [10..10]	
	int64_t _11; //domain(_11)	= [empty..empty]	
	void* _12;
	uint16_t _14; //domain(_14)	= [2..2]	
	uint16_t _15; //domain(_15)	= [11..11]	
	int64_t _16; //domain(_16)	= [empty..empty]	
	void* _17;
	//const %5 = 1 : int
	_5 = 1;
	//invoke (%4) = (%5) ifelse:f : function(int)->(int)
	{
		_4 = _f_(_5);
	}
	//assign %1 = %4  : int
	a = _4;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %8 (%1) : method(any)->()
	{
		printf("%"PRIu16"\n", a);
	}
	//const %10 = 10 : int
	_10 = 10;
	//invoke (%9) = (%10) ifelse:f : function(int)->(int)
	{
		_9 = _f_(_10);
	}
	//assign %2 = %9  : int
	b = _9;
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%2) : method(any)->()
	{
		printf("%"PRIu16"\n", b);
	}
	//const %15 = 11 : int
	_15 = 11;
	//invoke (%14) = (%15) ifelse:f : function(int)->(int)
	{
		_14 = _f_(_15);
	}
	//assign %3 = %14  : int
	c = _14;
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %18 (%3) : method(any)->()
	{
		printf("%"PRIu16"\n", c);
	}
	//return
	exit(0);
}

