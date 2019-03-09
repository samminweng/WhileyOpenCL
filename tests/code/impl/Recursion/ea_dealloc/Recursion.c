#include "Recursion.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), int64_t i, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	int64_t b1;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	int64_t _18;
	int64_t _19;
	//const %5 = 2 : int
	_5 = 2;
	//iflt %2, %5 goto blklab0 : int
	if(i<_5){goto blklab0;}
	//const %6 = 1 : int
	_6 = 1;
	//indexof %7 = %0, %6 : int[]
	_7=b[_6];
	//assign %4 = %7  : int
	b1 = _7;
	//const %9 = 1 : int
	_9 = 1;
	//sub %10 = %2, %9 : int
	_10=i-_9;
	//invoke (%8) = (%0, %1, %10) Recursion:func : function(int[],int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_8, c, 1, "liveness: c = false, readonly: c = true, return:c = MAYBE_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_8, b, 0, "liveness: b = true, readonly: b = true, return:b = NEVER_RETURN" , "func");
		_DEALLOC(_8);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_8 = _func_(tmp_b, b_size, tmp_c, c_size, _10, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		if( _8 == tmp_c ){
			_8_dealloc = true;
			free(tmp_b);
		} else {
			_8_dealloc = true;
			free(tmp_b);
			free(tmp_c);
		}
	}
	//assign %3 = %8  : int[]
	_ADD_DEALLOC(a, _8, int64_t);
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %0, %11 : int[]
	_12=b[_11];
	//const %13 = 1 : int
	_13 = 1;
	//update %3[%13] = %12 : int[] -> int[]
	a[_13] = _12;
	//assert
	{
		//const %14 = 1 : int
		_14 = 1;
		//indexof %15 = %0, %14 : int[]
		_15=b[_14];
		//ifeq %4, %15 goto blklab2 : int
		if(b1==_15){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//return %3
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_8);
	_DEALLOC(_17);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %16 = 1 : int
	_16 = 1;
	//ifne %2, %16 goto blklab3 : int
	if(i!=_16){goto blklab3;}
	//const %18 = 1 : int
	_18 = 1;
	//sub %19 = %2, %18 : int
	_19=i-_18;
	//invoke (%17) = (%1, %0, %19) Recursion:func : function(int[],int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_17, b, 1, "liveness: b = false, readonly: b = true, return:b = MAYBE_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_17, c, 0, "liveness: c = false, readonly: c = true, return:c = NEVER_RETURN" , "func");
		_DEALLOC(_17);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(c, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(b, tmp_c, int64_t);
		_17 = _func_(tmp_b, c_size, tmp_c, b_size, _19, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
		if( _17 == tmp_c ){
			_17_dealloc = true;
			free(tmp_b);
		} else {
			_17_dealloc = true;
			free(tmp_b);
			free(tmp_c);
		}
	}
	//assign %3 = %17  : int[]
	_ADD_DEALLOC(a, _17, int64_t);
	//return %3
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_8);
	_DEALLOC(_17);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab4
	goto blklab4;
//.blklab3
blklab3:;
	//return %1
	_DEALLOC(b);
	_DEALLOC(a);
	_DEALLOC(_8);
	_DEALLOC(_17);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab4
blklab4:;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t _3;
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	int64_t _18;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 1 : int
	_4 = 1;
	//const %5 = 2 : int
	_5 = 2;
	//newlist %6 = (%3, %4, %5) : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 3, 0);
	_6[0] = _3; _6[1] = _4; _6[2] = _5; 
	_6_dealloc = true;
	//assign %1 = %6  : int[]
	_ADD_DEALLOC(b, _6, int64_t);
	//const %7 = 3 : int
	_7 = 3;
	//const %8 = 4 : int
	_8 = 4;
	//const %9 = 5 : int
	_9 = 5;
	//newlist %10 = (%7, %8, %9) : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, 3, 0);
	_10[0] = _7; _10[1] = _8; _10[2] = _9; 
	_10_dealloc = true;
	//assign %2 = %10  : int[]
	_ADD_DEALLOC(c, _10, int64_t);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = 1 : int
	_14 = 1;
	//invoke (%13) = (%1, %2, %14) Recursion:func : function(int[],int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_13, c, 1, "liveness: c = true, readonly: c = true, return:c = MAYBE_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_13, b, 0, "liveness: b = true, readonly: b = true, return:b = NEVER_RETURN" , "func");
		_DEALLOC(_13);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_13 = _func_(tmp_b, b_size, tmp_c, c_size, _14, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
		if( _13 == tmp_c ){
			_13_dealloc = true;
			free(tmp_b);
		} else {
			_13_dealloc = true;
			free(tmp_b);
			free(tmp_c);
		}
	}
	//indirectinvoke () = %12 (%13) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(_13);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = 2 : int
	_18 = 2;
	//invoke (%17) = (%1, %2, %18) Recursion:func : function(int[],int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_17, c, 1, "liveness: c = false, readonly: c = true, return:c = MAYBE_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_17, b, 0, "liveness: b = false, readonly: b = true, return:b = NEVER_RETURN" , "func");
		_DEALLOC(_17);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_17 = _func_(tmp_b, b_size, tmp_c, c_size, _18, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
		if( _17 == tmp_c ){
			_17_dealloc = true;
			free(tmp_b);
		} else {
			_17_dealloc = true;
			free(tmp_b);
			free(tmp_c);
		}
	}
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(_17);
	}
	//return
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_6);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_17);
	exit(0);
}

