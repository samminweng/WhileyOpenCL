#include "appendarray1.h"
BYTE* _append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	BYTE _11;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//lengthof %5 = %0 : byte[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : byte[]
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	_ADD_DEALLOC(_8);
	//assign %2 = %8  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _8);
	_TRANSFER_DEALLOC(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = items_size;
		//ifge %3, %10 goto blklab1 : int
		if(i>=_10){goto blklab1;}
		//indexof %11 = %0, %3 : byte[]
		_11=items[i];
		//update %2[%3] = %11 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//update %2[%3] = %1 : byte[] -> byte[]
	// isCopyEliminated = true
	nitems[i] = item;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_ADD_DEALLOC(_5);
	//assign %2 = %5  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	_TRANSFER_DEALLOC(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab5 : int
		if(i>=size){goto blklab5;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _f_append_(BYTE* input, size_t input_size, _DECL_DEALLOC_PARAM(input), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	BYTE index;
	BYTE item;
	int64_t _5 = 0;
	BYTE _6;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	BYTE _10;
	BYTE _11;
	_DECL_1DARRAY_BYTE(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	_DECL_1DARRAY_BYTE(_25);
	_DECL_DEALLOC(_25);
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	// isCopyEliminated = true
	pos = _5;
	//const %6 = 00000000b : byte
	_6 = 0b00000000;
	//const %7 = 0 : int
	_7 = 0;
	//const %16 = 2 : int
	_16 = 2;
	//lengthof %17 = %0 : byte[]
	_17 = input_size;
	//mul %18 = %16, %17 : int
	_18=_16*_17;
	//arraygen %8 = [6; 18] : byte[]
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _18, _6);
	_ADD_DEALLOC(_8);
	//const %19 = 0 : int
	_19 = 0;
	//assign %20 = %19  : int
	// isCopyEliminated = true
	_20 = _19;
	//assign %1 = %8  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _8);
	_TRANSFER_DEALLOC(output, _8);
	//loop (%1, %2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %20)
	while(true){
		//lengthof %9 = %0 : byte[]
		_9 = input_size;
		//ifge %2, %9 goto blklab7 : int
		if(pos>=_9){goto blklab7;}
		//invoke (%10) = (%2) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_10 = (BYTE)pos;
		}
		//assign %3 = %10  : byte
		// isCopyEliminated = true
		index = _10;
		//indexof %11 = %0, %2 : byte[]
		_11=input[pos];
		//assign %4 = %11  : byte
		// isCopyEliminated = true
		item = _11;
		//update %1[%20] = %3 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_20] = index;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %20, %21 : int
		_22=_20+_21;
		//assign %20 = %22  : int
		// isCopyEliminated = true
		_20 = _22;
		//update %1[%20] = %4 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_20] = item;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %20, %23 : int
		_24=_20+_23;
		//assign %20 = %24  : int
		// isCopyEliminated = true
		_20 = _24;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %2, %14 : int
		_15=pos+_14;
		//assign %2 = %15  : int
		// isCopyEliminated = true
		pos = _15;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//assert
	{
		//ifle %20, %18 goto blklab13 : int
		if(_20<=_18){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//invoke (%25) = (%1, %20) appendarray1:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_25);
		// isCopyEliminated of '_1' = true
		_25 = _resize_(_1DARRAY_PARAM(output), false, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
		_RETAIN_DEALLOC(output, "false-false-false" , "resize");
		_25_dealloc = true;
	}
	//assign %1 = %25  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _25);
	_TRANSFER_DEALLOC(output, _25);
	//return %1
	_DEALLOC(input);
	_DEALLOC(_8);
	_DEALLOC(_12);
	_DEALLOC(_13);
	_DEALLOC(_25);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* _f_resize_(BYTE* input, size_t input_size, _DECL_DEALLOC_PARAM(input), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	int64_t size = 0;
	BYTE index;
	BYTE item;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY_BYTE(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	BYTE _14;
	BYTE _15;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	_DECL_1DARRAY_BYTE(_25);
	_DECL_DEALLOC(_25);
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	// isCopyEliminated = true
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 2 : int
	_8 = 2;
	//lengthof %9 = %0 : byte[]
	_9 = input_size;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//arraygen %11 = [7; 10] : byte[]
	_DEALLOC(_11);
	_NEW_1DARRAY_BYTE(_11, _10, _7);
	_ADD_DEALLOC(_11);
	//assign %1 = %11  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _11);
	_TRANSFER_DEALLOC(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %3 = %12  : int
	// isCopyEliminated = true
	size = _12;
	//loop (%1, %2, %3, %4, %5, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//lengthof %13 = %0 : byte[]
		_13 = input_size;
		//ifge %2, %13 goto blklab9 : int
		if(pos>=_13){goto blklab9;}
		//invoke (%14) = (%2) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_14 = (BYTE)pos;
		}
		//assign %4 = %14  : byte
		// isCopyEliminated = true
		index = _14;
		//indexof %15 = %0, %2 : byte[]
		_15=input[pos];
		//assign %5 = %15  : byte
		// isCopyEliminated = true
		item = _15;
		//update %1[%3] = %4 : byte[] -> byte[]
		// isCopyEliminated = false
		output[size] = index;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %3, %16 : int
		_17=size+_16;
		//assign %3 = %17  : int
		// isCopyEliminated = true
		size = _17;
		//update %1[%3] = %5 : byte[] -> byte[]
		// isCopyEliminated = false
		output[size] = item;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %3, %18 : int
		_19=size+_18;
		//assign %3 = %19  : int
		// isCopyEliminated = true
		size = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		// isCopyEliminated = true
		pos = _21;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//assert
	{
		//const %22 = 2 : int
		_22 = 2;
		//lengthof %23 = %0 : byte[]
		_23 = input_size;
		//mul %24 = %22, %23 : int
		_24=_22*_23;
		//ifle %3, %24 goto blklab11 : int
		if(size<=_24){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//invoke (%25) = (%1, %3) appendarray1:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_25);
		// isCopyEliminated of '_1' = true
		_25 = _resize_(_1DARRAY_PARAM(output), false, size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
		_RETAIN_DEALLOC(output, "false-false-false" , "resize");
		_25_dealloc = true;
	}
	//assign %1 = %25  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _25);
	_TRANSFER_DEALLOC(output, _25);
	//return %1
	_DEALLOC(input);
	_DEALLOC(_11);
	_DEALLOC(_25);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(input);
	_DECL_DEALLOC(input);
	_DECL_1DARRAY_BYTE(arr);
	_DECL_DEALLOC(arr);
	_DECL_1DARRAY_BYTE(arr1);
	_DECL_DEALLOC(arr1);
	BYTE _4;
	BYTE _5;
	BYTE _6;
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	void* _12;
	//const %4 = 01100001b : byte
	_4 = 0b01100001;
	//const %5 = 01100010b : byte
	_5 = 0b01100010;
	//const %6 = 01100011b : byte
	_6 = 0b01100011;
	//newlist %7 = (%4, %5, %6) : byte[]
	_DEALLOC(_7);
	_NEW_1DARRAY_BYTE(_7, 3, 0b0);
	_7[0] = _4; _7[1] = _5; _7[2] = _6; 
	_ADD_DEALLOC(_7);
	//assign %1 = %7  : byte[]
	_DEALLOC(input);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(input, _7);
	_TRANSFER_DEALLOC(input, _7);
	//invoke (%8) = (%1) appendarray1:f_append : function(byte[])->(byte[])
	{
		_DEALLOC(_8);
		// isCopyEliminated of '_1' = true
		_8 = _f_append_(_1DARRAY_PARAM(input), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_RETAIN_DEALLOC(input, "false-false-true" , "f_append");
		_8_dealloc = true;
	}
	//assign %2 = %8  : byte[]
	_DEALLOC(arr);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(arr, _8);
	_TRANSFER_DEALLOC(arr, _8);
	//invoke (%9) = (%1) appendarray1:f_resize : function(byte[])->(byte[])
	{
		_DEALLOC(_9);
		// isCopyEliminated of '_1' = true
		_9 = _f_resize_(_1DARRAY_PARAM(input), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_9));
		_RETAIN_DEALLOC(input, "false-false-false" , "f_resize");
		_9_dealloc = true;
	}
	//assign %3 = %9  : byte[]
	_DEALLOC(arr1);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(arr1, _9);
	_TRANSFER_DEALLOC(arr1, _9);
	//assert
	{
		//ifeq %2, %3 goto blklab12 : byte[]
		_IFEQ_ARRAY_BYTE(arr, arr1, blklab12);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab12
blklab12:;
	//assert
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%2) : method(any)->()
	{
		_PRINT_1DARRAY_BYTE(arr);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%3) : method(any)->()
	{
		_PRINT_1DARRAY_BYTE(arr1);
	}
	//return
	_DEALLOC(input);
	_DEALLOC(arr);
	_DEALLOC(arr1);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_9);
	exit(0);
}

