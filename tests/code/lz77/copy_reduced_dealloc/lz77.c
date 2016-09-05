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

Match* findLongestMatch(Data* input, _DECL_DEALLOC_PARAM(input), long long pos){
	Match* _2;
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	long long bestOffset = 0;
	long long bestLen = 0;
	long long start = 0;
	long long offset = 0;
	long long len = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	Match* _20;
	_DECL_DEALLOC(_20);
	//fieldload %9 = %0 items : {byte[] items,int length}
	_DEALLOC(_9);
	_UPDATE_1DARRAY(_9, input->items);
	_REMOVE_DEALLOC(_9);
	//assign %3 = %9  : byte[]
	_DEALLOC(data);
	_UPDATE_1DARRAY(data, _9);
	_TRANSFER_DEALLOC(data, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	bestOffset = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	bestLen = _11;
	//const %13 = 255 : int
	_13 = 255;
	//sub %14 = %1, %13 : int
	_14=pos-_13;
	//const %15 = 0 : int
	_15 = 0;
	//invoke (%12) = (%14, %15) whiley/lang/Math:max : function(int,int)->(int)
	_12 = max(_14, _15);
	//assign %6 = %12  : int
	start = _12;
	//assign %7 = %6  : int
	offset = start;
	//loop (%4, %5, %7, %8, %16, %17, %18, %19)
	while(true){
		//ifge %7, %1 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//invoke (%16) = (%3, %7, %1) lz77:match : function(byte[],lz77:nat,lz77:nat)->(int)
		{
			_16 = match(_1DARRAY_PARAM(data), false, offset, pos);
			_RETAIN_DEALLOC(data, "false-false-true");
		}
		//assign %8 = %16  : int
		len = _16;
		//ifle %8, %5 goto blklab5 : int
		if(len<=bestLen){goto blklab5;}
		//sub %17 = %1, %7 : int
		_17=pos-offset;
		//assign %4 = %17  : int
		bestOffset = _17;
		//assign %5 = %8  : int
		bestLen = len;
//.blklab5
blklab5:;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %7, %18 : int
		_19=offset+_18;
		//assign %7 = %19  : int
		offset = _19;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//newrecord %20 = (%5, %4) : {int len,int offset}
	_DEALLOC_STRUCT(_20, Match);
	_20 = malloc(sizeof(Match));
	_20->len = bestLen;
	_20->offset = bestOffset;
	_ADD_DEALLOC(_20);
	//return %20
	_DEALLOC_STRUCT(input, Data);
	_DEALLOC_STRUCT(_2, Match);
	_DEALLOC(data);
	_DEALLOC(_9);
	return _20;
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
	_4 = toUnsignedByte(u1);
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
	long long _26 = 0;
	long long _27 = 0;
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
	//loop (%2, %3, %4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27)
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
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %2, %26 : int
		_27=pos+_26;
		//assign %2 = %27  : int
		pos = _27;
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

int main(int argc, char** args){
	Data* data;
	_DECL_DEALLOC(data);
	Data* compress_data;
	_DECL_DEALLOC(compress_data);
	_DECL_1DARRAY_BYTE(_3);
	_DECL_DEALLOC(_3);
	_DECL_1DARRAY_BYTE(_4);
	_DECL_DEALLOC(_4);
	long long _5 = 0;
	Data* _6;
	_DECL_DEALLOC(_6);
	void* _7;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	long long _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	Data* _20;
	_DECL_DEALLOC(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	void* _24;
	long long _26 = 0;
	void* _27;
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	//const %3 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_DEALLOC(_3);
	_NEW_1DARRAY_BYTE(_3, 15);
	_3[0] = 0b01100001; _3[1] = 0b01100001; _3[2] = 0b01100011; _3[3] = 0b01100001; _3[4] = 0b01100001; _3[5] = 0b01100011; _3[6] = 0b01100001; _3[7] = 0b01100010; _3[8] = 0b01100011; _3[9] = 0b01100001; _3[10] = 0b01100010; _3[11] = 0b01100001; _3[12] = 0b01100001; _3[13] = 0b01100001; _3[14] = 0b01100011; 
	_ADD_DEALLOC(_3);
	//const %4 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_DEALLOC(_4);
	_NEW_1DARRAY_BYTE(_4, 15);
	_4[0] = 0b01100001; _4[1] = 0b01100001; _4[2] = 0b01100011; _4[3] = 0b01100001; _4[4] = 0b01100001; _4[5] = 0b01100011; _4[6] = 0b01100001; _4[7] = 0b01100010; _4[8] = 0b01100011; _4[9] = 0b01100001; _4[10] = 0b01100010; _4[11] = 0b01100001; _4[12] = 0b01100001; _4[13] = 0b01100001; _4[14] = 0b01100011; 
	_ADD_DEALLOC(_4);
	//lengthof %5 = %4 : byte[]
	_5 = _4_size;
	//newrecord %6 = (%3, %5) : {byte[] items,int length}
	_DEALLOC_STRUCT(_6, Data);
	_6 = malloc(sizeof(Data));
	_UPDATE_1DARRAY(_6->items, _3);
	_6->length = _5;
	_REMOVE_DEALLOC(_3);
	_ADD_DEALLOC(_6);
	//assign %1 = %6  : {byte[] items,int length}
	_DEALLOC_STRUCT(data, Data);
	data = _6;
	_TRANSFER_DEALLOC(data, _6);
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY(_9, 14, 0);
	_9[0] = 68; _9[1] = 97; _9[2] = 116; _9[3] = 97; _9[4] = 58; _9[5] = 32; _9[6] = 32; _9[7] = 32; _9[8] = 32; _9[9] = 32; _9[10] = 32; _9[11] = 32; _9[12] = 32; _9[13] = 32; 
	_ADD_DEALLOC(_9);
	//indirectinvoke () = %8 (%9) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_9));
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %13 = %1 items : {byte[] items,int length}
	_DEALLOC(_13);
	_UPDATE_1DARRAY(_13, data->items);
	_REMOVE_DEALLOC(_13);
	//invoke (%12) = (%13) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_12, _13);
	_DEALLOC(_12);
	_12 = fromBytes(_13, _13_size);
	_12_size = _13_size;
	_ADD_DEALLOC(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	println_s(_12, _12_size);
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %16 = %1 length : {byte[] items,int length}
	_16 = data->length;
	//indirectinvoke () = %15 (%16) : method(any)->()
	printf("%lld", _16);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	_ADD_DEALLOC(_19);
	//indirectinvoke () = %18 (%19) : method(int[])->()
	println_s(_19, _19_size);
	//invoke (%20) = (%1) lz77:compress : function(lz77:Data)->(lz77:Data)
	{
		_DEALLOC_STRUCT(_20, Data);
		_20 = compress(_STRUCT_PARAM(data), false);
		_RETAIN_DEALLOC(data, "false-false-false");
		_ADD_DEALLOC(_20);
	}
	//assign %2 = %20  : {byte[] items,int length}
	_DEALLOC_STRUCT(compress_data, Data);
	compress_data = _20;
	_TRANSFER_DEALLOC(compress_data, _20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_23);
	_NEW_1DARRAY(_23, 19, 0);
	_23[0] = 67; _23[1] = 79; _23[2] = 77; _23[3] = 80; _23[4] = 82; _23[5] = 69; _23[6] = 83; _23[7] = 83; _23[8] = 69; _23[9] = 68; _23[10] = 32; _23[11] = 68; _23[12] = 97; _23[13] = 116; _23[14] = 97; _23[15] = 58; _23[16] = 32; _23[17] = 32; _23[18] = 32; 
	_ADD_DEALLOC(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %26 = %2 length : {byte[] items,int length}
	_26 = compress_data->length;
	//indirectinvoke () = %25 (%26) : method(any)->()
	printf("%lld", _26);
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_29);
	_NEW_1DARRAY(_29, 6, 0);
	_29[0] = 32; _29[1] = 98; _29[2] = 121; _29[3] = 116; _29[4] = 101; _29[5] = 115; 
	_ADD_DEALLOC(_29);
	//indirectinvoke () = %28 (%29) : method(int[])->()
	println_s(_29, _29_size);
	//return
	_DEALLOC_STRUCT(data, Data);
	_DEALLOC_STRUCT(compress_data, Data);
	_DEALLOC(_3);
	_DEALLOC(_4);
	_DEALLOC_STRUCT(_6, Data);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_DEALLOC(_13);
	_DEALLOC(_19);
	_DEALLOC_STRUCT(_20, Data);
	_DEALLOC(_23);
	_DEALLOC(_29);
	exit(0);
}

