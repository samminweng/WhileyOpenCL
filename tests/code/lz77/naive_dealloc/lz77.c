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
	_COPY_1DARRAY_BYTE(data, _8);
	_ADD_DEALLOC(data);
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
			void* input_tmp;
			_14 = match(input_tmp = _COPY_STRUCT_PARAM(input, Data), true, offset, pos);
			_CALLEE_DEALLOC(input, "false-false-true");
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
	_COPY_1DARRAY_BYTE(items, _7);
	_ADD_DEALLOC(items);
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
	_COPY_1DARRAY_BYTE(nitems, _12);
	_ADD_DEALLOC(nitems);
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
	_COPY_1DARRAY_BYTE(_21->items, nitems);
	_21->length = length;
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
		void* data_tmp;
		_DEALLOC_STRUCT(_3, Data);
		_3 = append_byte(data_tmp = _COPY_STRUCT_PARAM(data, Data), true, _4);
		_CALLEE_DEALLOC(data, "false-false-false");
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
	_COPY_1DARRAY_BYTE(_12->items, _10);
	_12->length = _11;
	_ADD_DEALLOC(_12);
	//assign %3 = %12  : {byte[] items,int length}
	_DEALLOC_STRUCT(output, Data);
	output = copy_Data(_12);
	_ADD_DEALLOC(output);
	//loop (%2, %3, %4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//fieldload %13 = %0 length : {byte[] items,int length}
		_13 = input->length;
		//ifge %2, %13 goto blklab8 : int
		if(pos>=_13){goto blklab8;}
		//invoke (%14) = (%0, %2) lz77:findLongestMatch : function(lz77:Data,lz77:nat)->(lz77:Match)
		{
			void* input_tmp;
			_DEALLOC_STRUCT(_14, Match);
			_14 = findLongestMatch(input_tmp = _COPY_STRUCT_PARAM(input, Data), true, pos);
			_CALLEE_DEALLOC(input, "false-false-true");
			_ADD_DEALLOC(_14);
		}
		//assign %4 = %14  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		m = copy_Match(_14);
		_ADD_DEALLOC(m);
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
			void* output_tmp;
			_DEALLOC_STRUCT(_17, Data);
			_17 = write_u1(output_tmp = _COPY_STRUCT_PARAM(output, Data), true, offset);
			_CALLEE_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_17);
		}
		//assign %3 = %17  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = copy_Data(_17);
		_ADD_DEALLOC(output);
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
			void* output_tmp;
			_DEALLOC_STRUCT(_19, Data);
			_19 = append_byte(output_tmp = _COPY_STRUCT_PARAM(output, Data), true, _21);
			_CALLEE_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_19);
		}
		//assign %3 = %19  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = copy_Data(_19);
		_ADD_DEALLOC(output);
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
			void* output_tmp;
			_DEALLOC_STRUCT(_24, Data);
			_24 = write_u1(output_tmp = _COPY_STRUCT_PARAM(output, Data), true, len);
			_CALLEE_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_24);
		}
		//assign %3 = %24  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = copy_Data(_24);
		_ADD_DEALLOC(output);
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
	_COPY_1DARRAY_BYTE(_15->items, _13);
	_15->length = _14;
	_ADD_DEALLOC(_15);
	//assign %2 = %15  : {byte[] items,int length}
	_DEALLOC_STRUCT(output, Data);
	output = copy_Data(_15);
	_ADD_DEALLOC(output);
	//fieldload %16 = %0 items : {byte[] items,int length}
	_DEALLOC(_16);
	_UPDATE_1DARRAY(_16, input->items);
	_REMOVE_DEALLOC(_16);
	//assign %3 = %16  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _16);
	_ADD_DEALLOC(data);
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
			void* output_tmp;
			_DEALLOC_STRUCT(_28, Data);
			_28 = append_byte(output_tmp = _COPY_STRUCT_PARAM(output, Data), true, item);
			_CALLEE_DEALLOC(output, "false-false-false");
			_ADD_DEALLOC(_28);
		}
		//assign %2 = %28  : {byte[] items,int length}
		_DEALLOC_STRUCT(output, Data);
		output = copy_Data(_28);
		_ADD_DEALLOC(output);
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
				void* output_tmp;
				_DEALLOC_STRUCT(_37, Data);
				_37 = append_byte(output_tmp = _COPY_STRUCT_PARAM(output, Data), true, item);
				_CALLEE_DEALLOC(output, "false-false-false");
				_ADD_DEALLOC(_37);
			}
			//assign %2 = %37  : {byte[] items,int length}
			_DEALLOC_STRUCT(output, Data);
			output = copy_Data(_37);
			_ADD_DEALLOC(output);
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

