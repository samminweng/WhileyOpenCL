#include "lz77_opt_decompress.h"
BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_NEW1DARRAY_DEALLOC(_5, _4, size);
	//assign %2 = %5  : byte[]
	_DEALLOC(nitems);
	_COPY_1DARRAY_BYTE(nitems, _5);
	_ADD_DEALLOC(nitems, _5);
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
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _opt_append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t inspos, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t index;
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
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
	//ifge %1, %6 goto blklab10 : int
	if(inspos>=_6){goto blklab10;}
	//update %0[%1] = %2 : byte[] -> byte[]
	items[inspos] = item;
	//return %0
	_DEALLOC(output);
	_DEALLOC(nitems);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//goto blklab11
	goto blklab11;
//.blklab10
blklab10:;
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
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, _12, _7);
	_NEW1DARRAY_DEALLOC(_13, _7, _12);
	//assign %4 = %13  : byte[]
	_DEALLOC(nitems);
	_COPY_1DARRAY_BYTE(nitems, _13);
	_ADD_DEALLOC(nitems, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	index = _14;
	//loop (%4, %5, %15, %16, %18, %19, %20, %21, %22, %23, %24, %25, %26)
	while(true){
		//lengthof %23 = %0 : byte[]
		_23 = items_size;
		//ifge %5, %23 goto blklab12 : int
		if(index>=_23){goto blklab12;}
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
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//update %4[%5] = %2 : byte[] -> byte[]
	nitems[index] = item;
	//return %4
	_DEALLOC(items);
	_DEALLOC(output);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
//.blklab11
blklab11:;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	int64_t inspos;
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
	_DECL_DEALLOC(_13);
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
	_DECL_DEALLOC(_26);
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	BYTE _33;
	_DECL_1DARRAY_BYTE(_34);
	_DECL_DEALLOC(_34);
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	_DECL_1DARRAY_BYTE(_39);
	_DECL_DEALLOC(_39);
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	_NEW1DARRAY_DEALLOC(_13, _11, _12);
	//assign %2 = %13  : byte[]
	_DEALLOC(items);
	_COPY_1DARRAY_BYTE(items, _13);
	_ADD_DEALLOC(items, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	inspos = _14;
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
		//ifge %17, %18 goto blklab18 : int
		if(_17>=_18){goto blklab18;}
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
		//ifne %5, %25 goto blklab20 : byte
		if(header!=_25){goto blklab20;}
		//invoke (%26) = (%2, %3, %6) lz77_opt_decompress:opt_append : function(byte[],lz77_opt_decompress:nat,byte)->(byte[])
		{
			void* tmp_items;
			_COPY_1DARRAY_PARAM(items, tmp_items, BYTE);
			_DEALLOC(_26);
			_26 = _opt_append_(tmp_items, items_size, false, inspos, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_26));
			_CALLER_DEALLOC(items, "true-true-false" , "opt_append");
			_CALLER_DEALLOC_POST(_26, tmp_items);
		}
		//assign %2 = %26  : byte[]
		_DEALLOC(items);
		_COPY_1DARRAY_BYTE(items, _26);
		_ADD_DEALLOC(items, _26);
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=inspos+_27;
		//assign %3 = %28  : int
		inspos = _28;
		//goto blklab21
		goto blklab21;
//.blklab20
blklab20:;
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
		_31=inspos-offset;
		//assign %9 = %31  : int
		start = _31;
		//assign %10 = %9  : int
		i = start;
		//loop (%2, %3, %6, %10, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//add %32 = %9, %8 : int
			_32=start+len;
			//ifge %10, %32 goto blklab22 : int
			if(i>=_32){goto blklab22;}
			//indexof %33 = %2, %10 : byte[]
			_33=items[i];
			//assign %6 = %33  : byte
			item = _33;
			//invoke (%34) = (%2, %3, %6) lz77_opt_decompress:opt_append : function(byte[],lz77_opt_decompress:nat,byte)->(byte[])
			{
				void* tmp_items;
				_COPY_1DARRAY_PARAM(items, tmp_items, BYTE);
				_DEALLOC(_34);
				_34 = _opt_append_(tmp_items, items_size, false, inspos, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
				_CALLER_DEALLOC(items, "true-true-false" , "opt_append");
				_CALLER_DEALLOC_POST(_34, tmp_items);
			}
			//assign %2 = %34  : byte[]
			_DEALLOC(items);
			_COPY_1DARRAY_BYTE(items, _34);
			_ADD_DEALLOC(items, _34);
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %3, %35 : int
			_36=inspos+_35;
			//assign %3 = %36  : int
			inspos = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %10, %37 : int
			_38=i+_37;
			//assign %10 = %38  : int
			i = _38;
//.blklab23
blklab23:;
		}
//.blklab22
blklab22:;
//.blklab21
blklab21:;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
	//invoke (%39) = (%2, %3) lz77_opt_decompress:resize : function(byte[],int)->(byte[])
	{
		void* tmp_items;
		_COPY_1DARRAY_PARAM(items, tmp_items, BYTE);
		_DEALLOC(_39);
		_39 = _resize_(tmp_items, items_size, true, inspos, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
		_CALLEE_DEALLOC(items, "false-false-false" , "resize");
		_CALLEE_DEALLOC_POST(_39, items);
	}
	//assign %1 = %39  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _39);
	_ADD_DEALLOC(output, _39);
	//return %1
	_DEALLOC(data);
	_DEALLOC(items);
	_DEALLOC(_13);
	_DEALLOC(_26);
	_DEALLOC(_34);
	_DEALLOC(_39);
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
	//const %5 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,115,109,97,108,108,95,111,112,116,46,100,97,116] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, 33, 0);
	_5[0] = 46; _5[1] = 46; _5[2] = 47; _5[3] = 46; _5[4] = 46; _5[5] = 47; _5[6] = 46; _5[7] = 46; _5[8] = 47; _5[9] = 73; _5[10] = 110; _5[11] = 112; _5[12] = 117; _5[13] = 116; _5[14] = 102; _5[15] = 105; _5[16] = 108; _5[17] = 101; _5[18] = 115; _5[19] = 47; _5[20] = 115; _5[21] = 109; _5[22] = 97; _5[23] = 108; _5[24] = 108; _5[25] = 95; _5[26] = 111; _5[27] = 112; _5[28] = 116; _5[29] = 46; _5[30] = 100; _5[31] = 97; _5[32] = 116; 
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
	_DEALLOC(input_data);
	_COPY_1DARRAY_BYTE(input_data, _6);
	_ADD_DEALLOC(input_data, _6);
	//invoke (%8) = (%2) lz77_opt_decompress:decompress : function(byte[])->(byte[])
	{
		void* tmp_data;
		_COPY_1DARRAY_PARAM(input_data, tmp_data, BYTE);
		_DEALLOC(_8);
		_8 = _decompress_(tmp_data, input_data_size, true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_CALLEE_DEALLOC(input_data, "false-false-false" , "decompress");
		_CALLEE_DEALLOC_POST(_8, input_data);
	}
	//assign %3 = %8  : byte[]
	_DEALLOC(decompress_data);
	_COPY_1DARRAY_BYTE(decompress_data, _8);
	_ADD_DEALLOC(decompress_data, _8);
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

