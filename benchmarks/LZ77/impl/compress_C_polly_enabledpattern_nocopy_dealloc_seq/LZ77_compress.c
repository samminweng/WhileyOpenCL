#include "LZ77_compress.h"
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
int64_t _match_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t offset, int64_t end){
	int64_t _3 = 0;
	int64_t pos = 0;
	int64_t len = 0;
	int64_t maxIter = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	BYTE _15;
	int64_t _16 = 0;
	BYTE _17;
	int64_t _18 = 0;
	int64_t _19 = 0;
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
	_DEALLOC(data);
	return len;
	//return
}

Match* _findLongestMatch_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t pos){
	Match* m;
	_DECL_DEALLOC(m);
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
	_DECL_DEALLOC(_18);
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
		//invoke (%14) = (%0, %6, %1) LZ77_compress:match : function(byte[],LZ77_compress:nat,LZ77_compress:nat)->(int)
		{
			// isCopyEliminated of '_0' = true
			_14 = _match_(_1DARRAY_PARAM(data), false, offset, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "match");
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
	_DEALLOC_STRUCT(_18, Match);
	_18 = malloc(sizeof(Match));
	// isCopyEliminated = true
	_18->len = bestLen;
	// isCopyEliminated = true
	_18->offset = bestOffset;
	_ADD_DEALLOC(_18);
	//return %18
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	return _18;
	//return
}

BYTE* _append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
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
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	_ADD_DEALLOC(_8);
	//assign %2 = %8  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _8);
	_TRANSFER_DEALLOC(nitems, _8);
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
	_DEALLOC(items);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_ADD_DEALLOC(_5);
	//assign %2 = %5  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	_TRANSFER_DEALLOC(nitems, _5);
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
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	Match* m;
	_DECL_DEALLOC(m);
	BYTE offset;
	BYTE length;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	Match* _11;
	_DECL_DEALLOC(_11);
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
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	_DECL_1DARRAY_BYTE(_33);
	_DECL_DEALLOC(_33);
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	// isCopyEliminated = true
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//const %24 = 2 : int
	_24 = 2;
	//lengthof %25 = %0 : byte[]
	_25 = data_size;
	//mul %26 = %24, %25 : int
	_26=_24*_25;
	//arraygen %9 = [7; 26] : byte[]
	_DEALLOC(_9);
	_NEW_1DARRAY_BYTE(_9, _26, _7);
	_ADD_DEALLOC(_9);
	//const %27 = 0 : int
	_27 = 0;
	//assign %28 = %27  : int
	// isCopyEliminated = true
	_28 = _27;
	//assign %1 = %9  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _9);
	_TRANSFER_DEALLOC(output, _9);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %28)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab12 : int
		if(pos>=_10){goto blklab12;}
		//invoke (%11) = (%0, %2) LZ77_compress:findLongestMatch : function(byte[],LZ77_compress:nat)->(LZ77_compress:Match)
		{
			_DEALLOC_STRUCT(_11, Match);
			// isCopyEliminated of '_0' = true
			_11 = _findLongestMatch_(_1DARRAY_PARAM(data), false, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "findLongestMatch");
			_ADD_DEALLOC(_11);
		}
		//assign %3 = %11  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		// isCopyEliminated = true
		m = _11;
		_TRANSFER_DEALLOC(m, _11);
		//fieldload %13 = %3 offset : {int len,int offset}
		_13 = m->offset;
		//invoke (%12) = (%13) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_12 = (BYTE)_13;
		}
		//assign %4 = %12  : byte
		// isCopyEliminated = true
		offset = _12;
		//fieldload %15 = %3 len : {int len,int offset}
		_15 = m->len;
		//invoke (%14) = (%15) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_14 = (BYTE)_15;
		}
		//assign %5 = %14  : byte
		// isCopyEliminated = true
		length = _14;
		//const %16 = 00000000b : byte
		_16 = 0b00000000;
		//ifne %4, %16 goto blklab14 : byte
		if(offset!=_16){goto blklab14;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//assign %5 = %17  : byte
		// isCopyEliminated = true
		length = _17;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=pos+_18;
		//assign %2 = %19  : int
		// isCopyEliminated = true
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
		// isCopyEliminated = true
		pos = _21;
//.blklab15
blklab15:;
		//update %1[%28] = %4 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_28] = offset;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %28, %29 : int
		_30=_28+_29;
		//assign %28 = %30  : int
		// isCopyEliminated = true
		_28 = _30;
		//update %1[%28] = %5 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_28] = length;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %28, %31 : int
		_32=_28+_31;
		//assign %28 = %32  : int
		// isCopyEliminated = true
		_28 = _32;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//assert
	{
		//ifle %28, %26 goto blklab22 : int
		if(_28<=_26){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//invoke (%33) = (%1, %28) LZ77_compress:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_33);
		// isCopyEliminated of '_1' = true
		_33 = _resize_(_1DARRAY_PARAM(output), false, _28, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
		_RETAIN_DEALLOC(output, "false-false-false" , "resize");
		_ADD_DEALLOC(_33);
	}
	//assign %1 = %33  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _33);
	_TRANSFER_DEALLOC(output, _33);
	//return %1
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_9);
	_DEALLOC_STRUCT(_11, Match);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_33);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
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
	_DECL_DEALLOC(_11);
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
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	_DECL_DEALLOC(_30);
	int64_t _31 = 0;
	int64_t _32 = 0;
	//const %9 = 00000000b : byte
	_9 = 0b00000000;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [9; 10] : byte[]
	_DEALLOC(_11);
	_NEW_1DARRAY_BYTE(_11, _10, _9);
	_ADD_DEALLOC(_11);
	//assign %1 = %11  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _11);
	_TRANSFER_DEALLOC(output, _11);
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
		//ifge %14, %15 goto blklab16 : int
		if(_14>=_15){goto blklab16;}
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
		//ifne %3, %22 goto blklab18 : byte
		if(header!=_22){goto blklab18;}
		//invoke (%23) = (%1, %4) LZ77_compress:append : function(byte[],byte)->(byte[])
		{
			_DEALLOC(_23);
			// isCopyEliminated of '_1' = true
			_23 = _append_(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_RETAIN_DEALLOC(output, "false-false-false" , "append");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(output, _23);
		_TRANSFER_DEALLOC(output, _23);
		//goto blklab19
		goto blklab19;
//.blklab18
blklab18:;
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
			//ifge %8, %28 goto blklab20 : int
			if(i>=_28){goto blklab20;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			// isCopyEliminated = true
			item = _29;
			//invoke (%30) = (%1, %4) LZ77_compress:append : function(byte[],byte)->(byte[])
			{
				_DEALLOC(_30);
				// isCopyEliminated of '_1' = true
				_30 = _append_(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_RETAIN_DEALLOC(output, "false-false-false" , "append");
				_ADD_DEALLOC(_30);
			}
			//assign %1 = %30  : byte[]
			_DEALLOC(output);
			// isCopyEliminated = true
			_UPDATE_1DARRAY(output, _30);
			_TRANSFER_DEALLOC(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			// isCopyEliminated = true
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
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_DEALLOC(compress_data);
	FILE* writer;
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	void* _6;
	_DECL_DEALLOC(_6);
	_DECL_2DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	void* _18;
	int64_t _20 = 0;
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	_DECL_1DARRAY_BYTE(_24);
	_DECL_DEALLOC(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	void* _28;
	int64_t _30 = 0;
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	void* _34;
	_DECL_DEALLOC(_34);
	_DECL_2DARRAY(_35);
	_DECL_DEALLOC(_35);
	int64_t _36 = 0;
	_DECL_1DARRAY(_37);
	_DECL_DEALLOC(_37);
	int64_t _38 = 0;
	_DECL_1DARRAY_BYTE(_41);
	_DECL_DEALLOC(_41);
	void* _42;
	_DECL_1DARRAY(_44);
	_DECL_DEALLOC(_44);
	void* _45;
	_DECL_1DARRAY(_47);
	_DECL_DEALLOC(_47);
	void* _48;
	int64_t _50 = 0;
	void* _51;
	_DECL_1DARRAY(_53);
	_DECL_DEALLOC(_53);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_7);
	_CONV_ARGS(_7);
	_ADD_DEALLOC(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_9_size = _7_size_size;
	_REMOVE_DEALLOC(_9);
	//invoke (%6) = (%9) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_6 = Reader(_9, _9_size);
	}
	//assign %1 = %6  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _6;
	//fieldload %11 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%10) = %11 () : method()->(byte[])
	{
		_10 = readAll(file, &_10_size);
		_ADD_DEALLOC(_10);
	}
	//assign %2 = %10  : byte[]
	_DEALLOC(data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(data, _10);
	_TRANSFER_DEALLOC(data, _10);
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, 14, 0);
	_14[0] = 68; _14[1] = 97; _14[2] = 116; _14[3] = 97; _14[4] = 58; _14[5] = 32; _14[6] = 32; _14[7] = 32; _14[8] = 32; _14[9] = 32; _14[10] = 32; _14[11] = 32; _14[12] = 32; _14[13] = 32; 
	_ADD_DEALLOC(_14);
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		println_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%17) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_17);
		_17 = fromBytes(data, data_size);
		_17_size = data_size;
		_ADD_DEALLOC(_17);
	}
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		println_s(_17, _17_size);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %20 = %2 : byte[]
	_20 = data_size;
	//indirectinvoke () = %19 (%20) : method(any)->()
	{
		printf("%"PRId64, _20);
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY_int64_t(_23, 6, 0);
	_23[0] = 32; _23[1] = 98; _23[2] = 121; _23[3] = 116; _23[4] = 101; _23[5] = 115; 
	_ADD_DEALLOC(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
	//invoke (%24) = (%2) LZ77_compress:compress : function(byte[])->(byte[])
	{
		_DEALLOC(_24);
		// isCopyEliminated of '_2' = true
		_24 = _compress_(_1DARRAY_PARAM(data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
		_RETAIN_DEALLOC(data, "false-false-false" , "compress");
		_ADD_DEALLOC(_24);
	}
	//assign %3 = %24  : byte[]
	_DEALLOC(compress_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(compress_data, _24);
	_TRANSFER_DEALLOC(compress_data, _24);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 19, 0);
	_27[0] = 67; _27[1] = 79; _27[2] = 77; _27[3] = 80; _27[4] = 82; _27[5] = 69; _27[6] = 83; _27[7] = 83; _27[8] = 69; _27[9] = 68; _27[10] = 32; _27[11] = 68; _27[12] = 97; _27[13] = 116; _27[14] = 97; _27[15] = 58; _27[16] = 32; _27[17] = 32; _27[18] = 32; 
	_ADD_DEALLOC(_27);
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
	_DEALLOC(_33);
	_NEW_1DARRAY_int64_t(_33, 6, 0);
	_33[0] = 32; _33[1] = 98; _33[2] = 121; _33[3] = 116; _33[4] = 101; _33[5] = 115; 
	_ADD_DEALLOC(_33);
	//indirectinvoke () = %32 (%33) : method(int[])->()
	{
		println_s(_33, _33_size);
	}
	//fieldload %35 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_35);
	_CONV_ARGS(_35);
	_ADD_DEALLOC(_35);
	//const %36 = 1 : int
	_36 = 1;
	//indexof %37 = %35, %36 : int[][]
	_37=_35[_36];
	_37_size = _35_size_size;
	_REMOVE_DEALLOC(_37);
	//invoke (%34) = (%37) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_34 = Writer(_37, _37_size);
	}
	//assign %4 = %34  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	// isCopyEliminated = true
	writer = _34;
	//fieldload %39 = %4 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%38) = %39 (%3) : method(byte[])->(int)
	{
		writeAll(writer, compress_data, compress_data_size);
	}
	//fieldload %40 = %4 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %40 () : method()->()
	{
		fclose(writer);
		writer = NULL;
	}
	//invoke (%41) = (%3) LZ77_compress:decompress : function(byte[])->(byte[])
	{
		_DEALLOC(_41);
		// isCopyEliminated of '_3' = true
		_41 = _decompress_(_1DARRAY_PARAM(compress_data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_41));
		_RETAIN_DEALLOC(compress_data, "false-false-false" , "decompress");
		_ADD_DEALLOC(_41);
	}
	//assign %5 = %41  : byte[]
	_DEALLOC(decompress_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(decompress_data, _41);
	_TRANSFER_DEALLOC(decompress_data, _41);
	//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %43 = %42 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %44 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_44);
	_NEW_1DARRAY_int64_t(_44, 16, 0);
	_44[0] = 68; _44[1] = 69; _44[2] = 67; _44[3] = 79; _44[4] = 77; _44[5] = 80; _44[6] = 82; _44[7] = 69; _44[8] = 83; _44[9] = 83; _44[10] = 69; _44[11] = 68; _44[12] = 58; _44[13] = 32; _44[14] = 32; _44[15] = 32; 
	_ADD_DEALLOC(_44);
	//indirectinvoke () = %43 (%44) : method(int[])->()
	{
		println_s(_44, _44_size);
	}
	//fieldload %45 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %46 = %45 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%47) = (%5) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_47);
		_47 = fromBytes(decompress_data, decompress_data_size);
		_47_size = decompress_data_size;
		_ADD_DEALLOC(_47);
	}
	//indirectinvoke () = %46 (%47) : method(int[])->()
	{
		println_s(_47, _47_size);
	}
	//fieldload %48 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %49 = %48 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %50 = %5 : byte[]
	_50 = decompress_data_size;
	//indirectinvoke () = %49 (%50) : method(any)->()
	{
		printf("%"PRId64, _50);
	}
	//fieldload %51 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %52 = %51 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %53 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_53);
	_NEW_1DARRAY_int64_t(_53, 6, 0);
	_53[0] = 32; _53[1] = 98; _53[2] = 121; _53[3] = 116; _53[4] = 101; _53[5] = 115; 
	_ADD_DEALLOC(_53);
	//indirectinvoke () = %52 (%53) : method(int[])->()
	{
		println_s(_53, _53_size);
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(compress_data);
	if(writer != NULL){fclose(writer); writer = NULL;}
	_DEALLOC(decompress_data);
	_DEALLOC_2DARRAY_int64_t(_7);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_DEALLOC(_14);
	_DEALLOC(_17);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC(_33);
	_DEALLOC_2DARRAY_int64_t(_35);
	_DEALLOC(_37);
	_DEALLOC(_41);
	_DEALLOC(_44);
	_DEALLOC(_47);
	_DEALLOC(_53);
	exit(0);
}