Data* init(long long repeat){
	Data* _1;
	_DECL_DEALLOC(_1);
	long long length = 0;
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	long long pos = 0;
	long long _5 = 0;
	long long _6 = 0;
	BYTE _7;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	long long _12 = 0;
	BYTE _13;
	long long _14 = 0;
	long long _15 = 0;
	Data* _16;
	_DECL_DEALLOC(_16);
	//const %5 = 15 : int
	_5 = 15;
	//mul %6 = %0, %5 : int
	_6=repeat*_5;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//arraygen %8 = [7; 2] : byte[]
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE_VALUE(_8, length, _7);
	_ADD_DEALLOC(_8);
	//assign %3 = %8  : byte[]
	_DEALLOC(items);
	_COPY_1DARRAY_BYTE(items, _8);
	_ADD_DEALLOC(items);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	pos = _9;
	//loop (%3, %4, %10, %11, %12, %13, %14, %15)
	while(true){
		//ifge %4, %2 goto blklab18 : int
		if(pos>=length){goto blklab18;}
		//const %10 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
		_DEALLOC(_10);
		_NEW_1DARRAY_BYTE(_10, 15);
		_10[0] = 0b01100001; _10[1] = 0b01100001; _10[2] = 0b01100011; _10[3] = 0b01100001; _10[4] = 0b01100001; _10[5] = 0b01100011; _10[6] = 0b01100001; _10[7] = 0b01100010; _10[8] = 0b01100011; _10[9] = 0b01100001; _10[10] = 0b01100010; _10[11] = 0b01100001; _10[12] = 0b01100001; _10[13] = 0b01100001; _10[14] = 0b01100011; 
		_ADD_DEALLOC(_10);
		//const %11 = 15 : int
		_11 = 15;
		//rem %12 = %4, %11 : int
		_12=pos%_11;
		//indexof %13 = %10, %12 : byte[]
		_13=_10[_12];
		//update %3[%4] = %13 : byte[] -> byte[]
		items[pos] = _13;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %4, %14 : int
		_15=pos+_14;
		//assign %4 = %15  : int
		pos = _15;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
	//newrecord %16 = (%3, %2) : {byte[] items,int length}
	_DEALLOC_STRUCT(_16, Data);
	_16 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_16->items, items);
	_16->length = length;
	_ADD_DEALLOC(_16);
	//return %16
	_DEALLOC_STRUCT(_1, Data);
	_DEALLOC(items);
	_DEALLOC(_8);
	_DEALLOC(_10);
	return _16;
	//return
}

