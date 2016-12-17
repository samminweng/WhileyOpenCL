#include "bubblesort.h"
int64_t* _bubbleSort_(_DECL_1DARRAY_PARAM(items), _DECL_DEALLOC_PARAM(items), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t length = 0;
	int64_t last_swapped = 0;
	int64_t index = 0;
	int64_t tmp = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
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
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	//lengthof %6 = %0 : int[]
	_6 = items_size;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 0 : int
	_7 = 0;
	//assign %3 = %7  : int
	last_swapped = _7;
	//loop (%0, %2, %3, %4, %5, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %8 = 0 : int
		_8 = 0;
		//ifle %2, %8 goto blklab0 : int
		if(length<=_8){goto blklab0;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %3 = %9  : int
		last_swapped = _9;
		//const %10 = 1 : int
		_10 = 1;
		//assign %4 = %10  : int
		index = _10;
		//loop (%0, %3, %4, %5, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//ifge %4, %2 goto blklab2 : int
			if(index>=length){goto blklab2;}
			//const %11 = 1 : int
			_11 = 1;
			//sub %12 = %4, %11 : int
			_12=index-_11;
			//indexof %13 = %0, %12 : int[]
			_13=items[_12];
			//indexof %14 = %0, %4 : int[]
			_14=items[index];
			//ifle %13, %14 goto blklab4 : int
			if(_13<=_14){goto blklab4;}
			//const %15 = 1 : int
			_15 = 1;
			//sub %16 = %4, %15 : int
			_16=index-_15;
			//indexof %17 = %0, %16 : int[]
			_17=items[_16];
			//assign %5 = %17  : int
			tmp = _17;
			//indexof %18 = %0, %4 : int[]
			_18=items[index];
			//const %19 = 1 : int
			_19 = 1;
			//sub %20 = %4, %19 : int
			_20=index-_19;
			//update %0[%20] = %18 : int[] -> int[]
			items[_20] = _18;
			//update %0[%4] = %5 : int[] -> int[]
			items[index] = tmp;
			//assign %3 = %4  : int
			last_swapped = index;
//.blklab4
blklab4:;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %4, %21 : int
			_22=index+_21;
			//assign %4 = %22  : int
			index = _22;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//assign %2 = %3  : int
		length = last_swapped;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(ys);
	_DECL_DEALLOC(ys);
	int64_t max = 0;
	int64_t index = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	void* _18;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	void* _31;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	_DECL_1DARRAY(_37);
	_DECL_DEALLOC(_37);
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	void* _44;
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
	int64_t _50 = 0;
	_DECL_1DARRAY(_51);
	_DECL_DEALLOC(_51);
	_DECL_1DARRAY(_52);
	_DECL_DEALLOC(_52);
	int64_t _53 = 0;
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	_DECL_1DARRAY(_58);
	_DECL_DEALLOC(_58);
	void* _59;
	int64_t _61 = 0;
	int64_t _62 = 0;
	int64_t _63 = 0;
	_DECL_1DARRAY(_64);
	_DECL_DEALLOC(_64);
	int64_t _65 = 0;
	int64_t _66 = 0;
	int64_t _67 = 0;
	_DECL_1DARRAY(_68);
	_DECL_DEALLOC(_68);
	int64_t _69 = 0;
	int64_t _70 = 0;
	int64_t _71 = 0;
	int64_t _72 = 0;
	int64_t _73 = 0;
	int64_t _74 = 0;
	int64_t _75 = 0;
	int64_t _76 = 0;
	int64_t _77 = 0;
	int64_t _78 = 0;
	_DECL_1DARRAY(_79);
	_DECL_DEALLOC(_79);
	void* _80;
	void* _82;
	_DECL_1DARRAY(_84);
	_DECL_DEALLOC(_84);
	//const %5 = 3 : int
	_5 = 3;
	//const %6 = 4 : int
	_6 = 4;
	//const %7 = 7 : int
	_7 = 7;
	//const %8 = 1 : int
	_8 = 1;
	//const %9 = 2 : int
	_9 = 2;
	//newlist %10 = (%5, %6, %7, %8, %9) : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, 5, 0);
	_10[0] = _5; _10[1] = _6; _10[2] = _7; _10[3] = _8; _10[4] = _9; 
	_ADD_DEALLOC(_10);
	//assign %1 = %10  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _10);
	_TRANSFER_DEALLOC(ys, _10);
	//invoke (%11) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	{
		_DEALLOC(_11);
		_11 = _bubbleSort_(_1DARRAY_PARAM(ys), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_11));
		_RESET_DEALLOC(ys, "true-true-false" , "bubbleSort");
		_ADD_DEALLOC(_11);
	}
	//assign %1 = %11  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _11);
	_TRANSFER_DEALLOC(ys, _11);
	//assert
	{
		//const %12 = 1 : int
		_12 = 1;
		//const %13 = 2 : int
		_13 = 2;
		//const %14 = 3 : int
		_14 = 3;
		//const %15 = 4 : int
		_15 = 4;
		//const %16 = 7 : int
		_16 = 7;
		//newlist %17 = (%12, %13, %14, %15, %16) : int[]
		_DEALLOC(_17);
		_NEW_1DARRAY_int64_t(_17, 5, 0);
		_17[0] = _12; _17[1] = _13; _17[2] = _14; _17[3] = _15; _17[4] = _16; 
		_ADD_DEALLOC(_17);
		//ifeq %1, %17 goto blklab5 : int[]
		_IFEQ_ARRAY_int64_t(ys, _17, blklab5);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %19 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(ys);
	}
	//const %20 = 3 : int
	_20 = 3;
	//const %21 = 4 : int
	_21 = 4;
	//const %22 = 7 : int
	_22 = 7;
	//const %23 = 2 : int
	_23 = 2;
	//newlist %24 = (%20, %21, %22, %23) : int[]
	_DEALLOC(_24);
	_NEW_1DARRAY_int64_t(_24, 4, 0);
	_24[0] = _20; _24[1] = _21; _24[2] = _22; _24[3] = _23; 
	_ADD_DEALLOC(_24);
	//assign %1 = %24  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _24);
	_TRANSFER_DEALLOC(ys, _24);
	//invoke (%25) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	{
		_DEALLOC(_25);
		_25 = _bubbleSort_(_1DARRAY_PARAM(ys), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
		_RESET_DEALLOC(ys, "true-true-false" , "bubbleSort");
		_ADD_DEALLOC(_25);
	}
	//assign %1 = %25  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _25);
	_TRANSFER_DEALLOC(ys, _25);
	//assert
	{
		//const %26 = 2 : int
		_26 = 2;
		//const %27 = 3 : int
		_27 = 3;
		//const %28 = 4 : int
		_28 = 4;
		//const %29 = 7 : int
		_29 = 7;
		//newlist %30 = (%26, %27, %28, %29) : int[]
		_DEALLOC(_30);
		_NEW_1DARRAY_int64_t(_30, 4, 0);
		_30[0] = _26; _30[1] = _27; _30[2] = _28; _30[3] = _29; 
		_ADD_DEALLOC(_30);
		//ifeq %1, %30 goto blklab6 : int[]
		_IFEQ_ARRAY_int64_t(ys, _30, blklab6);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %32 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(ys);
	}
	//const %33 = 1 : int
	_33 = 1;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 3 : int
	_35 = 3;
	//const %36 = 4 : int
	_36 = 4;
	//newlist %37 = (%33, %34, %35, %36) : int[]
	_DEALLOC(_37);
	_NEW_1DARRAY_int64_t(_37, 4, 0);
	_37[0] = _33; _37[1] = _34; _37[2] = _35; _37[3] = _36; 
	_ADD_DEALLOC(_37);
	//assign %1 = %37  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _37);
	_TRANSFER_DEALLOC(ys, _37);
	//invoke (%38) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	{
		_DEALLOC(_38);
		_38 = _bubbleSort_(_1DARRAY_PARAM(ys), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_38));
		_RESET_DEALLOC(ys, "true-true-false" , "bubbleSort");
		_ADD_DEALLOC(_38);
	}
	//assign %1 = %38  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _38);
	_TRANSFER_DEALLOC(ys, _38);
	//assert
	{
		//const %39 = 1 : int
		_39 = 1;
		//const %40 = 2 : int
		_40 = 2;
		//const %41 = 3 : int
		_41 = 3;
		//const %42 = 4 : int
		_42 = 4;
		//newlist %43 = (%39, %40, %41, %42) : int[]
		_DEALLOC(_43);
		_NEW_1DARRAY_int64_t(_43, 4, 0);
		_43[0] = _39; _43[1] = _40; _43[2] = _41; _43[3] = _42; 
		_ADD_DEALLOC(_43);
		//ifeq %1, %43 goto blklab7 : int[]
		_IFEQ_ARRAY_int64_t(ys, _43, blklab7);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %45 = %44 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %45 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(ys);
	}
	//const %46 = 1 : int
	_46 = 1;
	//const %47 = 2 : int
	_47 = 2;
	//const %48 = 3 : int
	_48 = 3;
	//const %49 = 4 : int
	_49 = 4;
	//const %50 = 5 : int
	_50 = 5;
	//newlist %51 = (%46, %47, %48, %49, %50) : int[]
	_DEALLOC(_51);
	_NEW_1DARRAY_int64_t(_51, 5, 0);
	_51[0] = _46; _51[1] = _47; _51[2] = _48; _51[3] = _49; _51[4] = _50; 
	_ADD_DEALLOC(_51);
	//assign %1 = %51  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _51);
	_TRANSFER_DEALLOC(ys, _51);
	//invoke (%52) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	{
		_DEALLOC(_52);
		_52 = _bubbleSort_(_1DARRAY_PARAM(ys), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_52));
		_RESET_DEALLOC(ys, "true-true-false" , "bubbleSort");
		_ADD_DEALLOC(_52);
	}
	//assign %1 = %52  : int[]
	_DEALLOC(ys);
	_UPDATE_1DARRAY(ys, _52);
	_TRANSFER_DEALLOC(ys, _52);
	//assert
	{
		//const %53 = 1 : int
		_53 = 1;
		//const %54 = 2 : int
		_54 = 2;
		//const %55 = 3 : int
		_55 = 3;
		//const %56 = 4 : int
		_56 = 4;
		//const %57 = 5 : int
		_57 = 5;
		//newlist %58 = (%53, %54, %55, %56, %57) : int[]
		_DEALLOC(_58);
		_NEW_1DARRAY_int64_t(_58, 5, 0);
		_58[0] = _53; _58[1] = _54; _58[2] = _55; _58[3] = _56; _58[4] = _57; 
		_ADD_DEALLOC(_58);
		//ifeq %1, %58 goto blklab8 : int[]
		_IFEQ_ARRAY_int64_t(ys, _58, blklab8);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %59 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %60 = %59 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %60 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(ys);
	}
	//const %61 = 10 : int
	_61 = 10;
	//assign %2 = %61  : int
	max = _61;
	//const %62 = 0 : int
	_62 = 0;
	//assign %3 = %62  : int
	index = _62;
	//const %63 = 0 : int
	_63 = 0;
	//arraygen %64 = [63; 2] : int[]
	_DEALLOC(_64);
	_NEW_1DARRAY_int64_t(_64, max, _63);
	_ADD_DEALLOC(_64);
	//assign %4 = %64  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _64);
	_TRANSFER_DEALLOC(arr, _64);
	//loop (%3, %4, %65, %66, %67)
	while(true){
		//ifge %3, %2 goto blklab9 : int
		if(index>=max){goto blklab9;}
		//sub %65 = %2, %3 : int
		_65=max-index;
		//update %4[%3] = %65 : int[] -> int[]
		arr[index] = _65;
		//const %66 = 1 : int
		_66 = 1;
		//add %67 = %3, %66 : int
		_67=index+_66;
		//assign %3 = %67  : int
		index = _67;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//invoke (%68) = (%4) bubblesort:bubbleSort : function(int[])->(int[])
	{
		_DEALLOC(_68);
		_68 = _bubbleSort_(_1DARRAY_PARAM(arr), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_68));
		_RESET_DEALLOC(arr, "true-true-false" , "bubbleSort");
		_ADD_DEALLOC(_68);
	}
	//assign %4 = %68  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _68);
	_TRANSFER_DEALLOC(arr, _68);
	//assert
	{
		//const %69 = 1 : int
		_69 = 1;
		//const %70 = 2 : int
		_70 = 2;
		//const %71 = 3 : int
		_71 = 3;
		//const %72 = 4 : int
		_72 = 4;
		//const %73 = 5 : int
		_73 = 5;
		//const %74 = 6 : int
		_74 = 6;
		//const %75 = 7 : int
		_75 = 7;
		//const %76 = 8 : int
		_76 = 8;
		//const %77 = 9 : int
		_77 = 9;
		//const %78 = 10 : int
		_78 = 10;
		//newlist %79 = (%69, %70, %71, %72, %73, %74, %75, %76, %77, %78) : int[]
		_DEALLOC(_79);
		_NEW_1DARRAY_int64_t(_79, 10, 0);
		_79[0] = _69; _79[1] = _70; _79[2] = _71; _79[3] = _72; _79[4] = _73; _79[5] = _74; _79[6] = _75; _79[7] = _76; _79[8] = _77; _79[9] = _78; 
		_ADD_DEALLOC(_79);
		//ifeq %4, %79 goto blklab11 : int[]
		_IFEQ_ARRAY_int64_t(arr, _79, blklab11);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//fieldload %80 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %81 = %80 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %81 (%4) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(arr);
	}
	//fieldload %82 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %83 = %82 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %84 = [80,97,115,115,32,66,117,98,98,108,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_84);
	_NEW_1DARRAY_int64_t(_84, 25, 0);
	_84[0] = 80; _84[1] = 97; _84[2] = 115; _84[3] = 115; _84[4] = 32; _84[5] = 66; _84[6] = 117; _84[7] = 98; _84[8] = 98; _84[9] = 108; _84[10] = 101; _84[11] = 83; _84[12] = 111; _84[13] = 114; _84[14] = 116; _84[15] = 32; _84[16] = 116; _84[17] = 101; _84[18] = 115; _84[19] = 116; _84[20] = 32; _84[21] = 99; _84[22] = 97; _84[23] = 115; _84[24] = 101; 
	_ADD_DEALLOC(_84);
	//indirectinvoke () = %83 (%84) : method(int[])->()
	{
		println_s(_84, _84_size);
	}
	//return
	_DEALLOC(ys);
	_DEALLOC(arr);
	_DEALLOC(_10);
	_DEALLOC(_11);
	_DEALLOC(_17);
	_DEALLOC(_24);
	_DEALLOC(_25);
	_DEALLOC(_30);
	_DEALLOC(_37);
	_DEALLOC(_38);
	_DEALLOC(_43);
	_DEALLOC(_51);
	_DEALLOC(_52);
	_DEALLOC(_58);
	_DEALLOC(_64);
	_DEALLOC(_68);
	_DEALLOC(_79);
	_DEALLOC(_84);
	exit(0);
}

