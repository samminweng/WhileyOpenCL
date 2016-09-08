#include "FunctionCall3.h"
long long* func(_DECL_1DARRAY_PARAM(s), _DECL_DEALLOC_PARAM(s)){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(t);
	_DECL_DEALLOC(t);
	//assign %2 = %0  : int[]
	_DEALLOC(t);
	_UPDATE_1DARRAY(t, s);
	_TRANSFER_DEALLOC(t, s);
	//return %2
	_DEALLOC(s);
	_DEALLOC(_1);
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
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	void* _17;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	void* _37;
	long long _39 = 0;
	long long _40 = 0;
	void* _41;
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	void* _44;
	long long _46 = 0;
	long long _47 = 0;
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
	_NEW_1DARRAY(_9, 5, 0, T_INT);
	_9[0] = _4; _9[1] = _5; _9[2] = _6; _9[3] = _7; _9[4] = _8; 
	_ADD_DEALLOC(_9);
	//assign %1 = %9  : int[]
	_DEALLOC(a);
	_UPDATE_1DARRAY(a, _9);
	_TRANSFER_DEALLOC(a, _9);
	//invoke (%10) = (%1) FunctionCall3:func : function(int[])->(int[])
	{
		_UPDATE_1DARRAY_SIZE(_10, a);
		_DEALLOC(_10);
		_10 = func(_1DARRAY_PARAM(a), false);
		_RESET_DEALLOC(a, "true-true-false" , "main");
		_ADD_DEALLOC(_10);
	}
	//assign %1 = %10  : int[]
	_DEALLOC(a);
	_UPDATE_1DARRAY(a, _10);
	_TRANSFER_DEALLOC(a, _10);
	//assert
	{
		//const %11 = 2 : int
		_11 = 2;
		//indexof %12 = %1, %11 : int[]
		_12=a[_11];
		//const %13 = 0 : int
		_13 = 0;
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
	_NEW_1DARRAY(_16, 5, 0, T_INT);
	_16[0] = 97; _16[1] = 91; _16[2] = 50; _16[3] = 93; _16[4] = 61; 
	_ADD_DEALLOC(_16);
	//indirectinvoke () = %15 (%16) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_16));
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 2 : int
	_19 = 2;
	//indexof %20 = %1, %19 : int[]
	_20=a[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	printf("%lld\n", _20);
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
	_NEW_1DARRAY(_26, 5, 0, T_INT);
	_26[0] = _21; _26[1] = _22; _26[2] = _23; _26[3] = _24; _26[4] = _25; 
	_ADD_DEALLOC(_26);
	//assign %2 = %26  : int[]
	_DEALLOC(b);
	_UPDATE_1DARRAY(b, _26);
	_TRANSFER_DEALLOC(b, _26);
	//invoke (%27) = (%2) FunctionCall3:func : function(int[])->(int[])
	{
		void* b_tmp;
		_UPDATE_1DARRAY_SIZE(_27, b);
		_DEALLOC(_27);
		_27 = func(b_tmp = _COPY_1DARRAY_PARAM(b, T_INT), false);
		_CALLER_DEALLOC(_27, b, "true-true-true" , "main");
		_ADD_DEALLOC(_27);
	}
	//assign %3 = %27  : int[]
	_DEALLOC(c);
	_UPDATE_1DARRAY(c, _27);
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
		//const %33 = 0 : int
		_33 = 0;
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
	_NEW_1DARRAY(_36, 5, 0, T_INT);
	_36[0] = 98; _36[1] = 91; _36[2] = 50; _36[3] = 93; _36[4] = 61; 
	_ADD_DEALLOC(_36);
	//indirectinvoke () = %35 (%36) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_36));
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %39 = 2 : int
	_39 = 2;
	//indexof %40 = %2, %39 : int[]
	_40=b[_39];
	//indirectinvoke () = %38 (%40) : method(any)->()
	printf("%lld\n", _40);
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [99,91,50,93,61] : int[]
	_DEALLOC(_43);
	_NEW_1DARRAY(_43, 5, 0, T_INT);
	_43[0] = 99; _43[1] = 91; _43[2] = 50; _43[3] = 93; _43[4] = 61; 
	_ADD_DEALLOC(_43);
	//indirectinvoke () = %42 (%43) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_43));
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %46 = 2 : int
	_46 = 2;
	//indexof %47 = %3, %46 : int[]
	_47=c[_46];
	//indirectinvoke () = %45 (%47) : method(any)->()
	printf("%lld\n", _47);
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

