#include "lz77_optimised_decompress.h"
MyArrayList* copy_MyArrayList(MyArrayList* _MyArrayList){
	MyArrayList* new_MyArrayList = malloc(sizeof(MyArrayList));
	new_MyArrayList->items_length = _MyArrayList->items_length;
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
	printf(" items_length:");
	printf("%"PRId64, myarraylist->items_length);
	printf(" items:");
	_PRINT_1DARRAY_BYTE(myarraylist->items);
	printf("}");
}
MyArrayList* _opt_append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t items_length, BYTE item){
	MyArrayList* nlist;
	_DECL_DEALLOC(nlist);
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	int64_t _14 = 0;
	int64_t _15 = 0;
	BYTE _16;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	MyArrayList* _21;
	_DECL_DEALLOC(_21);
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//ifge %1, %6 goto blklab1 : int
	if(items_length>=_6){goto blklab1;}
	//update %0[%1] = %2 : byte[] -> byte[]
	// isCopyEliminated = false
	items[items_length] = item;
	//goto blklab2
	goto blklab2;
//.blklab1
blklab1:;
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
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, _12, _7);
	_ADD_DEALLOC(_13);
	//assign %4 = %13  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _13);
	_TRANSFER_DEALLOC(nitems, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	// isCopyEliminated = true
	i = _14;
	//loop (%4, %5, %15, %16, %17, %18)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = items_size;
		//ifge %5, %15 goto blklab3 : int
		if(i>=_15){goto blklab3;}
		//indexof %16 = %0, %5 : byte[]
		_16=items[i];
		//update %4[%5] = %16 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %5, %17 : int
		_18=i+_17;
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//update %4[%5] = %2 : byte[] -> byte[]
	// isCopyEliminated = true
	nitems[i] = item;
	//assign %0 = %4  : byte[]
	_DEALLOC(items);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(items, nitems);
	_TRANSFER_DEALLOC(items, nitems);
//.blklab2
blklab2:;
	//const %19 = 1 : int
	_19 = 1;
	//add %20 = %1, %19 : int
	_20=items_length+_19;
	//assign %1 = %20  : int
	// isCopyEliminated = true
	items_length = _20;
	//newrecord %21 = (%0, %1) : {byte[] items,int items_length}
	_DEALLOC_STRUCT(_21, MyArrayList);
	_21 = malloc(sizeof(MyArrayList));
	// isCopyEliminated = true
	_UPDATE_1DARRAY(_21->items, items);
	// isCopyEliminated = true
	_21->items_length = items_length;
	_REMOVE_DEALLOC(items);
	_ADD_DEALLOC(_21);
	//assign %3 = %21  : {byte[] items,int items_length}
	_DEALLOC_STRUCT(nlist, MyArrayList);
	// isCopyEliminated = true
	nlist = _21;
	_TRANSFER_DEALLOC(nlist, _21);
	//return %3
	_DEALLOC(items);
	_DEALLOC(nitems);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_21, MyArrayList);
	return nlist;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
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
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	_TRANSFER_DEALLOC(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab7 : int
		if(i>=size){goto blklab7;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	int64_t items_length = 0;
	MyArrayList* list;
	_DECL_DEALLOC(list);
	int64_t pos = 0;
	BYTE header;
	BYTE item;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t start = 0;
	int64_t i = 0;
	BYTE _12;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	MyArrayList* _16;
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	BYTE _21;
	int64_t _22 = 0;
	int64_t _23 = 0;
	BYTE _24;
	int64_t _25 = 0;
	int64_t _26 = 0;
	BYTE _27;
	MyArrayList* _28;
	_DECL_DEALLOC(_28);
	_DECL_1DARRAY_BYTE(_29);
	_DECL_DEALLOC(_29);
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	BYTE _35;
	MyArrayList* _36;
	_DECL_DEALLOC(_36);
	_DECL_1DARRAY_BYTE(_37);
	_DECL_DEALLOC(_37);
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	_DECL_1DARRAY_BYTE(_41);
	_DECL_DEALLOC(_41);
	//const %12 = 00000000b : byte
	_12 = 0b00000000;
	//const %13 = 0 : int
	_13 = 0;
	//arraygen %14 = [12; 13] : byte[]
	_DEALLOC(_14);
	_NEW_1DARRAY_BYTE(_14, _13, _12);
	_ADD_DEALLOC(_14);
	//assign %2 = %14  : byte[]
	_DEALLOC(items);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(items, _14);
	_TRANSFER_DEALLOC(items, _14);
	//const %15 = 0 : int
	_15 = 0;
	//assign %3 = %15  : int
	// isCopyEliminated = true
	items_length = _15;
	//newrecord %16 = (%2, %3) : {byte[] items,int items_length}
	_DEALLOC_STRUCT(_16, MyArrayList);
	_16 = malloc(sizeof(MyArrayList));
	// isCopyEliminated = false
	_COPY_1DARRAY_BYTE(_16->items, items);
	// isCopyEliminated = false
	_16->items_length = items_length;
	_ADD_DEALLOC(_16);
	//assign %4 = %16  : {byte[] items,int items_length}
	_DEALLOC_STRUCT(list, MyArrayList);
	// isCopyEliminated = true
	list = _16;
	_TRANSFER_DEALLOC(list, _16);
	//const %17 = 0 : int
	_17 = 0;
	//assign %5 = %17  : int
	// isCopyEliminated = true
	pos = _17;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
	while(true){
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %5, %18 : int
		_19=pos+_18;
		//lengthof %20 = %0 : byte[]
		_20 = data_size;
		//ifge %19, %20 goto blklab9 : int
		if(_19>=_20){goto blklab9;}
		//indexof %21 = %0, %5 : byte[]
		_21=data[pos];
		//assign %6 = %21  : byte
		// isCopyEliminated = true
		header = _21;
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %5, %22 : int
		_23=pos+_22;
		//indexof %24 = %0, %23 : byte[]
		_24=data[_23];
		//assign %7 = %24  : byte
		// isCopyEliminated = true
		item = _24;
		//const %25 = 2 : int
		_25 = 2;
		//add %26 = %5, %25 : int
		_26=pos+_25;
		//assign %5 = %26  : int
		// isCopyEliminated = true
		pos = _26;
		//const %27 = 00000000b : byte
		_27 = 0b00000000;
		//ifne %6, %27 goto blklab11 : byte
		if(header!=_27){goto blklab11;}
		//invoke (%28) = (%2, %3, %7) lz77_optimised_decompress:opt_append : function(byte[],lz77_optimised_decompress:nat,byte)->(lz77_optimised_decompress:MyArrayList)
		{
			_DEALLOC_STRUCT(_28, MyArrayList);
			// isCopyEliminated of '_2' = true
			_28 = _opt_append_(_1DARRAY_PARAM(items), false, items_length, item);
			_RETAIN_DEALLOC(items, "true-false-false" , "opt_append");
			_ADD_DEALLOC(_28);
		}
		//assign %4 = %28  : {byte[] items,int items_length}
		_DEALLOC_STRUCT(list, MyArrayList);
		// isCopyEliminated = true
		list = _28;
		_TRANSFER_DEALLOC(list, _28);
		//fieldload %29 = %4 items : {byte[] items,int items_length}
		_DEALLOC(_29);
		_UPDATE_1DARRAY(_29, list->items);
		_REMOVE_DEALLOC(_29);
		//assign %2 = %29  : byte[]
		_DEALLOC(items);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(items, _29);
		_TRANSFER_DEALLOC(items, _29);
		//fieldload %30 = %4 items_length : {byte[] items,int items_length}
		_30 = list->items_length;
		//assign %3 = %30  : int
		// isCopyEliminated = true
		items_length = _30;
		//goto blklab12
		goto blklab12;
//.blklab11
blklab11:;
		//invoke (%31) = (%6) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_31 = (unsigned int)header;
		}
		//assign %8 = %31  : int
		// isCopyEliminated = true
		offset = _31;
		//invoke (%32) = (%7) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_32 = (unsigned int)item;
		}
		//assign %9 = %32  : int
		// isCopyEliminated = true
		len = _32;
		//sub %33 = %3, %8 : int
		_33=items_length-offset;
		//assign %10 = %33  : int
		// isCopyEliminated = true
		start = _33;
		//assign %11 = %10  : int
		// isCopyEliminated = false
		i = start;
		//loop (%2, %3, %4, %7, %11, %34, %35, %36, %37, %38, %39, %40)
		while(true){
			//add %34 = %10, %9 : int
			_34=start+len;
			//ifge %11, %34 goto blklab13 : int
			if(i>=_34){goto blklab13;}
			//indexof %35 = %2, %11 : byte[]
			_35=items[i];
			//assign %7 = %35  : byte
			// isCopyEliminated = true
			item = _35;
			//invoke (%36) = (%2, %3, %7) lz77_optimised_decompress:opt_append : function(byte[],lz77_optimised_decompress:nat,byte)->(lz77_optimised_decompress:MyArrayList)
			{
				_DEALLOC_STRUCT(_36, MyArrayList);
				// isCopyEliminated of '_2' = true
				_36 = _opt_append_(_1DARRAY_PARAM(items), false, items_length, item);
				_RETAIN_DEALLOC(items, "true-false-false" , "opt_append");
				_ADD_DEALLOC(_36);
			}
			//assign %4 = %36  : {byte[] items,int items_length}
			_DEALLOC_STRUCT(list, MyArrayList);
			// isCopyEliminated = true
			list = _36;
			_TRANSFER_DEALLOC(list, _36);
			//fieldload %37 = %4 items : {byte[] items,int items_length}
			_DEALLOC(_37);
			_UPDATE_1DARRAY(_37, list->items);
			_REMOVE_DEALLOC(_37);
			//assign %2 = %37  : byte[]
			_DEALLOC(items);
			// isCopyEliminated = true
			_UPDATE_1DARRAY(items, _37);
			_TRANSFER_DEALLOC(items, _37);
			//fieldload %38 = %4 items_length : {byte[] items,int items_length}
			_38 = list->items_length;
			//assign %3 = %38  : int
			// isCopyEliminated = true
			items_length = _38;
			//const %39 = 1 : int
			_39 = 1;
			//add %40 = %11, %39 : int
			_40=i+_39;
			//assign %11 = %40  : int
			// isCopyEliminated = true
			i = _40;
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
	//invoke (%41) = (%2, %3) lz77_optimised_decompress:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_41);
		// isCopyEliminated of '_2' = true
		_41 = _resize_(_1DARRAY_PARAM(items), false, items_length, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_41));
		_RETAIN_DEALLOC(items, "false-false-false" , "resize");
		_ADD_DEALLOC(_41);
	}
	//assign %1 = %41  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _41);
	_TRANSFER_DEALLOC(output, _41);
	//return %1
	_DEALLOC(data);
	_DEALLOC(items);
	_DEALLOC_STRUCT(list, MyArrayList);
	_DEALLOC(_14);
	_DEALLOC_STRUCT(_16, MyArrayList);
	_DEALLOC_STRUCT(_28, MyArrayList);
	_DEALLOC(_29);
	_DEALLOC_STRUCT(_36, MyArrayList);
	_DEALLOC(_37);
	_DEALLOC(_41);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(input_data);
	_DECL_DEALLOC(input_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	void* _4;
	_DECL_DEALLOC(_4);
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY_BYTE(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	//const %5 = [115,109,97,108,108,46,100,97,116] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, 9, 0);
	_5[0] = 115; _5[1] = 109; _5[2] = 97; _5[3] = 108; _5[4] = 108; _5[5] = 46; _5[6] = 100; _5[7] = 97; _5[8] = 116; 
	_ADD_DEALLOC(_5);
	//invoke (%4) = (%5) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_5, _5_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _4;
	//fieldload %7 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%6) = %7 () : method()->(byte[])
	{
		_6 = readAll(file, &_6_size);
		_ADD_DEALLOC(_6);
	}
	//assign %2 = %6  : byte[]
	_DEALLOC(input_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(input_data, _6);
	_TRANSFER_DEALLOC(input_data, _6);
	//invoke (%8) = (%2) lz77_optimised_decompress:decompress : function(byte[])->(byte[])
	{
		_DEALLOC(_8);
		// isCopyEliminated of '_2' = true
		_8 = _decompress_(_1DARRAY_PARAM(input_data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_RETAIN_DEALLOC(input_data, "false-false-false" , "decompress");
		_ADD_DEALLOC(_8);
	}
	//assign %3 = %8  : byte[]
	_DEALLOC(decompress_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(decompress_data, _8);
	_TRANSFER_DEALLOC(decompress_data, _8);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, 16, 0);
	_11[0] = 68; _11[1] = 69; _11[2] = 67; _11[3] = 79; _11[4] = 77; _11[5] = 80; _11[6] = 82; _11[7] = 69; _11[8] = 83; _11[9] = 83; _11[10] = 69; _11[11] = 68; _11[12] = 58; _11[13] = 32; _11[14] = 32; _11[15] = 32; 
	_ADD_DEALLOC(_11);
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_14);
		_14 = fromBytes(decompress_data, decompress_data_size);
		_14_size = decompress_data_size;
		_ADD_DEALLOC(_14);
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
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	_ADD_DEALLOC(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(input_data);
	_DEALLOC(decompress_data);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_20);
	exit(0);
}

