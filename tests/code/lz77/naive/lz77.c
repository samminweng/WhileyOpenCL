#include "lz77.h"
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
int64_t match(BYTE* data, size_t data_size, int64_t offset, int64_t end){
	int64_t _3 = 0;
	int64_t pos = 0;
	int64_t len = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	BYTE _8;
	BYTE _9;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	//assign %4 = %2  : int
	pos = end;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	len = _6;
	//loop (%1, %4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16)
	while(true){
		//ifge %1, %4 goto blklab1 : int
		if(offset>=pos){goto blklab1;}
		//lengthof %7 = %0 : byte[]
		_7 = data_size;
		//ifge %4, %7 goto blklab1 : int
		if(pos>=_7){goto blklab1;}
		//indexof %8 = %0, %1 : byte[]
		_8=data[offset];
		//indexof %9 = %0, %4 : byte[]
		_9=data[pos];
		//ifne %8, %9 goto blklab1 : byte
		if(_8!=_9){goto blklab1;}
		//const %10 = 255 : int
		_10 = 255;
		//ifge %5, %10 goto blklab1 : int
		if(len>=_10){goto blklab1;}
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
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %5
	return len;
	//return
}

Match* findLongestMatch(BYTE* data, size_t data_size, int64_t pos){
	Match* m;
	int64_t bestOffset = 0;
	int64_t bestLen = 0;
	int64_t start = 0;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
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
		//ifge %6, %1 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//invoke (%14) = (%0, %6, %1) lz77:match : function(byte[],lz77:nat,lz77:nat)->(int)
		{
			void* data_tmp;
			_14 = match(_COPY_1DARRAY_PARAM_BYTE(data), offset, pos);
		}
		//assign %7 = %14  : int
		len = _14;
		//ifle %7, %4 goto blklab5 : int
		if(len<=bestLen){goto blklab5;}
		//sub %15 = %1, %6 : int
		_15=pos-offset;
		//assign %3 = %15  : int
		bestOffset = _15;
		//assign %4 = %7  : int
		bestLen = len;
//.blklab5
blklab5:;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %6, %16 : int
		_17=offset+_16;
		//assign %6 = %17  : int
		offset = _17;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_18 = malloc(sizeof(Match));
	_18->len = bestLen;
	_18->offset = bestOffset;
	//return %18
	return _18;
	//return
}

BYTE* append_byte(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
		//ifge %3, %10 goto blklab6 : int
		if(i>=_10){goto blklab6;}
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
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %2[%3] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* write_u1(BYTE* bytes, size_t bytes_size, int64_t u1, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_1DARRAY_BYTE(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	{
		_4 = (BYTE)u1;
	}
	//invoke (%3) = (%0, %4) lz77:append_byte : function(byte[],byte)->(byte[])
	{
		void* bytes_tmp;
		_3 = append_byte(_COPY_1DARRAY_PARAM_BYTE(bytes), _4, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
	}
	//assign %2 = %3  : byte[]
	_COPY_1DARRAY_BYTE(output, _3);
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* compress(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos = 0;
	Match* m;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	int64_t _10 = 0;
	Match* _11;
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	int64_t _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	BYTE _17;
	int64_t _18 = 0;
	int64_t _19 = 0;
	_DECL_1DARRAY_BYTE(_20);
	int64_t _21 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//arraygen %9 = [7; 8] : byte[]
	_NEW_1DARRAY_BYTE(_9, _8, _7);
	//assign %1 = %9  : byte[]
	_COPY_1DARRAY_BYTE(output, _9);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab8 : int
		if(pos>=_10){goto blklab8;}
		//invoke (%11) = (%0, %2) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			void* data_tmp;
			_11 = findLongestMatch(_COPY_1DARRAY_PARAM_BYTE(data), pos);
		}
		//assign %3 = %11  : {int len,int offset}
		m = copy_Match(_11);
		//fieldload %12 = %3 offset : {int len,int offset}
		_12 = m->offset;
		//assign %4 = %12  : int
		offset = _12;
		//fieldload %13 = %3 len : {int len,int offset}
		_13 = m->len;
		//assign %5 = %13  : int
		len = _13;
		//invoke (%14) = (%1, %4) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_14 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		}
		//assign %1 = %14  : byte[]
		_COPY_1DARRAY_BYTE(output, _14);
		//const %15 = 0 : int
		_15 = 0;
		//ifne %4, %15 goto blklab10 : int
		if(offset!=_15){goto blklab10;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//invoke (%16) = (%1, %17) lz77:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_16 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), _17, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		}
		//assign %1 = %16  : byte[]
		_COPY_1DARRAY_BYTE(output, _16);
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=pos+_18;
		//assign %2 = %19  : int
		pos = _19;
		//goto blklab11
		goto blklab11;
//.blklab10
blklab10:;
		//invoke (%20) = (%1, %5) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_20 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), len, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		}
		//assign %1 = %20  : byte[]
		_COPY_1DARRAY_BYTE(output, _20);
		//add %21 = %2, %5 : int
		_21=pos+len;
		//assign %2 = %21  : int
		pos = _21;
//.blklab11
blklab11:;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* decompress(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos = 0;
	BYTE header;
	BYTE item;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t start = 0;
	int64_t i = 0;
	BYTE _9;
	int64_t _10 = 0;
	_DECL_1DARRAY_BYTE(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	BYTE _16;
	int64_t _17 = 0;
	int64_t _18 = 0;
	BYTE _19;
	int64_t _20 = 0;
	int64_t _21 = 0;
	BYTE _22;
	_DECL_1DARRAY_BYTE(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	int64_t _31 = 0;
	int64_t _32 = 0;
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
		//ifge %14, %15 goto blklab12 : int
		if(_14>=_15){goto blklab12;}
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
		//ifne %3, %22 goto blklab14 : byte
		if(header!=_22){goto blklab14;}
		//invoke (%23) = (%1, %4) lz77:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
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
			//ifge %8, %28 goto blklab16 : int
			if(i>=_28){goto blklab16;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) lz77:append_byte : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_30 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			_COPY_1DARRAY_BYTE(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab17
blklab17:;
		}
//.blklab16
blklab16:;
//.blklab15
blklab15:;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	void* _5;
	_DECL_1DARRAY(_6);
	_DECL_1DARRAY_BYTE(_7);
	void* _9;
	_DECL_1DARRAY(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_1DARRAY_BYTE(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	void* _28;
	int64_t _30 = 0;
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_1DARRAY_BYTE(_34);
	void* _35;
	_DECL_1DARRAY(_37);
	void* _38;
	_DECL_1DARRAY(_40);
	void* _41;
	int64_t _43 = 0;
	void* _44;
	_DECL_1DARRAY(_46);
	//const %6 = [115,109,97,108,108,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_6, 8, 0);
	_6[0] = 115; _6[1] = 109; _6[2] = 97; _6[3] = 108; _6[4] = 108; _6[5] = 46; _6[6] = 105; _6[7] = 110; 
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _5;
	//fieldload %8 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%7) = %8 () : method()->(byte[])
	{
		_7 = readAll(file, &_7_size);
	}
	//assign %2 = %7  : byte[]
	_COPY_1DARRAY_BYTE(data, _7);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_11, 14, 0);
	_11[0] = 68; _11[1] = 97; _11[2] = 116; _11[3] = 97; _11[4] = 58; _11[5] = 32; _11[6] = 32; _11[7] = 32; _11[8] = 32; _11[9] = 32; _11[10] = 32; _11[11] = 32; _11[12] = 32; _11[13] = 32; 
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_11));
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_14 = fromBytes(data, data_size);
		_14_size = data_size;
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		println_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %2 : byte[]
	_17 = data_size;
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
	//invoke (%21) = (%2) lz77:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_21 = compress(_COPY_1DARRAY_PARAM_BYTE(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_21));
	}
	//assign %3 = %21  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _21);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_24, 19, 0);
	_24[0] = 67; _24[1] = 79; _24[2] = 77; _24[3] = 80; _24[4] = 82; _24[5] = 69; _24[6] = 83; _24[7] = 83; _24[8] = 69; _24[9] = 68; _24[10] = 32; _24[11] = 68; _24[12] = 97; _24[13] = 116; _24[14] = 97; _24[15] = 58; _24[16] = 32; _24[17] = 32; _24[18] = 32; 
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_24));
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%27) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_27 = fromBytes(compress_data, compress_data_size);
		_27_size = compress_data_size;
	}
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %30 = %3 : byte[]
	_30 = compress_data_size;
	//indirectinvoke () = %29 (%30) : method(any)->()
	{
		printf("%"PRId64, _30);
	}
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_33, 6, 0);
	_33[0] = 32; _33[1] = 98; _33[2] = 121; _33[3] = 116; _33[4] = 101; _33[5] = 115; 
	//indirectinvoke () = %32 (%33) : method(int[])->()
	{
		println_s(_33, _33_size);
	}
	//invoke (%34) = (%3) lz77:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_34 = decompress(_COPY_1DARRAY_PARAM_BYTE(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
	}
	//assign %4 = %34  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _34);
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %37 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_37, 16, 0);
	_37[0] = 68; _37[1] = 69; _37[2] = 67; _37[3] = 79; _37[4] = 77; _37[5] = 80; _37[6] = 82; _37[7] = 69; _37[8] = 83; _37[9] = 83; _37[10] = 69; _37[11] = 68; _37[12] = 58; _37[13] = 32; _37[14] = 32; _37[15] = 32; 
	//indirectinvoke () = %36 (%37) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_37));
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%40) = (%4) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_40 = fromBytes(decompress_data, decompress_data_size);
		_40_size = decompress_data_size;
	}
	//indirectinvoke () = %39 (%40) : method(int[])->()
	{
		println_s(_40, _40_size);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %43 = %4 : byte[]
	_43 = decompress_data_size;
	//indirectinvoke () = %42 (%43) : method(any)->()
	{
		printf("%"PRId64, _43);
	}
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %46 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_46, 6, 0);
	_46[0] = 32; _46[1] = 98; _46[2] = 121; _46[3] = 116; _46[4] = 101; _46[5] = 115; 
	//indirectinvoke () = %45 (%46) : method(int[])->()
	{
		println_s(_46, _46_size);
	}
	//return
	exit(0);
}

