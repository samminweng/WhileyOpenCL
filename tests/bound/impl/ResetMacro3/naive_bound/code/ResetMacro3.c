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
	_COPY_1DARRAY(a, _6, uint16_t);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
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
	uint16_t* tmp = 0; //domain(_2)	= [2..11]	
	size_t tmp_size = 0;
	uint16_t _3 = 0; //domain(_3)	= [2..2]	
	uint16_t _4 = 0; //domain(_4)	= [3..3]	
	uint16_t* _5 = 0; //domain(_5)	= [2..2]	
	size_t _5_size = 0;
	uint16_t* _6 = 0; //domain(_6)	= [2..11]	
	size_t _6_size = 0;
	uint16_t _7 = 0; //domain(_7)	= [11..11]	
	int64_t _8 = 0; //domain(_8)	= [empty..empty]	
	int64_t _9 = 0; //domain(_9)	= [empty..empty]	
	int64_t _10 = 0; //domain(_10)	= [empty..empty]	
	void* _11;
	uint16_t* _13 = 0; //domain(_13)	= [32..120]	
	size_t _13_size = 0;
	void* _14;
	uint16_t _16 = 0; //domain(_16)	= [0..0]	
	int64_t _17 = 0; //domain(_17)	= [empty..empty]	
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY(_5, _4, _3, uint16_t);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY(x, _5, uint16_t);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro3:func : function(int[],int)->(int[])
	{
		void* x_tmp;
		_COPY_1DARRAY_PARAM(x, uint16_t);
		_6 = _func_(x_tmp, x_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY(tmp, _6, uint16_t);
	//assign %1 = %2  : int[]
	_COPY_1DARRAY(x, tmp, uint16_t);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=x[_8];
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
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [120,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY(_13, 7, 0, uint16_t);
	_13[0] = 120; _13[1] = 91; _13[2] = 48; _13[3] = 93; _13[4] = 32; _13[5] = 61; _13[6] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		_PRINT_STR(_13);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %1, %16 : int[]
	_17=x[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//return
	exit(0);
}

