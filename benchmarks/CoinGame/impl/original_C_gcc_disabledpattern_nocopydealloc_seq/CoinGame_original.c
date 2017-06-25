#include "CoinGame_original.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), _DECL_DEALLOC_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t s = 0;
	int64_t i = 0;
	int64_t j = 0;
	int64_t y = 0;
	int64_t x = 0;
	int64_t z = 0;
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
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
	while(true){
		//ifge %3, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//const %10 = 0 : int
		_10 = 0;
		//assign %4 = %10  : int
		// isCopyEliminated = true
		i = _10;
		//loop (%0, %4, %5, %6, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
		while(true){
			//sub %11 = %1, %3 : int
			_11=n-s;
			//ifge %4, %11 goto blklab2 : int
			if(i>=_11){goto blklab2;}
			//add %12 = %4, %3 : int
			_12=i+s;
			//assign %5 = %12  : int
			// isCopyEliminated = true
			j = _12;
			//const %13 = 1 : int
			_13 = 1;
			//add %14 = %4, %13 : int
			_14=i+_13;
			//mul %15 = %14, %1 : int
			_15=_14*n;
			//add %16 = %15, %5 : int
			_16=_15+j;
			//const %17 = 1 : int
			_17 = 1;
			//sub %18 = %16, %17 : int
			_18=_16-_17;
			//indexof %19 = %0, %18 : int[]
			_19=moves[_18];
			//assign %6 = %19  : int
			// isCopyEliminated = true
			y = _19;
			//const %20 = 2 : int
			_20 = 2;
			//add %21 = %4, %20 : int
			_21=i+_20;
			//mul %22 = %21, %1 : int
			_22=_21*n;
			//add %23 = %22, %5 : int
			_23=_22+j;
			//indexof %24 = %0, %23 : int[]
			_24=moves[_23];
			//assign %7 = %24  : int
			// isCopyEliminated = true
			x = _24;
			//mul %25 = %4, %1 : int
			_25=i*n;
			//add %26 = %25, %5 : int
			_26=_25+j;
			//const %27 = 2 : int
			_27 = 2;
			//sub %28 = %26, %27 : int
			_28=_26-_27;
			//indexof %29 = %0, %28 : int[]
			_29=moves[_28];
			//assign %8 = %29  : int
			// isCopyEliminated = true
			z = _29;
			//invoke (%31) = (%7, %6) whiley/lang/Math:min : function(int,int)->(int)
			{
				_31 = min(x, y);
			}
			//add %32 = %4, %31 : int
			_32=i+_31;
			//invoke (%33) = (%6, %8) whiley/lang/Math:min : function(int,int)->(int)
			{
				_33 = min(y, z);
			}
			//add %34 = %5, %33 : int
			_34=j+_33;
			//invoke (%30) = (%32, %34) whiley/lang/Math:max : function(int,int)->(int)
			{
				_30 = max(_32, _34);
			}
			//mul %35 = %4, %1 : int
			_35=i*n;
			//add %36 = %35, %5 : int
			_36=_35+j;
			//update %0[%36] = %30 : int[] -> int[]
			// isCopyEliminated = true
			moves[_36] = _30;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %4, %37 : int
			_38=i+_37;
			//assign %4 = %38  : int
			// isCopyEliminated = true
			i = _38;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %39 = 1 : int
		_39 = 1;
		//add %40 = %3, %39 : int
		_40=s+_39;
		//assign %3 = %40  : int
		// isCopyEliminated = true
		s = _40;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(moves);
	return moves;
	//return
}

int main(int argc, char** args){
	int64_t* max;
	_DECL_DEALLOC(max);
	int64_t n = 0;
	_DECL_1DARRAY(moves);
	_DECL_DEALLOC(moves);
	int64_t sum_alice = 0;
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
		_ADD_DEALLOC(_5);
		_REMOVE_DEALLOC(_8);
	}
	//assign %1 = %5  : null|int
	_DEALLOC(max);
	// isCopyEliminated = true
	max = _5;
	_TRANSFER_DEALLOC(max, _5);
	//ifis %1, null goto blklab4 : null|int
	if(max == NULL) { goto blklab4;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	n = *max;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 2 : int
	_10 = 2;
	//add %11 = %2, %10 : int
	_11=n+_10;
	//const %12 = 2 : int
	_12 = 2;
	//add %13 = %2, %12 : int
	_13=n+_12;
	//mul %14 = %11, %13 : int
	_14=_11*_13;
	//arraygen %15 = [9; 14] : int[]
	_DEALLOC(_15);
	_NEW_1DARRAY_int64_t(_15, _14, _9);
	_ADD_DEALLOC(_15);
	//assign %3 = %15  : int[]
	_DEALLOC(moves);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _15);
	_TRANSFER_DEALLOC(moves, _15);
	//invoke (%16) = (%3, %2) CoinGame_original:findMoves : function(int[],int)->(int[])
	{
		_DEALLOC(_16);
		// isCopyEliminated of '_3' = true
		_16 = _findMoves_(_1DARRAY_PARAM(moves), false, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_RESET_DEALLOC(moves, "true-true-false" , "findMoves");
		_ADD_DEALLOC(_16);
	}
	//assign %3 = %16  : int[]
	_DEALLOC(moves);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _16);
	_TRANSFER_DEALLOC(moves, _16);
	//const %17 = 1 : int
	_17 = 1;
	//sub %18 = %2, %17 : int
	_18=n-_17;
	//indexof %19 = %3, %18 : int[]
	_19=moves[_18];
	//assign %4 = %19  : int
	// isCopyEliminated = true
	sum_alice = _19;
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 50, 0);
	_22[0] = 84; _22[1] = 104; _22[2] = 101; _22[3] = 32; _22[4] = 116; _22[5] = 111; _22[6] = 116; _22[7] = 97; _22[8] = 108; _22[9] = 32; _22[10] = 97; _22[11] = 109; _22[12] = 111; _22[13] = 117; _22[14] = 110; _22[15] = 116; _22[16] = 32; _22[17] = 111; _22[18] = 102; _22[19] = 32; _22[20] = 109; _22[21] = 111; _22[22] = 110; _22[23] = 101; _22[24] = 121; _22[25] = 32; _22[26] = 40; _22[27] = 109; _22[28] = 97; _22[29] = 120; _22[30] = 105; _22[31] = 109; _22[32] = 117; _22[33] = 109; _22[34] = 41; _22[35] = 32; _22[36] = 65; _22[37] = 108; _22[38] = 105; _22[39] = 99; _22[40] = 101; _22[41] = 32; _22[42] = 103; _22[43] = 101; _22[44] = 116; _22[45] = 115; _22[46] = 32; _22[47] = 105; _22[48] = 115; _22[49] = 32; 
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_22));
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %24 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 23, 0);
	_27[0] = 80; _27[1] = 97; _27[2] = 115; _27[3] = 115; _27[4] = 32; _27[5] = 67; _27[6] = 111; _27[7] = 105; _27[8] = 110; _27[9] = 71; _27[10] = 97; _27[11] = 109; _27[12] = 101; _27[13] = 32; _27[14] = 116; _27[15] = 101; _27[16] = 115; _27[17] = 116; _27[18] = 32; _27[19] = 99; _27[20] = 97; _27[21] = 115; _27[22] = 101; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
//.blklab4
blklab4:;
	//return
	_DEALLOC(max);
	_DEALLOC(moves);
	_DEALLOC(_5);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_15);
	_DEALLOC(_16);
	_DEALLOC(_22);
	_DEALLOC(_27);
	exit(0);
}

