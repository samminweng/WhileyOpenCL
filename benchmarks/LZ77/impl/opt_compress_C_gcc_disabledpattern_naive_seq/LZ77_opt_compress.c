#include "LZ77_opt_compress.h"
Match* copy_Match(Match* _Match){
	Match* new_Match = malloc(sizeof(Match));
	new_Match->len = _Match->len;
	new_Match->offset = _Match->offset;
	return new_Match;
}
Match** copy_array_Match(Match** _Match, size_t _Match_size){
	Match** new_Match = malloc(_Match_size*sizeof(Match*));
	for(int i=0;i<_Match_size;i++){
		new_Match[i] = copy_Match(_Match[i]);
	}
	return new_Match;
}
void free_Match(Match* match){
	free(match);
}
void printf_Match(Match* match){
	printf("{");
	printf(" len:");
	printf("%"PRId64, match->len);
	printf(" offset:");
	printf("%"PRId64, match->offset);
	printf("}");
}
int64_t _match_(BYTE* data, size_t data_size, int64_t offset, int64_t end){
	int64_t length;
	int64_t pos;
	int64_t len;
	int64_t _6;
	int64_t _7;
	BYTE _8;
	BYTE _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	//assign %4 = %2  : int
	pos = end;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	len = _6;
	//loop (%1, %4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16)
	while(true){
		//ifge %1, %4 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//lengthof %7 = %0 : byte[]
		_7 = data_size;
		//ifge %4, %7 goto blklab3 : int
		if(pos>=_7){goto blklab3;}
		//indexof %8 = %0, %1 : byte[]
		_8=data[offset];
		//indexof %9 = %0, %4 : byte[]
		_9=data[pos];
		//ifne %8, %9 goto blklab3 : byte
		if(_8!=_9){goto blklab3;}
		//const %10 = 255 : int
		_10 = 255;
		//ifge %5, %10 goto blklab3 : int
		if(len>=_10){goto blklab3;}
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %1, %11 : int
		_12=offset+_11;
		//assign %1 = %12  : int
		offset = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=pos+_13;
		//assign %4 = %14  : int
		pos = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %5, %15 : int
		_16=len+_15;
		//assign %5 = %16  : int
		len = _16;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %5
	return len;
	//return
}

Match* _findLongestMatch_(BYTE* data, size_t data_size, int64_t pos){
	Match* m;
	int64_t bestOffset;
	int64_t bestLen;
	int64_t start;
	int64_t offset;
	int64_t len;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	Match* _18;
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	bestOffset = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	bestLen = _9;
	//const %11 = 255 : int
	_11 = 255;
	//sub %12 = %1, %11 : int
	_12=pos-_11;
	//const %13 = 0 : int
	_13 = 0;
	//invoke (%10) = (%12, %13) whiley/lang/Math:max : function(int,int)->(int)
	{
		_10 = max(_12, _13);
	}
	//assign %5 = %10  : int
	start = _10;
	//assign %6 = %5  : int
	offset = start;
	//loop (%3, %4, %6, %7, %14, %15, %16, %17)
	while(true){
		//ifge %6, %1 goto blklab5 : int
		if(offset>=pos){goto blklab5;}
		//invoke (%14) = (%0, %6, %1) LZ77_opt_compress:match : function(byte[],LZ77_opt_compress:nat,LZ77_opt_compress:nat)->(int)
		{
			void* tmp_data;
			_COPY_1DARRAY_PARAM(data, tmp_data, BYTE);
			_14 = _match_(tmp_data, data_size, offset, pos);
		}
		//assign %7 = %14  : int
		len = _14;
		//ifle %7, %4 goto blklab7 : int
		if(len<=bestLen){goto blklab7;}
		//sub %15 = %1, %6 : int
		_15=pos-offset;
		//assign %3 = %15  : int
		bestOffset = _15;
		//assign %4 = %7  : int
		bestLen = len;
//.blklab7
blklab7:;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %6, %16 : int
		_17=offset+_16;
		//assign %6 = %17  : int
		offset = _17;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_18 = malloc(sizeof(Match));
	_18->len = bestLen;
	_18->offset = bestOffset;
	//return %18
	return _18;
	//return
}

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
	_COPY_1DARRAY_BYTE(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = items_size;
		//ifge %3, %10 goto blklab8 : int
		if(i>=_10){goto blklab8;}
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
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
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
	_COPY_1DARRAY_BYTE(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab12 : int
		if(i>=size){goto blklab12;}
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
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos;
	int64_t arr_capacity;
	int64_t arr_size;
	Match* m;
	BYTE offset;
	BYTE length;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	BYTE _12;
	_DECL_1DARRAY_BYTE(_13);
	int64_t _14;
	int64_t _15;
	Match* _16;
	BYTE _17;
	int64_t _18;
	BYTE _19;
	int64_t _20;
	BYTE _21;
	BYTE _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	_DECL_1DARRAY_BYTE(_31);
	//const %8 = 0 : int
	_8 = 0;
	//assign %2 = %8  : int
	pos = _8;
	//const %9 = 2 : int
	_9 = 2;
	//lengthof %10 = %0 : byte[]
	_10 = data_size;
	//mul %11 = %9, %10 : int
	_11=_9*_10;
	//assign %3 = %11  : int
	arr_capacity = _11;
	//const %12 = 00000000b : byte
	_12 = 0b00000000;
	//arraygen %13 = [12; 3] : byte[]
	_NEW_1DARRAY_BYTE(_13, arr_capacity, _12);
	//assign %1 = %13  : byte[]
	_COPY_1DARRAY_BYTE(output, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %4 = %14  : int
	arr_size = _14;
	//loop (%1, %2, %4, %5, %6, %7, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %2, %15 goto blklab14 : int
		if(pos>=_15){goto blklab14;}
		//invoke (%16) = (%0, %2) LZ77_opt_compress:findLongestMatch : function(byte[],LZ77_opt_compress:nat)->(LZ77_opt_compress:Match)
		{
			void* tmp_data;
			_COPY_1DARRAY_PARAM(data, tmp_data, BYTE);
			_16 = _findLongestMatch_(tmp_data, data_size, pos);
		}
		//assign %5 = %16  : {int len,int offset}
		m = copy_Match(_16);
		//fieldload %18 = %5 offset : {int len,int offset}
		_18 = m->offset;
		//invoke (%17) = (%18) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_17 = (BYTE)_18;
		}
		//assign %6 = %17  : byte
		offset = _17;
		//fieldload %20 = %5 len : {int len,int offset}
		_20 = m->len;
		//invoke (%19) = (%20) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_19 = (BYTE)_20;
		}
		//assign %7 = %19  : byte
		length = _19;
		//const %21 = 00000000b : byte
		_21 = 0b00000000;
		//ifne %6, %21 goto blklab16 : byte
		if(offset!=_21){goto blklab16;}
		//indexof %22 = %0, %2 : byte[]
		_22=data[pos];
		//assign %7 = %22  : byte
		length = _22;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %2, %23 : int
		_24=pos+_23;
		//assign %2 = %24  : int
		pos = _24;
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
		//fieldload %25 = %5 len : {int len,int offset}
		_25 = m->len;
		//add %26 = %2, %25 : int
		_26=pos+_25;
		//assign %2 = %26  : int
		pos = _26;
//.blklab17
blklab17:;
		//update %1[%4] = %6 : byte[] -> byte[]
		output[arr_size] = offset;
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %4, %27 : int
		_28=arr_size+_27;
		//assign %4 = %28  : int
		arr_size = _28;
		//update %1[%4] = %7 : byte[] -> byte[]
		output[arr_size] = length;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %4, %29 : int
		_30=arr_size+_29;
		//assign %4 = %30  : int
		arr_size = _30;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
	//invoke (%31) = (%1, %4) LZ77_opt_compress:resize : function(byte[],int)->(byte[])
	{
		void* tmp_items;
		_COPY_1DARRAY_PARAM(output, tmp_items, BYTE);
		_31 = _resize_(tmp_items, output_size, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_31));
	}
	//assign %1 = %31  : byte[]
	_COPY_1DARRAY_BYTE(output, _31);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
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
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	int64_t _31;
	int64_t _32;
	//const %9 = 00000000b : byte
	_9 = 0b00000000;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [9; 10] : byte[]
	_NEW_1DARRAY_BYTE(_11, _10, _9);
	//assign %1 = %11  : byte[]
	_COPY_1DARRAY_BYTE(output, _11);
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
		//ifge %14, %15 goto blklab19 : int
		if(_14>=_15){goto blklab19;}
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
		//ifne %3, %22 goto blklab21 : byte
		if(header!=_22){goto blklab21;}
		//invoke (%23) = (%1, %4) LZ77_opt_compress:append : function(byte[],byte)->(byte[])
		{
			void* tmp_items;
			_COPY_1DARRAY_PARAM(output, tmp_items, BYTE);
			_23 = _append_(tmp_items, output_size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//goto blklab22
		goto blklab22;
//.blklab21
blklab21:;
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
			//ifge %8, %28 goto blklab23 : int
			if(i>=_28){goto blklab23;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) LZ77_opt_compress:append : function(byte[],byte)->(byte[])
			{
				void* tmp_items;
				_COPY_1DARRAY_PARAM(output, tmp_items, BYTE);
				_30 = _append_(tmp_items, output_size, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			_COPY_1DARRAY_BYTE(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab24
blklab24:;
		}
//.blklab23
blklab23:;
//.blklab22
blklab22:;
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(compress_data);
	void* _4;
	_DECL_2DARRAY(_5);
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_1DARRAY_BYTE(_8);
	void* _10;
	_DECL_1DARRAY(_12);
	void* _13;
	int64_t _15;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_1DARRAY_BYTE(_19);
	void* _20;
	_DECL_1DARRAY(_22);
	void* _23;
	int64_t _25;
	void* _26;
	_DECL_1DARRAY(_28);
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	_7_size = _5_size_size;
	//invoke (%4) = (%7) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_7, _7_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _4;
	//fieldload %9 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%8) = %9 () : method()->(byte[])
	{
		_8 = readAll(file, &_8_size);
	}
	//assign %2 = %8  : byte[]
	_COPY_1DARRAY_BYTE(data, _8);
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_12, 14, 0);
	_12[0] = 68; _12[1] = 97; _12[2] = 116; _12[3] = 97; _12[4] = 58; _12[5] = 32; _12[6] = 32; _12[7] = 32; _12[8] = 32; _12[9] = 32; _12[10] = 32; _12[11] = 32; _12[12] = 32; _12[13] = 32; 
	//indirectinvoke () = %11 (%12) : method(int[])->()
	{
		println_s(_12, _12_size);
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %15 = %2 : byte[]
	_15 = data_size;
	//indirectinvoke () = %14 (%15) : method(any)->()
	{
		printf("%"PRId64, _15);
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_18, 6, 0);
	_18[0] = 32; _18[1] = 98; _18[2] = 121; _18[3] = 116; _18[4] = 101; _18[5] = 115; 
	//indirectinvoke () = %17 (%18) : method(int[])->()
	{
		println_s(_18, _18_size);
	}
	//invoke (%19) = (%2) LZ77_opt_compress:compress : function(byte[])->(byte[])
	{
		void* tmp_data;
		_COPY_1DARRAY_PARAM(data, tmp_data, BYTE);
		_19 = _compress_(tmp_data, data_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
	}
	//assign %3 = %19  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _19);
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_22, 19, 0);
	_22[0] = 67; _22[1] = 79; _22[2] = 77; _22[3] = 80; _22[4] = 82; _22[5] = 69; _22[6] = 83; _22[7] = 83; _22[8] = 69; _22[9] = 68; _22[10] = 32; _22[11] = 68; _22[12] = 97; _22[13] = 116; _22[14] = 97; _22[15] = 58; _22[16] = 32; _22[17] = 32; _22[18] = 32; 
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		println_s(_22, _22_size);
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %25 = %3 : byte[]
	_25 = compress_data_size;
	//indirectinvoke () = %24 (%25) : method(any)->()
	{
		printf("%"PRId64, _25);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_28, 6, 0);
	_28[0] = 32; _28[1] = 98; _28[2] = 121; _28[3] = 116; _28[4] = 101; _28[5] = 115; 
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		println_s(_28, _28_size);
	}
	//return
	exit(0);
}

