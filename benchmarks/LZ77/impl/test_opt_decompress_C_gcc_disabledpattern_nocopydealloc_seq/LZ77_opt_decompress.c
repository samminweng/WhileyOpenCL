#include "LZ77_opt_decompress.h"
BYTE* _resize_(BYTE* buffer, size_t buffer_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(buffer);
	_DECL_1DARRAY_BYTE(nbuffer);
	_DECL_DEALLOC(nbuffer);
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
	_NEW1DARRAY_DEALLOC(_5, _4, size, BYTE);
	//assign %2 = %5  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(nbuffer, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab3 : int
		if(i>=size){goto blklab3;}
		//indexof %7 = %0, %3 : byte[]
		_7=buffer[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		nbuffer[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %2
	_DEALLOC(buffer);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nbuffer);
	return nbuffer;
	//return
}

BYTE* _opt_append_(BYTE* buffer, size_t buffer_size, int64_t size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(buffer);
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(nbuffer);
	_DECL_DEALLOC(nbuffer);
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
	_6 = buffer_size;
	//ifge %1, %6 goto blklab11 : int
	if(size>=_6){goto blklab11;}
	//update %0[%1] = %2 : byte[] -> byte[]
	buffer[size] = item;
	//return %0
	_DEALLOC(output);
	_DEALLOC(nbuffer);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(buffer);
	return buffer;
	//goto blklab12
	goto blklab12;
//.blklab11
blklab11:;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//lengthof %8 = %0 : byte[]
	_8 = buffer_size;
	//const %9 = 2 : int
	_9 = 2;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//arraygen %13 = [7; 12] : byte[]
	_NEW1DARRAY_DEALLOC(_13, _7, _12, BYTE);
	//assign %4 = %13  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(nbuffer, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	// isCopyEliminated = true
	index = _14;
	//loop (%4, %5, %15, %16, %17, %18, %20, %21, %22, %23, %24, %25, %26)
	while(true){
		//lengthof %23 = %0 : byte[]
		_23 = buffer_size;
		//ifge %5, %23 goto blklab13 : int
		if(index>=_23){goto blklab13;}
		//indexof %24 = %0, %5 : byte[]
		_24=buffer[index];
		//update %4[%5] = %24 : byte[] -> byte[]
		nbuffer[index] = _24;
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %5, %25 : int
		_26=index+_25;
		//assign %5 = %26  : int
		// isCopyEliminated = true
		index = _26;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//update %4[%5] = %2 : byte[] -> byte[]
	nbuffer[index] = item;
	//return %4
	_DEALLOC(buffer);
	_DEALLOC(output);
	_DEALLOC(_13);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nbuffer);
	return nbuffer;
//.blklab12
blklab12:;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	int64_t size;
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
	_NEW1DARRAY_DEALLOC(_13, _11, _12, BYTE);
	//assign %2 = %13  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(items, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	// isCopyEliminated = true
	size = _14;
	//const %15 = 0 : int
	_15 = 0;
	//assign %4 = %15  : int
	// isCopyEliminated = true
	pos = _15;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %4, %16 : int
		_17=pos+_16;
		//lengthof %18 = %0 : byte[]
		_18 = data_size;
		//ifge %17, %18 goto blklab20 : int
		if(_17>=_18){goto blklab20;}
		//indexof %19 = %0, %4 : byte[]
		_19=data[pos];
		//assign %5 = %19  : byte
		// isCopyEliminated = true
		header = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %4, %20 : int
		_21=pos+_20;
		//indexof %22 = %0, %21 : byte[]
		_22=data[_21];
		//assign %6 = %22  : byte
		// isCopyEliminated = true
		item = _22;
		//const %23 = 2 : int
		_23 = 2;
		//add %24 = %4, %23 : int
		_24=pos+_23;
		//assign %4 = %24  : int
		// isCopyEliminated = true
		pos = _24;
		//const %25 = 00000000b : byte
		_25 = 0b00000000;
		//ifne %5, %25 goto blklab22 : byte
		if(header!=_25){goto blklab22;}
		//invoke (%26) = (%2, %3, %6) LZ77_opt_decompress:opt_append : function(byte[],LZ77_opt_decompress:nat,byte)->(byte[])
		{
			_FUNCTIONCALL_NO_COPY_PRE(_26, items, 0, "liveness: items = false, readonly: items = false, return:items = MAYBE_RETURN" , "opt_append");
			_DEALLOC(_26);
			// isCopyEliminated of 'items at 0' = true
			_26 = _opt_append_(items, items_size, size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_26));
			if( _26 == items ){
				_26_dealloc = items_dealloc;
				items_dealloc = false;
			} else {
				_26_dealloc = true;
			}
		}
		//assign %2 = %26  : byte[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(items, _26);
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=size+_27;
		//assign %3 = %28  : int
		// isCopyEliminated = true
		size = _28;
		//goto blklab23
		goto blklab23;
//.blklab22
blklab22:;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_29 = (unsigned int)header;
		}
		//assign %7 = %29  : int
		// isCopyEliminated = true
		offset = _29;
		//invoke (%30) = (%6) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_30 = (unsigned int)item;
		}
		//assign %8 = %30  : int
		// isCopyEliminated = true
		len = _30;
		//sub %31 = %3, %7 : int
		_31=size-offset;
		//assign %9 = %31  : int
		// isCopyEliminated = true
		start = _31;
		//assign %10 = %9  : int
		// isCopyEliminated = false
		i = start;
		//loop (%2, %3, %6, %10, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//add %32 = %9, %8 : int
			_32=start+len;
			//ifge %10, %32 goto blklab24 : int
			if(i>=_32){goto blklab24;}
			//indexof %33 = %2, %10 : byte[]
			_33=items[i];
			//assign %6 = %33  : byte
			// isCopyEliminated = true
			item = _33;
			//invoke (%34) = (%2, %3, %6) LZ77_opt_decompress:opt_append : function(byte[],LZ77_opt_decompress:nat,byte)->(byte[])
			{
				_FUNCTIONCALL_NO_COPY_PRE(_34, items, 0, "liveness: items = false, readonly: items = false, return:items = MAYBE_RETURN" , "opt_append");
				_DEALLOC(_34);
				// isCopyEliminated of 'items at 0' = true
				_34 = _opt_append_(items, items_size, size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
				if( _34 == items ){
					_34_dealloc = items_dealloc;
					items_dealloc = false;
				} else {
					_34_dealloc = true;
				}
			}
			//assign %2 = %34  : byte[]
			// isCopyEliminated = true
			_TRANSFER_DEALLOC(items, _34);
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %3, %35 : int
			_36=size+_35;
			//assign %3 = %36  : int
			// isCopyEliminated = true
			size = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %10, %37 : int
			_38=i+_37;
			//assign %10 = %38  : int
			// isCopyEliminated = true
			i = _38;
//.blklab25
blklab25:;
		}
