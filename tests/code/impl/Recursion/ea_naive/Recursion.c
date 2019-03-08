#include "Recursion.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), int64_t i, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(a);
	int64_t b1;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	_DECL_1DARRAY(_17);
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
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_8 = _func_(tmp_b, b_size, tmp_c, c_size, _10, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_int64_t(a, _8);
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
		void* tmp_b;
		_COPY_1DARRAY_PARAM(c, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(b, tmp_c, int64_t);
		_17 = _func_(tmp_b, c_size, tmp_c, b_size, _19, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
	}
	//assign %3 = %17  : int[]
	_COPY_1DARRAY_int64_t(a, _17);
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab4
	goto blklab4;
//.blklab3
blklab3:;
	//return %1
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
	_DECL_1DARRAY(c);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	int64_t _18;
	void* _19;
	_DECL_1DARRAY(_21);
	int64_t _22;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY_int64_t(b, _5);
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 3 : int
	_7 = 3;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %2 = %8  : int[]
	_COPY_1DARRAY_int64_t(c, _8);
	//assert
	{
		//const %10 = 0 : int
		_10 = 0;
		//invoke (%9) = (%1, %2, %10) Recursion:func : function(int[],int[],int)->(int[])
		{
			void* tmp_b;
			_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
			void* tmp_c;
			_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
			_9 = _func_(tmp_b, b_size, tmp_c, c_size, _10, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_9));
		}
		//const %11 = 1 : int
		_11 = 1;
		//const %12 = 1 : int
		_12 = 1;
		//const %13 = 1 : int
		_13 = 1;
		//newlist %14 = (%11, %12, %13) : int[]
		_NEW_1DARRAY_int64_t(_14, 3, 0);
		_14[0] = _11; _14[1] = _12; _14[2] = _13; 
		//ifeq %9, %14 goto blklab5 : int[]
		_IFEQ_ARRAY_int64_t(_9, _14, blklab5);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = 1 : int
	_18 = 1;
	//invoke (%17) = (%1, %2, %18) Recursion:func : function(int[],int[],int)->(int[])
	{
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_17 = _func_(tmp_b, b_size, tmp_c, c_size, _18, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
	}
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(_17);
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = 2 : int
	_22 = 2;
	//invoke (%21) = (%1, %2, %22) Recursion:func : function(int[],int[],int)->(int[])
	{
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		_21 = _func_(tmp_b, b_size, tmp_c, c_size, _22, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_21));
	}
	//indirectinvoke () = %20 (%21) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(_21);
	}
	//return
	exit(0);
}

