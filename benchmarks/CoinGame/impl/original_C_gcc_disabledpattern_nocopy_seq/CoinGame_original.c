#include "CoinGame_original.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAY_PARAM(coins), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
	int64_t s;
	int64_t i;
	int64_t j;
	int64_t y;
	int64_t x;
	int64_t z;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	// isCopyEliminated = true
	s = _10;
	//loop (%0, %4, %5, %6, %7, %8, %9, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43)
	while(true){
		//ifge %4, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %5 = %11  : int
		// isCopyEliminated = true
		i = _11;
		//loop (%0, %5, %6, %7, %8, %9, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
		while(true){
			//sub %12 = %1, %4 : int
			_12=n-s;
			//ifge %5, %12 goto blklab2 : int
			if(i>=_12){goto blklab2;}
			//add %13 = %5, %4 : int
			_13=i+s;
			//assign %6 = %13  : int
			// isCopyEliminated = true
			j = _13;
			//const %14 = 1 : int
			_14 = 1;
			//add %15 = %5, %14 : int
			_15=i+_14;
			//mul %16 = %15, %1 : int
			_16=_15*n;
			//add %17 = %16, %6 : int
			_17=_16+j;
			//const %18 = 1 : int
			_18 = 1;
			//sub %19 = %17, %18 : int
			_19=_17-_18;
			//indexof %20 = %0, %19 : int[]
			_20=moves[_19];
			//assign %7 = %20  : int
			// isCopyEliminated = true
			y = _20;
			//const %21 = 2 : int
			_21 = 2;
			//add %22 = %5, %21 : int
			_22=i+_21;
			//mul %23 = %22, %1 : int
			_23=_22*n;
			//add %24 = %23, %6 : int
			_24=_23+j;
			//indexof %25 = %0, %24 : int[]
			_25=moves[_24];
			//assign %8 = %25  : int
			// isCopyEliminated = true
			x = _25;
			//mul %26 = %5, %1 : int
			_26=i*n;
			//add %27 = %26, %6 : int
			_27=_26+j;
			//const %28 = 2 : int
			_28 = 2;
			//sub %29 = %27, %28 : int
			_29=_27-_28;
			//indexof %30 = %0, %29 : int[]
			_30=moves[_29];
			//assign %9 = %30  : int
			// isCopyEliminated = true
			z = _30;
			//indexof %32 = %2, %5 : int[]
			_32=coins[i];
			//invoke (%33) = (%8, %7) whiley/lang/Math:min : function(int,int)->(int)
			{
				_33 = min(x, y);
			}
			//add %34 = %32, %33 : int
			_34=_32+_33;
			//indexof %35 = %2, %6 : int[]
			_35=coins[j];
			//invoke (%36) = (%7, %9) whiley/lang/Math:min : function(int,int)->(int)
			{
				_36 = min(y, z);
			}
			//add %37 = %35, %36 : int
			_37=_35+_36;
			//invoke (%31) = (%34, %37) whiley/lang/Math:max : function(int,int)->(int)
			{
				_31 = max(_34, _37);
			}
			//mul %38 = %5, %1 : int
			_38=i*n;
			//add %39 = %38, %6 : int
			_39=_38+j;
			//update %0[%39] = %31 : int[] -> int[]
			moves[_39] = _31;
			//const %40 = 1 : int
			_40 = 1;
			//add %41 = %5, %40 : int
			_41=i+_40;
			//assign %5 = %41  : int
			// isCopyEliminated = true
			i = _41;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %42 = 1 : int
		_42 = 1;
		//add %43 = %4, %42 : int
		_43=s+_42;
		//assign %4 = %43  : int
		// isCopyEliminated = true
		s = _43;
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
	int64_t n;
	_DECL_1DARRAY(coins);
	int64_t i;
	_DECL_1DARRAY(moves);
	int64_t sum_alice;
	int64_t* _7;
	_DECL_2DARRAY(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	_DECL_1DARRAY(_12);
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	_DECL_1DARRAY(_24);
	_DECL_1DARRAY(_25);
	int64_t _26;
	int64_t _27;
	int64_t _28;
	void* _29;
	_DECL_1DARRAY(_31);
	void* _32;
	void* _34;
	_DECL_1DARRAY(_36);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
	}
	//assign %1 = %7  : null|int
	// isCopyEliminated = true
	max = _7;
	//ifis %1, null goto blklab4 : null|int
	if(max == NULL) { goto blklab4;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	n = *max;
	//const %11 = 0 : int
	_11 = 0;
	//arraygen %12 = [11; 2] : int[]
	_NEW_1DARRAY_int64_t(_12, n, _11);
	//assign %3 = %12  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(coins, _12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %4 = %13  : int
	// isCopyEliminated = true
	i = _13;
	//loop (%3, %4, %14, %15, %16, %17)
	while(true){
		//ifge %4, %2 goto blklab5 : int
		if(i>=n){goto blklab5;}
		//const %14 = 5 : int
		_14 = 5;
		//rem %15 = %4, %14 : int
		_15=i%_14;
		//update %3[%4] = %15 : int[] -> int[]
		coins[i] = _15;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %4, %16 : int
		_17=i+_16;
		//assign %4 = %17  : int
		// isCopyEliminated = true
		i = _17;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//const %18 = 0 : int
	_18 = 0;
	//const %19 = 2 : int
	_19 = 2;
	//add %20 = %2, %19 : int
	_20=n+_19;
	//const %21 = 2 : int
	_21 = 2;
	//add %22 = %2, %21 : int
	_22=n+_21;
	//mul %23 = %20, %22 : int
	_23=_20*_22;
	//arraygen %24 = [18; 23] : int[]
	_NEW_1DARRAY_int64_t(_24, _23, _18);
	//assign %5 = %24  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _24);
	//invoke (%25) = (%5, %2, %3) CoinGame_original:findMoves : function(int[],int,int[])->(int[])
	{
		// isCopyEliminated of '_5' = true
		// isCopyEliminated of '_3' = true
		_25 = _findMoves_(_1DARRAY_PARAM(moves), n, _1DARRAY_PARAM(coins), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_25));
	}
	//assign %5 = %25  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _25);
	//const %26 = 1 : int
	_26 = 1;
	//sub %27 = %2, %26 : int
	_27=n-_26;
	//indexof %28 = %5, %27 : int[]
	_28=moves[_27];
	//assign %6 = %28  : int
	// isCopyEliminated = true
	sum_alice = _28;
	//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %31 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_1DARRAY_int64_t(_31, 50, 0);
	_31[0] = 84; _31[1] = 104; _31[2] = 101; _31[3] = 32; _31[4] = 116; _31[5] = 111; _31[6] = 116; _31[7] = 97; _31[8] = 108; _31[9] = 32; _31[10] = 97; _31[11] = 109; _31[12] = 111; _31[13] = 117; _31[14] = 110; _31[15] = 116; _31[16] = 32; _31[17] = 111; _31[18] = 102; _31[19] = 32; _31[20] = 109; _31[21] = 111; _31[22] = 110; _31[23] = 101; _31[24] = 121; _31[25] = 32; _31[26] = 40; _31[27] = 109; _31[28] = 97; _31[29] = 120; _31[30] = 105; _31[31] = 109; _31[32] = 117; _31[33] = 109; _31[34] = 41; _31[35] = 32; _31[36] = 65; _31[37] = 108; _31[38] = 105; _31[39] = 99; _31[40] = 101; _31[41] = 32; _31[42] = 103; _31[43] = 101; _31[44] = 116; _31[45] = 115; _31[46] = 32; _31[47] = 105; _31[48] = 115; _31[49] = 32; 
	//indirectinvoke () = %30 (%31) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_31));
	}
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %33 (%6) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_36, 23, 0);
	_36[0] = 80; _36[1] = 97; _36[2] = 115; _36[3] = 115; _36[4] = 32; _36[5] = 67; _36[6] = 111; _36[7] = 105; _36[8] = 110; _36[9] = 71; _36[10] = 97; _36[11] = 109; _36[12] = 101; _36[13] = 32; _36[14] = 116; _36[15] = 101; _36[16] = 115; _36[17] = 116; _36[18] = 32; _36[19] = 99; _36[20] = 97; _36[21] = 115; _36[22] = 101; 
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		println_s(_36, _36_size);
	}
//.blklab4
blklab4:;
	//return
	exit(0);
}

