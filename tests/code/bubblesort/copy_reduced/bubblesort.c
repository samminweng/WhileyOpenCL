#include "bubblesort.h"
long long* bubbleSort(_DECL_1DARRAY_PARAM(items)){
	_DECL_1DARRAY(_1);
	long long length = 0;
	long long last_swapped = 0;
	long long index = 0;
	long long tmp = 0;
	long long _6 = 0;
	long long _7 = 0;
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
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
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
	return items;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(ys);
	long long max = 0;
	long long index = 0;
	_DECL_1DARRAY(arr);
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_1DARRAY(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	void* _18;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	_DECL_1DARRAY(_24);
	_DECL_1DARRAY(_25);
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	_DECL_1DARRAY(_30);
	void* _31;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	_DECL_1DARRAY(_37);
	_DECL_1DARRAY(_38);
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	_DECL_1DARRAY(_43);
	void* _44;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	_DECL_1DARRAY(_51);
	_DECL_1DARRAY(_52);
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	_DECL_1DARRAY(_58);
	void* _59;
	long long _61 = 0;
	long long _62 = 0;
	long long _63 = 0;
	_DECL_1DARRAY(_64);
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	_DECL_1DARRAY(_68);
	long long _69 = 0;
	long long _70 = 0;
	long long _71 = 0;
	long long _72 = 0;
	long long _73 = 0;
	long long _74 = 0;
	long long _75 = 0;
	long long _76 = 0;
	long long _77 = 0;
	long long _78 = 0;
	_DECL_1DARRAY(_79);
	void* _80;
	void* _82;
	_DECL_1DARRAY(_84);
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
	_NEW_1DARRAY(_10, 5, 0);
	_10[0] = _5; _10[1] = _6; _10[2] = _7; _10[3] = _8; _10[4] = _9; 
	//assign %1 = %10  : int[]
	_UPDATE_1DARRAY(ys, _10);
	//invoke (%11) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_11, ys);
	_11 = bubbleSort(_1DARRAY_PARAM(ys));
	//assign %1 = %11  : int[]
	_UPDATE_1DARRAY(ys, _11);
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
		_NEW_1DARRAY(_17, 5, 0);
		_17[0] = _12; _17[1] = _13; _17[2] = _14; _17[3] = _15; _17[4] = _16; 
		//ifeq %1, %17 goto blklab5 : int[]
		_IFEQ_ARRAY(ys, _17, blklab5);
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
	_PRINT_1DARRAY(ys);
	//const %20 = 3 : int
	_20 = 3;
	//const %21 = 4 : int
	_21 = 4;
	//const %22 = 7 : int
	_22 = 7;
	//const %23 = 2 : int
	_23 = 2;
	//newlist %24 = (%20, %21, %22, %23) : int[]
	_NEW_1DARRAY(_24, 4, 0);
	_24[0] = _20; _24[1] = _21; _24[2] = _22; _24[3] = _23; 
	//assign %1 = %24  : int[]
	_UPDATE_1DARRAY(ys, _24);
	//invoke (%25) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_25, ys);
	_25 = bubbleSort(_1DARRAY_PARAM(ys));
	//assign %1 = %25  : int[]
	_UPDATE_1DARRAY(ys, _25);
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
		_NEW_1DARRAY(_30, 4, 0);
		_30[0] = _26; _30[1] = _27; _30[2] = _28; _30[3] = _29; 
		//ifeq %1, %30 goto blklab6 : int[]
		_IFEQ_ARRAY(ys, _30, blklab6);
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
	_PRINT_1DARRAY(ys);
	//const %33 = 1 : int
	_33 = 1;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 3 : int
	_35 = 3;
	//const %36 = 4 : int
	_36 = 4;
	//newlist %37 = (%33, %34, %35, %36) : int[]
	_NEW_1DARRAY(_37, 4, 0);
	_37[0] = _33; _37[1] = _34; _37[2] = _35; _37[3] = _36; 
	//assign %1 = %37  : int[]
	_UPDATE_1DARRAY(ys, _37);
	//invoke (%38) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_38, ys);
	_38 = bubbleSort(_1DARRAY_PARAM(ys));
	//assign %1 = %38  : int[]
	_UPDATE_1DARRAY(ys, _38);
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
		_NEW_1DARRAY(_43, 4, 0);
		_43[0] = _39; _43[1] = _40; _43[2] = _41; _43[3] = _42; 
		//ifeq %1, %43 goto blklab7 : int[]
		_IFEQ_ARRAY(ys, _43, blklab7);
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
	_PRINT_1DARRAY(ys);
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
	_NEW_1DARRAY(_51, 5, 0);
	_51[0] = _46; _51[1] = _47; _51[2] = _48; _51[3] = _49; _51[4] = _50; 
	//assign %1 = %51  : int[]
	_UPDATE_1DARRAY(ys, _51);
	//invoke (%52) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_52, ys);
	_52 = bubbleSort(_1DARRAY_PARAM(ys));
	//assign %1 = %52  : int[]
	_UPDATE_1DARRAY(ys, _52);
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
		_NEW_1DARRAY(_58, 5, 0);
		_58[0] = _53; _58[1] = _54; _58[2] = _55; _58[3] = _56; _58[4] = _57; 
		//ifeq %1, %58 goto blklab8 : int[]
		_IFEQ_ARRAY(ys, _58, blklab8);
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
	_PRINT_1DARRAY(ys);
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
	_NEW_1DARRAY(_64, max, _63);
	//assign %4 = %64  : int[]
	_UPDATE_1DARRAY(arr, _64);
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
	_UPDATE_1DARRAY_SIZE(_68, arr);
	_68 = bubbleSort(_1DARRAY_PARAM(arr));
	//assign %4 = %68  : int[]
	_UPDATE_1DARRAY(arr, _68);
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
		_NEW_1DARRAY(_79, 10, 0);
		_79[0] = _69; _79[1] = _70; _79[2] = _71; _79[3] = _72; _79[4] = _73; _79[5] = _74; _79[6] = _75; _79[7] = _76; _79[8] = _77; _79[9] = _78; 
		//ifeq %4, %79 goto blklab11 : int[]
		_IFEQ_ARRAY(arr, _79, blklab11);
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
	_PRINT_1DARRAY(arr);
	//fieldload %82 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %83 = %82 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %84 = [80,97,115,115,32,66,117,98,98,108,101,83,111,114,116,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY(_84, 25, 0);
	_84[0] = 80; _84[1] = 97; _84[2] = 115; _84[3] = 115; _84[4] = 32; _84[5] = 66; _84[6] = 117; _84[7] = 98; _84[8] = 98; _84[9] = 108; _84[10] = 101; _84[11] = 83; _84[12] = 111; _84[13] = 114; _84[14] = 116; _84[15] = 32; _84[16] = 116; _84[17] = 101; _84[18] = 115; _84[19] = 116; _84[20] = 32; _84[21] = 99; _84[22] = 97; _84[23] = 115; _84[24] = 101; 
	//indirectinvoke () = %83 (%84) : method(int[])->()
	println_s(_84, _84_size);
	//return
	exit(0);
}
