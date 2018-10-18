#include "lz77_decompress.h"
BYTE* _append_(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(items);
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i;
	BYTE _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
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
	_NEW1DARRAY_DEALLOC(_8, _4, _7, BYTE);
	//assign %2 = %8  : byte[]
	_ADD_DEALLOC(nitems, _8, BYTE);
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

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos;
	BYTE header;
	BYTE item;
	int64_t offset;
	int64_t len;
	int64_t start;
	int64_t i;
	BYTE _9;
	int64_t _10;
	_DECL_1DARRAY_BYTE(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	BYTE _16;
	int64_t _17;
	int64_t _18;
	BYTE _19;
	int64_t _20;
	int64_t _21;
	BYTE _22;
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	_DECL_DEALLOC(_30);
	int64_t _31;
	int64_t _32;
	//const %9 = 00000000b : byte
	_9 = 0b00000000;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [9; 10] : byte[]
	_NEW1DARRAY_DEALLOC(_11, _9, _10, BYTE);
	//assign %1 = %11  : byte[]
	_ADD_DEALLOC(output, _11, BYTE);
	//const %12 = 0 : int
	_12 = 0;
	//assign %2 = %12  : int
	pos = _12;
	//loop (%1, %2, %3, %4, %5, %6, %7, %8, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %2, %13 : int
		_14=pos+_13;
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %14, %15 goto blklab3 : int
		if(_14>=_15){goto blklab3;}
		//indexof %16 = %0, %2 : byte[]
		_16=data[pos];
		//assign %3 = %16  : byte
		header = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %2, %17 : int
		_18=pos+_17;
		//indexof %19 = %0, %18 : byte[]
		_19=data[_18];
		//assign %4 = %19  : byte
		item = _19;
		//const %20 = 2 : int
		_20 = 2;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		pos = _21;
		//const %22 = 00000000b : byte
		_22 = 0b00000000;
		//ifne %3, %22 goto blklab5 : byte
		if(header!=_22){goto blklab5;}
		//invoke (%23) = (%1, %4) lz77_decompress:append : function(byte[],byte)->(byte[])
		{
			_CALLEE_DEALLOC(_23, output, "false-false-false" , "append");
			_DEALLOC(_23);
			void* tmp_items;
			_COPY_1DARRAY_PARAM(output, tmp_items, BYTE);
			_23 = _append_(tmp_items, output_size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_CALLEE_DEALLOC_POST(_23, tmp_items);
		}
		//assign %1 = %23  : byte[]
		_ADD_DEALLOC(output, _23, BYTE);
		//goto blklab6
		goto blklab6;
//.blklab5
blklab5:;
		//invoke (%24) = (%3) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_24 = (unsigned int)header;
		}
		//assign %5 = %24  : int
		offset = _24;
		//invoke (%25) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_25 = (unsigned int)item;
		}
		//assign %6 = %25  : int
		len = _25;
		//lengthof %26 = %1 : byte[]
		_26 = output_size;
		//sub %27 = %26, %5 : int
		_27=_26-offset;
		//assign %7 = %27  : int
		start = _27;
		//assign %8 = %7  : int
		i = start;
		//loop (%1, %4, %8, %28, %29, %30, %31, %32)
		while(true){
			//add %28 = %7, %6 : int
			_28=start+len;
			//ifge %8, %28 goto blklab7 : int
			if(i>=_28){goto blklab7;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) lz77_decompress:append : function(byte[],byte)->(byte[])
			{
				_CALLEE_DEALLOC(_30, output, "false-false-false" , "append");
				_DEALLOC(_30);
				void* tmp_items;
				_COPY_1DARRAY_PARAM(output, tmp_items, BYTE);
				_30 = _append_(tmp_items, output_size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_CALLEE_DEALLOC_POST(_30, tmp_items);
			}
			//assign %1 = %30  : byte[]
			_ADD_DEALLOC(output, _30, BYTE);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab8
blklab8:;
		}
//.blklab7
blklab7:;
//.blklab6
blklab6:;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %1
	_DEALLOC(data);
	_DEALLOC(_11);
	_DEALLOC(_23);
	_DEALLOC(_30);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(input_data);
	_DECL_DEALLOC(input_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	void* _4;
	_DECL_DEALLOC(_4);
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY_BYTE(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	//const %5 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,115,109,97,108,108,46,100,97,116] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, 29, 0);
	_5[0] = 46; _5[1] = 46; _5[2] = 47; _5[3] = 46; _5[4] = 46; _5[5] = 47; _5[6] = 46; _5[7] = 46; _5[8] = 47; _5[9] = 73; _5[10] = 110; _5[11] = 112; _5[12] = 117; _5[13] = 116; _5[14] = 102; _5[15] = 105; _5[16] = 108; _5[17] = 101; _5[18] = 115; _5[19] = 47; _5[20] = 115; _5[21] = 109; _5[22] = 97; _5[23] = 108; _5[24] = 108; _5[25] = 46; _5[26] = 100; _5[27] = 97; _5[28] = 116; 
	_5_dealloc = true;
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
		_6_dealloc = true;
	}
	//assign %2 = %6  : byte[]
	_ADD_DEALLOC(input_data, _6, BYTE);
	//invoke (%8) = (%2) lz77_decompress:decompress : function(byte[])->(byte[])
	{
		_CALLEE_DEALLOC(_8, input_data, "false-false-false" , "decompress");
		_DEALLOC(_8);
		void* tmp_data;
		_COPY_1DARRAY_PARAM(input_data, tmp_data, BYTE);
		_8 = _decompress_(tmp_data, input_data_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_CALLEE_DEALLOC_POST(_8, tmp_data);
	}
	//assign %3 = %8  : byte[]
	_ADD_DEALLOC(decompress_data, _8, BYTE);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, 16, 0);
	_11[0] = 68; _11[1] = 69; _11[2] = 67; _11[3] = 79; _11[4] = 77; _11[5] = 80; _11[6] = 82; _11[7] = 69; _11[8] = 83; _11[9] = 83; _11[10] = 69; _11[11] = 68; _11[12] = 58; _11[13] = 32; _11[14] = 32; _11[15] = 32; 
	_11_dealloc = true;
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_14);
		_14 = fromBytes(decompress_data, decompress_data_size);
		_14_size = decompress_data_size;
		_14_dealloc = true;
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
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	_20_dealloc = true;
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
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(input_data);
	_DEALLOC(decompress_data);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_20);
	exit(0);
}

