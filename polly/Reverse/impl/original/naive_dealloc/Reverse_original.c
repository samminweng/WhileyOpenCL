#include "Reverse_original.h"
long long* reverse(_DECL_1DARRAY_PARAM(ls), _DECL_DEALLOC_PARAM(ls)){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	long long i = 0;
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	long long item = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
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
	_DEALLOC(_8);
	_NEW_1DARRAY(_8, _7, _6);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[]
	_DEALLOC(r);
	_COPY_1DARRAY(r, _8);
	_ADD_DEALLOC(r);
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
	_DEALLOC(ls);
	_DEALLOC(_1);
	_DEALLOC(_8);
	return r;
	//return
}

int main(int argc, char** args){
	long long* n;
	_DECL_DEALLOC(n);
	long long max = 0;
	long long index = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	long long* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	void* _16;
	long long _18 = 0;
	long long _19 = 0;
	void* _20;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DArray(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	_ADD_DEALLOC(_5);
	_REMOVE_DEALLOC(_8);
	//assign %1 = %5  : null|int
	_DEALLOC(n);
	n = _5;
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab4 : null|int
	if(n == NULL) { goto blklab4;}
	//assign %2 = %1  : int
	max = *n;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	index = _9;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [10; 2] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY(_11, max, _10);
	_ADD_DEALLOC(_11);
	//assign %4 = %11  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY(arr, _11);
	_ADD_DEALLOC(arr);
	//loop (%3, %4, %12, %13, %14)
	while(true){
		//ifge %3, %2 goto blklab5 : int
		if(index>=max){goto blklab5;}
		//sub %12 = %2, %3 : int
		_12=max-index;
		//update %4[%3] = %12 : int[] -> int[]
		arr[index] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %3, %13 : int
		_14=index+_13;
		//assign %3 = %14  : int
		index = _14;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//invoke (%15) = (%4) Reverse_original:reverse : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_15, arr);
	_DEALLOC(_15);
	_15 = reverse(_COPY_1DARRAY_PARAM(arr), true);
	_ADD_DEALLOC(arr);
	_ADD_DEALLOC(_15);
	//assign %4 = %15  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY(arr, _15);
	_ADD_DEALLOC(arr);
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = 0 : int
	_18 = 0;
	//indexof %19 = %4, %18 : int[]
	_19=arr[_18];
	//indirectinvoke () = %17 (%19) : method(any)->()
	printf("%lld\n", _19);
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = 1 : int
	_22 = 1;
	//sub %23 = %2, %22 : int
	_23=max-_22;
	//indexof %24 = %4, %23 : int[]
	_24=arr[_23];
	//indirectinvoke () = %21 (%24) : method(any)->()
	printf("%lld\n", _24);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY(_27, 22, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 82; _27[6] = 101; _27[7] = 118; _27[8] = 101; _27[9] = 114; _27[10] = 115; _27[11] = 101; _27[12] = 32; _27[13] = 116; _27[14] = 101; _27[15] = 115; _27[16] = 116; _27[17] = 32; _27[18] = 99; _27[19] = 97; _27[20] = 115; _27[21] = 101; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	println_s(_27, _27_size);
//.blklab4
blklab4:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_5);
	_DEALLOC_2DArray(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_27);
	exit(0);
}
