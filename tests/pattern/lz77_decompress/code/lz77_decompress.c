#include "lz77_decompress.h"
MyArrayList* copy_MyArrayList(MyArrayList* _MyArrayList){
	MyArrayList* new_MyArrayList = malloc(sizeof(MyArrayList));
	new_MyArrayList->len = _MyArrayList->len;
	_COPY_1DARRAY_BYTE(new_MyArrayList->items, _MyArrayList->items);
	return new_MyArrayList;
}
MyArrayList** copy_array_MyArrayList(MyArrayList** _MyArrayList, size_t _MyArrayList_size){
	MyArrayList** new_MyArrayList = malloc(_MyArrayList_size*sizeof(MyArrayList*));
	for(int i=0;i<_MyArrayList_size;i++){
		new_MyArrayList[i] = copy_MyArrayList(_MyArrayList[i]);
	}
	return new_MyArrayList;
}
void free_MyArrayList(MyArrayList* myarraylist){
	free(myarraylist->items);
	myarraylist->items = NULL;
	free(myarraylist);
}
void printf_MyArrayList(MyArrayList* myarraylist){
	printf("{");
	printf(" len:");
	printf("%"PRId64, myarraylist->len);
	printf(" items:");
	_PRINT_1DARRAY_BYTE(myarraylist->items);
	printf("}");
}
MyArrayList* _append_(MyArrayList* list, BYTE item){
	MyArrayList* nlist;
	_DECL_1DARRAY_BYTE(items);
	int64_t items_length = 0;
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i = 0;
	_DECL_1DARRAY_BYTE(_7);
	int64_t _8 = 0;
	int64_t _9 = 0;
	BYTE _10;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	BYTE _19;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	MyArrayList* _24;
	//fieldload %7 = %0 items : {byte[] items,int len}
	_UPDATE_1DARRAY(_7, list->items);
	//assign %3 = %7  : byte[]
	_COPY_1DARRAY_BYTE(items, _7);
	//fieldload %8 = %0 len : {byte[] items,int len}
	_8 = list->len;
	//assign %4 = %8  : int
	items_length = _8;
	//lengthof %9 = %3 : byte[]
	_9 = items_size;
	//ifge %4, %9 goto blklab1 : int
	if(items_length>=_9){goto blklab1;}
	//update %3[%4] = %1 : byte[] -> byte[]
	items[items_length] = item;
	//goto blklab2
	goto blklab2;
//.blklab1
blklab1:;
	//const %10 = 00000000b : byte
	_10 = 0b00000000;
	//lengthof %11 = %3 : byte[]
	_11 = items_size;
	//const %12 = 2 : int
	_12 = 2;
	//mul %13 = %11, %12 : int
	_13=_11*_12;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %13, %14 : int
	_15=_13+_14;
	//arraygen %16 = [10; 15] : byte[]
	_NEW_1DARRAY_BYTE(_16, _15, _10);
	//assign %5 = %16  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _16);
	//const %17 = 0 : int
	_17 = 0;
	//assign %6 = %17  : int
	i = _17;
	//loop (%5, %6, %18, %19, %20, %21)
	while(true){
		//lengthof %18 = %3 : byte[]
		_18 = items_size;
		//ifge %6, %18 goto blklab3 : int
		if(i>=_18){goto blklab3;}
		//indexof %19 = %3, %6 : byte[]
		_19=items[i];
		//update %5[%6] = %19 : byte[] -> byte[]
		nitems[i] = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %6, %20 : int
		_21=i+_20;
		//assign %6 = %21  : int
		i = _21;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//update %5[%6] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//assign %3 = %5  : byte[]
	_COPY_1DARRAY_BYTE(items, nitems);
//.blklab2
blklab2:;
	//const %22 = 1 : int
	_22 = 1;
	//add %23 = %4, %22 : int
	_23=items_length+_22;
	//assign %4 = %23  : int
	items_length = _23;
	//newrecord %24 = (%3, %4) : {byte[] items,int len}
	_24 = malloc(sizeof(MyArrayList));
	_COPY_1DARRAY_BYTE(_24->items, items);
	_24->len = items_length;
	//assign %2 = %24  : {byte[] items,int len}
	nlist = copy_MyArrayList(_24);
	//return %2
	return nlist;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
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
		//ifge %3, %1 goto blklab7 : int
		if(i>=size){goto blklab7;}
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
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	MyArrayList* list;
	int64_t pos = 0;
	BYTE header;
	BYTE item;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t start = 0;
	int64_t i = 0;
	_DECL_1DARRAY_BYTE(items);
	BYTE _11;
	int64_t _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	int64_t _14 = 0;
	MyArrayList* _15;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	BYTE _20;
	int64_t _21 = 0;
	int64_t _22 = 0;
	BYTE _23;
	int64_t _24 = 0;
	int64_t _25 = 0;
	BYTE _26;
	MyArrayList* _27;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	_DECL_1DARRAY_BYTE(_33);
	BYTE _34;
	MyArrayList* _35;
	int64_t _36 = 0;
	int64_t _37 = 0;
	_DECL_1DARRAY_BYTE(_38);
	_DECL_1DARRAY_BYTE(_39);
	int64_t _40 = 0;
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	//const %14 = 0 : int
	_14 = 0;
	//newrecord %15 = (%13, %14) : {byte[] items,int len}
	_15 = malloc(sizeof(MyArrayList));
	_COPY_1DARRAY_BYTE(_15->items, _13);
	_15->len = _14;
	//assign %2 = %15  : {byte[] items,int len}
	list = copy_MyArrayList(_15);
	//const %16 = 0 : int
	_16 = 0;
	//assign %3 = %16  : int
	pos = _16;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=pos+_17;
		//lengthof %19 = %0 : byte[]
		_19 = data_size;
		//ifge %18, %19 goto blklab9 : int
		if(_18>=_19){goto blklab9;}
		//indexof %20 = %0, %3 : byte[]
		_20=data[pos];
		//assign %4 = %20  : byte
		header = _20;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %3, %21 : int
		_22=pos+_21;
		//indexof %23 = %0, %22 : byte[]
		_23=data[_22];
		//assign %5 = %23  : byte
		item = _23;
		//const %24 = 2 : int
		_24 = 2;
		//add %25 = %3, %24 : int
		_25=pos+_24;
		//assign %3 = %25  : int
		pos = _25;
		//const %26 = 00000000b : byte
		_26 = 0b00000000;
		//ifne %4, %26 goto blklab11 : byte
		if(header!=_26){goto blklab11;}
		//invoke (%27) = (%2, %5) lz77_decompress:append : function(lz77_decompress:MyArrayList,byte)->(lz77_decompress:MyArrayList)
		{
			void* list_tmp;
			_27 = _append_(_COPY_STRUCT_PARAM(list, MyArrayList), item);
		}
		//assign %2 = %27  : {byte[] items,int len}
		list = copy_MyArrayList(_27);
		//goto blklab12
		goto blklab12;
//.blklab11
blklab11:;
		//invoke (%28) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_28 = (unsigned int)header;
		}
		//assign %6 = %28  : int
		offset = _28;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_29 = (unsigned int)item;
		}
		//assign %7 = %29  : int
		len = _29;
		//fieldload %30 = %2 len : {byte[] items,int len}
		_30 = list->len;
		//sub %31 = %30, %6 : int
		_31=_30-offset;
		//assign %8 = %31  : int
		start = _31;
		//assign %9 = %8  : int
		i = start;
		//loop (%2, %5, %9, %10, %32, %33, %34, %35, %36, %37)
		while(true){
			//add %32 = %8, %7 : int
			_32=start+len;
			//ifge %9, %32 goto blklab13 : int
			if(i>=_32){goto blklab13;}
			//fieldload %33 = %2 items : {byte[] items,int len}
			_UPDATE_1DARRAY(_33, list->items);
			//assign %10 = %33  : byte[]
			_COPY_1DARRAY_BYTE(items, _33);
			//indexof %34 = %10, %9 : byte[]
			_34=items[i];
			//assign %5 = %34  : byte
			item = _34;
			//invoke (%35) = (%2, %5) lz77_decompress:append : function(lz77_decompress:MyArrayList,byte)->(lz77_decompress:MyArrayList)
			{
				void* list_tmp;
				_35 = _append_(_COPY_STRUCT_PARAM(list, MyArrayList), item);
			}
			//assign %2 = %35  : {byte[] items,int len}
			list = copy_MyArrayList(_35);
			//const %36 = 1 : int
			_36 = 1;
			//add %37 = %9, %36 : int
			_37=i+_36;
			//assign %9 = %37  : int
			i = _37;
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
//.blklab12
blklab12:;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//fieldload %39 = %2 items : {byte[] items,int len}
	_UPDATE_1DARRAY(_39, list->items);
	//fieldload %40 = %2 len : {byte[] items,int len}
	_40 = list->len;
	//invoke (%38) = (%39, %40) lz77_decompress:resize : function(byte[],int)->(byte[])
	{
		void* _39_tmp;
		_38 = _resize_(_COPY_1DARRAY_PARAM_BYTE(_39), _40, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_38));
	}
	//assign %1 = %38  : byte[]
	_COPY_1DARRAY_BYTE(output, _38);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(input_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	void* _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY_BYTE(_6);
	_DECL_1DARRAY_BYTE(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	//const %5 = [105,110,112,117,116,50,120,46,100,97,116] : int[]
	_NEW_1DARRAY_int64_t(_5, 11, 0);
	_5[0] = 105; _5[1] = 110; _5[2] = 112; _5[3] = 117; _5[4] = 116; _5[5] = 50; _5[6] = 120; _5[7] = 46; _5[8] = 100; _5[9] = 97; _5[10] = 116; 
	//invoke (%4) = (%5) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_5, _5_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _4;
	//fieldload %7 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%6) = %7 () : method()->(byte[])
	{
		_6 = readAll(file, &_6_size);
	}
	//assign %2 = %6  : byte[]
	_COPY_1DARRAY_BYTE(input_data, _6);
	//invoke (%8) = (%2) lz77_decompress:decompress : function(byte[])->(byte[])
	{
		void* input_data_tmp;
		_8 = _decompress_(_COPY_1DARRAY_PARAM_BYTE(input_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %3 = %8  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _8);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_11, 16, 0);
	_11[0] = 68; _11[1] = 69; _11[2] = 67; _11[3] = 79; _11[4] = 77; _11[5] = 80; _11[6] = 82; _11[7] = 69; _11[8] = 83; _11[9] = 83; _11[10] = 69; _11[11] = 68; _11[12] = 58; _11[13] = 32; _11[14] = 32; _11[15] = 32; 
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_14 = fromBytes(decompress_data, decompress_data_size);
		_14_size = decompress_data_size;
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		println_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %3 : byte[]
	_17 = decompress_data_size;
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		printf("%"PRId64, _17);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//return
	exit(0);
}

