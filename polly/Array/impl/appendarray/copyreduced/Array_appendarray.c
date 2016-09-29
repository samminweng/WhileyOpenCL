#include "Array_appendarray.h"
int64_t* append(_DECL_1DARRAY_PARAM(items), int64_t item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(nitems);
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//lengthof %5 = %0 : int[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _4);
	//assign %2 = %8  : int[]
	_UPDATE_1DARRAY(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : int[]
		_10 = items_size;
		//ifge %3, %10 goto blklab0 : int
		if(i>=_10){goto blklab0;}
		//indexof %11 = %0, %3 : int[]
		_11=items[i];
		//update %2[%3] = %11 : int[] -> int[]
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//update %2[%3] = %1 : int[] -> int[]
	nitems[i] = item;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

int64_t* appendArray(_DECL_1DARRAY_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(output);
	int64_t pos = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	_DECL_1DARRAY(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//assign %2 = %3  : int
	pos = _3;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	_UPDATE_1DARRAY(output, _6);
	//loop (%1, %2, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//lengthof %7 = %0 : int[]
		_7 = data_size;
		//ifge %2, %7 goto blklab2 : int
		if(pos>=_7){goto blklab2;}
		//indexof %9 = %0, %2 : int[]
		_9=data[pos];
		//const %10 = 10 : int
		_10 = 10;
		//add %11 = %9, %10 : int
		_11=_9+_10;
		//invoke (%8) = (%1, %11) Array_appendarray:append : function(int[],int)->(int[])
		{
			_8 = append(_1DARRAY_PARAM(output), _11, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		}
		//assign %1 = %8  : int[]
		_UPDATE_1DARRAY(output, _8);
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=pos+_12;
		//assign %2 = %13  : int
		pos = _13;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int64_t* fastAppendArray(_DECL_1DARRAY_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(output);
	int64_t pos = 0;
	int64_t size = 0;
	_DECL_1DARRAY(output_1);
	int64_t size_1 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	_DECL_1DARRAY(_22);
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 2 : int
	_8 = 2;
	//lengthof %9 = %0 : int[]
	_9 = data_size;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//arraygen %11 = [7; 10] : int[]
	_NEW_1DARRAY_int64_t(_11, _10, _7);
	//assign %1 = %11  : int[]
	_UPDATE_1DARRAY(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %3 = %12  : int
	size = _12;
	//loop (%1, %2, %3, %13, %14, %15, %16, %17, %18, %19, %20)
	while(true){
		//lengthof %13 = %0 : int[]
		_13 = data_size;
		//ifge %2, %13 goto blklab4 : int
		if(pos>=_13){goto blklab4;}
		//indexof %14 = %0, %2 : int[]
		_14=data[pos];
		//const %15 = 10 : int
		_15 = 10;
		//add %16 = %14, %15 : int
		_16=_14+_15;
		//update %1[%3] = %16 : int[] -> int[]
		output[size] = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=size+_17;
		//assign %3 = %18  : int
		size = _18;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %2, %19 : int
		_20=pos+_19;
		//assign %2 = %20  : int
		pos = _20;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//const %21 = 0 : int
	_21 = 0;
	//arraygen %22 = [21; 3] : int[]
	_NEW_1DARRAY_int64_t(_22, size, _21);
	//assign %4 = %22  : int[]
	_UPDATE_1DARRAY(output_1, _22);
	//const %23 = 0 : int
	_23 = 0;
	//assign %5 = %23  : int
	size_1 = _23;
	//loop (%4, %5, %24, %25, %26)
	while(true){
		//ifge %5, %3 goto blklab6 : int
		if(size_1>=size){goto blklab6;}
		//indexof %24 = %1, %5 : int[]
		_24=output[size_1];
		//update %4[%5] = %24 : int[] -> int[]
		output_1[size_1] = _24;
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %5, %25 : int
		_26=size_1+_25;
		//assign %5 = %26  : int
		size_1 = _26;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//assign %1 = %4  : int[]
	_UPDATE_1DARRAY(output, output_1);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int64_t* init(int64_t max, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(data);
	int64_t index = 0;
	int64_t _3 = 0;
	_DECL_1DARRAY(_4);
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//arraygen %4 = [3; 0] : int[]
	_NEW_1DARRAY_int64_t(_4, max, _3);
	//assign %1 = %4  : int[]
	_UPDATE_1DARRAY(data, _4);
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	index = _5;
	//loop (%1, %2, %6, %7, %8)
	while(true){
		//ifge %2, %0 goto blklab8 : int
		if(index>=max){goto blklab8;}
		//sub %6 = %0, %2 : int
		_6=max-index;
		//update %1[%2] = %6 : int[] -> int[]
		data[index] = _6;
		//const %7 = 1 : int
		_7 = 1;
		//add %8 = %2, %7 : int
		_8=index+_7;
		//assign %2 = %8  : int
		index = _8;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(data);
	return data;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	int64_t max = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(arr);
	int64_t* _5;
	_DECL_2DARRAY(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
	_DECL_1DARRAY(_10);
	void* _11;
	int64_t _13 = 0;
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
	}
	//assign %1 = %5  : null|int
	n = _5;
	//ifis %1, null goto blklab10 : null|int
	if(n == NULL) { goto blklab10;}
	//assign %2 = %1  : int
	max = *n;
	//invoke (%9) = (%2) Array_appendarray:init : function(int)->(int[])
	{
		_9 = init(max, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_9));
	}
	//assign %3 = %9  : int[]
	_UPDATE_1DARRAY(data, _9);
	//invoke (%10) = (%3) Array_appendarray:appendArray : function(int[])->(int[])
	{
		_10 = appendArray(_1DARRAY_PARAM(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
	}
	//assign %4 = %10  : int[]
	_UPDATE_1DARRAY(arr, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %13 = %4 : int[]
	_13 = arr_size;
	//indirectinvoke () = %12 (%13) : method(any)->()
	{
		printf("%"PRId64"\n", _13);
	}
//.blklab10
blklab10:;
	//return
	exit(0);
}

