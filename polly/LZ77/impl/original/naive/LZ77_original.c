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
long long match(Data* input, long long offset, long long end){
	long long _3 = 0;
	long long pos = 0;
	long long len = 0;
	_DECL_1DARRAY_BYTE(data);
	long long _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
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
	_UPDATE_1DARRAY(_8, input->items);
	//assign %6 = %8  : byte[]
	_COPY_1DARRAY_BYTE(data, _8);
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
	return len;
	//return
}

Match* findLongestMatch(Data* input, long long pos){
	Match* _2;
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
		//invoke (%14) = (%0, %6, %1) LZ77_original:match : function(LZ77_original:Data,LZ77_original:nat,LZ77_original:nat)->(int)
		{
			void* input_tmp;
			_14 = match(_COPY_STRUCT_PARAM(input, Data), offset, pos);
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

Data* append_byte(Data* data, BYTE item){
	Data* _2;
	_DECL_1DARRAY_BYTE(items);
	_DECL_1DARRAY_BYTE(nitems);
	long long i = 0;
	long long length = 0;
	_DECL_1DARRAY_BYTE(_7);
	BYTE _8;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY_BYTE(_12);
	long long _13 = 0;
	long long _14 = 0;
	BYTE _15;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	Data* _21;
	//fieldload %7 = %0 items : {byte[] items,int length}
	_UPDATE_1DARRAY(_7, data->items);
	//assign %3 = %7  : byte[]
	_COPY_1DARRAY_BYTE(items, _7);
	//const %8 = 00000000b : byte
	_8 = 0b00000000;
	//lengthof %9 = %3 : byte[]
	_9 = items_size;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %9, %10 : int
	_11=_9+_10;
	//arraygen %12 = [8; 11] : byte[]
	_NEW_1DARRAY_BYTE(_12, _11, _8);
	//assign %4 = %12  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _12);
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
	_21 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_21->items, nitems);
	_21->length = length;
	//return %21
	return _21;
	//return
}

Data* write_u1(Data* data, long long u1){
	Data* _2;
	Data* _3;
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	_4 = (BYTE)u1;
	//invoke (%3) = (%0, %4) LZ77_original:append_byte : function(LZ77_original:Data,byte)->(LZ77_original:Data)
	{
		void* data_tmp;
		_3 = append_byte(_COPY_STRUCT_PARAM(data, Data), _4);
	}
	//return %3
	return _3;
	//return
}

Data* compress(Data* input){
	Data* _1;
	long long pos = 0;
	Data* output;
	Match* m;
	long long offset = 0;
	long long len = 0;
	long long _7 = 0;
	BYTE _8;
	long long _9 = 0;
	_DECL_1DARRAY_BYTE(_10);
	long long _11 = 0;
	Data* _12;
	long long _13 = 0;
	Match* _14;
	long long _15 = 0;
	long long _16 = 0;
	Data* _17;
	long long _18 = 0;
	Data* _19;
	_DECL_1DARRAY_BYTE(_20);
	BYTE _21;
	long long _22 = 0;
	long long _23 = 0;
	Data* _24;
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
	_NEW_1DARRAY_BYTE(_10, _9, _8);
	//const %11 = 0 : int
	_11 = 0;
	//newrecord %12 = (%10, %11) : {byte[] items,int length}
	_12 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_12->items, _10);
	_12->length = _11;
	//assign %3 = %12  : {byte[] items,int length}
	output = copy_Data(_12);
	//loop (%2, %3, %4, %5, %6, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//fieldload %13 = %0 length : {byte[] items,int length}
		_13 = input->length;
		//ifge %2, %13 goto blklab8 : int
		if(pos>=_13){goto blklab8;}
		//invoke (%14) = (%0, %2) LZ77_original:findLongestMatch : function(LZ77_original:Data,LZ77_original:nat)->(LZ77_original:Match)
		{
			void* input_tmp;
			_14 = findLongestMatch(_COPY_STRUCT_PARAM(input, Data), pos);
		}
		//assign %4 = %14  : {int len,int offset}
		m = copy_Match(_14);
		//fieldload %15 = %4 offset : {int len,int offset}
		_15 = m->offset;
		//assign %5 = %15  : int
		offset = _15;
		//fieldload %16 = %4 len : {int len,int offset}
		_16 = m->len;
		//assign %6 = %16  : int
		len = _16;
		//invoke (%17) = (%3, %5) LZ77_original:write_u1 : function(LZ77_original:Data,int)->(LZ77_original:Data)
		{
			void* output_tmp;
			_17 = write_u1(_COPY_STRUCT_PARAM(output, Data), offset);
		}
		//assign %3 = %17  : {byte[] items,int length}
		output = copy_Data(_17);
		//const %18 = 0 : int
		_18 = 0;
		//ifne %5, %18 goto blklab10 : int
		if(offset!=_18){goto blklab10;}
		//fieldload %20 = %0 items : {byte[] items,int length}
		_UPDATE_1DARRAY(_20, input->items);
		//indexof %21 = %20, %2 : byte[]
		_21=_20[pos];
		//invoke (%19) = (%3, %21) LZ77_original:append_byte : function(LZ77_original:Data,byte)->(LZ77_original:Data)
		{
			void* output_tmp;
			_19 = append_byte(_COPY_STRUCT_PARAM(output, Data), _21);
		}
		//assign %3 = %19  : {byte[] items,int length}
		output = copy_Data(_19);
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
		//invoke (%24) = (%3, %6) LZ77_original:write_u1 : function(LZ77_original:Data,int)->(LZ77_original:Data)
		{
			void* output_tmp;
			_24 = write_u1(_COPY_STRUCT_PARAM(output, Data), len);
		}
		//assign %3 = %24  : {byte[] items,int length}
		output = copy_Data(_24);
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
	return output;
	//return
}

