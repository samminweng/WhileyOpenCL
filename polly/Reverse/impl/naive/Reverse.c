#include "Reverse.h"
long long* reverse(_DECL_1DARRAY_PARAM(ls)){
	_DECL_1DARRAY(_1);
	long long i = 0;
	_DECL_1DARRAY(r);
	long long item = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	//lengthof %5 = %0 : int[]
	_5 = ls_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = ls_size;
	//arraygen %8 = [6; 7] : int[]
	_GEN_1DARRAY(_8, _7, _6);
	//assign %3 = %8  : int[]
	_1DARRAY_COPY(r, _8);
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
			//return
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
	return r;
	//return
}

int main(int argc, char** args){
	long long max;
	long long index = 0;
	_DECL_1DARRAY(arr);
	long long _4;
	_DECL_2DARRAY(_5);
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	_DECL_1DARRAY(_16);
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	//invoke (%4) = (%7) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_4, _7);
	//assign %1 = %4  : null|int
	max = _4;
	//ifis %1, null goto blklab4 : null|int
	if(max == NULL) { goto blklab4;}
	//const %8 = 0 : int
	_8 = 0;
	//assign %2 = %8  : int
	index = _8;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %1, %10 : int
	_11=max+_10;
	//arraygen %12 = [9; 11] : int[]
	_GEN_1DARRAY(_12, _11, _9);
	//assign %3 = %12  : int[]
	_1DARRAY_COPY(arr, _12);
	//loop (%2, %3, %13, %14, %15)
	while(true){
		//ifgt %2, %1 goto blklab5 : int
		if(index>max){goto blklab5;}
		//sub %13 = %1, %2 : int
		_13=max-index;
		//update %3[%2] = %13 : int[] -> int[]
		arr[index] = _13;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %2, %14 : int
		_15=index+_14;
		//assign %2 = %15  : int
		index = _15;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//invoke (%16) = (%3) Reverse:reverse : function(int[])->(int[])
	_1DARRAY_SIZE(_16, arr);
	_16 = reverse(_1DARRAY_COPY_PARAM(arr));
	//assign %3 = %16  : int[]
	_1DARRAY_COPY(arr, _16);
	//assert
	{
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %3, %17 : int[]
		_18=arr[_17];
		//const %19 = 0 : int
		_19 = 0;
		//ifeq %18, %19 goto blklab7 : int
		if(_18==_19){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//assert
	{
		//indexof %20 = %3, %1 : int[]
		_20=arr[max];
		//ifeq %20, %1 goto blklab8 : int
		if(_20==max){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_NEW_ARRAY(_23, 36);
	_23[0] = 80; _23[1] = 97; _23[2] = 115; _23[3] = 115; _23[4] = 32; _23[5] = 82; _23[6] = 101; _23[7] = 118; _23[8] = 101; _23[9] = 114; _23[10] = 115; _23[11] = 101; _23[12] = 32; _23[13] = 116; _23[14] = 101; _23[15] = 115; _23[16] = 116; _23[17] = 32; _23[18] = 99; _23[19] = 97; _23[20] = 115; _23[21] = 101; _23[22] = 32; _23[23] = 119; _23[24] = 105; _23[25] = 116; _23[26] = 104; _23[27] = 32; _23[28] = 105; _23[29] = 110; _23[30] = 112; _23[31] = 117; _23[32] = 116; _23[33] = 32; _23[34] = 61; _23[35] = 32; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %25 (%1) : method(any)->()
	printf("%d\n", max);
//.blklab4
blklab4:;
	//return
	exit(0);
}

