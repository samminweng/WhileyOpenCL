#include "BubbleSort_original.h"
int64_t* _bubbleSort_(_DECL_1DARRAY_PARAM(items), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(items);
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
	int64_t size;
	int64_t repeats;
	int64_t index;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t* _7;
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	void* _25;
	int64_t _27;
	int64_t _28;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	void* _32;
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY(_8);
	_CONV_ARGS(_8);
	_8_dealloc = true;
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	_10_dealloc = false;
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
		_7_dealloc = true;
		_10_dealloc = false;
	}
	//assign %1 = %7  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _7);
	_ADD_DEALLOC_POST(n, _7);
	//ifis %1, null goto blklab5 : null|int
	if(n == NULL) { goto blklab5;}
	//const %11 = 1 : int
	_11 = 1;
	//assign %2 = %11  : int
	max = _11;
	//assign %3 = %1  : int
	size = *n;
	//const %12 = 0 : int
	_12 = 0;
	//assign %4 = %12  : int
	repeats = _12;
	//loop (%4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
	while(true){
		//ifge %4, %2 goto blklab6 : int
		if(repeats>=max){goto blklab6;}
		//const %13 = 0 : int
		_13 = 0;
		//assign %5 = %13  : int
		index = _13;
		//const %14 = 0 : int
		_14 = 0;
		//arraygen %15 = [14; 3] : int[]
		_NEW1DARRAY_DEALLOC(_15, _14, size, int64_t);
		//assign %6 = %15  : int[]
		_ADD_DEALLOC(arr, _15, int64_t);
		//loop (%5, %6, %16, %17, %18)
		while(true){
			//ifge %5, %3 goto blklab8 : int
			if(index>=size){goto blklab8;}
			//sub %16 = %3, %5 : int
			_16=size-index;
			//update %6[%5] = %16 : int[] -> int[]
			arr[index] = _16;
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %5, %17 : int
			_18=index+_17;
			//assign %5 = %18  : int
			index = _18;
//.blklab9
blklab9:;
		}
//.blklab8
blklab8:;
		//invoke (%19) = (%6) BubbleSort_original:bubbleSort : function(int[])->(int[])
		{
			_FUNCTIONCALL_COPY_PRE(_19, arr, 0, "liveness: arr = false, readonly: arr = false, return:arr = ALWAYS_RETURN" , "bubbleSort");
			_DEALLOC(_19);
			void* tmp_items;
			_COPY_1DARRAY_PARAM(arr, tmp_items, int64_t);
			_19 = _bubbleSort_(tmp_items, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			_19_dealloc = true;
		}
		//assign %6 = %19  : int[]
		_ADD_DEALLOC(arr, _19, int64_t);
		//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %22 = 1 : int
		_22 = 1;
		//sub %23 = %3, %22 : int
		_23=size-_22;
		//indexof %24 = %6, %23 : int[]
		_24=arr[_23];
		//indirectinvoke () = %21 (%24) : method(any)->()
		{
			printf("%"PRId64"\n", _24);
		}
		//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %26 = %25 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %26 (%4) : method(any)->()
		{
			printf("%"PRId64"\n", repeats);
		}
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %4, %27 : int
		_28=repeats+_27;
		//assign %4 = %28  : int
		repeats = _28;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [78,117,109,98,101,114,32,111,102,32,114,101,112,101,97,116,115,32] : int[]
	_DEALLOC(_31);
	_NEW_1DARRAY_int64_t(_31, 18, 0);
	_31[0] = 78; _31[1] = 117; _31[2] = 109; _31[3] = 98; _31[4] = 101; _31[5] = 114; _31[6] = 32; _31[7] = 111; _31[8] = 102; _31[9] = 32; _31[10] = 114; _31[11] = 101; _31[12] = 112; _31[13] = 101; _31[14] = 97; _31[15] = 116; _31[16] = 115; _31[17] = 32; 
	_31_dealloc = true;
	//indirectinvoke () = %30 (%31) : method(int[])->()
	{
		printf_s(_31, _31_size);
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %33 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", repeats);
	}
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [80,97,115,115,32,66,117,98,98,108,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY_int64_t(_36, 25, 0);
	_36[0] = 80; _36[1] = 97; _36[2] = 115; _36[3] = 115; _36[4] = 32; _36[5] = 66; _36[6] = 117; _36[7] = 98; _36[8] = 98; _36[9] = 108; _36[10] = 101; _36[11] = 83; _36[12] = 111; _36[13] = 114; _36[14] = 116; _36[15] = 32; _36[16] = 116; _36[17] = 101; _36[18] = 115; _36[19] = 116; _36[20] = 32; _36[21] = 99; _36[22] = 97; _36[23] = 115; _36[24] = 101; 
	_36_dealloc = true;
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		println_s(_36, _36_size);
	}
//.blklab5
blklab5:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_7);
	_FREE_ARGS(_8);
	_DEALLOC(_10);
	_DEALLOC(_15);
	_DEALLOC(_19);
	_DEALLOC(_31);
	_DEALLOC(_36);
	exit(0);
}

