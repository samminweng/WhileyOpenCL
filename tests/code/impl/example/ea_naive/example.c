#include "example.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(c);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %3 = %6  : int[]
	_COPY_1DARRAY_int64_t(c, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	b[_8] = num;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(tmp);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	void* _14;
	int64_t _16;
	int64_t _17;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY_int64_t(b, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) example:func : function(int[],int)->(int[])
	{
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		_6 = _func_(tmp_b, b_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY_int64_t(tmp, _6);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=b[_8];
		//const %10 = 2 : int
		_10 = 2;
		//ifeq %9, %10 goto blklab2 : int
		if(_9==_10){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//assert
	{
		//const %11 = 0 : int
		_11 = 0;
		//indexof %12 = %2, %11 : int[]
		_12=tmp[_11];
		//const %13 = 11 : int
		_13 = 11;
		//ifeq %12, %13 goto blklab3 : int
		if(_12==_13){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %1, %16 : int[]
	_17=b[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//return
	exit(0);
}

