#include "LZ77_original.h"
Match* copy_Match(Match* _Match){
	Match* new_Match = malloc(sizeof(Match));
	new_Match->len = _Match->len;
	new_Match->offset = _Match->offset;
	return new_Match;
}
Match** copy_array_Match(Match** _Match, long long _Match_size){
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
	printf("%lld", match->len);
	printf(" offset:");
	printf("%lld", match->offset);
	printf("}");
}
long long match(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), long long offset, long long end){
	long long _3 = 0;
	long long pos = 0;
	long long len = 0;
	long long _6 = 0;
	long long _7 = 0;
	BYTE _8;
	BYTE _9;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
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

Match* findLongestMatch(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), long long pos){
	Match* m;
	_DECL_DEALLOC(m);
	long long bestOffset = 0;
	long long bestLen = 0;
	long long start = 0;
	long long offset = 0;
	long long len = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
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
	_10 = max(_12, _13);
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
			_14 = match(_1DARRAY_PARAM(data), false, offset, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "match");
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

BYTE* append_byte(BYTE* items, long long items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	long long i = 0;
	BYTE _4;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	BYTE _11;
	long long _12 = 0;
	long long _13 = 0;
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
	_UPDATE_1DARRAY(nitems, _8);
	_TRANSFER_DEALLOC(nitems, _8);
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

BYTE* write_u1(BYTE* bytes, long long bytes_size, _DECL_DEALLOC_PARAM(bytes), long long u1, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(_3);
	_DECL_DEALLOC(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	_4 = (BYTE)u1;
	//invoke (%3) = (%0, %4) LZ77_original:append_byte : function(byte[],byte)->(byte[])
	{
		_UPDATE_1DARRAY_SIZE(_3, bytes);
		_DEALLOC(_3);
		_3 = append_byte(_1DARRAY_PARAM(bytes), false, _4, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
		_RETAIN_DEALLOC(bytes, "false-false-false" , "append_byte");
		_ADD_DEALLOC(_3);
	}
	//assign %2 = %3  : byte[]
	_DEALLOC(output);
	_UPDATE_1DARRAY(output, _3);
	_TRANSFER_DEALLOC(output, _3);
	//return %2
	_DEALLOC(bytes);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* compress(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	long long pos = 0;
	Match* m;
	_DECL_DEALLOC(m);
	long long offset = 0;
	long long len = 0;
	long long _6 = 0;
	BYTE _7;
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	long long _10 = 0;
	Match* _11;
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	long long _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	long long _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	BYTE _17;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
	long long _21 = 0;
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
	_UPDATE_1DARRAY(output, _9);
	_TRANSFER_DEALLOC(output, _9);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab8 : int
		if(pos>=_10){goto blklab8;}
		//invoke (%11) = (%0, %2) LZ77_original:findLongestMatch : function(byte[],LZ77_original:nat)->(LZ77_original:Match)
		{
			_DEALLOC_STRUCT(_11, Match);
			_11 = findLongestMatch(_1DARRAY_PARAM(data), false, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "findLongestMatch");
			_ADD_DEALLOC(_11);
		}
		//assign %3 = %11  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		m = _11;
		_TRANSFER_DEALLOC(m, _11);
		//fieldload %12 = %3 offset : {int len,int offset}
		_12 = m->offset;
		//assign %4 = %12  : int
		offset = _12;
		//fieldload %13 = %3 len : {int len,int offset}
		_13 = m->len;
		//assign %5 = %13  : int
		len = _13;
		//invoke (%14) = (%1, %4) LZ77_original:write_u1 : function(byte[],int)->(byte[])
		{
			_UPDATE_1DARRAY_SIZE(_14, output);
			_DEALLOC(_14);
			_14 = write_u1(_1DARRAY_PARAM(output), false, offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
			_RETAIN_DEALLOC(output, "false-false-false" , "write_u1");
			_ADD_DEALLOC(_14);
		}
		//assign %1 = %14  : byte[]
		_DEALLOC(output);
		_UPDATE_1DARRAY(output, _14);
		_TRANSFER_DEALLOC(output, _14);
		//const %15 = 0 : int
		_15 = 0;
		//ifne %4, %15 goto blklab10 : int
		if(offset!=_15){goto blklab10;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//invoke (%16) = (%1, %17) LZ77_original:append_byte : function(byte[],byte)->(byte[])
		{
			_UPDATE_1DARRAY_SIZE(_16, output);
			_DEALLOC(_16);
			_16 = append_byte(_1DARRAY_PARAM(output), false, _17, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
			_RETAIN_DEALLOC(output, "false-false-false" , "append_byte");
			_ADD_DEALLOC(_16);
		}
		//assign %1 = %16  : byte[]
		_DEALLOC(output);
		_UPDATE_1DARRAY(output, _16);
		_TRANSFER_DEALLOC(output, _16);
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
		//invoke (%20) = (%1, %5) LZ77_original:write_u1 : function(byte[],int)->(byte[])
		{
			_UPDATE_1DARRAY_SIZE(_20, output);
			_DEALLOC(_20);
			_20 = write_u1(_1DARRAY_PARAM(output), false, len, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_RETAIN_DEALLOC(output, "false-false-false" , "write_u1");
			_ADD_DEALLOC(_20);
		}
		//assign %1 = %20  : byte[]
		_DEALLOC(output);
		_UPDATE_1DARRAY(output, _20);
		_TRANSFER_DEALLOC(output, _20);
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

BYTE* decompress(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	long long pos = 0;
	BYTE header;
	BYTE item;
	long long offset = 0;
	long long len = 0;
	long long start = 0;
	long long i = 0;
	BYTE _9;
	long long _10 = 0;
	_DECL_1DARRAY_BYTE(_11);
	_DECL_DEALLOC(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	BYTE _16;
	long long _17 = 0;
	long long _18 = 0;
	BYTE _19;
	long long _20 = 0;
	long long _21 = 0;
	BYTE _22;
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	_DECL_DEALLOC(_30);
	long long _31 = 0;
	long long _32 = 0;
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
	_UPDATE_1DARRAY(output, _11);
	_TRANSFER_DEALLOC(output, _11);
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
		//invoke (%23) = (%1, %4) LZ77_original:append_byte : function(byte[],byte)->(byte[])
		{
			_UPDATE_1DARRAY_SIZE(_23, output);
			_DEALLOC(_23);
			_23 = append_byte(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_RETAIN_DEALLOC(output, "false-false-false" , "append_byte");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		_UPDATE_1DARRAY(output, _23);
		_TRANSFER_DEALLOC(output, _23);
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
		//invoke (%24) = (%3) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		_24 = (unsigned int)header;
		//assign %5 = %24  : int
		offset = _24;
		//invoke (%25) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		_25 = (unsigned int)item;
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
			//invoke (%30) = (%1, %4) LZ77_original:append_byte : function(byte[],byte)->(byte[])
			{
				_UPDATE_1DARRAY_SIZE(_30, output);
				_DEALLOC(_30);
				_30 = append_byte(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_RETAIN_DEALLOC(output, "false-false-false" , "append_byte");
				_ADD_DEALLOC(_30);
			}
			//assign %1 = %30  : byte[]
			_DEALLOC(output);
			_UPDATE_1DARRAY(output, _30);
			_TRANSFER_DEALLOC(output, _30);
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

BYTE* init(long long repeat, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	long long length = 0;
	long long pos = 0;
	long long _4 = 0;
	long long _5 = 0;
	BYTE _6;
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	long long _10 = 0;
	long long _11 = 0;
	BYTE _12;
	long long _13 = 0;
	long long _14 = 0;
	//const %4 = 15 : int
	_4 = 15;
	//mul %5 = %0, %4 : int
	_5=repeat*_4;
	//assign %2 = %5  : int
	length = _5;
	//const %6 = 00000000b : byte
	_6 = 0b00000000;
	//arraygen %7 = [6; 2] : byte[]
	_DEALLOC(_7);
	_NEW_1DARRAY_BYTE(_7, length, _6);
	_ADD_DEALLOC(_7);
	//assign %1 = %7  : byte[]
	_DEALLOC(items);
	_UPDATE_1DARRAY(items, _7);
	_TRANSFER_DEALLOC(items, _7);
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	pos = _8;
	//loop (%1, %3, %9, %10, %11, %12, %13, %14)
	while(true){
		//ifge %3, %2 goto blklab18 : int
		if(pos>=length){goto blklab18;}
		//const %9 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
		_DEALLOC(_9);
		_NEW_1DARRAY_BYTE(_9, 15, 0b0);
		_9[0] = 0b01100001; _9[1] = 0b01100001; _9[2] = 0b01100011; _9[3] = 0b01100001; _9[4] = 0b01100001; _9[5] = 0b01100011; _9[6] = 0b01100001; _9[7] = 0b01100010; _9[8] = 0b01100011; _9[9] = 0b01100001; _9[10] = 0b01100010; _9[11] = 0b01100001; _9[12] = 0b01100001; _9[13] = 0b01100001; _9[14] = 0b01100011; 
		_ADD_DEALLOC(_9);
		//const %10 = 15 : int
		_10 = 15;
		//rem %11 = %3, %10 : int
		_11=pos%_10;
		//indexof %12 = %9, %11 : byte[]
		_12=_9[_11];
		//update %1[%3] = %12 : byte[] -> byte[]
		items[pos] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %3, %13 : int
		_14=pos+_13;
		//assign %3 = %14  : int
		pos = _14;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
	//return %1
	_DEALLOC(_7);
	_DEALLOC(_9);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	long long* n;
	_DECL_DEALLOC(n);
	long long repeat = 0;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_DEALLOC(compress_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	long long* _6;
	_DECL_DEALLOC(_6);
	_DECL_2DARRAY(_7);
	_DECL_DEALLOC(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	long long _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	void* _24;
	long long _26 = 0;
	void* _27;
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	_DECL_1DARRAY_BYTE(_30);
	_DECL_DEALLOC(_30);
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	void* _34;
	long long _36 = 0;
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_LONGLONG(_7);
	_CONV_ARGS(_7);
	_ADD_DEALLOC(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_REMOVE_DEALLOC(_9);
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	_ADD_DEALLOC(_6);
	_REMOVE_DEALLOC(_9);
	//assign %1 = %6  : null|int
	_DEALLOC(n);
	n = _6;
	_TRANSFER_DEALLOC(n, _6);
	//ifis %1, null goto blklab20 : null|int
	if(n == NULL) { goto blklab20;}
	//assign %2 = %1  : int
	repeat = *n;
	//invoke (%10) = (%2) LZ77_original:init : function(int)->(byte[])
	{
		_DEALLOC(_10);
		_10 = init(repeat, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_ADD_DEALLOC(_10);
	}
	//assign %3 = %10  : byte[]
	_DEALLOC(data);
	_UPDATE_1DARRAY(data, _10);
	_TRANSFER_DEALLOC(data, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_LONGLONG(_13, 14, 0);
	_13[0] = 68; _13[1] = 97; _13[2] = 116; _13[3] = 97; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %16 = %3 : byte[]
	_16 = data_size;
	//indirectinvoke () = %15 (%16) : method(any)->()
	printf("%lld", _16);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_LONGLONG(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	_ADD_DEALLOC(_19);
	//indirectinvoke () = %18 (%19) : method(int[])->()
	println_s(_19, _19_size);
	//invoke (%20) = (%3) LZ77_original:compress : function(byte[])->(byte[])
	{
		_UPDATE_1DARRAY_SIZE(_20, data);
		_DEALLOC(_20);
		_20 = compress(_1DARRAY_PARAM(data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		_RETAIN_DEALLOC(data, "false-false-false" , "compress");
		_ADD_DEALLOC(_20);
	}
	//assign %4 = %20  : byte[]
	_DEALLOC(compress_data);
	_UPDATE_1DARRAY(compress_data, _20);
	_TRANSFER_DEALLOC(compress_data, _20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY_LONGLONG(_23, 19, 0);
	_23[0] = 67; _23[1] = 79; _23[2] = 77; _23[3] = 80; _23[4] = 82; _23[5] = 69; _23[6] = 83; _23[7] = 83; _23[8] = 69; _23[9] = 68; _23[10] = 32; _23[11] = 68; _23[12] = 97; _23[13] = 116; _23[14] = 97; _23[15] = 58; _23[16] = 32; _23[17] = 32; _23[18] = 32; 
	_ADD_DEALLOC(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %26 = %4 : byte[]
	_26 = compress_data_size;
	//indirectinvoke () = %25 (%26) : method(any)->()
	printf("%lld", _26);
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_29);
	_NEW_1DARRAY_LONGLONG(_29, 6, 0);
	_29[0] = 32; _29[1] = 98; _29[2] = 121; _29[3] = 116; _29[4] = 101; _29[5] = 115; 
	_ADD_DEALLOC(_29);
	//indirectinvoke () = %28 (%29) : method(int[])->()
	println_s(_29, _29_size);
	//invoke (%30) = (%4) LZ77_original:decompress : function(byte[])->(byte[])
	{
		_UPDATE_1DARRAY_SIZE(_30, compress_data);
		_DEALLOC(_30);
		_30 = decompress(_1DARRAY_PARAM(compress_data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
		_RETAIN_DEALLOC(compress_data, "false-false-false" , "decompress");
		_ADD_DEALLOC(_30);
	}
	//assign %5 = %30  : byte[]
	_DEALLOC(decompress_data);
	_UPDATE_1DARRAY(decompress_data, _30);
	_TRANSFER_DEALLOC(decompress_data, _30);
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_33);
	_NEW_1DARRAY_LONGLONG(_33, 16, 0);
	_33[0] = 68; _33[1] = 69; _33[2] = 67; _33[3] = 79; _33[4] = 77; _33[5] = 80; _33[6] = 82; _33[7] = 69; _33[8] = 83; _33[9] = 83; _33[10] = 69; _33[11] = 68; _33[12] = 58; _33[13] = 32; _33[14] = 32; _33[15] = 32; 
	_ADD_DEALLOC(_33);
	//indirectinvoke () = %32 (%33) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_33));
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %36 = %5 : byte[]
	_36 = decompress_data_size;
	//indirectinvoke () = %35 (%36) : method(any)->()
	printf("%lld", _36);
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %39 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_39);
	_NEW_1DARRAY_LONGLONG(_39, 6, 0);
	_39[0] = 32; _39[1] = 98; _39[2] = 121; _39[3] = 116; _39[4] = 101; _39[5] = 115; 
	_ADD_DEALLOC(_39);
	//indirectinvoke () = %38 (%39) : method(int[])->()
	println_s(_39, _39_size);
//.blklab20
blklab20:;
	//return
	_DEALLOC(n);
	_DEALLOC(data);
	_DEALLOC(compress_data);
	_DEALLOC(decompress_data);
	_DEALLOC(_6);
	_DEALLOC_2DARRAY_LONGLONG(_7);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_29);
	_DEALLOC(_30);
	_DEALLOC(_33);
	_DEALLOC(_39);
	exit(0);
}