Data* decompress(Data* input){
	Data* _1;
	Data* output;
	_DECL_1DARRAY_BYTE(data);
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
	long long _14 = 0;
	Data* _15;
	_DECL_1DARRAY_BYTE(_16);
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
	long long _29 = 0;
	long long _30 = 0;
	_DECL_1DARRAY_BYTE(_31);
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	_DECL_1DARRAY_BYTE(_35);
	BYTE _36;
	Data* _37;
	long long _38 = 0;
	long long _39 = 0;
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	//const %14 = 0 : int
	_14 = 0;
	//newrecord %15 = (%13, %14) : {byte[] items,int length}
	_15 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_15->items, _13);
	_15->length = _14;
	//assign %2 = %15  : {byte[] items,int length}
	output = copy_Data(_15);
	//fieldload %16 = %0 items : {byte[] items,int length}
	_UPDATE_1DARRAY(_16, input->items);
	//assign %3 = %16  : byte[]
	_COPY_1DARRAY_BYTE(data, _16);
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
		//invoke (%28) = (%2, %6) LZ77_original:append_byte : function(LZ77_original:Data,byte)->(LZ77_original:Data)
		{
			void* output_tmp;
			_28 = append_byte(_COPY_STRUCT_PARAM(output, Data), item);
		}
		//assign %2 = %28  : {byte[] items,int length}
		output = copy_Data(_28);
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
		_UPDATE_1DARRAY(_31, output->items);
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
			_UPDATE_1DARRAY(_35, output->items);
			//indexof %36 = %35, %10 : byte[]
			_36=_35[i];
			//assign %6 = %36  : byte
			item = _36;
			//invoke (%37) = (%2, %6) LZ77_original:append_byte : function(LZ77_original:Data,byte)->(LZ77_original:Data)
			{
				void* output_tmp;
				_37 = append_byte(_COPY_STRUCT_PARAM(output, Data), item);
			}
			//assign %2 = %37  : {byte[] items,int length}
			output = copy_Data(_37);
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
	return output;
	//return
}

