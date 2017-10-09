#include "livecheck.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(c);
	_DECL_1DARRAY(d);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
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
	void* _31;
	int64_t _33;
	int64_t _34;
	void* _35;
	_DECL_1DARRAY(_37);
	void* _38;
	int64_t _40;
	int64_t _41;
	void* _42;
	_DECL_1DARRAY(_44);
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 5 : int
	_6 = 5;
	//arraygen %7 = [5; 6] : int[]
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _7);
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 5 : int
	_9 = 5;
	//arraygen %10 = [8; 9] : int[]
	_NEW_1DARRAY_int64_t(_10, _9, _8);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _10);
	//assign %1 = %2  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, b);
	//assign %3 = %2  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, b);
	//assign %4 = %2  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(d, b);
	//const %11 = 2 : int
	_11 = 2;
	//const %12 = 5 : int
	_12 = 5;
	//arraygen %13 = [11; 12] : int[]
	_NEW_1DARRAY_int64_t(_13, _12, _11);
	//assign %2 = %13  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _13);
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
	//const %30 = [99,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_30, 7, 0);
	_30[0] = 99; _30[1] = 91; _30[2] = 48; _30[3] = 93; _30[4] = 32; _30[5] = 61; _30[6] = 32; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	{
		printf_s(_30, _30_size);
	}
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = 0 : int
	_33 = 0;
	//indexof %34 = %3, %33 : int[]
	_34=c[_33];
	//indirectinvoke () = %32 (%34) : method(any)->()
	{
		printf("%"PRId64"\n", _34);
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %37 = [100,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_37, 7, 0);
	_37[0] = 100; _37[1] = 91; _37[2] = 48; _37[3] = 93; _37[4] = 32; _37[5] = 61; _37[6] = 32; 
	//indirectinvoke () = %36 (%37) : method(int[])->()
	{
		printf_s(_37, _37_size);
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %40 = 0 : int
	_40 = 0;
	//indexof %41 = %4, %40 : int[]
	_41=d[_40];
	//indirectinvoke () = %39 (%41) : method(any)->()
	{
		printf("%"PRId64"\n", _41);
	}
	//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %43 = %42 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %44 = [80,97,115,115,32,108,105,118,101,99,104,101,99,107,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_44, 24, 0);
	_44[0] = 80; _44[1] = 97; _44[2] = 115; _44[3] = 115; _44[4] = 32; _44[5] = 108; _44[6] = 105; _44[7] = 118; _44[8] = 101; _44[9] = 99; _44[10] = 104; _44[11] = 101; _44[12] = 99; _44[13] = 107; _44[14] = 32; _44[15] = 116; _44[16] = 101; _44[17] = 115; _44[18] = 116; _44[19] = 32; _44[20] = 99; _44[21] = 97; _44[22] = 115; _44[23] = 101; 
	//indirectinvoke () = %43 (%44) : method(int[])->()
	{
		printf_s(_44, _44_size);
	}
	//return
	exit(0);
}

