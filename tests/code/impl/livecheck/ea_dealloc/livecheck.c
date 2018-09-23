#include "livecheck.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(d);
	_DECL_DEALLOC(d);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	void* _26;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	void* _29;
	int64_t _31;
	int64_t _32;
	void* _33;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	void* _36;
	int64_t _38;
	int64_t _39;
	void* _40;
	_DECL_1DARRAY(_42);
	_DECL_DEALLOC(_42);
	void* _43;
	int64_t _45;
	int64_t _46;
	void* _47;
	_DECL_1DARRAY(_49);
	_DECL_DEALLOC(_49);
	void* _50;
	int64_t _52;
	int64_t _53;
	void* _54;
	_DECL_1DARRAY(_56);
	_DECL_DEALLOC(_56);
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 5 : int
	_6 = 5;
	//arraygen %7 = [5; 6] : int[]
	_DEALLOC(_7);
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	_NEW1DARRAY_DEALLOC(_7, _5, _6);
	//assign %1 = %7  : int[]
	_ADD_DEALLOC(a, _7, int64_t);
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 5 : int
	_9 = 5;
	//arraygen %10 = [8; 9] : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, _9, _8);
	_NEW1DARRAY_DEALLOC(_10, _8, _9);
	//assign %2 = %10  : int[]
	_ADD_DEALLOC(b, _10, int64_t);
	//assign %1 = %2  : int[]
	_ADD_DEALLOC(a, b, int64_t);
	//assign %3 = %2  : int[]
	_ADD_DEALLOC(c, b, int64_t);
	//assign %4 = %2  : int[]
	_ADD_DEALLOC(d, b, int64_t);
	//const %11 = 2 : int
	_11 = 2;
	//const %12 = 5 : int
	_12 = 5;
	//arraygen %13 = [11; 12] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, _12, _11);
	_NEW1DARRAY_DEALLOC(_13, _11, _12);
	//assign %2 = %13  : int[]
	_ADD_DEALLOC(b, _13, int64_t);
	//assert
	{
		//const %14 = 0 : int
		_14 = 0;
		//indexof %15 = %1, %14 : int[]
		_15=a[_14];
		//const %16 = 1 : int
		_16 = 1;
		//ifeq %15, %16 goto blklab0 : int
		if(_15==_16){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %2, %17 : int[]
		_18=b[_17];
		//const %19 = 2 : int
		_19 = 2;
		//ifeq %18, %19 goto blklab1 : int
		if(_18==_19){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %3, %20 : int[]
		_21=c[_20];
		//const %22 = 1 : int
		_22 = 1;
		//ifeq %21, %22 goto blklab2 : int
		if(_21==_22){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//assert
	{
		//const %23 = 0 : int
		_23 = 0;
		//indexof %24 = %4, %23 : int[]
		_24=d[_23];
		//const %25 = 1 : int
		_25 = 1;
		//ifeq %24, %25 goto blklab3 : int
		if(_24==_25){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [97,91,48,93,32,61,32] : int[]
	_DEALLOC(_28);
	_NEW_1DARRAY_int64_t(_28, 7, 0);
	_28[0] = 97; _28[1] = 91; _28[2] = 48; _28[3] = 93; _28[4] = 32; _28[5] = 61; _28[6] = 32; 
	_28_dealloc = true;
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		printf_s(_28, _28_size);
	}
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = 0 : int
	_31 = 0;
	//indexof %32 = %1, %31 : int[]
	_32=a[_31];
	//indirectinvoke () = %30 (%32) : method(any)->()
	{
		printf("%"PRId64"\n", _32);
	}
	//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %35 = [98,91,48,93,32,61,32] : int[]
	_DEALLOC(_35);
	_NEW_1DARRAY_int64_t(_35, 7, 0);
	_35[0] = 98; _35[1] = 91; _35[2] = 48; _35[3] = 93; _35[4] = 32; _35[5] = 61; _35[6] = 32; 
	_35_dealloc = true;
	//indirectinvoke () = %34 (%35) : method(int[])->()
	{
		printf_s(_35, _35_size);
	}
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %38 = 0 : int
	_38 = 0;
	//indexof %39 = %2, %38 : int[]
	_39=b[_38];
	//indirectinvoke () = %37 (%39) : method(any)->()
	{
		printf("%"PRId64"\n", _39);
	}
	//fieldload %40 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %41 = %40 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %42 = [99,91,48,93,32,61,32] : int[]
	_DEALLOC(_42);
	_NEW_1DARRAY_int64_t(_42, 7, 0);
	_42[0] = 99; _42[1] = 91; _42[2] = 48; _42[3] = 93; _42[4] = 32; _42[5] = 61; _42[6] = 32; 
	_42_dealloc = true;
	//indirectinvoke () = %41 (%42) : method(int[])->()
	{
		printf_s(_42, _42_size);
	}
	//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %44 = %43 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %45 = 0 : int
	_45 = 0;
	//indexof %46 = %3, %45 : int[]
	_46=c[_45];
	//indirectinvoke () = %44 (%46) : method(any)->()
	{
		printf("%"PRId64"\n", _46);
	}
	//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %48 = %47 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %49 = [100,91,48,93,32,61,32] : int[]
	_DEALLOC(_49);
	_NEW_1DARRAY_int64_t(_49, 7, 0);
	_49[0] = 100; _49[1] = 91; _49[2] = 48; _49[3] = 93; _49[4] = 32; _49[5] = 61; _49[6] = 32; 
	_49_dealloc = true;
	//indirectinvoke () = %48 (%49) : method(int[])->()
	{
		printf_s(_49, _49_size);
	}
	//fieldload %50 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %51 = %50 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %52 = 0 : int
	_52 = 0;
	//indexof %53 = %4, %52 : int[]
	_53=d[_52];
	//indirectinvoke () = %51 (%53) : method(any)->()
	{
		printf("%"PRId64"\n", _53);
	}
	//fieldload %54 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %55 = %54 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %56 = [80,97,115,115,32,108,105,118,101,99,104,101,99,107,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_56);
	_NEW_1DARRAY_int64_t(_56, 24, 0);
	_56[0] = 80; _56[1] = 97; _56[2] = 115; _56[3] = 115; _56[4] = 32; _56[5] = 108; _56[6] = 105; _56[7] = 118; _56[8] = 101; _56[9] = 99; _56[10] = 104; _56[11] = 101; _56[12] = 99; _56[13] = 107; _56[14] = 32; _56[15] = 116; _56[16] = 101; _56[17] = 115; _56[18] = 116; _56[19] = 32; _56[20] = 99; _56[21] = 97; _56[22] = 115; _56[23] = 101; 
	_56_dealloc = true;
	//indirectinvoke () = %55 (%56) : method(int[])->()
	{
		printf_s(_56, _56_size);
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(d);
	_DEALLOC(_7);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_28);
	_DEALLOC(_35);
	_DEALLOC(_42);
	_DEALLOC(_49);
	_DEALLOC(_56);
	exit(0);
}

