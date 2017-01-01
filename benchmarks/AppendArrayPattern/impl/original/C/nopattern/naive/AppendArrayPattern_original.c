#include "AppendArrayPattern_original.h"
BYTE* _append_(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i = 0;
	BYTE _4;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
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
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	//assign %2 = %8  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _8);
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
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_NEW_1DARRAY_BYTE(_5, size, _4);
	//assign %2 = %5  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _5);
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
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _comp_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos = 0;
	BYTE item;
	BYTE length;
	int64_t _5 = 0;
	BYTE _6;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	int64_t _9 = 0;
	BYTE _10;
	BYTE _11;
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_1DARRAY_BYTE(_15);
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	pos = _5;
	//const %6 = 00000000b : byte
	_6 = 0b00000000;
	//const %7 = 0 : int
	_7 = 0;
	//arraygen %8 = [6; 7] : byte[]
	_NEW_1DARRAY_BYTE(_8, _7, _6);
	//assign %1 = %8  : byte[]
	_COPY_1DARRAY_BYTE(output, _8);
	//loop (%1, %2, %3, %4, %9, %10, %11, %12, %13, %14, %15)
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
		//invoke (%14) = (%1, %4) AppendArrayPattern_original:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_14 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		}
		//assign %1 = %14  : byte[]
		_COPY_1DARRAY_BYTE(output, _14);
		//invoke (%15) = (%1, %3) AppendArrayPattern_original:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_15 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		}
		//assign %1 = %15  : byte[]
		_COPY_1DARRAY_BYTE(output, _15);
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	int64_t max = 0;
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(arr);
	int64_t* _5;
	_DECL_2DARRAY(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	BYTE _9;
	_DECL_1DARRAY_BYTE(_10);
	_DECL_1DARRAY_BYTE(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	int64_t _18 = 0;
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
	}
	//assign %1 = %5  : null|int
	_NEW_INTEGER_POINTER(n, _5);
	//ifis %1, null goto blklab9 : null|int
	if(n == NULL) { goto blklab9;}
	//assign %2 = %1  : int
	max = *n;
	//const %9 = 01100001b : byte
	_9 = 0b01100001;
	//arraygen %10 = [9; 2] : byte[]
	_NEW_1DARRAY_BYTE(_10, max, _9);
	//assign %3 = %10  : byte[]
	_COPY_1DARRAY_BYTE(data, _10);
	//invoke (%11) = (%3) AppendArrayPattern_original:comp : function(byte[])->(byte[])
	{
		void* data_tmp;
		_11 = _comp_(_COPY_1DARRAY_PARAM_BYTE(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_11));
	}
	//assign %4 = %11  : byte[]
	_COPY_1DARRAY_BYTE(arr, _11);
	//assert
	{
		//lengthof %12 = %4 : byte[]
		_12 = arr_size;
		//const %13 = 2 : int
		_13 = 2;
		//lengthof %14 = %3 : byte[]
		_14 = data_size;
		//mul %15 = %13, %14 : int
		_15=_13*_14;
		//ifeq %12, %15 goto blklab10 : int
		if(_12==_15){goto blklab10;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab10
blklab10:;
	//assert
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %18 = %4 : byte[]
	_18 = arr_size;
	//indirectinvoke () = %17 (%18) : method(any)->()
	{
		printf("%"PRId64, _18);
	}
//.blklab9
blklab9:;
	//return
	exit(0);
}

