#include "lz77_2.h"
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
		//invoke (%14) = (%0, %6, %1) lz77_2:match : function(byte[],lz77_2:nat,lz77_2:nat)->(int)
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

BYTE* append(BYTE* items, size_t items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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

BYTE* populate(BYTE* items, size_t items_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
		//ifge %3, %1 goto blklab8 : int
		if(i>=size){goto blklab8;}
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
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* compress(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos = 0;
	int64_t size = 0;
	Match* m;
	BYTE offset;
	BYTE length;
	int64_t _7 = 0;
	BYTE _8;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	_DECL_1DARRAY_BYTE(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	Match* _15;
	BYTE _16;
	int64_t _17 = 0;
	BYTE _18;
	int64_t _19 = 0;
	BYTE _20;
	BYTE _21;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	_DECL_1DARRAY_BYTE(_30);
	//const %7 = 0 : int
	_7 = 0;
	//assign %2 = %7  : int
	pos = _7;
	//const %8 = 00000000b : byte
	_8 = 0b00000000;
	//const %9 = 2 : int
	_9 = 2;
	//lengthof %10 = %0 : byte[]
	_10 = data_size;
	//mul %11 = %9, %10 : int
	_11=_9*_10;
	//arraygen %12 = [8; 11] : byte[]
	_NEW_1DARRAY_BYTE(_12, _11, _8);
	//assign %1 = %12  : byte[]
	_COPY_1DARRAY_BYTE(output, _12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %3 = %13  : int
	size = _13;
	//loop (%1, %2, %3, %4, %5, %6, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
	while(true){
		//lengthof %14 = %0 : byte[]
		_14 = data_size;
		//ifge %2, %14 goto blklab10 : int
		if(pos>=_14){goto blklab10;}
		//invoke (%15) = (%0, %2) lz77_2:findLongestMatch : function(byte[],lz77_2:nat)->(lz77_2:Match)
		{
			void* data_tmp;
			_15 = findLongestMatch(_COPY_1DARRAY_PARAM_BYTE(data), pos);
		}
		//assign %4 = %15  : {int len,int offset}
		m = copy_Match(_15);
		//fieldload %17 = %4 offset : {int len,int offset}
		_17 = m->offset;
		//invoke (%16) = (%17) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_16 = (BYTE)_17;
		}
		//assign %5 = %16  : byte
		offset = _16;
		//fieldload %19 = %4 len : {int len,int offset}
		_19 = m->len;
		//invoke (%18) = (%19) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_18 = (BYTE)_19;
		}
		//assign %6 = %18  : byte
		length = _18;
		//const %20 = 00000000b : byte
		_20 = 0b00000000;
		//ifne %5, %20 goto blklab12 : byte
		if(offset!=_20){goto blklab12;}
		//indexof %21 = %0, %2 : byte[]
		_21=data[pos];
		//assign %6 = %21  : byte
		length = _21;
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %2, %22 : int
		_23=pos+_22;
		//assign %2 = %23  : int
		pos = _23;
		//goto blklab13
		goto blklab13;
//.blklab12
blklab12:;
		//fieldload %24 = %4 len : {int len,int offset}
		_24 = m->len;
		//add %25 = %2, %24 : int
		_25=pos+_24;
		//assign %2 = %25  : int
		pos = _25;
//.blklab13
blklab13:;
		//update %1[%3] = %5 : byte[] -> byte[]
		output[size] = offset;
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %3, %26 : int
		_27=size+_26;
		//assign %3 = %27  : int
		size = _27;
		//update %1[%3] = %6 : byte[] -> byte[]
		output[size] = length;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %3, %28 : int
		_29=size+_28;
		//assign %3 = %29  : int
		size = _29;
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//invoke (%30) = (%1, %3) lz77_2:populate : function(byte[],lz77_2:nat)->(byte[])
	{
		void* output_tmp;
		_30 = populate(_COPY_1DARRAY_PARAM_BYTE(output), size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
	}
	//assign %1 = %30  : byte[]
	_COPY_1DARRAY_BYTE(output, _30);
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
		//ifge %14, %15 goto blklab14 : int
		if(_14>=_15){goto blklab14;}
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
		//ifne %3, %22 goto blklab16 : byte
		if(header!=_22){goto blklab16;}
		//invoke (%23) = (%1, %4) lz77_2:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = append(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
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
			//ifge %8, %28 goto blklab18 : int
			if(i>=_28){goto blklab18;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) lz77_2:append : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_30 = append(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			_COPY_1DARRAY_BYTE(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab19
blklab19:;
		}
//.blklab18
blklab18:;
//.blklab17
blklab17:;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
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
	int64_t _27 = 0;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_1DARRAY_BYTE(_31);
	void* _32;
	_DECL_1DARRAY(_34);
	void* _35;
	_DECL_1DARRAY(_37);
	void* _38;
	int64_t _40 = 0;
	void* _41;
	_DECL_1DARRAY(_43);
	int64_t _44 = 0;
	int64_t _45 = 0;
	//const %6 = [109,101,100,105,117,109,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_6, 9, 0);
	_6[0] = 109; _6[1] = 101; _6[2] = 100; _6[3] = 105; _6[4] = 117; _6[5] = 109; _6[6] = 46; _6[7] = 105; _6[8] = 110; 
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6,  _6_size);
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
	//invoke (%21) = (%2) lz77_2:compress : function(byte[])->(byte[])
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
	//fieldload %26 = %25 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %27 = %3 : byte[]
	_27 = compress_data_size;
	//indirectinvoke () = %26 (%27) : method(any)->()
	{
		printf("%"PRId64, _27);
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_30, 6, 0);
	_30[0] = 32; _30[1] = 98; _30[2] = 121; _30[3] = 116; _30[4] = 101; _30[5] = 115; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	{
		println_s(_30, _30_size);
	}
	//invoke (%31) = (%3) lz77_2:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_31 = decompress(_COPY_1DARRAY_PARAM_BYTE(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_31));
	}
	//assign %4 = %31  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _31);
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_34, 16, 0);
	_34[0] = 68; _34[1] = 69; _34[2] = 67; _34[3] = 79; _34[4] = 77; _34[5] = 80; _34[6] = 82; _34[7] = 69; _34[8] = 83; _34[9] = 83; _34[10] = 69; _34[11] = 68; _34[12] = 58; _34[13] = 32; _34[14] = 32; _34[15] = 32; 
	//indirectinvoke () = %33 (%34) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_34));
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%37) = (%4) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_37 = fromBytes(decompress_data, decompress_data_size);
		_37_size = decompress_data_size;
	}
	//indirectinvoke () = %36 (%37) : method(int[])->()
	{
		println_s(_37, _37_size);
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %40 = %4 : byte[]
	_40 = decompress_data_size;
	//indirectinvoke () = %39 (%40) : method(any)->()
	{
		printf("%"PRId64, _40);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_43, 6, 0);
	_43[0] = 32; _43[1] = 98; _43[2] = 121; _43[3] = 116; _43[4] = 101; _43[5] = 115; 
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		println_s(_43, _43_size);
	}
	//assert
	{
		//lengthof %44 = %2 : byte[]
		_44 = data_size;
		//lengthof %45 = %4 : byte[]
		_45 = decompress_data_size;
		//ifeq %44, %45 goto blklab20 : int
		if(_44==_45){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//ifeq %2, %4 goto blklab21 : byte[]
		_IFEQ_ARRAY_BYTE(data, decompress_data, blklab21);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//return
	exit(0);
}

