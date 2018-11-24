#include "testcase9.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	void* _14;
	_DECL_1DARRAY(_16);
	void* _17;
	int64_t _19;
	int64_t _20;
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	int64_t _26;
	int64_t _27;
	void* _28;
	_DECL_1DARRAY(_30);
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 5 : int
	_4 = 5;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _5);
	//assign %2 = %1  : int[]
	// isCopyEliminated = false
	_COPY_1DARRAY_int64_t(b, a);
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 0 : int
	_7 = 0;
	//update %2[%7] = %6 : int[] -> int[]
	b[_7] = _6;
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=a[_8];
		//const %10 = 0 : int
		_10 = 0;
		//ifeq %9, %10 goto blklab0 : int
		if(_9==_10){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %11 = 0 : int
		_11 = 0;
		//indexof %12 = %2, %11 : int[]
		_12=b[_11];
		//const %13 = 1 : int
		_13 = 1;
		//ifeq %12, %13 goto blklab1 : int
		if(_12==_13){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = [97,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_16, 7, 0);
	_16[0] = 97; _16[1] = 91; _16[2] = 48; _16[3] = 93; _16[4] = 32; _16[5] = 61; _16[6] = 32; 
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		printf_s(_16, _16_size);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 0 : int
	_19 = 0;
	//indexof %20 = %1, %19 : int[]
	_20=a[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	{
		printf("%"PRId64"\n", _20);
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [98,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_23, 7, 0);
	_23[0] = 98; _23[1] = 91; _23[2] = 48; _23[3] = 93; _23[4] = 32; _23[5] = 61; _23[6] = 32; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		printf_s(_23, _23_size);
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = 0 : int
	_26 = 0;
	//indexof %27 = %2, %26 : int[]
	_27=b[_26];
	//indirectinvoke () = %25 (%27) : method(any)->()
	{
		printf("%"PRId64"\n", _27);
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [80,97,115,115,32,108,105,118,101,99,104,101,99,107,49,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_30, 25, 0);
	_30[0] = 80; _30[1] = 97; _30[2] = 115; _30[3] = 115; _30[4] = 32; _30[5] = 108; _30[6] = 105; _30[7] = 118; _30[8] = 101; _30[9] = 99; _30[10] = 104; _30[11] = 101; _30[12] = 99; _30[13] = 107; _30[14] = 49; _30[15] = 32; _30[16] = 116; _30[17] = 101; _30[18] = 115; _30[19] = 116; _30[20] = 32; _30[21] = 99; _30[22] = 97; _30[23] = 115; _30[24] = 101; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	{
		printf_s(_30, _30_size);
	}
	//return
	exit(0);
}

