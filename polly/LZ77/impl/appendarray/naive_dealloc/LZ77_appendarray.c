#include "LZ77_appendarray.h"
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
		//invoke (%14) = (%0, %6, %1) LZ77_appendarray:match : function(byte[],LZ77_appendarray:nat,LZ77_appendarray:nat)->(int)
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

BYTE* append_byte(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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

BYTE* write_u1(BYTE* bytes, size_t bytes_size, _DECL_DEALLOC_PARAM(bytes), int64_t u1, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(_3);
	_DECL_DEALLOC(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	{
		_4 = (BYTE)u1;
	}
	//invoke (%3) = (%0, %4) LZ77_appendarray:append_byte : function(byte[],byte)->(byte[])
	{
		void* bytes_tmp;
		_DEALLOC(_3);
		_3 = append_byte(_COPY_1DARRAY_PARAM_BYTE(bytes), true, _4, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
		_CALLEE_DEALLOC(bytes, "false-false-false" , "append_byte");
		_ADD_DEALLOC(_3);
	}
	//assign %2 = %3  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _3);
	_ADD_DEALLOC(output);
	//return %2
	_DEALLOC(bytes);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* compress(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	Match* m;
	_DECL_DEALLOC(m);
	int64_t offset = 0;
	int64_t len = 0;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	Match* _11;
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	BYTE _17;
	int64_t _18 = 0;
	int64_t _19 = 0;
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
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
	_DEALLOC(_9);
	_NEW_1DARRAY_BYTE(_9, _8, _7);
	_ADD_DEALLOC(_9);
	//assign %1 = %9  : byte[]
	_DEALLOC(output);
	_COPY_1DARRAY_BYTE(output, _9);
	_ADD_DEALLOC(output);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab8 : int
		if(pos>=_10){goto blklab8;}
		//invoke (%11) = (%0, %2) LZ77_appendarray:findLongestMatch : function(byte[],LZ77_appendarray:nat)->(LZ77_appendarray:Match)
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
		//fieldload %12 = %3 offset : {int len,int offset}
		_12 = m->offset;
		//assign %4 = %12  : int
		offset = _12;
		//fieldload %13 = %3 len : {int len,int offset}
		_13 = m->len;
		//assign %5 = %13  : int
		len = _13;
		//invoke (%14) = (%1, %4) LZ77_appendarray:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_14);
			_14 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), true, offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
			_CALLEE_DEALLOC(output, "false-false-false" , "write_u1");
			_ADD_DEALLOC(_14);
		}
		//assign %1 = %14  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _14);
		_ADD_DEALLOC(output);
		//const %15 = 0 : int
		_15 = 0;
		//ifne %4, %15 goto blklab10 : int
		if(offset!=_15){goto blklab10;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//invoke (%16) = (%1, %17) LZ77_appendarray:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_16);
			_16 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), true, _17, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
			_CALLEE_DEALLOC(output, "false-false-false" , "append_byte");
			_ADD_DEALLOC(_16);
		}
		//assign %1 = %16  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _16);
		_ADD_DEALLOC(output);
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
		//invoke (%20) = (%1, %5) LZ77_appendarray:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_20);
			_20 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), true, len, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_CALLEE_DEALLOC(output, "false-false-false" , "write_u1");
			_ADD_DEALLOC(_20);
		}
		//assign %1 = %20  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _20);
		_ADD_DEALLOC(output);
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
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_9);
	_DEALLOC_STRUCT(_11, Match);
	_DEALLOC(_14);
	_DEALLOC(_16);
	_DEALLOC(_20);
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
		//invoke (%23) = (%1, %4) LZ77_appendarray:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_DEALLOC(_23);
			_23 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), true, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_CALLEE_DEALLOC(output, "false-false-false" , "append_byte");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		_COPY_1DARRAY_BYTE(output, _23);
		_ADD_DEALLOC(output);
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
			//invoke (%30) = (%1, %4) LZ77_appendarray:append_byte : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_DEALLOC(_30);
				_30 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), true, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_CALLEE_DEALLOC(output, "false-false-false" , "append_byte");
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
	void* _4;
	_DECL_DEALLOC(_4);
	_DECL_2DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	void* _13;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	_DECL_1DARRAY_BYTE(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	int64_t _25 = 0;
	void* _26;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_5);
	_CONV_ARGS(_5);
	_ADD_DEALLOC(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	_REMOVE_DEALLOC(_7);
	//invoke (%4) = (%7) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_7);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _4;
	//fieldload %9 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%8) = %9 () : method()->(byte[])
	{
		_8 = readAll(file, &_8_size);
		_ADD_DEALLOC(_8);
	}
	//assign %2 = %8  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _8);
	_ADD_DEALLOC(data);
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 14, 0);
	_12[0] = 68; _12[1] = 97; _12[2] = 116; _12[3] = 97; _12[4] = 58; _12[5] = 32; _12[6] = 32; _12[7] = 32; _12[8] = 32; _12[9] = 32; _12[10] = 32; _12[11] = 32; _12[12] = 32; _12[13] = 32; 
	_ADD_DEALLOC(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_12));
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
	_DEALLOC(_18);
	_NEW_1DARRAY_int64_t(_18, 6, 0);
	_18[0] = 32; _18[1] = 98; _18[2] = 121; _18[3] = 116; _18[4] = 101; _18[5] = 115; 
	_ADD_DEALLOC(_18);
	//indirectinvoke () = %17 (%18) : method(int[])->()
	{
		println_s(_18, _18_size);
	}
	//invoke (%19) = (%2) LZ77_appendarray:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_DEALLOC(_19);
		_19 = compress(_COPY_1DARRAY_PARAM_BYTE(data), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
		_CALLEE_DEALLOC(data, "false-false-false" , "compress");
		_ADD_DEALLOC(_19);
	}
	//assign %3 = %19  : byte[]
	_DEALLOC(compress_data);
	_COPY_1DARRAY_BYTE(compress_data, _19);
	_ADD_DEALLOC(compress_data);
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 19, 0);
	_22[0] = 67; _22[1] = 79; _22[2] = 77; _22[3] = 80; _22[4] = 82; _22[5] = 69; _22[6] = 83; _22[7] = 83; _22[8] = 69; _22[9] = 68; _22[10] = 32; _22[11] = 68; _22[12] = 97; _22[13] = 116; _22[14] = 97; _22[15] = 58; _22[16] = 32; _22[17] = 32; _22[18] = 32; 
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_22));
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
	_DEALLOC(_28);
	_NEW_1DARRAY_int64_t(_28, 6, 0);
	_28[0] = 32; _28[1] = 98; _28[2] = 121; _28[3] = 116; _28[4] = 101; _28[5] = 115; 
	_ADD_DEALLOC(_28);
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		println_s(_28, _28_size);
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(compress_data);
	_DEALLOC_2DARRAY_int64_t(_5);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_12);
	_DEALLOC(_18);
	_DEALLOC(_19);
	_DEALLOC(_22);
	_DEALLOC(_28);
	exit(0);
}