Data* init(long long repeat){
	Data* _1;
	long long length = 0;
	_DECL_1DARRAY_BYTE(items);
	long long pos = 0;
	long long _5 = 0;
	long long _6 = 0;
	BYTE _7;
	_DECL_1DARRAY_BYTE(_8);
	long long _9 = 0;
	_DECL_1DARRAY_BYTE(_10);
	long long _11 = 0;
	long long _12 = 0;
	BYTE _13;
	long long _14 = 0;
	long long _15 = 0;
	Data* _16;
	//const %5 = 15 : int
	_5 = 15;
	//mul %6 = %0, %5 : int
	_6=repeat*_5;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//arraygen %8 = [7; 2] : byte[]
	_NEW_1DARRAY_BYTE(_8, length, _7);
	//assign %3 = %8  : byte[]
	_COPY_1DARRAY_BYTE(items, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	pos = _9;
	//loop (%3, %4, %10, %11, %12, %13, %14, %15)
	while(true){
		//ifge %4, %2 goto blklab18 : int
		if(pos>=length){goto blklab18;}
		//const %10 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
		_NEW_1DARRAY_BYTE(_10, 15, 0b0);
		_10[0] = 0b01100001; _10[1] = 0b01100001; _10[2] = 0b01100011; _10[3] = 0b01100001; _10[4] = 0b01100001; _10[5] = 0b01100011; _10[6] = 0b01100001; _10[7] = 0b01100010; _10[8] = 0b01100011; _10[9] = 0b01100001; _10[10] = 0b01100010; _10[11] = 0b01100001; _10[12] = 0b01100001; _10[13] = 0b01100001; _10[14] = 0b01100011; 
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
	_16 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_16->items, items);
	_16->length = length;
	//return %16
	return _16;
	//return
}

int main(int argc, char** args){
	long long* n;
	long long repeat = 0;
	Data* data;
	Data* compress_data;
	Data* decompress_data;
	long long* _6;
	_DECL_2DARRAY(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	Data* _10;
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	long long _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	Data* _20;
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	long long _26 = 0;
	void* _27;
	_DECL_1DARRAY(_29);
	Data* _30;
	void* _31;
	_DECL_1DARRAY(_33);
	void* _34;
	long long _36 = 0;
	void* _37;
	_DECL_1DARRAY(_39);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	//assign %1 = %6  : null|int
	_NEW_INTEGER_POINTER(n, _6);
	//ifis %1, null goto blklab20 : null|int
	if(n == NULL) { goto blklab20;}
	//assign %2 = %1  : int
	repeat = *n;
	//invoke (%10) = (%2) LZ77_original:init : function(int)->(LZ77_original:Data)
	{
		_10 = init(repeat);
	}
	//assign %3 = %10  : {byte[] items,int length}
	data = copy_Data(_10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_13, 14, 0);
	_13[0] = 68; _13[1] = 97; _13[2] = 116; _13[3] = 97; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %16 = %3 length : {byte[] items,int length}
	_16 = data->length;
	//indirectinvoke () = %15 (%16) : method(any)->()
	printf("%lld", _16);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	//indirectinvoke () = %18 (%19) : method(int[])->()
	println_s(_19, _19_size);
	//invoke (%20) = (%3) LZ77_original:compress : function(LZ77_original:Data)->(LZ77_original:Data)
	{
		void* data_tmp;
		_20 = compress(_COPY_STRUCT_PARAM(data, Data));
	}
	//assign %4 = %20  : {byte[] items,int length}
	compress_data = copy_Data(_20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_23, 19, 0);
	_23[0] = 67; _23[1] = 79; _23[2] = 77; _23[3] = 80; _23[4] = 82; _23[5] = 69; _23[6] = 83; _23[7] = 83; _23[8] = 69; _23[9] = 68; _23[10] = 32; _23[11] = 68; _23[12] = 97; _23[13] = 116; _23[14] = 97; _23[15] = 58; _23[16] = 32; _23[17] = 32; _23[18] = 32; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %26 = %4 length : {byte[] items,int length}
	_26 = compress_data->length;
	//indirectinvoke () = %25 (%26) : method(any)->()
	printf("%lld", _26);
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_29, 6, 0);
	_29[0] = 32; _29[1] = 98; _29[2] = 121; _29[3] = 116; _29[4] = 101; _29[5] = 115; 
	//indirectinvoke () = %28 (%29) : method(int[])->()
	println_s(_29, _29_size);
	//invoke (%30) = (%4) LZ77_original:decompress : function(LZ77_original:Data)->(LZ77_original:Data)
	{
		void* compress_data_tmp;
		_30 = decompress(_COPY_STRUCT_PARAM(compress_data, Data));
	}
	//assign %5 = %30  : {byte[] items,int length}
	decompress_data = copy_Data(_30);
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_33, 16, 0);
	_33[0] = 68; _33[1] = 69; _33[2] = 67; _33[3] = 79; _33[4] = 77; _33[5] = 80; _33[6] = 82; _33[7] = 69; _33[8] = 83; _33[9] = 83; _33[10] = 69; _33[11] = 68; _33[12] = 58; _33[13] = 32; _33[14] = 32; _33[15] = 32; 
	//indirectinvoke () = %32 (%33) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_33));
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %36 = %5 length : {byte[] items,int length}
	_36 = decompress_data->length;
	//indirectinvoke () = %35 (%36) : method(any)->()
	printf("%lld", _36);
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %39 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_39, 6, 0);
	_39[0] = 32; _39[1] = 98; _39[2] = 121; _39[3] = 116; _39[4] = 101; _39[5] = 115; 
	//indirectinvoke () = %38 (%39) : method(int[])->()
	println_s(_39, _39_size);
//.blklab20
blklab20:;
	//return
	exit(0);
}

