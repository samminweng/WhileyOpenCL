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
int64_t _match_(BYTE* data, size_t data_size, int64_t offset, int64_t end){
	int64_t _3;
	int64_t pos;
	int64_t len;
	int64_t maxIter;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	BYTE _15;
	int64_t _16;
	BYTE _17;
	int64_t _18;
	int64_t _19;
	//assign %4 = %2  : int
	// isCopyEliminated = true
	pos = end;
	//const %7 = 0 : int
	_7 = 0;
	//assign %5 = %7  : int
	// isCopyEliminated = true
	len = _7;
	//sub %9 = %4, %1 : int
	_9=pos-offset;
	//lengthof %10 = %0 : byte[]
	_10 = data_size;
	//sub %11 = %10, %4 : int
	_11=_10-pos;
	//invoke (%8) = (%9, %11) whiley/lang/Math:min : function(int,int)->(int)
	{
		_8 = min(_9, _11);
	}
	//assign %6 = %8  : int
	// isCopyEliminated = true
	maxIter = _8;
	//const %13 = 255 : int
	_13 = 255;
	//invoke (%12) = (%13, %6) whiley/lang/Math:min : function(int,int)->(int)
	{
		_12 = min(_13, maxIter);
	}
	//assign %6 = %12  : int
	// isCopyEliminated = true
	maxIter = _12;
	//loop (%5, %14, %15, %16, %17, %18, %19)
	while(true){
		//ifge %5, %6 goto blklab1 : int
		if(len>=maxIter){goto blklab1;}
		//add %14 = %1, %5 : int
		_14=offset+len;
		//indexof %15 = %0, %14 : byte[]
		_15=data[_14];
		//add %16 = %4, %5 : int
		_16=pos+len;
		//indexof %17 = %0, %16 : byte[]
		_17=data[_16];
		//ifne %15, %17 goto blklab1 : byte
		if(_15!=_17){goto blklab1;}
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %5, %18 : int
		_19=len+_18;
		//assign %5 = %19  : int
		// isCopyEliminated = true
		len = _19;
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
	// isCopyEliminated = true
	bestOffset = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	// isCopyEliminated = true
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
	// isCopyEliminated = true
	start = _10;
	//assign %6 = %5  : int
	// isCopyEliminated = true
	offset = start;
	//loop (%3, %4, %6, %7, %14, %15, %16, %17)
	while(true){
		//ifge %6, %1 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//invoke (%14) = (%0, %6, %1) lz77_2:match : function(byte[],lz77_2:nat,lz77_2:nat)->(int)
		{
			// isCopyEliminated of '_0' = true
			_14 = _match_(_1DARRAY_PARAM(data), offset, pos);
		}
		//assign %7 = %14  : int
		// isCopyEliminated = true
		len = _14;
		//ifle %7, %4 goto blklab5 : int
		if(len<=bestLen){goto blklab5;}
		//sub %15 = %1, %6 : int
		_15=pos-offset;
		//assign %3 = %15  : int
		// isCopyEliminated = true
		bestOffset = _15;
		//assign %4 = %7  : int
		// isCopyEliminated = false
		bestLen = len;
//.blklab5
blklab5:;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %6, %16 : int
		_17=offset+_16;
		//assign %6 = %17  : int
		// isCopyEliminated = true
		offset = _17;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_18 = malloc(sizeof(Match));
	// isCopyEliminated = true
	_18->len = bestLen;
	// isCopyEliminated = true
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
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = false
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %2[%3] = %1 : byte[] -> byte[]
	// isCopyEliminated = true
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
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab10 : int
		if(i>=size){goto blklab10;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
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
	// isCopyEliminated = true
	pos = _8;
	//const %9 = 2 : int
	_9 = 2;
	//lengthof %10 = %0 : byte[]
	_10 = data_size;
	//mul %11 = %9, %10 : int
	_11=_9*_10;
	//assign %3 = %11  : int
	// isCopyEliminated = true
	arr_capacity = _11;
	//const %12 = 00000000b : byte
	_12 = 0b00000000;
	//arraygen %13 = [12; 3] : byte[]
	_NEW_1DARRAY_BYTE(_13, arr_capacity, _12);
	//assign %1 = %13  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %4 = %14  : int
	// isCopyEliminated = true
	arr_size = _14;
	//loop (%1, %2, %4, %5, %6, %7, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %2, %15 goto blklab12 : int
		if(pos>=_15){goto blklab12;}
		//invoke (%16) = (%0, %2) lz77_2:findLongestMatch : function(byte[],lz77_2:nat)->(lz77_2:Match)
		{
			// isCopyEliminated of '_0' = true
			_16 = _findLongestMatch_(_1DARRAY_PARAM(data), pos);
		}
		//assign %5 = %16  : {int len,int offset}
		// isCopyEliminated = true
		m = _16;
		//fieldload %18 = %5 offset : {int len,int offset}
		_18 = m->offset;
		//invoke (%17) = (%18) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_17 = (BYTE)_18;
		}
		//assign %6 = %17  : byte
		// isCopyEliminated = true
		offset = _17;
		//fieldload %20 = %5 len : {int len,int offset}
		_20 = m->len;
		//invoke (%19) = (%20) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_19 = (BYTE)_20;
		}
		//assign %7 = %19  : byte
		// isCopyEliminated = true
		length = _19;
		//const %21 = 00000000b : byte
		_21 = 0b00000000;
		//ifne %6, %21 goto blklab14 : byte
		if(offset!=_21){goto blklab14;}
		//indexof %22 = %0, %2 : byte[]
		_22=data[pos];
		//assign %7 = %22  : byte
		// isCopyEliminated = true
		length = _22;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %2, %23 : int
		_24=pos+_23;
		//assign %2 = %24  : int
		// isCopyEliminated = true
		pos = _24;
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
		//fieldload %25 = %5 len : {int len,int offset}
		_25 = m->len;
		//add %26 = %2, %25 : int
		_26=pos+_25;
		//assign %2 = %26  : int
		// isCopyEliminated = true
		pos = _26;
//.blklab15
blklab15:;
		//update %1[%4] = %6 : byte[] -> byte[]
		// isCopyEliminated = false
		output[arr_size] = offset;
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %4, %27 : int
		_28=arr_size+_27;
		//assign %4 = %28  : int
		// isCopyEliminated = true
		arr_size = _28;
		//update %1[%4] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		output[arr_size] = length;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %4, %29 : int
		_30=arr_size+_29;
		//assign %4 = %30  : int
		// isCopyEliminated = true
		arr_size = _30;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//assert
	{
		//ifge %3, %4 goto blklab16 : int
		if(arr_capacity>=arr_size){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//invoke (%31) = (%1, %4) lz77_2:resize : function(byte[],int)->(byte[])
	{
		// isCopyEliminated of '_1' = true
		_31 = _resize_(_1DARRAY_PARAM(output), arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_31));
	}
	//assign %1 = %31  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _31);
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
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %2 = %12  : int
	// isCopyEliminated = true
	pos = _12;
	//loop (%1, %2, %3, %4, %5, %6, %7, %8, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %2, %13 : int
		_14=pos+_13;
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %14, %15 goto blklab17 : int
		if(_14>=_15){goto blklab17;}
		//indexof %16 = %0, %2 : byte[]
		_16=data[pos];
		//assign %3 = %16  : byte
		// isCopyEliminated = true
		header = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %2, %17 : int
		_18=pos+_17;
		//indexof %19 = %0, %18 : byte[]
		_19=data[_18];
		//assign %4 = %19  : byte
		// isCopyEliminated = true
		item = _19;
		//const %20 = 2 : int
		_20 = 2;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		// isCopyEliminated = true
		pos = _21;
		//const %22 = 00000000b : byte
		_22 = 0b00000000;
		//ifne %3, %22 goto blklab19 : byte
		if(header!=_22){goto blklab19;}
		//invoke (%23) = (%1, %4) lz77_2:append : function(byte[],byte)->(byte[])
		{
			// isCopyEliminated of '_1' = true
			_23 = _append_(_1DARRAY_PARAM(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		// isCopyEliminated = true
		_UPDATE_1DARRAY(output, _23);
		//goto blklab20
		goto blklab20;
//.blklab19
blklab19:;
		//invoke (%24) = (%3) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_24 = (unsigned int)header;
		}
		//assign %5 = %24  : int
		// isCopyEliminated = true
		offset = _24;
		//invoke (%25) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_25 = (unsigned int)item;
		}
		//assign %6 = %25  : int
		// isCopyEliminated = true
		len = _25;
		//lengthof %26 = %1 : byte[]
		_26 = output_size;
		//sub %27 = %26, %5 : int
		_27=_26-offset;
		//assign %7 = %27  : int
		// isCopyEliminated = true
		start = _27;
		//assign %8 = %7  : int
		// isCopyEliminated = false
		i = start;
		//loop (%1, %4, %8, %28, %29, %30, %31, %32)
		while(true){
			//add %28 = %7, %6 : int
			_28=start+len;
			//ifge %8, %28 goto blklab21 : int
			if(i>=_28){goto blklab21;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			// isCopyEliminated = true
			item = _29;
			//invoke (%30) = (%1, %4) lz77_2:append : function(byte[],byte)->(byte[])
			{
				// isCopyEliminated of '_1' = true
				_30 = _append_(_1DARRAY_PARAM(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			// isCopyEliminated = true
			_UPDATE_1DARRAY(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			// isCopyEliminated = true
			i = _32;
//.blklab22
blklab22:;
		}
//.blklab21
blklab21:;
//.blklab20
blklab20:;
//.blklab18
blklab18:;
	}
//.blklab17
blklab17:;
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
	int64_t _17;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_1DARRAY_BYTE(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	void* _25;
	void* _27;
	int64_t _29;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_1DARRAY_BYTE(_33);
	void* _34;
	_DECL_1DARRAY(_36);
	void* _37;
	_DECL_1DARRAY(_39);
	void* _40;
	int64_t _42;
	void* _43;
	_DECL_1DARRAY(_45);
	int64_t _46;
	int64_t _47;
	//const %6 = [115,109,97,108,108,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_6, 8, 0);
	_6[0] = 115; _6[1] = 109; _6[2] = 97; _6[3] = 108; _6[4] = 108; _6[5] = 46; _6[6] = 105; _6[7] = 110; 
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _5;
	//fieldload %8 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%7) = %8 () : method()->(byte[])
	{
		_7 = readAll(file, &_7_size);
	}
	//assign %2 = %7  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(data, _7);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_11, 14, 0);
	_11[0] = 68; _11[1] = 97; _11[2] = 116; _11[3] = 97; _11[4] = 58; _11[5] = 32; _11[6] = 32; _11[7] = 32; _11[8] = 32; _11[9] = 32; _11[10] = 32; _11[11] = 32; _11[12] = 32; _11[13] = 32; 
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
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
		// isCopyEliminated of '_2' = true
		_21 = _compress_(_1DARRAY_PARAM(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_21));
	}
	//assign %3 = %21  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(compress_data, _21);
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
	//fieldload %26 = %25 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %26 (%3) : method(any)->()
	{
		_PRINT_1DARRAY_BYTE(compress_data);
	}
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %29 = %3 : byte[]
	_29 = compress_data_size;
	//indirectinvoke () = %28 (%29) : method(any)->()
	{
		printf("%"PRId64, _29);
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_32, 6, 0);
	_32[0] = 32; _32[1] = 98; _32[2] = 121; _32[3] = 116; _32[4] = 101; _32[5] = 115; 
	//indirectinvoke () = %31 (%32) : method(int[])->()
	{
		println_s(_32, _32_size);
	}
	//invoke (%33) = (%3) lz77_2:decompress : function(byte[])->(byte[])
	{
		// isCopyEliminated of '_3' = true
		_33 = _decompress_(_1DARRAY_PARAM(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
	}
	//assign %4 = %33  : byte[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(decompress_data, _33);
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_36, 16, 0);
	_36[0] = 68; _36[1] = 69; _36[2] = 67; _36[3] = 79; _36[4] = 77; _36[5] = 80; _36[6] = 82; _36[7] = 69; _36[8] = 83; _36[9] = 83; _36[10] = 69; _36[11] = 68; _36[12] = 58; _36[13] = 32; _36[14] = 32; _36[15] = 32; 
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		println_s(_36, _36_size);
	}
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%39) = (%4) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_39 = fromBytes(decompress_data, decompress_data_size);
		_39_size = decompress_data_size;
	}
	//indirectinvoke () = %38 (%39) : method(int[])->()
	{
		println_s(_39, _39_size);
	}
	//fieldload %40 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %41 = %40 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %42 = %4 : byte[]
	_42 = decompress_data_size;
	//indirectinvoke () = %41 (%42) : method(any)->()
	{
		printf("%"PRId64, _42);
	}
	//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %44 = %43 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %45 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_45, 6, 0);
	_45[0] = 32; _45[1] = 98; _45[2] = 121; _45[3] = 116; _45[4] = 101; _45[5] = 115; 
	//indirectinvoke () = %44 (%45) : method(int[])->()
	{
		println_s(_45, _45_size);
	}
	//assert
	{
		//lengthof %46 = %2 : byte[]
		_46 = data_size;
		//lengthof %47 = %4 : byte[]
		_47 = decompress_data_size;
		//ifeq %46, %47 goto blklab23 : int
		if(_46==_47){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//assert
	{
		//ifeq %2, %4 goto blklab24 : byte[]
		_IFEQ_ARRAY_BYTE(data, decompress_data, blklab24);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab24
blklab24:;
	//assert
	}
	//fieldload %48 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %48 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	exit(0);
}

