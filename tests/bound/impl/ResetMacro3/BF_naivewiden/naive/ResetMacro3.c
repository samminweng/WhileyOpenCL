#include "ResetMacro3.h"
//	domain(_0)	= [0..65536]	
uint32_t* _func_(uint32_t* b, size_t b_size, uint32_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	int64_t* _2 = NULL; //domain(_2)	= [empty..empty]	
	size_t _2_size = 0;
	uint32_t* c = NULL; //domain(_3)	= [0..65536]	
	size_t c_size = 0;
	uint16_t _4; //domain(_4)	= [0..0]	
	uint16_t _5; //domain(_5)	= [3..3]	
	uint16_t* _6 = NULL; //domain(_6)	= [0..0]	
	size_t _6_size = 0;
	uint16_t _7; //domain(_7)	= [10..10]	
	uint16_t _8; //domain(_8)	= [0..0]	
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY(_6, _5, _4, uint16_t);
	//assign %3 = %6  : int[]
	_COPY_1DARRAY(c, _6, uint32_t);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	b[_8] = num;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab1
blklab1:;
	//return
}

//
int main(int argc, char** args){
	uint32_t* b = NULL; //domain(_1)	= [0..65536]	
	size_t b_size = 0;
	uint16_t* tmp = NULL; //domain(_2)	= [0..11]	
	size_t tmp_size = 0;
	uint16_t _3; //domain(_3)	= [2..2]	
	uint16_t _4; //domain(_4)	= [3..3]	
	uint16_t* _5 = NULL; //domain(_5)	= [2..2]	
	size_t _5_size = 0;
	uint16_t* _6 = NULL; //domain(_6)	= [0..11]	
	size_t _6_size = 0;
	uint16_t _7; //domain(_7)	= [11..11]	
	int64_t _8; //domain(_8)	= [empty..empty]	
	int64_t _9; //domain(_9)	= [empty..empty]	
	int64_t _10; //domain(_10)	= [empty..empty]	
	void* _11;
	uint16_t _13; //domain(_13)	= [0..0]	
	int64_t _14; //domain(_14)	= [empty..empty]	
	uint32_t* _15 = NULL; //domain(_15)	= [0..65536]	
	size_t _15_size = 0;
	uint32_t _16; //domain(_16)	= [65536..65536]	
	void* _17;
	uint16_t _19; //domain(_19)	= [0..0]	
	int64_t _20; //domain(_20)	= [empty..empty]	
	int64_t _21; //domain(_21)	= [empty..empty]	
	int64_t _22; //domain(_22)	= [empty..empty]	
	int64_t _23; //domain(_23)	= [empty..empty]	
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY(_5, _4, _3, uint16_t);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY(b, _5, uint32_t);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro3:func : function(int[],int)->(int[])
	{
		void* tmp_b_0;
		_COPY_1DARRAY_PARAM(b, tmp_b_0, uint16_t);
		_6 = _func_(tmp_b_0, b_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY(tmp, _6, uint16_t);
	//assign %1 = %2  : int[]
	_COPY_1DARRAY(b, tmp, uint32_t);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=b[_8];
		//const %10 = 11 : int
		_10 = 11;
		//ifeq %9, %10 goto blklab2 : int
		if(_9==_10){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=b[_13];
	//indirectinvoke () = %12 (%14) : method(any)->()
	{
		printf("%"PRId64"\n", _14);
	}
	//const %16 = 65536 : int
	_16 = 65536;
	//invoke (%15) = (%1, %16) ResetMacro3:func : function(int[],int)->(int[])
	{
		void* tmp_b_0;
		_COPY_1DARRAY_PARAM(b, tmp_b_0, uint32_t);
		_15 = _func_(tmp_b_0, b_size, _16, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
	}
	//assign %1 = %15  : int[]
	_COPY_1DARRAY(b, _15, uint32_t);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 0 : int
	_19 = 0;
	//indexof %20 = %1, %19 : int[]
	_20=b[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	{
		printf("%"PRId64"\n", _20);
	}
	//assert
	{
		//const %21 = 0 : int
		_21 = 0;
		//indexof %22 = %1, %21 : int[]
		_22=b[_21];
		//const %23 = 65536 : int
		_23 = 65536;
		//ifeq %22, %23 goto blklab3 : int
		if(_22==_23){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//return
	exit(0);
}

