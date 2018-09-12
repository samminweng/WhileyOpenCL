#include "appendarray.h"
BYTE* _append_(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i;
	BYTE _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY_BYTE(_8);
	int64_t _9;
	int64_t _10;
	BYTE _11;
	int64_t _12;
	int64_t _13;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//lengthof %5 = %0 : byte[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : byte[]
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	//assign %2 = %8  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _8);
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
	nitems[i] = item;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_NEW_1DARRAY_BYTE(_5, size, _4);
	//assign %2 = %5  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
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
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _f_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos;
	BYTE item;
	BYTE length;
	int64_t _5;
	BYTE _6;
	int64_t _7;
	_DECL_1DARRAY_BYTE(_8);
	int64_t _9;
	BYTE _10;
	BYTE _11;
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_1DARRAY_BYTE(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	_DECL_1DARRAY_BYTE(_25);
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
	_17 = data_size;
	//mul %18 = %16, %17 : int
	_18=_16*_17;
	//arraygen %8 = [6; 18] : byte[]
	_NEW_1DARRAY_BYTE(_8, _18, _6);
	//const %19 = 0 : int
	_19 = 0;
	//assign %20 = %19  : int
	// isCopyEliminated = true
	_20 = _19;
	//assign %1 = %8  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _8);
	//loop (%1, %2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %20)
	while(true){
		//lengthof %9 = %0 : byte[]
		_9 = data_size;
		//ifge %2, %9 goto blklab7 : int
		if(pos>=_9){goto blklab7;}
		//indexof %10 = %0, %2 : byte[]
		_10=data[pos];
		//assign %3 = %10  : byte
		// isCopyEliminated = true
		item = _10;
		//invoke (%11) = (%2) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_11 = (BYTE)pos;
		}
		//assign %4 = %11  : byte
		// isCopyEliminated = true
		length = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=pos+_12;
		//assign %2 = %13  : int
		// isCopyEliminated = true
		pos = _13;
		//update %1[%20] = %4 : byte[] -> byte[]
		output[_20] = length;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %20, %21 : int
		_22=_20+_21;
		//assign %20 = %22  : int
		// isCopyEliminated = true
		_20 = _22;
		//update %1[%20] = %3 : byte[] -> byte[]
		output[_20] = item;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %20, %23 : int
		_24=_20+_23;
		//assign %20 = %24  : int
		// isCopyEliminated = true
		_20 = _24;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//invoke (%25) = (%1, %20) appendarray:resize : function(byte[],int)->(byte[])
	{
		// isCopyEliminated of '_1' = true
		_25 = _resize_(output, output_size, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
	}
	//assign %1 = %25  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _25);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(arr);
	BYTE _3;
	BYTE _4;
	BYTE _5;
	_DECL_1DARRAY_BYTE(_6);
	_DECL_1DARRAY_BYTE(_7);
	BYTE _8;
	BYTE _9;
	BYTE _10;
	BYTE _11;
	BYTE _12;
	BYTE _13;
	_DECL_1DARRAY_BYTE(_14);
	void* _15;
	int64_t _17;
	//const %3 = 01100001b : byte
	_3 = 0b01100001;
	//const %4 = 01100010b : byte
	_4 = 0b01100010;
	//const %5 = 01100011b : byte
	_5 = 0b01100011;
	//newlist %6 = (%3, %4, %5) : byte[]
	_NEW_1DARRAY_BYTE(_6, 3, 0b0);
	_6[0] = _3; _6[1] = _4; _6[2] = _5; 
	//assign %1 = %6  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(data, _6);
	//invoke (%7) = (%1) appendarray:f : function(byte[])->(byte[])
	{
		// isCopyEliminated of '_1' = true
		_7 = _f_(data, data_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
	}
	//assign %2 = %7  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(arr, _7);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %2 : byte[]
	_17 = arr_size;
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		printf("%"PRId64, _17);
	}
	//return
	exit(0);
}