int main(int argc, char** args){
	Data* data;
	_DECL_DEALLOC(data);
	Data* compress_data;
	_DECL_DEALLOC(compress_data);
	Data* decompress_data;
	_DECL_DEALLOC(decompress_data);
	Data* _4;
	_DECL_DEALLOC(_4);
	long long _5 = 0;
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	_DECL_1DARRAY_BYTE(_12);
	_DECL_DEALLOC(_12);
	void* _13;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	Data* _19;
	_DECL_DEALLOC(_19);
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	_DECL_1DARRAY_BYTE(_26);
	_DECL_DEALLOC(_26);
	void* _27;
	long long _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	Data* _33;
	_DECL_DEALLOC(_33);
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	_DECL_1DARRAY_BYTE(_40);
	_DECL_DEALLOC(_40);
	void* _41;
	long long _43 = 0;
	void* _44;
	_DECL_1DARRAY(_46);
	_DECL_DEALLOC(_46);
	//const %5 = 2 : int
	_5 = 2;
	//invoke (%4) = (%5) lz77:init : function(int)->(lz77:Data)
	{
		_DEALLOC_STRUCT(_4, Data);
		_4 = init(_5);
		_ADD_DEALLOC(_4);
	}
	//assign %1 = %4  : {byte[] items,int length}
	_DEALLOC_STRUCT(data, Data);
	data = copy_Data(_4);
	_ADD_DEALLOC(data);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY(_8, 14, 0);
	_8[0] = 68; _8[1] = 97; _8[2] = 116; _8[3] = 97; _8[4] = 58; _8[5] = 32; _8[6] = 32; _8[7] = 32; _8[8] = 32; _8[9] = 32; _8[10] = 32; _8[11] = 32; _8[12] = 32; _8[13] = 32; 
	_ADD_DEALLOC(_8);
	//indirectinvoke () = %7 (%8) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_8));
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %12 = %1 items : {byte[] items,int length}
	_DEALLOC(_12);
	_UPDATE_1DARRAY(_12, data->items);
	_REMOVE_DEALLOC(_12);
	//invoke (%11) = (%12) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_11, _12);
	_DEALLOC(_11);
	_11 = fromBytes(_12, _12_size);
	_11_size = _12_size;
	_ADD_DEALLOC(_11);
	//indirectinvoke () = %10 (%11) : method(int[])->()
	println_s(_11, _11_size);
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %15 = %1 length : {byte[] items,int length}
	_15 = data->length;
	//indirectinvoke () = %14 (%15) : method(any)->()
	printf("%lld", _15);
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_18);
	_NEW_1DARRAY(_18, 6, 0);
	_18[0] = 32; _18[1] = 98; _18[2] = 121; _18[3] = 116; _18[4] = 101; _18[5] = 115; 
	_ADD_DEALLOC(_18);
	//indirectinvoke () = %17 (%18) : method(int[])->()
	println_s(_18, _18_size);
	//invoke (%19) = (%1) lz77:compress : function(lz77:Data)->(lz77:Data)
	{
		void* data_tmp;
		_DEALLOC_STRUCT(_19, Data);
		_19 = compress(data_tmp = _COPY_STRUCT_PARAM(data, Data), true);
		_CALLEE_DEALLOC(data, "false-false-false");
		_ADD_DEALLOC(_19);
	}
	//assign %2 = %19  : {byte[] items,int length}
	_DEALLOC_STRUCT(compress_data, Data);
	compress_data = copy_Data(_19);
	_ADD_DEALLOC(compress_data);
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY(_22, 19, 0);
	_22[0] = 67; _22[1] = 79; _22[2] = 77; _22[3] = 80; _22[4] = 82; _22[5] = 69; _22[6] = 83; _22[7] = 83; _22[8] = 69; _22[9] = 68; _22[10] = 32; _22[11] = 68; _22[12] = 97; _22[13] = 116; _22[14] = 97; _22[15] = 58; _22[16] = 32; _22[17] = 32; _22[18] = 32; 
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_22));
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %26 = %2 items : {byte[] items,int length}
	_DEALLOC(_26);
	_UPDATE_1DARRAY(_26, compress_data->items);
	_REMOVE_DEALLOC(_26);
	//invoke (%25) = (%26) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_25, _26);
	_DEALLOC(_25);
	_25 = fromBytes(_26, _26_size);
	_25_size = _26_size;
	_ADD_DEALLOC(_25);
	//indirectinvoke () = %24 (%25) : method(int[])->()
	println_s(_25, _25_size);
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %29 = %2 length : {byte[] items,int length}
	_29 = compress_data->length;
	//indirectinvoke () = %28 (%29) : method(any)->()
	printf("%lld", _29);
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_32);
	_NEW_1DARRAY(_32, 6, 0);
	_32[0] = 32; _32[1] = 98; _32[2] = 121; _32[3] = 116; _32[4] = 101; _32[5] = 115; 
	_ADD_DEALLOC(_32);
	//indirectinvoke () = %31 (%32) : method(int[])->()
	println_s(_32, _32_size);
	//invoke (%33) = (%2) lz77:decompress : function(lz77:Data)->(lz77:Data)
	{
		void* compress_data_tmp;
		_DEALLOC_STRUCT(_33, Data);
		_33 = decompress(compress_data_tmp = _COPY_STRUCT_PARAM(compress_data, Data), true);
		_CALLEE_DEALLOC(compress_data, "false-false-false");
		_ADD_DEALLOC(_33);
	}
	//assign %3 = %33  : {byte[] items,int length}
	_DEALLOC_STRUCT(decompress_data, Data);
	decompress_data = copy_Data(_33);
	_ADD_DEALLOC(decompress_data);
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY(_36, 16, 0);
	_36[0] = 68; _36[1] = 69; _36[2] = 67; _36[3] = 79; _36[4] = 77; _36[5] = 80; _36[6] = 82; _36[7] = 69; _36[8] = 83; _36[9] = 83; _36[10] = 69; _36[11] = 68; _36[12] = 58; _36[13] = 32; _36[14] = 32; _36[15] = 32; 
	_ADD_DEALLOC(_36);
	//indirectinvoke () = %35 (%36) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_36));
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %40 = %3 items : {byte[] items,int length}
	_DEALLOC(_40);
	_UPDATE_1DARRAY(_40, decompress_data->items);
	_REMOVE_DEALLOC(_40);
	//invoke (%39) = (%40) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_39, _40);
	_DEALLOC(_39);
	_39 = fromBytes(_40, _40_size);
	_39_size = _40_size;
	_ADD_DEALLOC(_39);
	//indirectinvoke () = %38 (%39) : method(int[])->()
	println_s(_39, _39_size);
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %43 = %3 length : {byte[] items,int length}
	_43 = decompress_data->length;
	//indirectinvoke () = %42 (%43) : method(any)->()
	printf("%lld", _43);
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %46 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_46);
	_NEW_1DARRAY(_46, 6, 0);
	_46[0] = 32; _46[1] = 98; _46[2] = 121; _46[3] = 116; _46[4] = 101; _46[5] = 115; 
	_ADD_DEALLOC(_46);
	//indirectinvoke () = %45 (%46) : method(int[])->()
	println_s(_46, _46_size);
	//return
	_DEALLOC_STRUCT(data, Data);
	_DEALLOC_STRUCT(compress_data, Data);
	_DEALLOC_STRUCT(decompress_data, Data);
	_DEALLOC_STRUCT(_4, Data);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_12);
	_DEALLOC(_18);
	_DEALLOC_STRUCT(_19, Data);
	_DEALLOC(_22);
	_DEALLOC(_25);
	_DEALLOC(_26);
	_DEALLOC(_32);
	_DEALLOC_STRUCT(_33, Data);
	_DEALLOC(_36);
	_DEALLOC(_39);
	_DEALLOC(_40);
	_DEALLOC(_46);
	exit(0);
}

