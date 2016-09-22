#include "CoinGame_single.h"
int64_t* findMoves(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t s = 0;
	int64_t j = 0;
	int64_t i = 0;
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
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53)
	while(true){
		//ifge %3, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %4 = %3  : int
		j = s;
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		i = _10;
		//loop (%0, %4, %5, %6, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51)
		while(true){
			//ifge %4, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %11 = 0 : int
			_11 = 0;
			//assign %6 = %11  : int
			y = _11;
			//const %12 = 1 : int
			_12 = 1;
			//add %13 = %5, %12 : int
			_13=i+_12;
			//ifge %13, %1 goto blklab4 : int
			if(_13>=n){goto blklab4;}
			//const %14 = 1 : int
			_14 = 1;
			//sub %15 = %4, %14 : int
			_15=j-_14;
			//const %16 = 0 : int
			_16 = 0;
			//iflt %15, %16 goto blklab4 : int
			if(_15<_16){goto blklab4;}
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %5, %17 : int
			_18=i+_17;
			//mul %19 = %18, %1 : int
			_19=_18*n;
			//add %20 = %19, %4 : int
			_20=_19+j;
			//const %21 = 1 : int
			_21 = 1;
			//sub %22 = %20, %21 : int
			_22=_20-_21;
			//indexof %23 = %0, %22 : int[]
			_23=moves[_22];
			//assign %6 = %23  : int
			y = _23;
//.blklab4
blklab4:;
			//const %24 = 0 : int
			_24 = 0;
			//assign %7 = %24  : int
			x = _24;
			//const %25 = 2 : int
			_25 = 2;
			//add %26 = %5, %25 : int
			_26=i+_25;
			//ifge %26, %1 goto blklab5 : int
			if(_26>=n){goto blklab5;}
			//const %27 = 2 : int
			_27 = 2;
			//add %28 = %5, %27 : int
			_28=i+_27;
			//mul %29 = %28, %1 : int
			_29=_28*n;
			//add %30 = %29, %4 : int
			_30=_29+j;
			//indexof %31 = %0, %30 : int[]
			_31=moves[_30];
			//assign %7 = %31  : int
			x = _31;
//.blklab5
blklab5:;
			//const %32 = 0 : int
			_32 = 0;
			//assign %8 = %32  : int
			z = _32;
			//const %33 = 1 : int
			_33 = 1;
			//sub %34 = %4, %33 : int
			_34=j-_33;
			//const %35 = 0 : int
			_35 = 0;
			//ifle %34, %35 goto blklab6 : int
			if(_34<=_35){goto blklab6;}
			//mul %36 = %5, %1 : int
			_36=i*n;
			//add %37 = %36, %4 : int
			_37=_36+j;
			//const %38 = 2 : int
			_38 = 2;
			//sub %39 = %37, %38 : int
			_39=_37-_38;
			//indexof %40 = %0, %39 : int[]
			_40=moves[_39];
			//assign %8 = %40  : int
			z = _40;
//.blklab6
blklab6:;
			//invoke (%42) = (%7, %6) whiley/lang/Math:min : function(int,int)->(int)
			{
				_42 = min(x, y);
			}
			//add %43 = %5, %42 : int
			_43=i+_42;
			//invoke (%44) = (%6, %8) whiley/lang/Math:min : function(int,int)->(int)
			{
				_44 = min(y, z);
			}
			//add %45 = %4, %44 : int
			_45=j+_44;
			//invoke (%41) = (%43, %45) whiley/lang/Math:max : function(int,int)->(int)
			{
				_41 = max(_43, _45);
			}
			//mul %46 = %5, %1 : int
			_46=i*n;
			//add %47 = %46, %4 : int
			_47=_46+j;
			//update %0[%47] = %41 : int[] -> int[]
			moves[_47] = _41;
			//const %48 = 1 : int
			_48 = 1;
			//add %49 = %4, %48 : int
			_49=j+_48;
			//assign %4 = %49  : int
			j = _49;
			//const %50 = 1 : int
			_50 = 1;
			//add %51 = %5, %50 : int
			_51=i+_50;
			//assign %5 = %51  : int
			i = _51;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %52 = 1 : int
		_52 = 1;
		//add %53 = %3, %52 : int
		_53=s+_52;
		//assign %3 = %53  : int
		s = _53;
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
	_DECL_1DARRAY(moves);
	int64_t sum_alice = 0;
	int64_t* _5;
	_DECL_2DARRAY(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_1DARRAY(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	void* _19;
	void* _21;
	_DECL_1DARRAY(_23);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
	}
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab7 : null|int
	if(max == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	n = *max;
	//const %9 = 0 : int
	_9 = 0;
	//mul %10 = %2, %2 : int
	_10=n*n;
	//arraygen %11 = [9; 10] : int[]
	_NEW_1DARRAY_int64_t(_11, _10, _9);
	//assign %3 = %11  : int[]
	_UPDATE_1DARRAY(moves, _11);
	//invoke (%12) = (%3, %2) CoinGame_single:findMoves : function(int[],int)->(int[])
	{
		_12 = findMoves(_1DARRAY_PARAM(moves), n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_12));
	}
	//assign %3 = %12  : int[]
	_UPDATE_1DARRAY(moves, _12);
	//const %13 = 1 : int
	_13 = 1;
	//sub %14 = %2, %13 : int
	_14=n-_13;
	//indexof %15 = %3, %14 : int[]
	_15=moves[_14];
	//assign %4 = %15  : int
	sum_alice = _15;
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %18 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_1DARRAY_int64_t(_18, 50, 0);
	_18[0] = 84; _18[1] = 104; _18[2] = 101; _18[3] = 32; _18[4] = 116; _18[5] = 111; _18[6] = 116; _18[7] = 97; _18[8] = 108; _18[9] = 32; _18[10] = 97; _18[11] = 109; _18[12] = 111; _18[13] = 117; _18[14] = 110; _18[15] = 116; _18[16] = 32; _18[17] = 111; _18[18] = 102; _18[19] = 32; _18[20] = 109; _18[21] = 111; _18[22] = 110; _18[23] = 101; _18[24] = 121; _18[25] = 32; _18[26] = 40; _18[27] = 109; _18[28] = 97; _18[29] = 120; _18[30] = 105; _18[31] = 109; _18[32] = 117; _18[33] = 109; _18[34] = 41; _18[35] = 32; _18[36] = 65; _18[37] = 108; _18[38] = 105; _18[39] = 99; _18[40] = 101; _18[41] = 32; _18[42] = 103; _18[43] = 101; _18[44] = 116; _18[45] = 115; _18[46] = 32; _18[47] = 105; _18[48] = 115; _18[49] = 32; 
	//indirectinvoke () = %17 (%18) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_18));
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %20 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_23, 23, 0);
	_23[0] = 80; _23[1] = 97; _23[2] = 115; _23[3] = 115; _23[4] = 32; _23[5] = 67; _23[6] = 111; _23[7] = 105; _23[8] = 110; _23[9] = 71; _23[10] = 97; _23[11] = 109; _23[12] = 101; _23[13] = 32; _23[14] = 116; _23[15] = 101; _23[16] = 115; _23[17] = 116; _23[18] = 32; _23[19] = 99; _23[20] = 97; _23[21] = 115; _23[22] = 101; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
//.blklab7
blklab7:;
	//return
	exit(0);
}

