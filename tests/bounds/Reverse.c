#include "Reverse.h"
int64_t* reverse(_DECL_1DARRAY_PARAM(ls), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	int64_t i = 0;
	_DECL_1DARRAY(r);
	int64_t item = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = ls_size;
	//arraygen %8 = [6; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_int64_t(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//invariant
		{
			//lengthof %9 = %0 : int[]
			_9 = ls_size;
			//ifgt %2, %9 goto blklab3 : int
			if(i>_9){goto blklab3;}
			//lengthof %10 = %3 : int[]
			_10 = r_size;
			//lengthof %11 = %0 : int[]
			_11 = ls_size;
			//ifeq %10, %11 goto blklab2 : int
			if(_10==_11){goto blklab2;}
//.blklab3
blklab3:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab2
blklab2:;
		//invariant
		}
		//const %12 = 0 : int
		_12 = 0;
		//ifle %2, %12 goto blklab0 : int
		if(i<=_12){goto blklab0;}
		//lengthof %13 = %0 : int[]
		_13 = ls_size;
		//sub %14 = %13, %2 : int
		_14=_13-i;
		//indexof %15 = %0, %14 : int[]
		_15=ls[_14];
		//assign %4 = %15  : int
		item = _15;
		//const %16 = 1 : int
		_16 = 1;
		//sub %17 = %2, %16 : int
		_17=i-_16;
		//assign %2 = %17  : int
		i = _17;
		//update %3[%2] = %4 : int[] -> int[]
		r[i] = item;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(rs);
	_DECL_1DARRAY(rs2);
	_DECL_1DARRAY(_3);
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	void* _16;
	_DECL_1DARRAY(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	_DECL_1DARRAY(_29);
	void* _30;
	//const %4 = 1 : int
	_4 = 1;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 3 : int
	_6 = 3;
	//const %7 = 4 : int
	_7 = 4;
	//const %8 = 5 : int
	_8 = 5;
	//newlist %9 = (%4, %5, %6, %7, %8) : int[]
	_NEW_1DARRAY_int64_t(_9, 5, 0);
	_9[0] = _4; _9[1] = _5; _9[2] = _6; _9[3] = _7; _9[4] = _8; 
	//invoke (%3) = (%9) Reverse:reverse : function(int[])->(int[])
	{
		void* _9_tmp;
		_3 = reverse(_COPY_1DARRAY_PARAM_int64_t(_9), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
	}
	//assign %1 = %3  : int[]
	_COPY_1DARRAY_int64_t(rs, _3);
	//assert
	{
		//const %10 = 5 : int
		_10 = 5;
		//const %11 = 4 : int
		_11 = 4;
		//const %12 = 3 : int
		_12 = 3;
		//const %13 = 2 : int
		_13 = 2;
		//const %14 = 1 : int
		_14 = 1;
		//newlist %15 = (%10, %11, %12, %13, %14) : int[]
		_NEW_1DARRAY_int64_t(_15, 5, 0);
		_15[0] = _10; _15[1] = _11; _15[2] = _12; _15[3] = _13; _15[4] = _14; 
		//ifeq %1, %15 goto blklab4 : int[]
		_IFEQ_ARRAY(rs, _15, blklab4);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %17 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(rs);
	}
	//const %19 = 1 : int
	_19 = 1;
	//const %20 = 2 : int
	_20 = 2;
	//const %21 = 3 : int
	_21 = 3;
	//const %22 = 4 : int
	_22 = 4;
	//const %23 = 5 : int
	_23 = 5;
	//const %24 = 6 : int
	_24 = 6;
	//const %25 = 7 : int
	_25 = 7;
	//const %26 = 8 : int
	_26 = 8;
	//const %27 = 9 : int
	_27 = 9;
	//const %28 = 10 : int
	_28 = 10;
	//newlist %29 = (%19, %20, %21, %22, %23, %24, %25, %26, %27, %28) : int[]
	_NEW_1DARRAY_int64_t(_29, 10, 0);
	_29[0] = _19; _29[1] = _20; _29[2] = _21; _29[3] = _22; _29[4] = _23; _29[5] = _24; _29[6] = _25; _29[7] = _26; _29[8] = _27; _29[9] = _28; 
	//invoke (%18) = (%29) Reverse:reverse : function(int[])->(int[])
	{
		void* _29_tmp;
		_18 = reverse(_COPY_1DARRAY_PARAM_int64_t(_29), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
	}
	//assign %2 = %18  : int[]
	_COPY_1DARRAY_int64_t(rs2, _18);
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %31 (%2) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(rs2);
	}
	//return
	exit(0);
}

