#include "ResetMacro3.h"
//	domain(_0)	= [2..11]	
uint16_t* _func_(uint16_t* x, size_t x_size, uint16_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	int64_t* _2 = 0; //domain(_2)	= [empty..empty]	
	size_t _2_size = 0;
	uint16_t* a = 0; //domain(_3)	= [0..0]	
	size_t a_size = 0;
	uint16_t _4 = 0; //domain(_4)	= [0..0]	
	uint16_t _5 = 0; //domain(_5)	= [3..3]	
	uint16_t* _6 = 0; //domain(_6)	= [0..0]	
	size_t _6_size = 0;
	uint16_t _7 = 0; //domain(_7)	= [10..10]	
	uint16_t _8 = 0; //domain(_8)	= [0..0]	
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY(_6, _5, _4, uint16_t);
	//assign %3 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	// isCopyEliminated = true
	x[_8] = num;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

//
int main(int argc, char** args){
	uint16_t* x = 0; //domain(_1)	= [2..11]	
	size_t x_size = 0;
	uint16_t num = 0; //domain(_2)	= [11..11]	
	uint16_t* tmp = 0; //domain(_3)	= [2..11]	
	size_t tmp_size = 0;
	uint16_t _4 = 0; //domain(_4)	= [2..2]	
	uint16_t _5 = 0; //domain(_5)	= [3..3]	
	uint16_t* _6 = 0; //domain(_6)	= [2..2]	
	size_t _6_size = 0;
	uint16_t _7 = 0; //domain(_7)	= [11..11]	
	uint16_t* _8 = 0; //domain(_8)	= [2..11]	
	size_t _8_size = 0;
	int64_t _9 = 0; //domain(_9)	= [empty..empty]	
	int64_t _10 = 0; //domain(_10)	= [empty..empty]	
	int64_t _11 = 0; //domain(_11)	= [empty..empty]	
	void* _12;
	uint16_t* _14 = 0; //domain(_14)	= [32..120]	
	size_t _14_size = 0;
	void* _15;
	uint16_t _17 = 0; //domain(_17)	= [0..0]	
	int64_t _18 = 0; //domain(_18)	= [empty..empty]	
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY(_6, _5, _4, uint16_t);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _6);
	//const %7 = 11 : int
	_7 = 11;
	//assign %2 = %7  : int
	// isCopyEliminated = true
	num = _7;
	//invoke (%8) = (%1, %2) ResetMacro3:func : function(int[],int)->(int[])
	{
		// isCopyEliminated of '_1' = true
		_8 = _func_(_1DARRAY_PARAM(x), num, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %3 = %8  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(tmp, _8);
	//assign %1 = %3  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, tmp);
	//assert
	{
		//const %9 = 0 : int
		_9 = 0;
		//indexof %10 = %1, %9 : int[]
		_10=x[_9];
		//const %11 = 11 : int
		_11 = 11;
		//ifeq %10, %11 goto blklab2 : int
		if(_10==_11){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [120,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY(_14, 7, 0, uint16_t);
	_14[0] = 120; _14[1] = 91; _14[2] = 48; _14[3] = 93; _14[4] = 32; _14[5] = 61; _14[6] = 32; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		_PRINT_STR(_14);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %1, %17 : int[]
	_18=x[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	{
		printf("%"PRId64"\n", _18);
	}
	//return
	exit(0);
}

