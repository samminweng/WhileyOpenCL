#include "lz77_opt_decompress.h"
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
	_COPY_1DARRAY_BYTE(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab3 : int
		if(i>=size){goto blklab3;}
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
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _opt_append_(BYTE* items, size_t items_size, int64_t items_length, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(_3);
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i;
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
	BYTE _16;
	int64_t _17;
	int64_t _18;
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//ifge %1, %6 goto blklab5 : int
	if(items_length>=_6){goto blklab5;}
	//update %0[%1] = %2 : byte[] -> byte[]
	items[items_length] = item;
	//goto blklab6
	goto blklab6;
//.blklab5
blklab5:;
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
	i = _14;
	//loop (%4, %5, %15, %16, %17, %18)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = items_size;
		//ifge %5, %15 goto blklab7 : int
		if(i>=_15){goto blklab7;}
		//indexof %16 = %0, %5 : byte[]
		_16=items[i];
		//update %4[%5] = %16 : byte[] -> byte[]
		nitems[i] = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %5, %17 : int
		_18=i+_17;
		//assign %5 = %18  : int
		i = _18;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//update %4[%5] = %2 : byte[] -> byte[]
	nitems[i] = item;
	//assign %0 = %4  : byte[]
	_COPY_1DARRAY_BYTE(items, nitems);
//.blklab6
blklab6:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_1DARRAY_BYTE(items);
	int64_t items_length;
	int64_t pos;
	BYTE header;
	BYTE item;
	int64_t offset;
	int64_t len;
	int64_t start;
	int64_t i;
	BYTE _11;
	int64_t _12;
	_DECL_1DARRAY_BYTE(_13);
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	BYTE _19;
	int64_t _20;
	int64_t _21;
	BYTE _22;
	int64_t _23;
	int64_t _24;
	BYTE _25;
	_DECL_1DARRAY_BYTE(_26);
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	BYTE _33;
	_DECL_1DARRAY_BYTE(_34);
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	_DECL_1DARRAY_BYTE(_39);
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	//assign %2 = %13  : byte[]
	_COPY_1DARRAY_BYTE(items, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	items_length = _14;
	//const %15 = 0 : int
	_15 = 0;
	//assign %4 = %15  : int
	pos = _15;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %4, %16 : int
		_17=pos+_16;
		//lengthof %18 = %0 : byte[]
		_18 = data_size;
		//ifge %17, %18 goto blklab9 : int
		if(_17>=_18){goto blklab9;}
		//indexof %19 = %0, %4 : byte[]
		_19=data[pos];
		//assign %5 = %19  : byte
		header = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %4, %20 : int
		_21=pos+_20;
		//indexof %22 = %0, %21 : byte[]
		_22=data[_21];
		//assign %6 = %22  : byte
		item = _22;
		//const %23 = 2 : int
		_23 = 2;
		//add %24 = %4, %23 : int
		_24=pos+_23;
		//assign %4 = %24  : int
		pos = _24;
		//const %25 = 00000000b : byte
		_25 = 0b00000000;
		//ifne %5, %25 goto blklab11 : byte
		if(header!=_25){goto blklab11;}
		//invoke (%26) = (%2, %3, %6) lz77_opt_decompress:opt_append : function(byte[],lz77_opt_decompress:nat,byte)->(byte[])
		{
			void* items_tmp;
			_26 = _opt_append_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_26));
		}
		//assign %2 = %26  : byte[]
		_COPY_1DARRAY_BYTE(items, _26);
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=items_length+_27;
		//assign %3 = %28  : int
		items_length = _28;
		//goto blklab12
		goto blklab12;
//.blklab11
blklab11:;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_29 = (unsigned int)header;
		}
		//assign %7 = %29  : int
		offset = _29;
		//invoke (%30) = (%6) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_30 = (unsigned int)item;
		}
		//assign %8 = %30  : int
		len = _30;
		//sub %31 = %3, %7 : int
		_31=items_length-offset;
		//assign %9 = %31  : int
		start = _31;
		//assign %10 = %9  : int
		i = start;
		//loop (%2, %3, %6, %10, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//add %32 = %9, %8 : int
			_32=start+len;
			//ifge %10, %32 goto blklab13 : int
			if(i>=_32){goto blklab13;}
			//indexof %33 = %2, %10 : byte[]
			_33=items[i];
			//assign %6 = %33  : byte
			item = _33;
			//invoke (%34) = (%2, %3, %6) lz77_opt_decompress:opt_append : function(byte[],lz77_opt_decompress:nat,byte)->(byte[])
			{
				void* items_tmp;
				_34 = _opt_append_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
			}
			//assign %2 = %34  : byte[]
			_COPY_1DARRAY_BYTE(items, _34);
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %3, %35 : int
			_36=items_length+_35;
			//assign %3 = %36  : int
			items_length = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %10, %37 : int
			_38=i+_37;
			//assign %10 = %38  : int
			i = _38;
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
//.blklab12
blklab12:;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//invoke (%39) = (%2, %3) lz77_opt_decompress:resize : function(byte[],int)->(byte[])
	{
		void* items_tmp;
		_39 = _resize_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
	}
	//assign %1 = %39  : byte[]
	_COPY_1DARRAY_BYTE(output, _39);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(input_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	void* _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY_BYTE(_6);
	_DECL_1DARRAY_BYTE(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17;
	void* _18;
	_DECL_1DARRAY(_20);
	//const %5 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,115,109,97,108,108,46,100,97,116] : int[]
	_NEW_1DARRAY_int64_t(_5, 29, 0);
	_5[0] = 46; _5[1] = 46; _5[2] = 47; _5[3] = 46; _5[4] = 46; _5[5] = 47; _5[6] = 46; _5[7] = 46; _5[8] = 47; _5[9] = 73; _5[10] = 110; _5[11] = 112; _5[12] = 117; _5[13] = 116; _5[14] = 102; _5[15] = 105; _5[16] = 108; _5[17] = 101; _5[18] = 115; _5[19] = 47; _5[20] = 115; _5[21] = 109; _5[22] = 97; _5[23] = 108; _5[24] = 108; _5[25] = 46; _5[26] = 100; _5[27] = 97; _5[28] = 116; 
	//invoke (%4) = (%5) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_5, _5_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _4;
	//fieldload %7 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%6) = %7 () : method()->(byte[])
	{
		_6 = readAll(file, &_6_size);
	}
	//assign %2 = %6  : byte[]
	_COPY_1DARRAY_BYTE(input_data, _6);
	//invoke (%8) = (%2) lz77_opt_decompress:decompress : function(byte[])->(byte[])
	{
		void* input_data_tmp;
		_8 = _decompress_(_COPY_1DARRAY_PARAM_BYTE(input_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %3 = %8  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _8);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_11, 16, 0);
	_11[0] = 68; _11[1] = 69; _11[2] = 67; _11[3] = 79; _11[4] = 77; _11[5] = 80; _11[6] = 82; _11[7] = 69; _11[8] = 83; _11[9] = 83; _11[10] = 69; _11[11] = 68; _11[12] = 58; _11[13] = 32; _11[14] = 32; _11[15] = 32; 
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_14 = fromBytes(decompress_data, decompress_data_size);
		_14_size = decompress_data_size;
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		println_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %3 : byte[]
	_17 = decompress_data_size;
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		printf("%"PRId64, _17);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//fieldload %21 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %21 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	exit(0);
}

