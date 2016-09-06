#include "lz77.h"
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
Data* copy_Data(Data* _Data){
	Data* new_Data = malloc(sizeof(Data));
	new_Data->length = _Data->length;
	_COPY_1DARRAY_BYTE(new_Data->items, _Data->items);
	return new_Data;
}
Data** copy_array_Data(Data** _Data, long long _Data_size){
	Data** new_Data = malloc(_Data_size*sizeof(Data*));
	for(int i=0;i<_Data_size;i++){
		new_Data[i] = copy_Data(_Data[i]);
	}
	return new_Data;
}
void free_Data(Data* data){
	free(data->items);
	data->items = NULL;
	free(data);
}
void printf_Data(Data* data){
	printf("{");
	printf(" length:");
	printf("%lld", data->length);
	printf(" items:");
	_PRINT_1DARRAY_BYTE(data->items);
	printf("}");
}
long long match(Data* input, _DECL_DEALLOC_PARAM(input), long long offset, long long end){
	long long _3 = 0;
	long long pos = 0;
	long long len = 0;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	long long _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	BYTE _10;
	BYTE _11;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	//assign %4 = %2  : int
	pos = end;
	//const %7 = 0 : int
	_7 = 0;
	//assign %5 = %7  : int
	len = _7;
	//fieldload %8 = %0 items : {byte[] items,int length}
	_DEALLOC(_8);
	_UPDATE_1DARRAY(_8, input->items);
	_REMOVE_DEALLOC(_8);
	//assign %6 = %8  : byte[]
	_DEALLOC(data);
	_UPDATE_1DARRAY(data, _8);
	_TRANSFER_DEALLOC(data, _8);
	//loop (%1, %4, %5, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18)
	while(true){
		//ifge %1, %4 goto blklab1 : int
		if(offset>=pos){goto blklab1;}
		//fieldload %9 = %0 length : {byte[] items,int length}
		_9 = input->length;
		//ifge %4, %9 goto blklab1 : int
		if(pos>=_9){goto blklab1;}
		//indexof %10 = %6, %1 : byte[]
		_10=data[offset];
		//indexof %11 = %6, %4 : byte[]
		_11=data[pos];
		//ifne %10, %11 goto blklab1 : byte
		if(_10!=_11){goto blklab1;}
		//const %12 = 255 : int
		_12 = 255;
		//ifge %5, %12 goto blklab1 : int
		if(len>=_12){goto blklab1;}
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %1, %13 : int
		_14=offset+_13;
		//assign %1 = %14  : int
		offset = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %4, %15 : int
		_16=pos+_15;
		//assign %4 = %16  : int
		pos = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %5, %17 : int
		_18=len+_17;
		//assign %5 = %18  : int
		len = _18;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %5
	_DEALLOC_STRUCT(input, Data);
	_DEALLOC(data);
	_DEALLOC(_8);
	return len;
	//return
}

Match* findLongestMatch(Data* input, _DECL_DEALLOC_PARAM(input), long long pos){
	Match* _2;
	_DECL_DEALLOC(_2);
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
		//invoke (%14) = (%0, %6, %1) lz77:match : function(lz77:Data,lz77:nat,lz77:nat)->(int)
		{
			_14 = match(_STRUCT_PARAM(input), false, offset, pos);
			_RETAIN_DEALLOC(input, "false-false-true");
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
	_DEALLOC_STRUCT(input, Data);
	_DEALLOC_STRUCT(_2, Match);
	return _18;
	//return
}

Data* append_byte(Data* data, _DECL_DEALLOC_PARAM(data), BYTE item){
	Data* _2;
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	long long i = 0;
	long long length = 0;
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	BYTE _8;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY_BYTE(_12);
	_DECL_DEALLOC(_12);
	long long _13 = 0;
	long long _14 = 0;
	BYTE _15;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	Data* _21;
	_DECL_DEALLOC(_21);
	//fieldload %7 = %0 items : {byte[] items,int length}
	_DEALLOC(_7);
	_UPDATE_1DARRAY(_7, data->items);
	_REMOVE_DEALLOC(_7);
	//assign %3 = %7  : byte[]
	_DEALLOC(items);
	_UPDATE_1DARRAY(items, _7);
	_TRANSFER_DEALLOC(items, _7);
	//const %8 = 00000000b : byte
	_8 = 0b00000000;
	//lengthof %9 = %3 : byte[]
	_9 = items_size;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %9, %10 : int
	_11=_9+_10;
	//arraygen %12 = [8; 11] : byte[]
	_DEALLOC(_12);
	_NEW_1DARRAY_BYTE_VALUE(_12, _11, _8);
	_ADD_DEALLOC(_12);
	//assign %4 = %12  : byte[]
	_DEALLOC(nitems);
	_UPDATE_1DARRAY(nitems, _12);
	_TRANSFER_DEALLOC(nitems, _12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %5 = %13  : int
	i = _13;
	//loop (%4, %5, %14, %15, %16, %17)
	while(true){
		//lengthof %14 = %3 : byte[]
		_14 = items_size;
		//ifge %5, %14 goto blklab6 : int
		if(i>=_14){goto blklab6;}
		//indexof %15 = %3, %5 : byte[]
		_15=items[i];
		//update %4[%5] = %15 : byte[] -> byte[]
		nitems[i] = _15;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %5, %16 : int
		_17=i+_16;
		//assign %5 = %17  : int
		i = _17;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %4[%5] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//fieldload %18 = %0 length : {byte[] items,int length}
	_18 = data->length;
	//const %19 = 1 : int
	_19 = 1;
	//add %20 = %18, %19 : int
	_20=_18+_19;
	//assign %6 = %20  : int
	length = _20;
	//newrecord %21 = (%4, %6) : {byte[] items,int length}
	_DEALLOC_STRUCT(_21, Data);
	_21 = malloc(sizeof(Data));
	_UPDATE_1DARRAY(_21->items, nitems);
	_21->length = length;
	_REMOVE_DEALLOC(nitems);
	_ADD_DEALLOC(_21);
	//return %21
	_DEALLOC_STRUCT(data, Data);
	_DEALLOC_STRUCT(_2, Data);
	_DEALLOC(items);
	_DEALLOC(nitems);
	_DEALLOC(_7);
	_DEALLOC(_12);
	return _21;
	//return
}

Data* write_u1(Data* data, _DECL_DEALLOC_PARAM(data), long long u1){
	Data* _2;
	_DECL_DEALLOC(_2);
	Data* _3;
	_DECL_DEALLOC(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	_4 = (BYTE)u1;
	//invoke (%3) = (%0, %4) lz77:append_byte : function(lz77:Data,byte)->(lz77:Data)
	{
		_DEALLOC_STRUCT(_3, Data);
		_3 = append_byte(_STRUCT_PARAM(data), false, _4);
		_RETAIN_DEALLOC(data, "false-false-false");
		_ADD_DEALLOC(_3);
	}
	//return %3
	_DEALLOC_STRUCT(data, Data);
	_DEALLOC_STRUCT(_2, Data);
	return _3;
	//return
}

Data* compress(Data* input, _DECL_DEALLOC_PARAM(input)){
	Data* _1;
	_DECL_DEALLOC(_1);
	long long pos = 0;
	Data* output;
	_DECL_DEALLOC(output);
	Match* m;
	_DECL_DEALLOC(m);
	long long offset = 0;
	long long len = 0;
	long long _7 = 0;
	BYTE _8;
	long long _9 = 0;
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	Data* _12;
	_DECL_DEALLOC(_12);
	long long _13 = 0;
	Match* _14;
	_DECL_DEALLOC(_14);
	long long _15 = 0;
	long long _16 = 0;
	Data* _17;
	_DECL_DEALLOC(_17);
	long long _18 = 0;
	Data* _19;
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
	BYTE _21;
	long long _22 = 0;
	long long _23 = 0;
	Data* _24;
	_DECL_DEALLOC(_24);
	long long _25 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//assign %2 = %7  : int
	pos = _7;
	//const %8 = 00000000b : byte
	_8 = 0b00000000;
	//const %9 = 0 : int
	_9 = 0;
	//arraygen %10 = [8; 9] : byte[]
	_DEALLOC(_10);
	_NEW_1DARRAY_BYTE_VALUE(_10, _9, _8);
	_ADD_DEALLOC(_10);
	//const %11 = 0 : int
	_11 = 0;
	//newrecord %12 = (%10, %11) : {byte[] items,int length}
	_DEALLOC_STRUCT(_12, Data);
	_12 = malloc(sizeof(Data));
	_UPDATE_1DARRAY(_12->items, _10);
	_12->length = _11;
	_REMOVE_DEALLOC(_10);
	_ADD_DEALLOC(_12);
	//assign %3 = %12  : {byte[] items,int length}
	_DEALLOC_STRUCT(output, Data);
	output = _12;
	_TRANSFER_DEALLOC(output, _12);
	//loop (%2, %3, %4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//fieldload %13 = %0 length : {byte[] items,int length}
		_13 = input->length;
		//ifge %2, %13 goto blklab8 : int
		if(pos>=_13){goto blklab8;}
		//invoke (%14) = (%0, %2) lz77:findLongestMatch : function(lz77:Data,lz77:nat)->(lz77:Match)
		{
			_DEALLOC_STRUCT(_14, Match);
			_14 = findLongestMatch(_STRUCT_PARAM(input), false, pos);
			_RETAIN_DEALLOC(input, "false-false-true");
			_ADD_DEALLOC(_14);
		}
		//assign %4 = %14  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		m = _14;
		_TRANSFER_DEALLOC(m, _14);
		//fieldload %15 = %4 offset : {int len,int offset}
		_15 = m->offset;
		//assign %5 = %15  : int
		offset = _15;
		//fieldload %16 = %4 len : {int len,int offset}
		_16 = m->len;
		//assign %6 = %16  : int
		len = _16;
		//invoke (%17) = (%3, %5) lz77:write_u1 : function(lz77:Data,int)->(lz77:Data)
		{
			_DEALLOC_STRUCT(_17, Data);
			_17 = write_u1(_STRUCT_PARAM(output), false, offset);
			_RETAIN_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_17);
		}
		//assign %3 = %17  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = _17;
		_TRANSFER_DEALLOC(output, _17);
		//const %18 = 0 : int
		_18 = 0;
		//ifne %5, %18 goto blklab10 : int
		if(offset!=_18){goto blklab10;}
		//fieldload %20 = %0 items : {byte[] items,int length}
		_DEALLOC(_20);
		_UPDATE_1DARRAY(_20, input->items);
		_REMOVE_DEALLOC(_20);
		//indexof %21 = %20, %2 : byte[]
		_21=_20[pos];
		//invoke (%19) = (%3, %21) lz77:append_byte : function(lz77:Data,byte)->(lz77:Data)
		{
			_DEALLOC_STRUCT(_19, Data);
			_19 = append_byte(_STRUCT_PARAM(output), false, _21);
			_RETAIN_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_19);
		}
		//assign %3 = %19  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = _19;
		_TRANSFER_DEALLOC(output, _19);
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %2, %22 : int
		_23=pos+_22;
		//assign %2 = %23  : int
		pos = _23;
		//goto blklab11
		goto blklab11;
//.blklab10
blklab10:;
		//invoke (%24) = (%3, %6) lz77:write_u1 : function(lz77:Data,int)->(lz77:Data)
		{
			_DEALLOC_STRUCT(_24, Data);
			_24 = write_u1(_STRUCT_PARAM(output), false, len);
			_RETAIN_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_24);
		}
		//assign %3 = %24  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = _24;
		_TRANSFER_DEALLOC(output, _24);
		//add %25 = %2, %6 : int
		_25=pos+len;
		//assign %2 = %25  : int
		pos = _25;
//.blklab11
blklab11:;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %3
	_DEALLOC_STRUCT(input, Data);
	_DEALLOC_STRUCT(_1, Data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_10);
	_DEALLOC_STRUCT(_12, Data);
	_DEALLOC_STRUCT(_14, Match);
	_DEALLOC_STRUCT(_17, Data);
	_DEALLOC_STRUCT(_19, Data);
	_DEALLOC(_20);
	_DEALLOC_STRUCT(_24, Data);
	return output;
	//return
}

Data* decompress(Data* input, _DECL_DEALLOC_PARAM(input)){
	Data* _1;
	_DECL_DEALLOC(_1);
	Data* output;
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	long long pos = 0;
	BYTE header;
	BYTE item;
	long long offset = 0;
	long long len = 0;
	long long start = 0;
	long long i = 0;
	BYTE _11;
	long long _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	long long _14 = 0;
	Data* _15;
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	BYTE _21;
	long long _22 = 0;
	long long _23 = 0;
	BYTE _24;
	long long _25 = 0;
	long long _26 = 0;
	BYTE _27;
	Data* _28;
	_DECL_DEALLOC(_28);
	long long _29 = 0;
	long long _30 = 0;
	_DECL_1DARRAY_BYTE(_31);
	_DECL_DEALLOC(_31);
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	_DECL_1DARRAY_BYTE(_35);
	_DECL_DEALLOC(_35);
	BYTE _36;
	Data* _37;
	_DECL_DEALLOC(_37);
	long long _38 = 0;
	long long _39 = 0;
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE_VALUE(_13, _12, _11);
	_ADD_DEALLOC(_13);
	//const %14 = 0 : int
	_14 = 0;
	//newrecord %15 = (%13, %14) : {byte[] items,int length}
	_DEALLOC_STRUCT(_15, Data);
	_15 = malloc(sizeof(Data));
	_UPDATE_1DARRAY(_15->items, _13);
	_15->length = _14;
	_REMOVE_DEALLOC(_13);
	_ADD_DEALLOC(_15);
	//assign %2 = %15  : {byte[] items,int length}
	_DEALLOC_STRUCT(output, Data);
	output = _15;
	_TRANSFER_DEALLOC(output, _15);
	//fieldload %16 = %0 items : {byte[] items,int length}
	_DEALLOC(_16);
	_UPDATE_1DARRAY(_16, input->items);
	_REMOVE_DEALLOC(_16);
	//assign %3 = %16  : byte[]
	_DEALLOC(data);
	_UPDATE_1DARRAY(data, _16);
	_TRANSFER_DEALLOC(data, _16);
	//const %17 = 0 : int
	_17 = 0;
	//assign %4 = %17  : int
	pos = _17;
	//loop (%2, %4, %5, %6, %7, %8, %9, %10, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
	while(true){
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %4, %18 : int
		_19=pos+_18;
		//fieldload %20 = %0 length : {byte[] items,int length}
		_20 = input->length;
		//ifge %19, %20 goto blklab12 : int
		if(_19>=_20){goto blklab12;}
		//indexof %21 = %3, %4 : byte[]
		_21=data[pos];
		//assign %5 = %21  : byte
		header = _21;
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %4, %22 : int
		_23=pos+_22;
		//indexof %24 = %3, %23 : byte[]
		_24=data[_23];
		//assign %6 = %24  : byte
		item = _24;
		//const %25 = 2 : int
		_25 = 2;
		//add %26 = %4, %25 : int
		_26=pos+_25;
		//assign %4 = %26  : int
		pos = _26;
		//const %27 = 00000000b : byte
		_27 = 0b00000000;
		//ifne %5, %27 goto blklab14 : byte
		if(header!=_27){goto blklab14;}
		//invoke (%28) = (%2, %6) lz77:append_byte : function(lz77:Data,byte)->(lz77:Data)
		{
			_DEALLOC_STRUCT(_28, Data);
			_28 = append_byte(_STRUCT_PARAM(output), false, item);
			_RETAIN_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_28);
		}
		//assign %2 = %28  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = _28;
		_TRANSFER_DEALLOC(output, _28);
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		_29 = (unsigned int)header;
		//assign %7 = %29  : int
		offset = _29;
		//invoke (%30) = (%6) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		_30 = (unsigned int)item;
		//assign %8 = %30  : int
		len = _30;
		//fieldload %31 = %2 items : {byte[] items,int length}
		_DEALLOC(_31);
		_UPDATE_1DARRAY(_31, output->items);
		_REMOVE_DEALLOC(_31);
		//lengthof %32 = %31 : byte[]
		_32 = _31_size;
		//sub %33 = %32, %7 : int
		_33=_32-offset;
		//assign %9 = %33  : int
		start = _33;
		//assign %10 = %9  : int
		i = start;
		//loop (%2, %6, %10, %34, %35, %36, %37, %38, %39)
		while(true){
			//add %34 = %9, %8 : int
			_34=start+len;
			//ifge %10, %34 goto blklab16 : int
			if(i>=_34){goto blklab16;}
			//fieldload %35 = %2 items : {byte[] items,int length}
			_DEALLOC(_35);
			_UPDATE_1DARRAY(_35, output->items);
			_REMOVE_DEALLOC(_35);
			//indexof %36 = %35, %10 : byte[]
			_36=_35[i];
			//assign %6 = %36  : byte
			item = _36;
			//invoke (%37) = (%2, %6) lz77:append_byte : function(lz77:Data,byte)->(lz77:Data)
			{
				_DEALLOC_STRUCT(_37, Data);
				_37 = append_byte(_STRUCT_PARAM(output), false, item);
				_RETAIN_DEALLOC(output, "false-false-false");
				_ADD_DEALLOC(_37);
			}
			//assign %2 = %37  : {byte[] items,int length}
			_DEALLOC_STRUCT(output, Data);
			output = _37;
			_TRANSFER_DEALLOC(output, _37);
			//const %38 = 1 : int
			_38 = 1;
			//add %39 = %10, %38 : int
			_39=i+_38;
			//assign %10 = %39  : int
			i = _39;
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
	//return %2
	_DEALLOC_STRUCT(input, Data);
	_DEALLOC_STRUCT(_1, Data);
	_DEALLOC(data);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_15, Data);
	_DEALLOC(_16);
	_DEALLOC_STRUCT(_28, Data);
	_DEALLOC(_31);
	_DEALLOC(_35);
	_DEALLOC_STRUCT(_37, Data);
	return output;
	//return
}

int main(int argc, char** args){
	Data* data;
	_DECL_DEALLOC(data);
	Data* compress_data;
	_DECL_DEALLOC(compress_data);
	Data* decompress_data;
	_DECL_DEALLOC(decompress_data);
	_DECL_1DARRAY_BYTE(_4);
	_DECL_DEALLOC(_4);
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	long long _6 = 0;
	Data* _7;
	_DECL_DEALLOC(_7);
	void* _8;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	long long _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	Data* _21;
	_DECL_DEALLOC(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY_BYTE(_28);
	_DECL_DEALLOC(_28);
	void* _29;
	long long _31 = 0;
	void* _32;
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	Data* _35;
	_DECL_DEALLOC(_35);
	void* _36;
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	void* _39;
	_DECL_1DARRAY(_41);
	_DECL_DEALLOC(_41);
	_DECL_1DARRAY_BYTE(_42);
	_DECL_DEALLOC(_42);
	void* _43;
	long long _45 = 0;
	void* _46;
	_DECL_1DARRAY(_48);
	_DECL_DEALLOC(_48);
	//const %4 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_DEALLOC(_4);
	_NEW_1DARRAY_BYTE(_4, 15);
	_4[0] = 0b01100001; _4[1] = 0b01100001; _4[2] = 0b01100011; _4[3] = 0b01100001; _4[4] = 0b01100001; _4[5] = 0b01100011; _4[6] = 0b01100001; _4[7] = 0b01100010; _4[8] = 0b01100011; _4[9] = 0b01100001; _4[10] = 0b01100010; _4[11] = 0b01100001; _4[12] = 0b01100001; _4[13] = 0b01100001; _4[14] = 0b01100011; 
	_ADD_DEALLOC(_4);
	//const %5 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, 15);
	_5[0] = 0b01100001; _5[1] = 0b01100001; _5[2] = 0b01100011; _5[3] = 0b01100001; _5[4] = 0b01100001; _5[5] = 0b01100011; _5[6] = 0b01100001; _5[7] = 0b01100010; _5[8] = 0b01100011; _5[9] = 0b01100001; _5[10] = 0b01100010; _5[11] = 0b01100001; _5[12] = 0b01100001; _5[13] = 0b01100001; _5[14] = 0b01100011; 
	_ADD_DEALLOC(_5);
	//lengthof %6 = %5 : byte[]
	_6 = _5_size;
	//newrecord %7 = (%4, %6) : {byte[] items,int length}
	_DEALLOC_STRUCT(_7, Data);
	_7 = malloc(sizeof(Data));
	_UPDATE_1DARRAY(_7->items, _4);
	_7->length = _6;
	_REMOVE_DEALLOC(_4);
	_ADD_DEALLOC(_7);
	//assign %1 = %7  : {byte[] items,int length}
	_DEALLOC_STRUCT(data, Data);
	data = _7;
	_TRANSFER_DEALLOC(data, _7);
	//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %9 = %8 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %10 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY(_10, 14, 0);
	_10[0] = 68; _10[1] = 97; _10[2] = 116; _10[3] = 97; _10[4] = 58; _10[5] = 32; _10[6] = 32; _10[7] = 32; _10[8] = 32; _10[9] = 32; _10[10] = 32; _10[11] = 32; _10[12] = 32; _10[13] = 32; 
	_ADD_DEALLOC(_10);
	//indirectinvoke () = %9 (%10) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_10));
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %14 = %1 items : {byte[] items,int length}
	_DEALLOC(_14);
	_UPDATE_1DARRAY(_14, data->items);
	_REMOVE_DEALLOC(_14);
	//invoke (%13) = (%14) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_13, _14);
	_DEALLOC(_13);
	_13 = fromBytes(_14, _14_size);
	_13_size = _14_size;
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	println_s(_13, _13_size);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %17 = %1 length : {byte[] items,int length}
	_17 = data->length;
	//indirectinvoke () = %16 (%17) : method(any)->()
	printf("%lld", _17);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	_ADD_DEALLOC(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	println_s(_20, _20_size);
	//invoke (%21) = (%1) lz77:compress : function(lz77:Data)->(lz77:Data)
	{
		_DEALLOC_STRUCT(_21, Data);
		_21 = compress(_STRUCT_PARAM(data), false);
		_RETAIN_DEALLOC(data, "false-false-false");
		_ADD_DEALLOC(_21);
	}
	//assign %2 = %21  : {byte[] items,int length}
	_DEALLOC_STRUCT(compress_data, Data);
	compress_data = _21;
	_TRANSFER_DEALLOC(compress_data, _21);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_24);
	_NEW_1DARRAY(_24, 19, 0);
	_24[0] = 67; _24[1] = 79; _24[2] = 77; _24[3] = 80; _24[4] = 82; _24[5] = 69; _24[6] = 83; _24[7] = 83; _24[8] = 69; _24[9] = 68; _24[10] = 32; _24[11] = 68; _24[12] = 97; _24[13] = 116; _24[14] = 97; _24[15] = 58; _24[16] = 32; _24[17] = 32; _24[18] = 32; 
	_ADD_DEALLOC(_24);
	//indirectinvoke () = %23 (%24) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_24));
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %28 = %2 items : {byte[] items,int length}
	_DEALLOC(_28);
	_UPDATE_1DARRAY(_28, compress_data->items);
	_REMOVE_DEALLOC(_28);
	//invoke (%27) = (%28) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_27, _28);
	_DEALLOC(_27);
	_27 = fromBytes(_28, _28_size);
	_27_size = _28_size;
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	println_s(_27, _27_size);
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %31 = %2 length : {byte[] items,int length}
	_31 = compress_data->length;
	//indirectinvoke () = %30 (%31) : method(any)->()
	printf("%lld", _31);
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_34);
	_NEW_1DARRAY(_34, 6, 0);
	_34[0] = 32; _34[1] = 98; _34[2] = 121; _34[3] = 116; _34[4] = 101; _34[5] = 115; 
	_ADD_DEALLOC(_34);
	//indirectinvoke () = %33 (%34) : method(int[])->()
	println_s(_34, _34_size);
	//invoke (%35) = (%2) lz77:decompress : function(lz77:Data)->(lz77:Data)
	{
		_DEALLOC_STRUCT(_35, Data);
		_35 = decompress(_STRUCT_PARAM(compress_data), false);
		_RETAIN_DEALLOC(compress_data, "false-false-false");
		_ADD_DEALLOC(_35);
	}
	//assign %3 = %35  : {byte[] items,int length}
	_DEALLOC_STRUCT(decompress_data, Data);
	decompress_data = _35;
	_TRANSFER_DEALLOC(decompress_data, _35);
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %38 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_38);
	_NEW_1DARRAY(_38, 16, 0);
	_38[0] = 68; _38[1] = 69; _38[2] = 67; _38[3] = 79; _38[4] = 77; _38[5] = 80; _38[6] = 82; _38[7] = 69; _38[8] = 83; _38[9] = 83; _38[10] = 69; _38[11] = 68; _38[12] = 58; _38[13] = 32; _38[14] = 32; _38[15] = 32; 
	_ADD_DEALLOC(_38);
	//indirectinvoke () = %37 (%38) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_38));
	//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %40 = %39 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %42 = %3 items : {byte[] items,int length}
	_DEALLOC(_42);
	_UPDATE_1DARRAY(_42, decompress_data->items);
	_REMOVE_DEALLOC(_42);
	//invoke (%41) = (%42) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_41, _42);
	_DEALLOC(_41);
	_41 = fromBytes(_42, _42_size);
	_41_size = _42_size;
	_ADD_DEALLOC(_41);
	//indirectinvoke () = %40 (%41) : method(int[])->()
	println_s(_41, _41_size);
	//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %44 = %43 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %45 = %3 length : {byte[] items,int length}
	_45 = decompress_data->length;
	//indirectinvoke () = %44 (%45) : method(any)->()
	printf("%lld", _45);
	//fieldload %46 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %47 = %46 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %48 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_48);
	_NEW_1DARRAY(_48, 6, 0);
	_48[0] = 32; _48[1] = 98; _48[2] = 121; _48[3] = 116; _48[4] = 101; _48[5] = 115; 
	_ADD_DEALLOC(_48);
	//indirectinvoke () = %47 (%48) : method(int[])->()
	println_s(_48, _48_size);
	//return
	_DEALLOC_STRUCT(data, Data);
	_DEALLOC_STRUCT(compress_data, Data);
	_DEALLOC_STRUCT(decompress_data, Data);
	_DEALLOC(_4);
	_DEALLOC(_5);
	_DEALLOC_STRUCT(_7, Data);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_14);
	_DEALLOC(_20);
	_DEALLOC_STRUCT(_21, Data);
	_DEALLOC(_24);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_34);
	_DEALLOC_STRUCT(_35, Data);
	_DEALLOC(_38);
	_DEALLOC(_41);
	_DEALLOC(_42);
	_DEALLOC(_48);
	exit(0);
}

