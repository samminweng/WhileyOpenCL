#include "ResetMacro3.h"
//	domain(_0)	= [2..65536]	
uint32_t* _func_(uint32_t* x, size_t x_size, _DECL_DEALLOC_PARAM(x), uint32_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	int64_t* _2 = NULL; //domain(_2)	= [empty..empty]	
	size_t _2_size = 0;
	_DECL_DEALLOC(_2);
	uint32_t* a = NULL; //domain(_3)	= [2..65536]	
	size_t a_size = 0;
	_DECL_DEALLOC(a);
	uint16_t _4; //domain(_4)	= [0..0]	
	uint16_t _5; //domain(_5)	= [3..3]	
	uint16_t* _6 = NULL; //domain(_6)	= [0..0]	
	size_t _6_size = 0;
	_DECL_DEALLOC(_6);
	uint16_t _7; //domain(_7)	= [10..10]	
	uint16_t _8; //domain(_8)	= [0..0]	
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY(_6, _5, _4, uint16_t);
	_ADD_DEALLOC(_6);
	//assign %3 = %6  : int[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	x[_8] = num;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

//
int main(int argc, char** args){
	uint32_t* x = NULL; //domain(_1)	= [2..65536]	
	size_t x_size = 0;
	_DECL_DEALLOC(x);
	uint32_t* tmp = NULL; //domain(_2)	= [2..65536]	
	size_t tmp_size = 0;
	_DECL_DEALLOC(tmp);
	uint16_t _3; //domain(_3)	= [2..2]	
	uint16_t _4; //domain(_4)	= [3..3]	
	uint32_t* _5 = NULL; //domain(_5)	= [2..65536]	
	size_t _5_size = 0;
	_DECL_DEALLOC(_5);
	uint32_t* _6 = NULL; //domain(_6)	= [2..65536]	
	size_t _6_size = 0;
	_DECL_DEALLOC(_6);
	uint16_t _7; //domain(_7)	= [11..11]	
	int64_t _8; //domain(_8)	= [empty..empty]	
	int64_t _9; //domain(_9)	= [empty..empty]	
	int64_t _10; //domain(_10)	= [empty..empty]	
	void* _11;
	uint16_t* _13 = NULL; //domain(_13)	= [32..120]	
	size_t _13_size = 0;
	_DECL_DEALLOC(_13);
	void* _14;
	uint16_t _16; //domain(_16)	= [0..0]	
	int64_t _17; //domain(_17)	= [empty..empty]	
	uint32_t* _18 = NULL; //domain(_18)	= [2..65536]	
	size_t _18_size = 0;
	_DECL_DEALLOC(_18);
	uint32_t _19; //domain(_19)	= [65536..65536]	
	int64_t _20; //domain(_20)	= [empty..empty]	
	int64_t _21; //domain(_21)	= [empty..empty]	
	int64_t _22; //domain(_22)	= [empty..empty]	
	void* _23;
	uint16_t* _25 = NULL; //domain(_25)	= [32..120]	
	size_t _25_size = 0;
	_DECL_DEALLOC(_25);
	void* _26;
	uint16_t _28; //domain(_28)	= [0..0]	
	int64_t _29; //domain(_29)	= [empty..empty]	
	int64_t _30; //domain(_30)	= [empty..empty]	
	int64_t _31; //domain(_31)	= [empty..empty]	
	int64_t _32; //domain(_32)	= [empty..empty]	
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY(_5, _4, _3, uint16_t);
	_ADD_DEALLOC(_5);
	//assign %1 = %5  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _5);
	_TRANSFER_DEALLOC(x, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro3:func : function(int[],int)->(int[])
	{
		_DEALLOC(_6);
		// isCopyEliminated of '_1' = true
		_6 = _func_(_1DARRAY_PARAM(x), false, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_RESET_DEALLOC(_6, x, "true-true-false" , "func");
	}
	//assign %2 = %6  : int[]
	_DEALLOC(tmp);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(tmp, _6);
	_TRANSFER_DEALLOC(tmp, _6);
	//assign %1 = %2  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, tmp);
	_TRANSFER_DEALLOC(x, tmp);
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
	_DEALLOC(_13);
	_NEW_1DARRAY(_13, 7, 0, uint16_t);
	_13[0] = 120; _13[1] = 91; _13[2] = 48; _13[3] = 93; _13[4] = 32; _13[5] = 61; _13[6] = 32; 
	_ADD_DEALLOC(_13);
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
	//const %19 = 65536 : int
	_19 = 65536;
	//invoke (%18) = (%1, %19) ResetMacro3:func : function(int[],int)->(int[])
	{
		_DEALLOC(_18);
		// isCopyEliminated of '_1' = true
		_18 = _func_(_1DARRAY_PARAM(x), false, _19, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
		_RESET_DEALLOC(_18, x, "true-true-false" , "func");
	}
	//assign %1 = %18  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _18);
	_TRANSFER_DEALLOC(x, _18);
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %1, %20 : int[]
		_21=x[_20];
		//const %22 = 65536 : int
		_22 = 65536;
		//ifeq %21, %22 goto blklab3 : int
		if(_21==_22){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = [120,91,48,93,32,61,32] : int[]
	_DEALLOC(_25);
	_NEW_1DARRAY(_25, 7, 0, uint16_t);
	_25[0] = 120; _25[1] = 91; _25[2] = 48; _25[3] = 93; _25[4] = 32; _25[5] = 61; _25[6] = 32; 
	_ADD_DEALLOC(_25);
	//indirectinvoke () = %24 (%25) : method(int[])->()
	{
		_PRINT_STR(_25);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = 0 : int
	_28 = 0;
	//indexof %29 = %1, %28 : int[]
	_29=x[_28];
	//indirectinvoke () = %27 (%29) : method(any)->()
	{
		printf("%"PRId64"\n", _29);
	}
	//assert
	{
		//const %30 = 0 : int
		_30 = 0;
		//indexof %31 = %1, %30 : int[]
		_31=x[_30];
		//const %32 = 65536 : int
		_32 = 65536;
		//ifeq %31, %32 goto blklab4 : int
		if(_31==_32){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//return
	_DEALLOC(x);
	_DEALLOC(tmp);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_13);
	_DEALLOC(_18);
	_DEALLOC(_25);
	exit(0);
}

