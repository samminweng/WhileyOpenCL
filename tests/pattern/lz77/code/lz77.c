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
int64_t _match_(BYTE* data, size_t data_size, int64_t offset, int64_t end){
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

Match* _findLongestMatch_(BYTE* data, size_t data_size, int64_t pos){
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
			_14 = _match_(_COPY_1DARRAY_PARAM_BYTE(data), offset, pos);
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
		//ifge %3, %1 goto blklab10 : int
		if(i>=size){goto blklab10;}
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
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos = 0;
	Match* m;
	BYTE offset;
	BYTE length;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	int64_t _10 = 0;
	Match* _11;
	BYTE _12;
	int64_t _13 = 0;
	BYTE _14;
	int64_t _15 = 0;
	BYTE _16;
	BYTE _17;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	_DECL_1DARRAY_BYTE(_22);
	_DECL_1DARRAY_BYTE(_23);
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
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab12 : int
		if(pos>=_10){goto blklab12;}
		//invoke (%11) = (%0, %2) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			void* data_tmp;
			_11 = _findLongestMatch_(_COPY_1DARRAY_PARAM_BYTE(data), pos);
		}
		//assign %3 = %11  : {int len,int offset}
		m = copy_Match(_11);
		//fieldload %13 = %3 offset : {int len,int offset}
		_13 = m->offset;
		//invoke (%12) = (%13) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_12 = (BYTE)_13;
		}
		//assign %4 = %12  : byte
		offset = _12;
		//fieldload %15 = %3 len : {int len,int offset}
		_15 = m->len;
		//invoke (%14) = (%15) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_14 = (BYTE)_15;
		}
		//assign %5 = %14  : byte
		length = _14;
		//const %16 = 00000000b : byte
		_16 = 0b00000000;
		//ifne %4, %16 goto blklab14 : byte
		if(offset!=_16){goto blklab14;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//assign %5 = %17  : byte
		length = _17;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=pos+_18;
		//assign %2 = %19  : int
		pos = _19;
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
		//fieldload %20 = %3 len : {int len,int offset}
		_20 = m->len;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		pos = _21;
//.blklab15
blklab15:;
		//invoke (%22) = (%1, %4) lz77:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_22 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_22));
		}
		//assign %1 = %22  : byte[]
		_COPY_1DARRAY_BYTE(output, _22);
		//invoke (%23) = (%1, %5) lz77:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
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

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
		//ifge %14, %15 goto blklab16 : int
		if(_14>=_15){goto blklab16;}
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
		//ifne %3, %22 goto blklab18 : byte
		if(header!=_22){goto blklab18;}
		//invoke (%23) = (%1, %4) lz77:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//goto blklab19
		goto blklab19;
//.blklab18
blklab18:;
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
			//ifge %8, %28 goto blklab20 : int
			if(i>=_28){goto blklab20;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) lz77:append : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_30 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			_COPY_1DARRAY_BYTE(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab21
blklab21:;
		}
//.blklab20
blklab20:;
//.blklab19
blklab19:;
//.blklab17
blklab17:;
	}
