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
long long match(BYTE* data, long long data_size, long long offset, long long end){
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
	return len;
	//return
}

Match* findLongestMatch(BYTE* data, long long data_size, long long pos){
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
		//invoke (%14) = (%0, %6, %1) lz77:match : function(byte[],lz77:nat,lz77:nat)->(int)
		{
			void* data_tmp;
			_14 = match(data_tmp = _COPY_1DARRAY_BYTE_PARAM(data), offset, pos);
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

BYTE* append_byte(BYTE* items, long long items_size, BYTE item){
	_DECL_1DARRAY_BYTE(_2);
	_DECL_1DARRAY_BYTE(nitems);
	long long i = 0;
	BYTE _5;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	long long _11 = 0;
	BYTE _12;
	long long _13 = 0;
	long long _14 = 0;
	//const %5 = 00000000b : byte
	_5 = 0b00000000;
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//const %7 = 1 : int
	_7 = 1;
	//add %8 = %6, %7 : int
	_8=_6+_7;
	//arraygen %9 = [5; 8] : byte[]
	_NEW_1DARRAY_BYTE_VALUE(_9, _8, _5);
	//assign %3 = %9  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	i = _10;
	//loop (%3, %4, %11, %12, %13, %14)
	while(true){
		//lengthof %11 = %0 : byte[]
		_11 = items_size;
		//ifge %4, %11 goto blklab6 : int
		if(i>=_11){goto blklab6;}
		//indexof %12 = %0, %4 : byte[]
		_12=items[i];
		//update %3[%4] = %12 : byte[] -> byte[]
		nitems[i] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=i+_13;
		//assign %4 = %14  : int
		i = _14;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %3[%4] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//return %3
	return nitems;
	//return
}

BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1){
	_DECL_1DARRAY_BYTE(_2);
	_DECL_1DARRAY_BYTE(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	_4 = toUnsignedByte(u1);
	//invoke (%3) = (%0, %4) lz77:append_byte : function(byte[],byte)->(byte[])
	{
		void* bytes_tmp;
		_UPDATE_1DARRAY_SIZE(_3, bytes);
		_3 = append_byte(bytes_tmp = _COPY_1DARRAY_BYTE_PARAM(bytes), _4);
	}
	//return %3
	return _3;
	//return
}

Data* compress(Data* data){
	Data* _1;
	_DECL_1DARRAY_BYTE(input);
	long long pos = 0;
	_DECL_1DARRAY_BYTE(output);
	long long length = 0;
	Match* m;
	long long offset = 0;
	long long len = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	BYTE _11;
	long long _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	long long _14 = 0;
	long long _15 = 0;
	Match* _16;
	long long _17 = 0;
	long long _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	_DECL_1DARRAY_BYTE(_23);
	BYTE _24;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	_DECL_1DARRAY_BYTE(_29);
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	Data* _35;
	//fieldload %9 = %0 items : {byte[] items,int length}
	_COPY_1DARRAY_BYTE(_9, data->items);
	//assign %2 = %9  : byte[]
	_COPY_1DARRAY_BYTE(input, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %3 = %10  : int
	pos = _10;
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_NEW_1DARRAY_BYTE_VALUE(_13, _12, _11);
	//assign %4 = %13  : byte[]
	_COPY_1DARRAY_BYTE(output, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	length = _14;
	//loop (%3, %4, %5, %6, %7, %8, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34)
	while(true){
		//fieldload %15 = %0 length : {byte[] items,int length}
		_15 = data->length;
		//ifge %3, %15 goto blklab8 : int
		if(pos>=_15){goto blklab8;}
		//invoke (%16) = (%2, %3) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			void* input_tmp;
			_16 = findLongestMatch(input_tmp = _COPY_1DARRAY_BYTE_PARAM(input), pos);
		}
		//assign %6 = %16  : {int len,int offset}
		m = copy_Match(_16);
		//fieldload %17 = %6 offset : {int len,int offset}
		_17 = m->offset;
		//assign %7 = %17  : int
		offset = _17;
		//fieldload %18 = %6 len : {int len,int offset}
		_18 = m->len;
		//assign %8 = %18  : int
		len = _18;
		//invoke (%19) = (%4, %7) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_UPDATE_1DARRAY_SIZE(_19, output);
			_19 = write_u1(output_tmp = _COPY_1DARRAY_BYTE_PARAM(output), offset);
		}
		//assign %4 = %19  : byte[]
		_COPY_1DARRAY_BYTE(output, _19);
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %5, %20 : int
		_21=length+_20;
		//assign %5 = %21  : int
		length = _21;
		//const %22 = 0 : int
		_22 = 0;
		//ifne %7, %22 goto blklab10 : int
		if(offset!=_22){goto blklab10;}
		//indexof %24 = %2, %3 : byte[]
		_24=input[pos];
		//invoke (%23) = (%4, %24) lz77:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_UPDATE_1DARRAY_SIZE(_23, output);
			_23 = append_byte(output_tmp = _COPY_1DARRAY_BYTE_PARAM(output), _24);
		}
		//assign %4 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//const %25 = 1 : int
		_25 = 1;
		//add %26 = %5, %25 : int
		_26=length+_25;
		//assign %5 = %26  : int
		length = _26;
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=pos+_27;
		//assign %3 = %28  : int
		pos = _28;
		//goto blklab11
		goto blklab11;
//.blklab10
blklab10:;
		//invoke (%29) = (%4, %8) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_UPDATE_1DARRAY_SIZE(_29, output);
			_29 = write_u1(output_tmp = _COPY_1DARRAY_BYTE_PARAM(output), len);
		}
		//assign %4 = %29  : byte[]
		_COPY_1DARRAY_BYTE(output, _29);
		//const %30 = 1 : int
		_30 = 1;
		//add %31 = %5, %30 : int
		_31=length+_30;
		//assign %5 = %31  : int
		length = _31;
		//add %32 = %3, %8 : int
		_32=pos+len;
		//assign %3 = %32  : int
		pos = _32;
//.blklab11
blklab11:;
		//const %33 = 1 : int
		_33 = 1;
		//add %34 = %3, %33 : int
		_34=pos+_33;
		//assign %3 = %34  : int
		pos = _34;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//newrecord %35 = (%4, %5) : {byte[] items,int length}
	_35 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_35->items, output);
	_35->length = length;
	//return %35
	return _35;
	//return
}

int main(int argc, char** args){
	Data* data;
	Data* compress_data;
	_DECL_1DARRAY_BYTE(_3);
	_DECL_1DARRAY_BYTE(_4);
	long long _5 = 0;
	Data* _6;
	void* _7;
	_DECL_1DARRAY(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_1DARRAY_BYTE(_13);
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
	//const %3 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_NEW_1DARRAY_BYTE(_3, 15);
	_3[0] = 0b01100001; _3[1] = 0b01100001; _3[2] = 0b01100011; _3[3] = 0b01100001; _3[4] = 0b01100001; _3[5] = 0b01100011; _3[6] = 0b01100001; _3[7] = 0b01100010; _3[8] = 0b01100011; _3[9] = 0b01100001; _3[10] = 0b01100010; _3[11] = 0b01100001; _3[12] = 0b01100001; _3[13] = 0b01100001; _3[14] = 0b01100011; 
	//const %4 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
	_NEW_1DARRAY_BYTE(_4, 15);
	_4[0] = 0b01100001; _4[1] = 0b01100001; _4[2] = 0b01100011; _4[3] = 0b01100001; _4[4] = 0b01100001; _4[5] = 0b01100011; _4[6] = 0b01100001; _4[7] = 0b01100010; _4[8] = 0b01100011; _4[9] = 0b01100001; _4[10] = 0b01100010; _4[11] = 0b01100001; _4[12] = 0b01100001; _4[13] = 0b01100001; _4[14] = 0b01100011; 
	//lengthof %5 = %4 : byte[]
	_5 = _4_size;
	//newrecord %6 = (%3, %5) : {byte[] items,int length}
	_6 = malloc(sizeof(Data));
	_COPY_1DARRAY_BYTE(_6->items, _3);
	_6->length = _5;
	//assign %1 = %6  : {byte[] items,int length}
	data = copy_Data(_6);
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY(_9, 14, 0);
	_9[0] = 68; _9[1] = 97; _9[2] = 116; _9[3] = 97; _9[4] = 58; _9[5] = 32; _9[6] = 32; _9[7] = 32; _9[8] = 32; _9[9] = 32; _9[10] = 32; _9[11] = 32; _9[12] = 32; _9[13] = 32; 
	//indirectinvoke () = %8 (%9) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_9));
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %13 = %1 items : {byte[] items,int length}
	_COPY_1DARRAY_BYTE(_13, data->items);
	//invoke (%12) = (%13) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_12, _13);
	_12 = fromBytes(_13, _13_size);
	_12_size = _13_size;
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
	_NEW_1DARRAY(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	//indirectinvoke () = %18 (%19) : method(int[])->()
	println_s(_19, _19_size);
	//invoke (%20) = (%1) lz77:compress : function(lz77:Data)->(lz77:Data)
	{
		void* data_tmp;
		_20 = compress(data_tmp = _COPY_STRUCT_PARAM(data, Data));
	}
	//assign %2 = %20  : {byte[] items,int length}
	compress_data = copy_Data(_20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY(_23, 14, 0);
	_23[0] = 67; _23[1] = 79; _23[2] = 77; _23[3] = 80; _23[4] = 82; _23[5] = 69; _23[6] = 83; _23[7] = 83; _23[8] = 69; _23[9] = 68; _23[10] = 58; _23[11] = 32; _23[12] = 32; _23[13] = 32; 
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
	_NEW_1DARRAY(_29, 6, 0);
	_29[0] = 32; _29[1] = 98; _29[2] = 121; _29[3] = 116; _29[4] = 101; _29[5] = 115; 
	//indirectinvoke () = %28 (%29) : method(int[])->()
	println_s(_29, _29_size);
	//return
	exit(0);
}

