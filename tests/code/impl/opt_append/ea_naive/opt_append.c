#include "opt_append.h"
BYTE* _opt_append_(BYTE* items, size_t items_size, int64_t inspos, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_1DARRAY_BYTE(nitems);
	int64_t index;
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY_BYTE(_13);
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	BYTE _21;
	BYTE _22;
	int64_t _23;
	BYTE _24;
	int64_t _25;
	int64_t _26;
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//ifge %1, %6 goto blklab6 : int
	if(inspos>=_6){goto blklab6;}
	//update %0[%1] = %2 : byte[] -> byte[]
	items[inspos] = item;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//goto blklab7
	goto blklab7;
//.blklab6
blklab6:;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//lengthof %8 = %0 : byte[]
	_8 = items_size;
	//const %9 = 2 : int
	_9 = 2;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//arraygen %13 = [7; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _7);
	//assign %4 = %13  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	index = _14;
	//loop (%4, %5, %15, %16, %18, %19, %20, %21, %22, %23, %24, %25, %26)
	while(true){
		//lengthof %23 = %0 : byte[]
		_23 = items_size;
		//ifge %5, %23 goto blklab8 : int
		if(index>=_23){goto blklab8;}
		//indexof %24 = %0, %5 : byte[]
		_24=items[index];
		//update %4[%5] = %24 : byte[] -> byte[]
		nitems[index] = _24;
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %5, %25 : int
		_26=index+_25;
		//assign %5 = %26  : int
		index = _26;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//update %4[%5] = %2 : byte[] -> byte[]
	nitems[index] = item;
	//return %4
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(b);
	int64_t inspos;
	BYTE item;
	_DECL_1DARRAY_BYTE(a);
	BYTE _5;
	int64_t _6;
	_DECL_1DARRAY_BYTE(_7);
	int64_t _8;
	BYTE _9;
	int64_t _10;
	_DECL_1DARRAY_BYTE(_11);
	int64_t _12;
	BYTE _13;
	BYTE _14;
	int64_t _15;
	BYTE _16;
	int64_t _17;
	BYTE _18;
	int64_t _19;
	BYTE _20;
	BYTE _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	void* _26;
	_DECL_1DARRAY(_28);
	void* _29;
	int64_t _31;
	BYTE _32;
	void* _33;
	_DECL_1DARRAY(_35);
	void* _36;
	int64_t _38;
	void* _39;
	_DECL_1DARRAY(_41);
	//const %5 = 00000000b : byte
	_5 = 0b00000000;
	//const %6 = 3 : int
	_6 = 3;
	//arraygen %7 = [5; 6] : byte[]
	_NEW_1DARRAY_BYTE(_7, _6, _5);
	//assign %1 = %7  : byte[]
	_COPY_1DARRAY_BYTE(b, _7);
	//const %8 = 3 : int
	_8 = 3;
	//assign %2 = %8  : int
	inspos = _8;
	//const %10 = 1 : int
	_10 = 1;
	//invoke (%9) = (%10) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	{
		_9 = (BYTE)_10;
	}
	//assign %3 = %9  : byte
	item = _9;
	//invoke (%11) = (%1, %2, %3) opt_append:opt_append : function(byte[],opt_append:nat,byte)->(byte[])
	{
		void* tmp_items;
		_COPY_1DARRAY_PARAM(b, tmp_items, BYTE);
		_11 = _opt_append_(tmp_items, b_size, inspos, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_11));
	}
	//assign %4 = %11  : byte[]
	_COPY_1DARRAY_BYTE(a, _11);
	//assert
	{
		//const %12 = 2 : int
		_12 = 2;
		//indexof %13 = %1, %12 : byte[]
		_13=b[_12];
		//const %14 = 00000000b : byte
		_14 = 0b00000000;
		//ifeq %13, %14 goto blklab14 : byte
		if(_13==_14){goto blklab14;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab14
blklab14:;
	//assert
	}
	//assert
	{
		//const %15 = 2 : int
		_15 = 2;
		//indexof %16 = %4, %15 : byte[]
		_16=a[_15];
		//const %17 = 2 : int
		_17 = 2;
		//indexof %18 = %1, %17 : byte[]
		_18=b[_17];
		//ifeq %16, %18 goto blklab15 : byte
		if(_16==_18){goto blklab15;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//assert
	{
		//const %19 = 3 : int
		_19 = 3;
		//indexof %20 = %4, %19 : byte[]
		_20=a[_19];
		//const %21 = 00000001b : byte
		_21 = 0b00000001;
		//ifeq %20, %21 goto blklab16 : byte
		if(_20==_21){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//lengthof %22 = %1 : byte[]
		_22 = b_size;
		//const %23 = 3 : int
		_23 = 3;
		//ifeq %22, %23 goto blklab17 : int
		if(_22==_23){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//assert
	{
		//lengthof %24 = %4 : byte[]
		_24 = a_size;
		//const %25 = 7 : int
		_25 = 7;
		//ifeq %24, %25 goto blklab18 : int
		if(_24==_25){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [97,91,51,93,61] : int[]
	_NEW_1DARRAY_int64_t(_28, 5, 0);
	_28[0] = 97; _28[1] = 91; _28[2] = 51; _28[3] = 93; _28[4] = 61; 
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		printf_s(_28, _28_size);
	}
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = 3 : int
	_31 = 3;
	//indexof %32 = %4, %31 : byte[]
	_32=a[_31];
	//indirectinvoke () = %30 (%32) : method(any)->()
	{
		printf("%"PRIu8"\n", _32);
	}
	//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %35 = [65,114,114,97,121,32,97,58,32] : int[]
	_NEW_1DARRAY_int64_t(_35, 9, 0);
	_35[0] = 65; _35[1] = 114; _35[2] = 114; _35[3] = 97; _35[4] = 121; _35[5] = 32; _35[6] = 97; _35[7] = 58; _35[8] = 32; 
	//indirectinvoke () = %34 (%35) : method(int[])->()
	{
		printf_s(_35, _35_size);
	}
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %38 = %4 : byte[]
	_38 = a_size;
	//indirectinvoke () = %37 (%38) : method(any)->()
	{
		printf("%"PRId64, _38);
	}
	//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %40 = %39 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %41 = [98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_41, 5, 0);
	_41[0] = 98; _41[1] = 121; _41[2] = 116; _41[3] = 101; _41[4] = 115; 
	//indirectinvoke () = %40 (%41) : method(int[])->()
	{
		println_s(_41, _41_size);
	}
	//return
	exit(0);
}