//.blklab16
blklab16:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(compress_data);
	FILE* writer;
	_DECL_1DARRAY_BYTE(decompress_data);
	void* _6;
	_DECL_1DARRAY(_7);
	_DECL_1DARRAY_BYTE(_8);
	void* _10;
	_DECL_1DARRAY(_12);
	void* _13;
	_DECL_1DARRAY(_15);
	void* _16;
	int64_t _18 = 0;
	void* _19;
	_DECL_1DARRAY(_21);
	_DECL_1DARRAY_BYTE(_22);
	void* _23;
	_DECL_1DARRAY(_25);
	void* _26;
	int64_t _28 = 0;
	void* _29;
	_DECL_1DARRAY(_31);
	void* _32;
	_DECL_1DARRAY(_33);
	int64_t _34 = 0;
	_DECL_1DARRAY_BYTE(_37);
	void* _38;
	_DECL_1DARRAY(_40);
	void* _41;
	_DECL_1DARRAY(_43);
	void* _44;
	int64_t _46 = 0;
	void* _47;
	_DECL_1DARRAY(_49);
	int64_t _50 = 0;
	int64_t _51 = 0;
	//const %7 = [115,109,97,108,108,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_7, 8, 0);
	_7[0] = 115; _7[1] = 109; _7[2] = 97; _7[3] = 108; _7[4] = 108; _7[5] = 46; _7[6] = 105; _7[7] = 110; 
	//invoke (%6) = (%7) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_6 = Reader(_7, _7_size);
	}
	//assign %1 = %6  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _6;
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
	//fieldload %14 = %13 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%15) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_15 = fromBytes(data, data_size);
		_15_size = data_size;
	}
	//indirectinvoke () = %14 (%15) : method(int[])->()
	{
		println_s(_15, _15_size);
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %18 = %2 : byte[]
	_18 = data_size;
	//indirectinvoke () = %17 (%18) : method(any)->()
	{
		printf("%"PRId64, _18);
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_21, 6, 0);
	_21[0] = 32; _21[1] = 98; _21[2] = 121; _21[3] = 116; _21[4] = 101; _21[5] = 115; 
	//indirectinvoke () = %20 (%21) : method(int[])->()
	{
		println_s(_21, _21_size);
	}
	//invoke (%22) = (%2) lz77:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_22 = _compress_(_COPY_1DARRAY_PARAM_BYTE(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_22));
	}
	//assign %3 = %22  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _22);
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_25, 19, 0);
	_25[0] = 67; _25[1] = 79; _25[2] = 77; _25[3] = 80; _25[4] = 82; _25[5] = 69; _25[6] = 83; _25[7] = 83; _25[8] = 69; _25[9] = 68; _25[10] = 32; _25[11] = 68; _25[12] = 97; _25[13] = 116; _25[14] = 97; _25[15] = 58; _25[16] = 32; _25[17] = 32; _25[18] = 32; 
	//indirectinvoke () = %24 (%25) : method(int[])->()
	{
		println_s(_25, _25_size);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %28 = %3 : byte[]
	_28 = compress_data_size;
	//indirectinvoke () = %27 (%28) : method(any)->()
	{
		printf("%"PRId64, _28);
	}
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_31, 6, 0);
	_31[0] = 32; _31[1] = 98; _31[2] = 121; _31[3] = 116; _31[4] = 101; _31[5] = 115; 
	//indirectinvoke () = %30 (%31) : method(int[])->()
	{
		println_s(_31, _31_size);
	}
	//const %33 = [115,109,97,108,108,46,100,97,116] : int[]
	_NEW_1DARRAY_int64_t(_33, 9, 0);
	_33[0] = 115; _33[1] = 109; _33[2] = 97; _33[3] = 108; _33[4] = 108; _33[5] = 46; _33[6] = 100; _33[7] = 97; _33[8] = 116; 
	//invoke (%32) = (%33) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_32 = Writer(_33, _33_size);
	}
	//assign %4 = %32  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	writer = _32;
	//fieldload %35 = %4 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%34) = %35 (%3) : method(byte[])->(int)
	{
		writeAll(writer, compress_data, compress_data_size);
	}
	//fieldload %36 = %4 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %36 () : method()->()
	{
		fclose(writer);
		writer = NULL;
	}
	//invoke (%37) = (%3) lz77:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_37 = _decompress_(_COPY_1DARRAY_PARAM_BYTE(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_37));
	}
	//assign %5 = %37  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _37);
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %40 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_40, 16, 0);
	_40[0] = 68; _40[1] = 69; _40[2] = 67; _40[3] = 79; _40[4] = 77; _40[5] = 80; _40[6] = 82; _40[7] = 69; _40[8] = 83; _40[9] = 83; _40[10] = 69; _40[11] = 68; _40[12] = 58; _40[13] = 32; _40[14] = 32; _40[15] = 32; 
	//indirectinvoke () = %39 (%40) : method(int[])->()
	{
		println_s(_40, _40_size);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%43) = (%5) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_43 = fromBytes(decompress_data, decompress_data_size);
		_43_size = decompress_data_size;
	}
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		println_s(_43, _43_size);
	}
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %46 = %5 : byte[]
	_46 = decompress_data_size;
	//indirectinvoke () = %45 (%46) : method(any)->()
	{
		printf("%"PRId64, _46);
	}
	//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %48 = %47 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %49 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_49, 6, 0);
	_49[0] = 32; _49[1] = 98; _49[2] = 121; _49[3] = 116; _49[4] = 101; _49[5] = 115; 
	//indirectinvoke () = %48 (%49) : method(int[])->()
	{
		println_s(_49, _49_size);
	}
	//assert
	{
		//lengthof %50 = %2 : byte[]
		_50 = data_size;
		//lengthof %51 = %5 : byte[]
		_51 = decompress_data_size;
		//ifeq %50, %51 goto blklab22 : int
		if(_50==_51){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//assert
	{
		//ifeq %2, %5 goto blklab23 : byte[]
		_IFEQ_ARRAY_BYTE(data, decompress_data, blklab23);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//return
	exit(0);
}

