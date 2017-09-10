#include "LZ77_original_opt.h"
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
		//invoke (%14) = (%0, %6, %1) LZ77_original_opt:match : function(byte[],LZ77_original_opt:nat,LZ77_original_opt:nat)->(int)
		{
			void* data_tmp;
			_14 = _match_(_COPY_1DARRAY_PARAM_BYTE(data), offset, pos);
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
		//ifge %3, %10 goto blklab9 : int
		if(i>=_10){goto blklab9;}
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
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
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
		//ifge %3, %1 goto blklab13 : int
		if(i>=size){goto blklab13;}
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
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	int64_t pos;
	Match* m;
	BYTE offset;
	BYTE length;
	int64_t _6;
	BYTE _7;
	int64_t _8;
	_DECL_1DARRAY_BYTE(_9);
	int64_t _10;
	Match* _11;
	BYTE _12;
	int64_t _13;
	BYTE _14;
	int64_t _15;
	BYTE _16;
	BYTE _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
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
		//ifge %2, %10 goto blklab15 : int
		if(pos>=_10){goto blklab15;}
		//invoke (%11) = (%0, %2) LZ77_original_opt:findLongestMatch : function(byte[],LZ77_original_opt:nat)->(LZ77_original_opt:Match)
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
		//ifne %4, %16 goto blklab17 : byte
		if(offset!=_16){goto blklab17;}
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
		//goto blklab18
		goto blklab18;
//.blklab17
blklab17:;
		//fieldload %20 = %3 len : {int len,int offset}
		_20 = m->len;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		pos = _21;
//.blklab18
blklab18:;
		//invoke (%22) = (%1, %4) LZ77_original_opt:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_22 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_22));
		}
		//assign %1 = %22  : byte[]
		_COPY_1DARRAY_BYTE(output, _22);
		//invoke (%23) = (%1, %5) LZ77_original_opt:append : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = _append_(_COPY_1DARRAY_PARAM_BYTE(output), length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
//.blklab16
blklab16:;
	}
//.blklab15
blklab15:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* _opt_append_(BYTE* items, size_t items_size, int64_t items_length, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(_3);
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i;
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY_BYTE(_13);
	int64_t _14;
	int64_t _15;
	BYTE _16;
	int64_t _17;
	int64_t _18;
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//ifge %1, %6 goto blklab19 : int
	if(items_length>=_6){goto blklab19;}
	//update %0[%1] = %2 : byte[] -> byte[]
	items[items_length] = item;
	//goto blklab20
	goto blklab20;
//.blklab19
blklab19:;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//lengthof %8 = %0 : byte[]
	_8 = items_size;
	//const %9 = 2 : int
	_9 = 2;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//arraygen %13 = [7; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _7);
	//assign %4 = %13  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	i = _14;
	//loop (%4, %5, %15, %16, %17, %18)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = items_size;
		//ifge %5, %15 goto blklab21 : int
		if(i>=_15){goto blklab21;}
		//indexof %16 = %0, %5 : byte[]
		_16=items[i];
		//update %4[%5] = %16 : byte[] -> byte[]
		nitems[i] = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %5, %17 : int
		_18=i+_17;
		//assign %5 = %18  : int
		i = _18;
//.blklab22
blklab22:;
	}
//.blklab21
blklab21:;
	//update %4[%5] = %2 : byte[] -> byte[]
	nitems[i] = item;
	//assign %0 = %4  : byte[]
	_COPY_1DARRAY_BYTE(items, nitems);
//.blklab20
blklab20:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_1DARRAY_BYTE(items);
	int64_t items_length;
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
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	BYTE _33;
	_DECL_1DARRAY_BYTE(_34);
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	_DECL_1DARRAY_BYTE(_39);
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	//assign %2 = %13  : byte[]
	_COPY_1DARRAY_BYTE(items, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	items_length = _14;
	//const %15 = 0 : int
	_15 = 0;
	//assign %4 = %15  : int
	pos = _15;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %4, %16 : int
		_17=pos+_16;
		//lengthof %18 = %0 : byte[]
		_18 = data_size;
		//ifge %17, %18 goto blklab23 : int
		if(_17>=_18){goto blklab23;}
		//indexof %19 = %0, %4 : byte[]
		_19=data[pos];
		//assign %5 = %19  : byte
		header = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %4, %20 : int
		_21=pos+_20;
		//indexof %22 = %0, %21 : byte[]
		_22=data[_21];
		//assign %6 = %22  : byte
		item = _22;
		//const %23 = 2 : int
		_23 = 2;
		//add %24 = %4, %23 : int
		_24=pos+_23;
		//assign %4 = %24  : int
		pos = _24;
		//const %25 = 00000000b : byte
		_25 = 0b00000000;
		//ifne %5, %25 goto blklab25 : byte
		if(header!=_25){goto blklab25;}
		//invoke (%26) = (%2, %3, %6) LZ77_original_opt:opt_append : function(byte[],LZ77_original_opt:nat,byte)->(byte[])
		{
			void* items_tmp;
			_26 = _opt_append_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_26));
		}
		//assign %2 = %26  : byte[]
		_COPY_1DARRAY_BYTE(items, _26);
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=items_length+_27;
		//assign %3 = %28  : int
		items_length = _28;
		//goto blklab26
		goto blklab26;
