#include "CoinGame_array1.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAY_PARAM(moves_out), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
	int64_t s = 0;
	int64_t j = 0;
	int64_t i = 0;
	int64_t y = 0;
	int64_t x = 0;
	int64_t z = 0;
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
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
	int64_t _50 = 0;
	int64_t _51 = 0;
	int64_t _52 = 0;
	int64_t _53 = 0;
	int64_t _54 = 0;
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	s = _10;
	//loop (%0, %2, %4, %5, %6, %7, %8, %9, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54)
	while(true){
		//ifge %4, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %2 = %0  : int[]
		moves_out = moves;
		//_COPY_1DARRAY_int64_t(moves_out, moves);
		//assign %5 = %4  : int
		j = s;
		//const %11 = 0 : int
		_11 = 0;
		//assign %6 = %11  : int
		i = _11;
		//loop (%0, %5, %6, %7, %8, %9, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52)
		while(true){
			//ifge %5, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %12 = 0 : int
			_12 = 0;
			//assign %7 = %12  : int
			y = _12;
			//const %13 = 1 : int
			_13 = 1;
			//add %14 = %6, %13 : int
			_14=i+_13;
			//ifge %14, %1 goto blklab4 : int
			if(_14>=n){goto blklab4;}
			//const %15 = 1 : int
			_15 = 1;
			//sub %16 = %5, %15 : int
			_16=j-_15;
			//const %17 = 0 : int
			_17 = 0;
			//iflt %16, %17 goto blklab4 : int
			if(_16<_17){goto blklab4;}
			//const %18 = 1 : int
			_18 = 1;
			//add %19 = %6, %18 : int
			_19=i+_18;
			//mul %20 = %19, %1 : int
			_20=_19*n;
			//add %21 = %20, %5 : int
			_21=_20+j;
			//const %22 = 1 : int
			_22 = 1;
			//sub %23 = %21, %22 : int
			_23=_21-_22;
			//indexof %24 = %2, %23 : int[]
			_24=moves_out[_23];
			//assign %7 = %24  : int
			y = _24;
//.blklab4
blklab4:;
			//const %25 = 0 : int
			_25 = 0;
			//assign %8 = %25  : int
			x = _25;
			//const %26 = 2 : int
			_26 = 2;
			//add %27 = %6, %26 : int
			_27=i+_26;
			//ifge %27, %1 goto blklab5 : int
			if(_27>=n){goto blklab5;}
			//const %28 = 2 : int
			_28 = 2;
			//add %29 = %6, %28 : int
			_29=i+_28;
			//mul %30 = %29, %1 : int
			_30=_29*n;
			//add %31 = %30, %5 : int
			_31=_30+j;
			//indexof %32 = %2, %31 : int[]
			_32=moves_out[_31];
			//assign %8 = %32  : int
			x = _32;
//.blklab5
blklab5:;
			//const %33 = 0 : int
			_33 = 0;
			//assign %9 = %33  : int
			z = _33;
			//const %34 = 1 : int
			_34 = 1;
			//sub %35 = %5, %34 : int
			_35=j-_34;
			//const %36 = 0 : int
			_36 = 0;
			//ifle %35, %36 goto blklab6 : int
			if(_35<=_36){goto blklab6;}
			//mul %37 = %6, %1 : int
			_37=i*n;
			//add %38 = %37, %5 : int
			_38=_37+j;
			//const %39 = 2 : int
			_39 = 2;
			//sub %40 = %38, %39 : int
			_40=_38-_39;
			//indexof %41 = %2, %40 : int[]
			_41=moves_out[_40];
			//assign %9 = %41  : int
			z = _41;
//.blklab6
blklab6:;
			//invoke (%43) = (%8, %7) whiley/lang/Math:min : function(int,int)->(int)
			{
				_43 = min(x, y);
			}
			//add %44 = %6, %43 : int
			_44=i+_43;
			//invoke (%45) = (%7, %9) whiley/lang/Math:min : function(int,int)->(int)
			{
				_45 = min(y, z);
			}
			//add %46 = %5, %45 : int
			_46=j+_45;
			//invoke (%42) = (%44, %46) whiley/lang/Math:max : function(int,int)->(int)
			{
				_42 = max(_44, _46);
			}
			//mul %47 = %6, %1 : int
			_47=i*n;
			//add %48 = %47, %5 : int
			_48=_47+j;
			//update %0[%48] = %42 : int[] -> int[]
			moves[_48] = _42;
			//const %49 = 1 : int
			_49 = 1;
			//add %50 = %5, %49 : int
			_50=j+_49;
			//assign %5 = %50  : int
			j = _50;
			//const %51 = 1 : int
			_51 = 1;
			//add %52 = %6, %51 : int
			_52=i+_51;
			//assign %6 = %52  : int
			i = _52;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %53 = 1 : int
		_53 = 1;
		//add %54 = %4, %53 : int
		_54=s+_53;
		//assign %4 = %54  : int
		s = _54;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(moves);
	return moves;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	int64_t n = 0;
	_DECL_1DARRAY(moves_out);
	_DECL_1DARRAY(moves);
	int64_t sum_alice = 0;
	int64_t* _6;
	_DECL_2DARRAY(_7);
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	int64_t _10 = 0;
	int64_t _11 = 0;
	_DECL_1DARRAY(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_1DARRAY(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	void* _23;
	void* _25;
	_DECL_1DARRAY(_27);
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	_9_size = _7_size_size;
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_6, _9);
	}
	//assign %1 = %6  : null|int
	max = _6;
	//ifis %1, null goto blklab7 : null|int
	if(max == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	n = *max;
	//const %10 = 0 : int
	_10 = 0;
	//mul %11 = %2, %2 : int
	_11=n*n;
	//arraygen %12 = [10; 11] : int[]
	_NEW_1DARRAY_int64_t(_12, _11, _10);
	//assign %3 = %12  : int[]
	_UPDATE_1DARRAY(moves_out, _12);
	//const %13 = 0 : int
	_13 = 0;
	//mul %14 = %2, %2 : int
	_14=n*n;
	//arraygen %15 = [13; 14] : int[]
	_NEW_1DARRAY_int64_t(_15, _14, _13);
	//assign %4 = %15  : int[]
	_UPDATE_1DARRAY(moves, _15);
	//invoke (%16) = (%4, %2, %3) CoinGame_array1:findMoves : function(int[],int,int[])->(int[])
	{
		_16 = _findMoves_(_1DARRAY_PARAM(moves), n, _1DARRAY_PARAM(moves_out), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
	}
	//assign %4 = %16  : int[]
	_UPDATE_1DARRAY(moves, _16);
	//const %17 = 1 : int
	_17 = 1;
	//sub %18 = %2, %17 : int
	_18=n-_17;
	//indexof %19 = %4, %18 : int[]
	_19=moves[_18];
	//assign %5 = %19  : int
	sum_alice = _19;
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_1DARRAY_int64_t(_22, 50, 0);
	_22[0] = 84; _22[1] = 104; _22[2] = 101; _22[3] = 32; _22[4] = 116; _22[5] = 111; _22[6] = 116; _22[7] = 97; _22[8] = 108; _22[9] = 32; _22[10] = 97; _22[11] = 109; _22[12] = 111; _22[13] = 117; _22[14] = 110; _22[15] = 116; _22[16] = 32; _22[17] = 111; _22[18] = 102; _22[19] = 32; _22[20] = 109; _22[21] = 111; _22[22] = 110; _22[23] = 101; _22[24] = 121; _22[25] = 32; _22[26] = 40; _22[27] = 109; _22[28] = 97; _22[29] = 120; _22[30] = 105; _22[31] = 109; _22[32] = 117; _22[33] = 109; _22[34] = 41; _22[35] = 32; _22[36] = 65; _22[37] = 108; _22[38] = 105; _22[39] = 99; _22[40] = 101; _22[41] = 32; _22[42] = 103; _22[43] = 101; _22[44] = 116; _22[45] = 115; _22[46] = 32; _22[47] = 105; _22[48] = 115; _22[49] = 32;
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_22));
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %24 (%5) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_27, 23, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 67; _27[6] = 111; _27[7] = 105; _27[8] = 110; _27[9] = 71; _27[10] = 97; _27[11] = 109; _27[12] = 101; _27[13] = 32; _27[14] = 116; _27[15] = 101; _27[16] = 115; _27[17] = 116; _27[18] = 32; _27[19] = 99; _27[20] = 97; _27[21] = 115; _27[22] = 101;
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
//.blklab7
blklab7:;
	//return
	exit(0);
}
