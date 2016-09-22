#include "FunctionCall4.h"
int64_t* func(_DECL_1DARRAY_PARAM(s), _DECL_DEALLOC_PARAM(s), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(t);
	_DECL_DEALLOC(t);
	_DECL_1DARRAY(new_t);
	_DECL_DEALLOC(new_t);
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	//const %5 = 5 : int
	_5 = 5;
	//ifle %1, %5 goto blklab0 : int
	if(n<=_5){goto blklab0;}
	//assign %3 = %0  : int[]
	_DEALLOC(t);
	_COPY_1DARRAY_int64_t(t, s);
	_ADD_DEALLOC(t);
	//const %6 = 3 : int
	_6 = 3;
	//const %7 = 2 : int
	_7 = 2;
	//update %3[%7] = %6 : int[] -> int[]
	t[_7] = _6;
	//return %3
	_DEALLOC(s);
	_DEALLOC(_2);
	_DEALLOC(new_t);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(t);
	return t;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 1 : int
	_9 = 1;
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 1 : int
	_11 = 1;
	//const %12 = 1 : int
	_12 = 1;
	//newlist %13 = (%8, %9, %10, %11, %12) : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 5, 0);
	_13[0] = _8; _13[1] = _9; _13[2] = _10; _13[3] = _11; _13[4] = _12; 
	_ADD_DEALLOC(_13);
	//assign %4 = %13  : int[]
	_DEALLOC(new_t);
	_COPY_1DARRAY_int64_t(new_t, _13);
	_ADD_DEALLOC(new_t);
	//return %4
	_DEALLOC(s);
	_DEALLOC(_2);
	_DEALLOC(t);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(new_t);
	return new_t;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	void* _18;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	void* _36;
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	void* _39;
	int64_t _41 = 0;
	int64_t _42 = 0;
	void* _43;
	_DECL_1DARRAY(_45);
	_DECL_DEALLOC(_45);
	void* _46;
	int64_t _48 = 0;
	int64_t _49 = 0;
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
	_ADD_DEALLOC(_9);
	//assign %1 = %9  : int[]
	_DEALLOC(a);
	_COPY_1DARRAY_int64_t(a, _9);
	_ADD_DEALLOC(a);
	//const %11 = 6 : int
	_11 = 6;
	//invoke (%10) = (%1, %11) FunctionCall4:func : function(int[],int)->(int[])
	{
		void* a_tmp;
		_DEALLOC(_10);
		_10 = func(_COPY_1DARRAY_PARAM_int64_t(a), true, _11, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_CALLEE_DEALLOC(a, "false-false-false" , "func");
		_ADD_DEALLOC(_10);
	}
	//assign %1 = %10  : int[]
	_DEALLOC(a);
	_COPY_1DARRAY_int64_t(a, _10);
	_ADD_DEALLOC(a);
	//assert
	{
		//const %12 = 2 : int
		_12 = 2;
		//indexof %13 = %1, %12 : int[]
		_13=a[_12];
		//const %14 = 3 : int
		_14 = 3;
		//ifeq %13, %14 goto blklab2 : int
		if(_13==_14){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [97,91,50,93,61] : int[]
	_DEALLOC(_17);
	_NEW_1DARRAY_int64_t(_17, 5, 0);
	_17[0] = 97; _17[1] = 91; _17[2] = 50; _17[3] = 93; _17[4] = 61; 
	_ADD_DEALLOC(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_17));
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = 2 : int
	_20 = 2;
	//indexof %21 = %1, %20 : int[]
	_21=a[_20];
	//indirectinvoke () = %19 (%21) : method(any)->()
	{
		printf("%"PRId64"\n", _21);
	}
	//const %22 = 0 : int
	_22 = 0;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 0 : int
	_24 = 0;
	//const %25 = 0 : int
	_25 = 0;
	//const %26 = 0 : int
	_26 = 0;
	//newlist %27 = (%22, %23, %24, %25, %26) : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 5, 0);
	_27[0] = _22; _27[1] = _23; _27[2] = _24; _27[3] = _25; _27[4] = _26; 
	_ADD_DEALLOC(_27);
	//assign %2 = %27  : int[]
	_DEALLOC(b);
	_COPY_1DARRAY_int64_t(b, _27);
	_ADD_DEALLOC(b);
	//const %29 = 1 : int
	_29 = 1;
	//invoke (%28) = (%2, %29) FunctionCall4:func : function(int[],int)->(int[])
	{
		void* b_tmp;
		_DEALLOC(_28);
		_28 = func(_COPY_1DARRAY_PARAM_int64_t(b), true, _29, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_CALLEE_DEALLOC(b, "false-false-true" , "func");
		_ADD_DEALLOC(_28);
	}
	//assign %3 = %28  : int[]
	_DEALLOC(c);
	_COPY_1DARRAY_int64_t(c, _28);
	_ADD_DEALLOC(c);
	//assert
	{
		//const %30 = 2 : int
		_30 = 2;
		//indexof %31 = %2, %30 : int[]
		_31=b[_30];
		//const %32 = 0 : int
		_32 = 0;
		//ifeq %31, %32 goto blklab3 : int
		if(_31==_32){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %33 = 2 : int
		_33 = 2;
		//indexof %34 = %3, %33 : int[]
		_34=c[_33];
		//const %35 = 1 : int
		_35 = 1;
		//ifeq %34, %35 goto blklab4 : int
		if(_34==_35){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %38 = [98,91,50,93,61] : int[]
	_DEALLOC(_38);
	_NEW_1DARRAY_int64_t(_38, 5, 0);
	_38[0] = 98; _38[1] = 91; _38[2] = 50; _38[3] = 93; _38[4] = 61; 
	_ADD_DEALLOC(_38);
	//indirectinvoke () = %37 (%38) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_38));
	}
	//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %40 = %39 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %41 = 2 : int
	_41 = 2;
	//indexof %42 = %2, %41 : int[]
	_42=b[_41];
	//indirectinvoke () = %40 (%42) : method(any)->()
	{
		printf("%"PRId64"\n", _42);
	}
	//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %44 = %43 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %45 = [99,91,50,93,61] : int[]
	_DEALLOC(_45);
	_NEW_1DARRAY_int64_t(_45, 5, 0);
	_45[0] = 99; _45[1] = 91; _45[2] = 50; _45[3] = 93; _45[4] = 61; 
	_ADD_DEALLOC(_45);
	//indirectinvoke () = %44 (%45) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_45));
	}
	//fieldload %46 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %47 = %46 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %48 = 2 : int
	_48 = 2;
	//indexof %49 = %3, %48 : int[]
	_49=c[_48];
	//indirectinvoke () = %47 (%49) : method(any)->()
	{
		printf("%"PRId64"\n", _49);
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_DEALLOC(_17);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_38);
	_DEALLOC(_45);
	exit(0);
}