//.blklab25
blklab25:;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_29 = (unsigned int)header;
		}
		//assign %7 = %29  : int
		offset = _29;
		//invoke (%30) = (%6) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_30 = (unsigned int)item;
		}
		//assign %8 = %30  : int
		len = _30;
		//sub %31 = %3, %7 : int
		_31=items_length-offset;
		//assign %9 = %31  : int
		start = _31;
		//assign %10 = %9  : int
		i = start;
		//loop (%2, %3, %6, %10, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//add %32 = %9, %8 : int
			_32=start+len;
			//ifge %10, %32 goto blklab27 : int
			if(i>=_32){goto blklab27;}
			//indexof %33 = %2, %10 : byte[]
			_33=items[i];
			//assign %6 = %33  : byte
			item = _33;
			//invoke (%34) = (%2, %3, %6) LZ77_original_opt:opt_append : function(byte[],LZ77_original_opt:nat,byte)->(byte[])
			{
				void* items_tmp;
				_34 = _opt_append_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
			}
			//assign %2 = %34  : byte[]
			_COPY_1DARRAY_BYTE(items, _34);
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %3, %35 : int
			_36=items_length+_35;
			//assign %3 = %36  : int
			items_length = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %10, %37 : int
			_38=i+_37;
			//assign %10 = %38  : int
			i = _38;
//.blklab28
blklab28:;
		}
//.blklab27
blklab27:;
//.blklab26
blklab26:;
//.blklab24
blklab24:;
	}
//.blklab23
blklab23:;
	//invoke (%39) = (%2, %3) LZ77_original_opt:resize : function(byte[],int)->(byte[])
	{
		void* items_tmp;
		_39 = _resize_(_COPY_1DARRAY_PARAM_BYTE(items), items_length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
	}
	//assign %1 = %39  : byte[]
	_COPY_1DARRAY_BYTE(output, _39);
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
	_DECL_2DARRAY(_6);
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY_BYTE(_9);
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	void* _17;
	int64_t _19;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_1DARRAY_BYTE(_23);
	void* _24;
	_DECL_1DARRAY(_26);
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
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	//invoke (%5) = (%8) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_8, _8_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _5;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(file, &_9_size);
	}
	//assign %2 = %9  : byte[]
	_COPY_1DARRAY_BYTE(data, _9);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_13, 14, 0);
	_13[0] = 68; _13[1] = 97; _13[2] = 116; _13[3] = 97; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		println_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_16 = fromBytes(data, data_size);
		_16_size = data_size;
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
	_NEW_1DARRAY_int64_t(_22, 6, 0);
	_22[0] = 32; _22[1] = 98; _22[2] = 121; _22[3] = 116; _22[4] = 101; _22[5] = 115; 
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		println_s(_22, _22_size);
	}
	//invoke (%23) = (%2) LZ77_original_opt:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_23 = _compress_(_COPY_1DARRAY_PARAM_BYTE(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
	}
	//assign %3 = %23  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _23);
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_26, 19, 0);
	_26[0] = 67; _26[1] = 79; _26[2] = 77; _26[3] = 80; _26[4] = 82; _26[5] = 69; _26[6] = 83; _26[7] = 83; _26[8] = 69; _26[9] = 68; _26[10] = 32; _26[11] = 68; _26[12] = 97; _26[13] = 116; _26[14] = 97; _26[15] = 58; _26[16] = 32; _26[17] = 32; _26[18] = 32; 
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		println_s(_26, _26_size);
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
	//invoke (%33) = (%3) LZ77_original_opt:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_33 = _decompress_(_COPY_1DARRAY_PARAM_BYTE(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
	}
	//assign %4 = %33  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _33);
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
	//fieldload %46 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %46 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	exit(0);
}

