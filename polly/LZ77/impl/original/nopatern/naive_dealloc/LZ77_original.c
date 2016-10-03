#include "LZ77_original.h"
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
int64_t match(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t offset, int64_t end){
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
	_DEALLOC(data);
	return len;
	//return
}

Match* findLongestMatch(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t pos){
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
		//invoke (%14) = (%0, %6, %1) LZ77_original:match : function(byte[],LZ77_original:nat,LZ77_original:nat)->(int)
		{
			void* data_tmp;
			_14 = match(_COPY_1DARRAY_PARAM_BYTE(data), true, offset, pos);
			_CALLEE_DEALLOC(data, "false-false-true" , "match");
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
	_DEALLOC_STRUCT(_18, Match);
	_18 = malloc(sizeof(Match));
	_18->len = bestLen;
	_18->offset = bestOffset;
	_ADD_DEALLOC(_18);
	//return %18
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	return _18;
	//return
}

BYTE* append(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	_COPY_1DARRAY_BYTE(nitems, _8);
	_ADD_DEALLOC(nitems);
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
	_DEALLOC(items);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* populate(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	_COPY_1DARRAY_BYTE(nitems, _5);
	_ADD_DEALLOC(nitems);
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
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* compress(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//arraygen %9 = [7; 8] : byte[]
	_DEALLOC(_9);
	_NEW_1DARRAY_BYTE(_9, _8, _7);
	_ADD_DEALLOC(_9);
	//assign %1 = %9  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _9);
	_ADD_DEALLOC(output);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab10 : int
		if(pos>=_10){goto blklab10;}
		//invoke (%11) = (%0, %2) LZ77_original:findLongestMatch : function(byte[],LZ77_original:nat)->(LZ77_original:Match)
		{
			void* data_tmp;
			_DEALLOC_STRUCT(_11, Match);
			_11 = findLongestMatch(_COPY_1DARRAY_PARAM_BYTE(data), true, pos);
			_CALLEE_DEALLOC(data, "false-false-true" , "findLongestMatch");
			_ADD_DEALLOC(_11);
		}
		//assign %3 = %11  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		m = copy_Match(_11);
		_ADD_DEALLOC(m);
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
		//ifne %4, %16 goto blklab12 : byte
		if(offset!=_16){goto blklab12;}
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
		//goto blklab13
		goto blklab13;
//.blklab12
blklab12:;
		//fieldload %20 = %3 len : {int len,int offset}
		_20 = m->len;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		pos = _21;
//.blklab13
blklab13:;
		//invoke (%22) = (%1, %4) LZ77_original:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_22);
			_22 = append(_COPY_1DARRAY_PARAM_BYTE(output), true, offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_22));
			_CALLEE_DEALLOC(output, "false-false-false" , "append");
			_ADD_DEALLOC(_22);
		}
		//assign %1 = %22  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _22);
		_ADD_DEALLOC(output);
		//invoke (%23) = (%1, %5) LZ77_original:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_23);
			_23 = append(_COPY_1DARRAY_PARAM_BYTE(output), true, length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_CALLEE_DEALLOC(output, "false-false-false" , "append");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _23);
		_ADD_DEALLOC(output);
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//return %1
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_9);
	_DEALLOC_STRUCT(_11, Match);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* decompress(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	_COPY_1DARRAY_BYTE(output, _11);
	_ADD_DEALLOC(output);
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
		//invoke (%23) = (%1, %4) LZ77_original:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_23);
			_23 = append(_COPY_1DARRAY_PARAM_BYTE(output), true, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_CALLEE_DEALLOC(output, "false-false-false" , "append");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _23);
		_ADD_DEALLOC(output);
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
			//invoke (%30) = (%1, %4) LZ77_original:append : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_DEALLOC(_30);
				_30 = append(_COPY_1DARRAY_PARAM_BYTE(output), true, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_CALLEE_DEALLOC(output, "false-false-false" , "append");
				_ADD_DEALLOC(_30);
			}
			//assign %1 = %30  : byte[]
			_DEALLOC(output);
			_COPY_1DARRAY_BYTE(output, _30);
			_ADD_DEALLOC(output);
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
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	void* _17;
	int64_t _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	void* _27;
	int64_t _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	_DECL_1DARRAY_BYTE(_33);
	_DECL_DEALLOC(_33);
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	void* _40;
	int64_t _42 = 0;
	void* _43;
	_DECL_1DARRAY(_45);
	_DECL_DEALLOC(_45);
	int64_t _46 = 0;
	int64_t _47 = 0;
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_8,  _8_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _5;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(file, &_9_size);
		_ADD_DEALLOC(_9);
	}
	//assign %2 = %9  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _9);
	_ADD_DEALLOC(data);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 14, 0);
	_13[0] = 68; _13[1] = 97; _13[2] = 116; _13[3] = 97; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_13));
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_16);
		_16 = fromBytes(data, data_size);
		_16_size = data_size;
		_ADD_DEALLOC(_16);
	}
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %19 = %2 : byte[]
	_19 = data_size;
	//indirectinvoke () = %18 (%19) : method(any)->()
	{
		printf("%"PRId64, _19);
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 6, 0);
	_22[0] = 32; _22[1] = 98; _22[2] = 121; _22[3] = 116; _22[4] = 101; _22[5] = 115; 
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		println_s(_22, _22_size);
	}
	//invoke (%23) = (%2) LZ77_original:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_DEALLOC(_23);
		_23 = compress(_COPY_1DARRAY_PARAM_BYTE(data), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		_CALLEE_DEALLOC(data, "false-false-false" , "compress");
		_ADD_DEALLOC(_23);
	}
	//assign %3 = %23  : byte[]
	_DEALLOC(compress_data);
	_COPY_1DARRAY_BYTE(compress_data, _23);
	_ADD_DEALLOC(compress_data);
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 19, 0);
	_26[0] = 67; _26[1] = 79; _26[2] = 77; _26[3] = 80; _26[4] = 82; _26[5] = 69; _26[6] = 83; _26[7] = 83; _26[8] = 69; _26[9] = 68; _26[10] = 32; _26[11] = 68; _26[12] = 97; _26[13] = 116; _26[14] = 97; _26[15] = 58; _26[16] = 32; _26[17] = 32; _26[18] = 32; 
	_ADD_DEALLOC(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_26));
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
	_DEALLOC(_32);
	_NEW_1DARRAY_int64_t(_32, 6, 0);
	_32[0] = 32; _32[1] = 98; _32[2] = 121; _32[3] = 116; _32[4] = 101; _32[5] = 115; 
	_ADD_DEALLOC(_32);
	//indirectinvoke () = %31 (%32) : method(int[])->()
	{
		println_s(_32, _32_size);
	}
	//invoke (%33) = (%3) LZ77_original:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_DEALLOC(_33);
		_33 = decompress(_COPY_1DARRAY_PARAM_BYTE(compress_data), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
		_CALLEE_DEALLOC(compress_data, "false-false-false" , "decompress");
		_ADD_DEALLOC(_33);
	}
	//assign %4 = %33  : byte[]
	_DEALLOC(decompress_data);
	_COPY_1DARRAY_BYTE(decompress_data, _33);
	_ADD_DEALLOC(decompress_data);
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY_int64_t(_36, 16, 0);
	_36[0] = 68; _36[1] = 69; _36[2] = 67; _36[3] = 79; _36[4] = 77; _36[5] = 80; _36[6] = 82; _36[7] = 69; _36[8] = 83; _36[9] = 83; _36[10] = 69; _36[11] = 68; _36[12] = 58; _36[13] = 32; _36[14] = 32; _36[15] = 32; 
	_ADD_DEALLOC(_36);
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_36));
	}
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%39) = (%4) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_39);
		_39 = fromBytes(decompress_data, decompress_data_size);
		_39_size = decompress_data_size;
		_ADD_DEALLOC(_39);
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
	_DEALLOC(_45);
	_NEW_1DARRAY_int64_t(_45, 6, 0);
	_45[0] = 32; _45[1] = 98; _45[2] = 121; _45[3] = 116; _45[4] = 101; _45[5] = 115; 
	_ADD_DEALLOC(_45);
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
		//ifeq %46, %47 goto blklab20 : int
		if(_46==_47){goto blklab20;}
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
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(compress_data);
	_DEALLOC(decompress_data);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_9);
	_DEALLOC(_13);
	_DEALLOC(_16);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_26);
	_DEALLOC(_32);
	_DEALLOC(_33);
	_DEALLOC(_36);
	_DEALLOC(_39);
	_DEALLOC(_45);
	exit(0);
}

