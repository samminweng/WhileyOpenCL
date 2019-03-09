#include "newTicTacToe_intarray.h"
int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max;
	int64_t repeat;
	_DECL_1DARRAY(b1);
	_DECL_DEALLOC(b1);
	_DECL_1DARRAY(b2);
	_DECL_DEALLOC(b2);
	int64_t i;
	int64_t p;
	int64_t* _8;
	_DECL_DEALLOC(_8);
	_DECL_2DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	int64_t _17;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	int64_t _21;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	_DECL_1DARRAY(_37);
	_DECL_DEALLOC(_37);
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	void* _42;
	_DECL_1DARRAY(_44);
	_DECL_DEALLOC(_44);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY(_9);
	_CONV_ARGS(_9);
	_9_dealloc = true;
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	_11_dealloc = false;
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
		_11_dealloc = false;
	}
	//assign %1 = %8  : null|int
	// isCopyEliminated = true
	_DEALLOC(n);
	n = _8;
	_TRANSFER_DEALLOC_POST(n, _8);
	//ifis %1, null goto blklab1 : null|int
	if(n == NULL) { goto blklab1;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	max = *n;
	//const %12 = 0 : int
	_12 = 0;
	//assign %3 = %12  : int
	// isCopyEliminated = true
	repeat = _12;
	//loop (%3, %4, %5, %6, %7, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
	while(true){
		//ifge %3, %2 goto blklab2 : int
		if(repeat>=max){goto blklab2;}
		//const %13 = 0 : int
		_13 = 0;
		//const %14 = 9 : int
		_14 = 9;
		//arraygen %15 = [13; 14] : int[]
		_NEW1DARRAY_DEALLOC(_15, _13, _14, int64_t);
		//assign %4 = %15  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b1, _15);
		//const %16 = 0 : int
		_16 = 0;
		//const %17 = 9 : int
		_17 = 9;
		//arraygen %18 = [16; 17] : int[]
		_NEW1DARRAY_DEALLOC(_18, _16, _17, int64_t);
		//assign %5 = %18  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b2, _18);
		//const %19 = 0 : int
		_19 = 0;
		//assign %6 = %19  : int
		// isCopyEliminated = true
		i = _19;
		//loop (%4, %5, %6, %7, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
		while(true){
			//const %20 = [0,1,2,3,4,5,6,7,8] : int[]
			_DEALLOC(_20);
			_NEW_1DARRAY_int64_t(_20, 9, 0);
			_20[0] = 0; _20[1] = 1; _20[2] = 2; _20[3] = 3; _20[4] = 4; _20[5] = 5; _20[6] = 6; _20[7] = 7; _20[8] = 8; 
			_20_dealloc = true;
			//lengthof %21 = %20 : int[]
			_21 = _20_size;
			//ifge %6, %21 goto blklab4 : int
			if(i>=_21){goto blklab4;}
			//const %22 = [0,1,2,3,4,5,6,7,8] : int[]
			_DEALLOC(_22);
			_NEW_1DARRAY_int64_t(_22, 9, 0);
			_22[0] = 0; _22[1] = 1; _22[2] = 2; _22[3] = 3; _22[4] = 4; _22[5] = 5; _22[6] = 6; _22[7] = 7; _22[8] = 8; 
			_22_dealloc = true;
			//indexof %23 = %22, %6 : int[]
			_23=_22[i];
			//assign %7 = %23  : int
			// isCopyEliminated = true
			p = _23;
			//const %24 = 0 : int
			_24 = 0;
			//iflt %7, %24 goto blklab8 : int
			if(p<_24){goto blklab8;}
			//const %25 = 9 : int
			_25 = 9;
			//ifle %7, %25 goto blklab6 : int
			if(p<=_25){goto blklab6;}
//.blklab8
blklab8:;
			//goto blklab4
			goto blklab4;
			//goto blklab7
			goto blklab7;
//.blklab6
blklab6:;
			//lengthof %26 = %4 : int[]
			_26 = b1_size;
			//const %27 = 0 : int
			_27 = 0;
			//ifeq %26, %27 goto blklab9 : int
			if(_26==_27){goto blklab9;}
			//const %28 = 1 : int
			_28 = 1;
			//update %4[%7] = %28 : int[] -> int[]
			b1[p] = _28;
			//assign %5 = %4  : int[]
			// isCopyEliminated = true
			_TRANSFER_DEALLOC(b2, b1);
			//const %29 = 0 : int
			_29 = 0;
			//const %30 = 0 : int
			_30 = 0;
			//arraygen %31 = [29; 30] : int[]
			_NEW1DARRAY_DEALLOC(_31, _29, _30, int64_t);
			//assign %4 = %31  : int[]
			// isCopyEliminated = true
			_TRANSFER_DEALLOC(b1, _31);
			//goto blklab10
			goto blklab10;
//.blklab9
blklab9:;
			//lengthof %32 = %5 : int[]
			_32 = b2_size;
			//const %33 = 0 : int
			_33 = 0;
			//ifeq %32, %33 goto blklab11 : int
			if(_32==_33){goto blklab11;}
			//const %34 = 2 : int
			_34 = 2;
			//update %5[%7] = %34 : int[] -> int[]
			b2[p] = _34;
			//assign %4 = %5  : int[]
			// isCopyEliminated = true
			_TRANSFER_DEALLOC(b1, b2);
			//const %35 = 0 : int
			_35 = 0;
			//const %36 = 0 : int
			_36 = 0;
			//arraygen %37 = [35; 36] : int[]
			_NEW1DARRAY_DEALLOC(_37, _35, _36, int64_t);
			//assign %5 = %37  : int[]
			// isCopyEliminated = true
			_TRANSFER_DEALLOC(b2, _37);
//.blklab11
blklab11:;
//.blklab10
blklab10:;
//.blklab7
blklab7:;
			//const %38 = 1 : int
			_38 = 1;
			//add %39 = %6, %38 : int
			_39=i+_38;
			//assign %6 = %39  : int
			// isCopyEliminated = true
			i = _39;
//.blklab5
blklab5:;
		}
//.blklab4
blklab4:;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %3, %40 : int
		_41=repeat+_40;
		//assign %3 = %41  : int
		// isCopyEliminated = true
		repeat = _41;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %43 = %42 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %44 = [80,97,115,115,32,110,101,119,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_44);
	_NEW_1DARRAY_int64_t(_44, 27, 0);
	_44[0] = 80; _44[1] = 97; _44[2] = 115; _44[3] = 115; _44[4] = 32; _44[5] = 110; _44[6] = 101; _44[7] = 119; _44[8] = 84; _44[9] = 105; _44[10] = 99; _44[11] = 84; _44[12] = 97; _44[13] = 99; _44[14] = 84; _44[15] = 111; _44[16] = 101; _44[17] = 32; _44[18] = 116; _44[19] = 101; _44[20] = 115; _44[21] = 116; _44[22] = 32; _44[23] = 99; _44[24] = 97; _44[25] = 115; _44[26] = 101; 
	_44_dealloc = true;
	//indirectinvoke () = %43 (%44) : method(int[])->()
	{
		println_s(_44, _44_size);
	}
//.blklab1
blklab1:;
	//return
	_DEALLOC(n);
	_DEALLOC(b1);
	_DEALLOC(b2);
	_DEALLOC(_8);
	_FREE_ARGS(_9);
	_DEALLOC(_11);
	_DEALLOC(_15);
	_DEALLOC(_18);
	_DEALLOC(_20);
	_DEALLOC(_22);
	_DEALLOC(_31);
	_DEALLOC(_37);
	_DEALLOC(_44);
	exit(0);
}

