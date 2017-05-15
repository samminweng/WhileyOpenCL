#include "appendarray.h"
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
	_COPY_1DARRAY_BYTE(nitems, _8);
	_ADD_DEALLOC(nitems);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
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
		i = _13;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//update %2[%3] = %1 : byte[] -> byte[]
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
	_COPY_1DARRAY_BYTE(nitems, _5);
	_ADD_DEALLOC(nitems);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
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

BYTE* _f_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	BYTE item;
	BYTE length;
	int64_t _5 = 0;
	BYTE _6;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	BYTE _10;
	BYTE _11;
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	_DECL_1DARRAY_BYTE(_15);
	_DECL_DEALLOC(_15);
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
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _18, _6);
	_ADD_DEALLOC(_8);
	//const %19 = 0 : int
	_19 = 0;
	//assign %20 = %19  : int
	_20 = _19;
	//assign %1 = %8  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _8);
	_ADD_DEALLOC(output);
	//loop (%1, %2, %3, %4, %9, %10, %11, %12, %13, %14, %15, %20)
	while(true){
		//lengthof %9 = %0 : byte[]
		_9 = data_size;
		//ifge %2, %9 goto blklab7 : int
		if(pos>=_9){goto blklab7;}
		//indexof %10 = %0, %2 : byte[]
		_10=data[pos];
		//assign %3 = %10  : byte
		item = _10;
		//invoke (%11) = (%2) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_11 = (BYTE)pos;
		}
		//assign %4 = %11  : byte
		length = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=pos+_12;
		//assign %2 = %13  : int
		pos = _13;
		//update %1[%20] = %4 : byte[] -> byte[]
		output[_20] = length;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %20, %21 : int
		_22=_20+_21;
		//assign %20 = %22  : int
		_20 = _22;
		//update %1[%20] = %3 : byte[] -> byte[]
		output[_20] = item;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %20, %23 : int
		_24=_20+_23;
		//assign %20 = %24  : int
		_20 = _24;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//assert
	{
		//ifle %20, %18 goto blklab10 : int
		if(_20<=_18){goto blklab10;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab10
blklab10:;
	//assert
	}
	//invoke (%25) = (%1, %20) appendarray:resize : function(byte[],int)->(byte[])
	{
		void* output_tmp;
		_DEALLOC(_25);
		_25 = _resize_(_COPY_1DARRAY_PARAM_BYTE(output), true, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
		_CALLEE_DEALLOC(output, "false-false-false" , "resize");
		_ADD_DEALLOC(_25);
	}
	//assign %1 = %25  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _25);
	_ADD_DEALLOC(output);
	//return %1
	_DEALLOC(data);
	_DEALLOC(_8);
	_DEALLOC(_14);
	_DEALLOC(_15);
	_DEALLOC(_25);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(arr);
	_DECL_DEALLOC(arr);
	BYTE _3;
	BYTE _4;
	BYTE _5;
	_DECL_1DARRAY_BYTE(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	BYTE _8;
	BYTE _9;
	BYTE _10;
	BYTE _11;
	BYTE _12;
	BYTE _13;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17 = 0;
	//const %3 = 01100001b : byte
	_3 = 0b01100001;
	//const %4 = 01100010b : byte
	_4 = 0b01100010;
	//const %5 = 01100011b : byte
	_5 = 0b01100011;
	//newlist %6 = (%3, %4, %5) : byte[]
	_DEALLOC(_6);
	_NEW_1DARRAY_BYTE(_6, 3, 0b0);
	_6[0] = _3; _6[1] = _4; _6[2] = _5; 
	_ADD_DEALLOC(_6);
	//assign %1 = %6  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _6);
	_ADD_DEALLOC(data);
	//invoke (%7) = (%1) appendarray:f : function(byte[])->(byte[])
	{
		void* data_tmp;
		_DEALLOC(_7);
		_7 = _f_(_COPY_1DARRAY_PARAM_BYTE(data), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_CALLEE_DEALLOC(data, "false-false-false" , "f");
		_ADD_DEALLOC(_7);
	}
	//assign %2 = %7  : byte[]
	_DEALLOC(arr);
	_COPY_1DARRAY_BYTE(arr, _7);
	_ADD_DEALLOC(arr);
	//assert
	{
		//const %8 = 00000000b : byte
		_8 = 0b00000000;
		//const %9 = 01100001b : byte
		_9 = 0b01100001;
		//const %10 = 00000001b : byte
		_10 = 0b00000001;
		//const %11 = 01100010b : byte
		_11 = 0b01100010;
		//const %12 = 00000010b : byte
		_12 = 0b00000010;
		//const %13 = 01100011b : byte
		_13 = 0b01100011;
		//newlist %14 = (%8, %9, %10, %11, %12, %13) : byte[]
		_DEALLOC(_14);
		_NEW_1DARRAY_BYTE(_14, 6, 0b0);
		_14[0] = _8; _14[1] = _9; _14[2] = _10; _14[3] = _11; _14[4] = _12; _14[5] = _13; 
		_ADD_DEALLOC(_14);
		//ifeq %2, %14 goto blklab9 : byte[]
		_IFEQ_ARRAY_BYTE(arr, _14, blklab9);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %2 : byte[]
	_17 = arr_size;
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		printf("%"PRId64, _17);
	}
	//return
	_DEALLOC(data);
	_DEALLOC(arr);
	_DEALLOC(_6);
	_DEALLOC(_7);
	_DEALLOC(_14);
	exit(0);
}

