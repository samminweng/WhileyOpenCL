#include "CoinGame.h"
long long* findMoves(_DECL_1DARRAY_PARAM(moves), _DECL_OWNERSHIP_PARAM(moves), long long n){
	_DECL_1DARRAY(_2);
	_DECL_OWNERSHIP(_2);
	long long s = 0;
	long long j = 0;
	long long i = 0;
	long long y = 0;
	long long x = 0;
	long long z = 0;
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
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54)
	while(true){
		//ifge %3, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %4 = %3  : int
		j = s;
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		i = _10;
		//loop (%0, %4, %5, %6, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52)
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
			//ifle %7, %6 goto blklab7 : int
			if(x<=y){goto blklab7;}
			//assign %7 = %6  : int
			x = y;
//.blklab7
blklab7:;
			//ifle %8, %6 goto blklab8 : int
			if(z<=y){goto blklab8;}
			//assign %8 = %6  : int
			z = y;
//.blklab8
blklab8:;
			//add %41 = %5, %7 : int
			_41=i+x;
			//add %42 = %4, %8 : int
			_42=j+z;
			//ifle %41, %42 goto blklab9 : int
			if(_41<=_42){goto blklab9;}
			//add %43 = %5, %7 : int
			_43=i+x;
			//mul %44 = %5, %1 : int
			_44=i*n;
			//add %45 = %44, %4 : int
			_45=_44+j;
			//update %0[%45] = %43 : int[] -> int[]
			moves[_45] = _43;
			//goto blklab10
			goto blklab10;
//.blklab9
blklab9:;
			//add %46 = %4, %8 : int
			_46=j+z;
			//mul %47 = %5, %1 : int
			_47=i*n;
			//add %48 = %47, %4 : int
			_48=_47+j;
			//update %0[%48] = %46 : int[] -> int[]
			moves[_48] = _46;
//.blklab10
blklab10:;
			//const %49 = 1 : int
			_49 = 1;
			//add %50 = %4, %49 : int
			_50=j+_49;
			//assign %4 = %50  : int
			j = _50;
			//const %51 = 1 : int
			_51 = 1;
			//add %52 = %5, %51 : int
			_52=i+_51;
			//assign %5 = %52  : int
			i = _52;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %53 = 1 : int
		_53 = 1;
		//add %54 = %3, %53 : int
		_54=s+_53;
		//assign %3 = %54  : int
		s = _54;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_FREE(_2);
	return moves;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	_DECL_1DARRAY(moves);
	_DECL_OWNERSHIP(moves);
	long long sum_alice = 0;
	long long* _5;
	_DECL_2DARRAY(_6);
	_DECL_OWNERSHIP(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_OWNERSHIP(_18);
	void* _19;
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_OWNERSHIP(_23);
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	_ADD_OWNERSHIP(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_REMOVE_OWNERSHIP(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab11 : null|int
	if(max == NULL) { goto blklab11;}
	//assign %2 = %1  : int
	n = *max;
	//const %9 = 0 : int
	_9 = 0;
	//mul %10 = %2, %2 : int
	_10=n*n;
	//arraygen %11 = [9; 10] : int[]
	_FREE(_11);
	_GEN_1DARRAY(_11, _10, _9);
	_ADD_OWNERSHIP(_11);
	//assign %3 = %11  : int[]
	_FREE(moves);
	_1DARRAY_UPDATE(moves, _11);
	_ADD_OWNERSHIP(moves);
	_REMOVE_OWNERSHIP(_11);
	//invoke (%12) = (%3, %2) CoinGame:findMoves : function(int[],int)->(int[])
	_FREE(_12);
	_REMOVE_OWNERSHIP(moves);
	_1DARRAY_SIZE(_12, moves);
	_12 = findMoves(_1DARRAY_PARAM(moves), true, n);
	_ADD_OWNERSHIP(_12);
	//assign %3 = %12  : int[]
	_FREE(moves);
	_1DARRAY_UPDATE(moves, _12);
	_ADD_OWNERSHIP(moves);
	_REMOVE_OWNERSHIP(_12);
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
	_FREE(_18);
	_NEW_ARRAY(_18, 50);
	_18[0] = 84; _18[1] = 104; _18[2] = 101; _18[3] = 32; _18[4] = 116; _18[5] = 111; _18[6] = 116; _18[7] = 97; _18[8] = 108; _18[9] = 32; _18[10] = 97; _18[11] = 109; _18[12] = 111; _18[13] = 117; _18[14] = 110; _18[15] = 116; _18[16] = 32; _18[17] = 111; _18[18] = 102; _18[19] = 32; _18[20] = 109; _18[21] = 111; _18[22] = 110; _18[23] = 101; _18[24] = 121; _18[25] = 32; _18[26] = 40; _18[27] = 109; _18[28] = 97; _18[29] = 120; _18[30] = 105; _18[31] = 109; _18[32] = 117; _18[33] = 109; _18[34] = 41; _18[35] = 32; _18[36] = 65; _18[37] = 108; _18[38] = 105; _18[39] = 99; _18[40] = 101; _18[41] = 32; _18[42] = 103; _18[43] = 101; _18[44] = 116; _18[45] = 115; _18[46] = 32; _18[47] = 105; _18[48] = 115; _18[49] = 32; 
	_ADD_OWNERSHIP(_18);
	//indirectinvoke () = %17 (%18) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_18));
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %20 (%4) : method(any)->()
	printf("%lld\n", sum_alice);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_23);
	_NEW_ARRAY(_23, 23);
	_23[0] = 80; _23[1] = 97; _23[2] = 115; _23[3] = 115; _23[4] = 32; _23[5] = 67; _23[6] = 111; _23[7] = 105; _23[8] = 110; _23[9] = 71; _23[10] = 97; _23[11] = 109; _23[12] = 101; _23[13] = 32; _23[14] = 116; _23[15] = 101; _23[16] = 115; _23[17] = 116; _23[18] = 32; _23[19] = 99; _23[20] = 97; _23[21] = 115; _23[22] = 101; 
	_ADD_OWNERSHIP(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	println_s(_23, _23_size);
//.blklab11
blklab11:;
	//return
	_FREE(moves);
	_FREE2DArray(_6);
	_FREE(_8);
	_FREE(_11);
	_FREE(_12);
	_FREE(_18);
	_FREE(_23);
	exit(0);
}
