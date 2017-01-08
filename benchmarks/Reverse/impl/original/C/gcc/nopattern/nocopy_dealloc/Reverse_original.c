#include "Reverse_original.h"
int64_t* _reverse_(_DECL_1DARRAY_PARAM(arr), _DECL_DEALLOC_PARAM(arr), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t i = 0;
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t item = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
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
	_5 = arr_size;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//lengthof %7 = %0 : int[]
	_7 = arr_size;
	//arraygen %8 = [6; 7] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : int[]
	_DEALLOC(r);
	_UPDATE_1DARRAY(r, _8);
	_TRANSFER_DEALLOC(r, _8);
	//loop (%2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//const %12 = 0 : int
		_12 = 0;
		//ifle %2, %12 goto blklab0 : int
		if(i<=_12){goto blklab0;}
		//lengthof %13 = %0 : int[]
		_13 = arr_size;
		//sub %14 = %13, %2 : int
		_14=_13-i;
		//indexof %15 = %0, %14 : int[]
		_15=arr[_14];
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
	_DEALLOC(arr);
	_DEALLOC(_1);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max = 0;
	int64_t index = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	void* _16;
	int64_t _18 = 0;
	int64_t _19 = 0;
	void* _20;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
		_ADD_DEALLOC(_5);
		_REMOVE_DEALLOC(_8);
	}
	//assign %1 = %5  : null|int
	_DEALLOC(n);
	n = _5;
	_TRANSFER_DEALLOC(n, _5);
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
	_NEW_1DARRAY_int64_t(_11, max, _10);
	_ADD_DEALLOC(_11);
	//assign %4 = %11  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _11);
	_TRANSFER_DEALLOC(arr, _11);
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
	{
		_DEALLOC(_15);
		_15 = _reverse_(_1DARRAY_PARAM(arr), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_RETAIN_DEALLOC(arr, "false-false-false" , "reverse");
		_ADD_DEALLOC(_15);
	}
	//assign %4 = %15  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _15);
	_TRANSFER_DEALLOC(arr, _15);
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = 0 : int
	_18 = 0;
	//indexof %19 = %4, %18 : int[]
	_19=arr[_18];
	//indirectinvoke () = %17 (%19) : method(any)->()
	{
		printf("%"PRId64"\n", _19);
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = 1 : int
	_22 = 1;
	//sub %23 = %2, %22 : int
	_23=max-_22;
	//indexof %24 = %4, %23 : int[]
	_24=arr[_23];
	//indirectinvoke () = %21 (%24) : method(any)->()
	{
		printf("%"PRId64"\n", _24);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [80,97,115,115,32,82,101,118,101,114,115,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 22, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 82; _27[6] = 101; _27[7] = 118; _27[8] = 101; _27[9] = 114; _27[10] = 115; _27[11] = 101; _27[12] = 32; _27[13] = 116; _27[14] = 101; _27[15] = 115; _27[16] = 116; _27[17] = 32; _27[18] = 99; _27[19] = 97; _27[20] = 115; _27[21] = 101; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
//.blklab4
blklab4:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_5);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_27);
	exit(0);
}

