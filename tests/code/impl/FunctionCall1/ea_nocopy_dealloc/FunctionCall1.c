#include "FunctionCall1.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(s), _DECL_DEALLOC_PARAM(s), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(t);
	_DECL_DEALLOC(t);
	int64_t _3;
	int64_t _4;
	//assign %2 = %0  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(t, s);
	//const %3 = 3 : int
	_3 = 3;
	//const %4 = 2 : int
	_4 = 2;
	//update %2[%4] = %3 : int[] -> int[]
	t[_4] = _3;
	//return %2
	_DEALLOC(s);
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(t);
	return t;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	void* _17;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	void* _37;
	int64_t _39;
	int64_t _40;
	void* _41;
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	void* _44;
	int64_t _46;
	int64_t _47;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//newlist %9 = (%4, %5, %6, %7, %8) : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, 5, 0);
	_9[0] = _4; _9[1] = _5; _9[2] = _6; _9[3] = _7; _9[4] = _8; 
	_9_dealloc = true;
	//assign %1 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _9);
	//invoke (%10) = (%1) FunctionCall1:func : function(int[])->(int[])
	{
		_RESET_DEALLOC(_10, a, "true-true-false" , "func");
		_DEALLOC(_10);
		// isCopyEliminated of '_1' = true
		_10 = _func_(a, a_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_RESET_DEALLOC_POST(_10, a);
	}
	//assign %1 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _10);
	//assert
	{
		//const %11 = 2 : int
		_11 = 2;
		//indexof %12 = %1, %11 : int[]
		_12=a[_11];
		//const %13 = 3 : int
		_13 = 3;
		//ifeq %12, %13 goto blklab0 : int
		if(_12==_13){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = [97,91,50,93,61] : int[]
	_DEALLOC(_16);
	_NEW_1DARRAY_int64_t(_16, 5, 0);
	_16[0] = 97; _16[1] = 91; _16[2] = 50; _16[3] = 93; _16[4] = 61; 
	_16_dealloc = true;
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		printf_s(_16, _16_size);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 2 : int
	_19 = 2;
	//indexof %20 = %1, %19 : int[]
	_20=a[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	{
		printf("%"PRId64"\n", _20);
	}
	//const %21 = 0 : int
	_21 = 0;
	//const %22 = 0 : int
	_22 = 0;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 0 : int
	_24 = 0;
	//const %25 = 0 : int
	_25 = 0;
	//newlist %26 = (%21, %22, %23, %24, %25) : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 5, 0);
	_26[0] = _21; _26[1] = _22; _26[2] = _23; _26[3] = _24; _26[4] = _25; 
	_26_dealloc = true;
	//assign %2 = %26  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _26);
	//invoke (%27) = (%2) FunctionCall1:func : function(int[])->(int[])
	{
		_CALLER_DEALLOC(_27, b, "true-true-true" , "func");
		void* tmp_s;
		_COPY_1DARRAY_PARAM(b, tmp_s, int64_t);
		_DEALLOC(_27);
		// isCopyEliminated of '_2' = false
		_27 = _func_(tmp_s, b_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_27));
		_CALLER_DEALLOC_POST(_27, tmp_s);
	}
	//assign %3 = %27  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _27);
	//assert
	{
		//const %28 = 2 : int
		_28 = 2;
		//indexof %29 = %2, %28 : int[]
		_29=b[_28];
		//const %30 = 0 : int
		_30 = 0;
		//ifeq %29, %30 goto blklab1 : int
		if(_29==_30){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//assert
	{
		//const %31 = 2 : int
		_31 = 2;
		//indexof %32 = %3, %31 : int[]
		_32=c[_31];
		//const %33 = 3 : int
		_33 = 3;
		//ifeq %32, %33 goto blklab2 : int
		if(_32==_33){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [98,91,50,93,61] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY_int64_t(_36, 5, 0);
	_36[0] = 98; _36[1] = 91; _36[2] = 50; _36[3] = 93; _36[4] = 61; 
	_36_dealloc = true;
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		printf_s(_36, _36_size);
	}
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %39 = 2 : int
	_39 = 2;
	//indexof %40 = %2, %39 : int[]
	_40=b[_39];
	//indirectinvoke () = %38 (%40) : method(any)->()
	{
		printf("%"PRId64"\n", _40);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [99,91,50,93,61] : int[]
	_DEALLOC(_43);
	_NEW_1DARRAY_int64_t(_43, 5, 0);
	_43[0] = 99; _43[1] = 91; _43[2] = 50; _43[3] = 93; _43[4] = 61; 
	_43_dealloc = true;
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		printf_s(_43, _43_size);
	}
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %46 = 2 : int
	_46 = 2;
	//indexof %47 = %3, %46 : int[]
	_47=c[_46];
	//indirectinvoke () = %45 (%47) : method(any)->()
	{
		printf("%"PRId64"\n", _47);
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_DEALLOC(_16);
	_DEALLOC(_26);
	_DEALLOC(_27);
	_DEALLOC(_36);
	_DEALLOC(_43);
	exit(0);
}