//.blklab24
blklab24:;
//.blklab23
blklab23:;
//.blklab21
blklab21:;
	}
//.blklab20
blklab20:;
	//invoke (%39) = (%2, %3) LZ77_opt_decompress:resize : function(byte[],int)->(byte[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_39, items, 0, "liveness: items = false, readonly: items = true, return:items = NEVER_RETURN" , "resize");
		_DEALLOC(_39);
		// isCopyEliminated of 'items at 0' = true
		_39 = _resize_(items, items_size, size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
		_39_dealloc = true;
	}
	//assign %1 = %39  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(output, _39);
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
	_DECL_2DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	int64_t _16;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY(_5);
	_CONV_ARGS(_5);
	_5_dealloc = true;
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	_7_size = _5_size_size;
	_7_dealloc = false;
	//invoke (%4) = (%7) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_7, _7_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _4;
	//fieldload %9 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%8) = %9 () : method()->(byte[])
	{
		_8 = readAll(file, &_8_size);
		_8_dealloc = true;
	}
	//assign %2 = %8  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(input_data, _8);
	//invoke (%10) = (%2) LZ77_opt_decompress:decompress : function(byte[])->(byte[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_10, input_data, 0, "liveness: input_data = false, readonly: input_data = true, return:input_data = NEVER_RETURN" , "decompress");
		_DEALLOC(_10);
		// isCopyEliminated of 'input_data at 0' = true
		_10 = _decompress_(input_data, input_data_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_10_dealloc = true;
	}
	//assign %3 = %10  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(decompress_data, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 16, 0);
	_13[0] = 68; _13[1] = 69; _13[2] = 67; _13[3] = 79; _13[4] = 77; _13[5] = 80; _13[6] = 82; _13[7] = 69; _13[8] = 83; _13[9] = 83; _13[10] = 69; _13[11] = 68; _13[12] = 58; _13[13] = 32; _13[14] = 32; _13[15] = 32; 
	_13_dealloc = true;
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		println_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %16 = %3 : byte[]
	_16 = decompress_data_size;
	//indirectinvoke () = %15 (%16) : method(any)->()
	{
		printf("%"PRId64, _16);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	_19_dealloc = true;
	//indirectinvoke () = %18 (%19) : method(int[])->()
	{
		println_s(_19, _19_size);
	}
	//fieldload %20 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %20 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(input_data);
	_DEALLOC(decompress_data);
	_FREE_ARGS(_5);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_19);
	exit(0);
}

