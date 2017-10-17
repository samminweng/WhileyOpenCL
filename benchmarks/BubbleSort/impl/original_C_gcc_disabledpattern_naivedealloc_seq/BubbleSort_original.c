#include "BubbleSort_original.h"
int64_t* _bubbleSort_(_DECL_1DARRAY_PARAM(items), _DECL_DEALLOC_PARAM(items), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t length;
	int64_t last_swapped;
	int64_t index;
	int64_t tmp;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	//lengthof %6 = %0 : int[]
	_6 = items_size;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 0 : int
	_7 = 0;
	//assign %3 = %7  : int
	last_swapped = _7;
	//loop (%0, %2, %3, %4, %5, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %8 = 0 : int
		_8 = 0;
		//ifle %2, %8 goto blklab0 : int
		if(length<=_8){goto blklab0;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %3 = %9  : int
		last_swapped = _9;
		//const %10 = 1 : int
		_10 = 1;
		//assign %4 = %10  : int
		index = _10;
		//loop (%0, %3, %4, %5, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//ifge %4, %2 goto blklab2 : int
			if(index>=length){goto blklab2;}
			//const %11 = 1 : int
			_11 = 1;
			//sub %12 = %4, %11 : int
			_12=index-_11;
			//indexof %13 = %0, %12 : int[]
			_13=items[_12];
			//indexof %14 = %0, %4 : int[]
			_14=items[index];
			//ifle %13, %14 goto blklab4 : int
			if(_13<=_14){goto blklab4;}
			//const %15 = 1 : int
			_15 = 1;
			//sub %16 = %4, %15 : int
			_16=index-_15;
			//indexof %17 = %0, %16 : int[]
			_17=items[_16];
			//assign %5 = %17  : int
			tmp = _17;
			//indexof %18 = %0, %4 : int[]
			_18=items[index];
			//const %19 = 1 : int
			_19 = 1;
			//sub %20 = %4, %19 : int
			_20=index-_19;
			//update %0[%20] = %18 : int[] -> int[]
			items[_20] = _18;
			//update %0[%4] = %5 : int[] -> int[]
			items[index] = tmp;
			//assign %3 = %4  : int
			last_swapped = index;
//.blklab4
blklab4:;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %4, %21 : int
			_22=index+_21;
			//assign %4 = %22  : int
			index = _22;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//assign %2 = %3  : int
		length = last_swapped;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max;
	int64_t index;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	void* _16;
	int64_t _18;
	int64_t _19;
	void* _20;
	int64_t _22;
	int64_t _23;
	int64_t _24;
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
	_NEW_INTEGER_POINTER(n, _5);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab5 : null|int
	if(n == NULL) { goto blklab5;}
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
	_COPY_1DARRAY_int64_t(arr, _11);
	_ADD_DEALLOC(arr);
	//loop (%3, %4, %12, %13, %14)
	while(true){
		//ifgt %3, %2 goto blklab6 : int
		if(index>max){goto blklab6;}
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
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//invoke (%15) = (%4) BubbleSort_original:bubbleSort : function(int[])->(int[])
	{
		void* tmp_arr_0;
		_COPY_1DARRAY_PARAM(arr, tmp_arr_0, int64_t);
		_DEALLOC(_15);
		_15 = _bubbleSort_(tmp_arr_0, arr_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_CALLER_DEALLOC(arr, "true-true-false" , "bubbleSort");
		_CALLER_DEALLOC_POST(_15, tmp_arr_0);
	}
	//assign %4 = %15  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY_int64_t(arr, _15);
	_ADD_DEALLOC(arr);
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
	//const %27 = [80,97,115,115,32,66,117,98,98,108,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 25, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 66; _27[6] = 117; _27[7] = 98; _27[8] = 98; _27[9] = 108; _27[10] = 101; _27[11] = 83; _27[12] = 111; _27[13] = 114; _27[14] = 116; _27[15] = 32; _27[16] = 116; _27[17] = 101; _27[18] = 115; _27[19] = 116; _27[20] = 32; _27[21] = 99; _27[22] = 97; _27[23] = 115; _27[24] = 101; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
//.blklab5
blklab5:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_5);
	_FREE_ARGS(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_27);
	exit(0);
}

