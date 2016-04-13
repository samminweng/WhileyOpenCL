#include "CoinGame.h"
long long* init(long long n){
	_DECL_1DARRAY(_1);
	_DECL_OWNERSHIP(_1);
	_DECL_1DARRAY(coins);
	_DECL_OWNERSHIP(coins);
	long long i = 0;
	long long _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_OWNERSHIP(_5);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 0] : int[]
	_FREE(_5);
	_GEN_1DARRAY(_5, n, _4);
	_ADD_OWNERSHIP(_5);
	//assign %2 = %5  : int[]
	_FREE(coins);
	_1DARRAY_UPDATE(coins, _5);
	_ADD_OWNERSHIP(coins);
	_REMOVE_OWNERSHIP(_5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %7, %8, %9, %10)
	while(true){
		//ifge %3, %0 goto blklab0 : int
		if(i>=n){goto blklab0;}
		//indexof %7 = %2, %3 : int[]
		_7=coins[i];
		//add %8 = %7, %3 : int
		_8=_7+i;
		//update %2[%3] = %8 : int[] -> int[]
		coins[i] = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %2
	_FREE(_1);
	_FREE(_5);
	return coins;
	//return
}

long long getBobSum(long long sum_alice, _DECL_1DARRAY_PARAM(coins), _DECL_OWNERSHIP_PARAM(coins), long long n){
	long long _3 = 0;
	long long i = 0;
	long long sum = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %4 = %6  : int
	i = _6;
	//const %7 = 0 : int
	_7 = 0;
	//assign %5 = %7  : int
	sum = _7;
	//loop (%4, %5, %8, %9, %10, %11)
	while(true){
		//ifge %4, %2 goto blklab2 : int
		if(i>=n){goto blklab2;}
		//indexof %8 = %1, %4 : int[]
		_8=coins[i];
		//add %9 = %5, %8 : int
		_9=sum+_8;
		//assign %5 = %9  : int
		sum = _9;
		//const %10 = 1 : int
		_10 = 1;
		//add %11 = %4, %10 : int
		_11=i+_10;
		//assign %4 = %11  : int
		i = _11;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//sub %12 = %5, %0 : int
	_12=sum-sum_alice;
	//return %12
	_FREE(coins);
	return _12;
	//return
}

long long* findMoves(_DECL_1DARRAY_PARAM(coins), _DECL_OWNERSHIP_PARAM(coins), long long n){
	_DECL_1DARRAY(_2);
	_DECL_OWNERSHIP(_2);
	_DECL_1DARRAY(moves);
	_DECL_OWNERSHIP(moves);
	long long s = 0;
	long long j = 0;
	long long i = 0;
	long long y = 0;
	long long x = 0;
	long long z = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
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
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	long long _61 = 0;
	long long _62 = 0;
	//const %10 = 0 : int
	_10 = 0;
	//mul %11 = %1, %1 : int
	_11=n*n;
	//arraygen %12 = [10; 11] : int[]
	_FREE(_12);
	_GEN_1DARRAY(_12, _11, _10);
	_ADD_OWNERSHIP(_12);
	//assign %3 = %12  : int[]
	_FREE(moves);
	_1DARRAY_UPDATE(moves, _12);
	_ADD_OWNERSHIP(moves);
	_REMOVE_OWNERSHIP(_12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %4 = %13  : int
	s = _13;
	//loop (%3, %4, %5, %6, %7, %8, %9, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62)
	while(true){
		//ifge %4, %1 goto blklab4 : int
		if(s>=n){goto blklab4;}
		//assign %5 = %4  : int
		j = s;
		//const %14 = 0 : int
		_14 = 0;
		//assign %6 = %14  : int
		i = _14;
		//loop (%3, %5, %6, %7, %8, %9, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60)
		while(true){
			//ifge %5, %1 goto blklab6 : int
			if(j>=n){goto blklab6;}
			//const %15 = 0 : int
			_15 = 0;
			//assign %7 = %15  : int
			y = _15;
			//const %16 = 1 : int
			_16 = 1;
			//add %17 = %6, %16 : int
			_17=i+_16;
			//ifge %17, %1 goto blklab8 : int
			if(_17>=n){goto blklab8;}
			//const %18 = 1 : int
			_18 = 1;
			//sub %19 = %5, %18 : int
			_19=j-_18;
			//const %20 = 0 : int
			_20 = 0;
			//iflt %19, %20 goto blklab8 : int
			if(_19<_20){goto blklab8;}
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %6, %21 : int
			_22=i+_21;
			//mul %23 = %22, %1 : int
			_23=_22*n;
			//add %24 = %23, %5 : int
			_24=_23+j;
			//const %25 = 1 : int
			_25 = 1;
			//sub %26 = %24, %25 : int
			_26=_24-_25;
			//indexof %27 = %3, %26 : int[]
			_27=moves[_26];
			//assign %7 = %27  : int
			y = _27;
//.blklab8
blklab8:;
			//const %28 = 0 : int
			_28 = 0;
			//assign %8 = %28  : int
			x = _28;
			//const %29 = 2 : int
			_29 = 2;
			//add %30 = %6, %29 : int
			_30=i+_29;
			//ifge %30, %1 goto blklab9 : int
			if(_30>=n){goto blklab9;}
			//const %31 = 2 : int
			_31 = 2;
			//add %32 = %6, %31 : int
			_32=i+_31;
			//mul %33 = %32, %1 : int
			_33=_32*n;
			//add %34 = %33, %5 : int
			_34=_33+j;
			//indexof %35 = %3, %34 : int[]
			_35=moves[_34];
			//assign %8 = %35  : int
			x = _35;
//.blklab9
blklab9:;
			//const %36 = 0 : int
			_36 = 0;
			//assign %9 = %36  : int
			z = _36;
			//const %37 = 1 : int
			_37 = 1;
			//sub %38 = %5, %37 : int
			_38=j-_37;
			//const %39 = 0 : int
			_39 = 0;
			//ifle %38, %39 goto blklab10 : int
			if(_38<=_39){goto blklab10;}
			//mul %40 = %6, %1 : int
			_40=i*n;
			//add %41 = %40, %5 : int
			_41=_40+j;
			//const %42 = 2 : int
			_42 = 2;
			//sub %43 = %41, %42 : int
			_43=_41-_42;
			//indexof %44 = %3, %43 : int[]
			_44=moves[_43];
			//assign %9 = %44  : int
			z = _44;
//.blklab10
blklab10:;
			//ifle %8, %7 goto blklab11 : int
			if(x<=y){goto blklab11;}
			//assign %8 = %7  : int
			x = y;
//.blklab11
blklab11:;
			//ifle %9, %7 goto blklab12 : int
			if(z<=y){goto blklab12;}
			//assign %9 = %7  : int
			z = y;
//.blklab12
blklab12:;
			//indexof %45 = %0, %6 : int[]
			_45=coins[i];
			//add %46 = %45, %8 : int
			_46=_45+x;
			//indexof %47 = %0, %5 : int[]
			_47=coins[j];
			//add %48 = %47, %9 : int
			_48=_47+z;
			//ifle %46, %48 goto blklab13 : int
			if(_46<=_48){goto blklab13;}
			//indexof %49 = %0, %6 : int[]
			_49=coins[i];
			//add %50 = %49, %8 : int
			_50=_49+x;
			//mul %51 = %6, %1 : int
			_51=i*n;
			//add %52 = %51, %5 : int
			_52=_51+j;
			//update %3[%52] = %50 : int[] -> int[]
			moves[_52] = _50;
			//goto blklab14
			goto blklab14;
//.blklab13
blklab13:;
			//indexof %53 = %0, %5 : int[]
			_53=coins[j];
			//add %54 = %53, %9 : int
			_54=_53+z;
			//mul %55 = %6, %1 : int
			_55=i*n;
			//add %56 = %55, %5 : int
			_56=_55+j;
			//update %3[%56] = %54 : int[] -> int[]
			moves[_56] = _54;
//.blklab14
blklab14:;
			//const %57 = 1 : int
			_57 = 1;
			//add %58 = %5, %57 : int
			_58=j+_57;
			//assign %5 = %58  : int
			j = _58;
			//const %59 = 1 : int
			_59 = 1;
			//add %60 = %6, %59 : int
			_60=i+_59;
			//assign %6 = %60  : int
			i = _60;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %61 = 1 : int
		_61 = 1;
		//add %62 = %4, %61 : int
		_62=s+_61;
		//assign %4 = %62  : int
		s = _62;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %3
	_FREE(coins);
	_FREE(_2);
	_FREE(_12);
	return moves;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	_DECL_1DARRAY(coins);
	_DECL_OWNERSHIP(coins);
	_DECL_1DARRAY(moves);
	_DECL_OWNERSHIP(moves);
	long long sum_alice = 0;
	long long* _6;
	_DECL_2DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
	_DECL_1DARRAY(_10);
	_DECL_OWNERSHIP(_10);
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	void* _18;
	//fieldload %7 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_7);
	_ADD_OWNERSHIP(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke (%6) = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_6, _9);
	//assign %1 = %6  : null|int
	max = _6;
	//ifis %1, null goto blklab15 : null|int
	if(max == NULL) { goto blklab15;}
	//assign %2 = %1  : int
	n = *max;
	//invoke (%10) = (%2) CoinGame:init : function(int)->(int[])
	_FREE(_10);
	_10 = init(n);
	_ADD_OWNERSHIP(_10);
	//assign %3 = %10  : int[]
	_FREE(coins);
	_1DARRAY_UPDATE(coins, _10);
	_ADD_OWNERSHIP(coins);
	_REMOVE_OWNERSHIP(_10);
	//invoke (%11) = (%3, %2) CoinGame:findMoves : function(int[],int)->(int[])
	_FREE(_11);
	_ADD_OWNERSHIP(coins);
	_1DARRAY_SIZE(_11, coins);
	_11 = findMoves(_1DARRAY_PARAM(coins), false, n);
	_ADD_OWNERSHIP(_11);
	//assign %4 = %11  : int[]
	_FREE(moves);
	_1DARRAY_UPDATE(moves, _11);
	_ADD_OWNERSHIP(moves);
	_REMOVE_OWNERSHIP(_11);
	//const %12 = 1 : int
	_12 = 1;
	//sub %13 = %2, %12 : int
	_13=n-_12;
	//indexof %14 = %4, %13 : int[]
	_14=moves[_13];
	//assign %5 = %14  : int
	sum_alice = _14;
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_FREE(_17);
	_NEW_ARRAY(_17, 50);
	_17[0] = 84; _17[1] = 104; _17[2] = 101; _17[3] = 32; _17[4] = 116; _17[5] = 111; _17[6] = 116; _17[7] = 97; _17[8] = 108; _17[9] = 32; _17[10] = 97; _17[11] = 109; _17[12] = 111; _17[13] = 117; _17[14] = 110; _17[15] = 116; _17[16] = 32; _17[17] = 111; _17[18] = 102; _17[19] = 32; _17[20] = 109; _17[21] = 111; _17[22] = 110; _17[23] = 101; _17[24] = 121; _17[25] = 32; _17[26] = 40; _17[27] = 109; _17[28] = 97; _17[29] = 120; _17[30] = 105; _17[31] = 109; _17[32] = 117; _17[33] = 109; _17[34] = 41; _17[35] = 32; _17[36] = 65; _17[37] = 108; _17[38] = 105; _17[39] = 99; _17[40] = 101; _17[41] = 32; _17[42] = 103; _17[43] = 101; _17[44] = 116; _17[45] = 115; _17[46] = 32; _17[47] = 105; _17[48] = 115; _17[49] = 32; 
	_ADD_OWNERSHIP(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_17));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %19 (%5) : method(any)->()
	printf("%lld\n", sum_alice);
//.blklab15
blklab15:;
	//return
	_FREE(coins);
	_FREE(moves);
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_10);
	_FREE(_11);
	_FREE(_17);
	exit(0);
}

