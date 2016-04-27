#include "CoinGame.h"
long long* findMoves(_DECL_1DARRAY_PARAM(moves), long long n){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(x);
	_DECL_1DARRAY(y);
	_DECL_1DARRAY(z);
	long long s = 0;
	long long j = 0;
	long long i = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	long long _11 = 0;
	_DECL_1DARRAY(_12);
	long long _13 = 0;
	_DECL_1DARRAY(_14);
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
	long long _63 = 0;
	long long _64 = 0;
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//arraygen %10 = [9; 1] : int[]
	_GEN_1DARRAY(_10, n, _9);
	//assign %3 = %10  : int[]
	_1DARRAY_UPDATE(x, _10);
	//const %11 = 0 : int
	_11 = 0;
	//arraygen %12 = [11; 1] : int[]
	_GEN_1DARRAY(_12, n, _11);
	//assign %4 = %12  : int[]
	_1DARRAY_UPDATE(y, _12);
	//const %13 = 0 : int
	_13 = 0;
	//arraygen %14 = [13; 1] : int[]
	_GEN_1DARRAY(_14, n, _13);
	//assign %5 = %14  : int[]
	_1DARRAY_UPDATE(z, _14);
	//const %15 = 0 : int
	_15 = 0;
	//assign %6 = %15  : int
	s = _15;
	//loop (%0, %3, %4, %5, %6, %7, %8, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70)
	while(true){
		//ifge %6, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %7 = %6  : int
		j = s;
		//const %16 = 0 : int
		_16 = 0;
		//assign %8 = %16  : int
		i = _16;
		//loop (%0, %3, %4, %5, %7, %8, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68)
		while(true){
			//ifge %7, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %17 = 0 : int
			_17 = 0;
			//update %4[%8] = %17 : int[] -> int[]
			y[i] = _17;
			//const %18 = 1 : int
			_18 = 1;
			//add %19 = %8, %18 : int
			_19=i+_18;
			//ifge %19, %1 goto blklab4 : int
			if(_19>=n){goto blklab4;}
			//const %20 = 1 : int
			_20 = 1;
			//sub %21 = %7, %20 : int
			_21=j-_20;
			//const %22 = 0 : int
			_22 = 0;
			//iflt %21, %22 goto blklab4 : int
			if(_21<_22){goto blklab4;}
			//const %23 = 1 : int
			_23 = 1;
			//add %24 = %8, %23 : int
			_24=i+_23;
			//mul %25 = %24, %1 : int
			_25=_24*n;
			//add %26 = %25, %7 : int
			_26=_25+j;
			//const %27 = 1 : int
			_27 = 1;
			//sub %28 = %26, %27 : int
			_28=_26-_27;
			//indexof %29 = %0, %28 : int[]
			_29=moves[_28];
			//update %4[%8] = %29 : int[] -> int[]
			y[i] = _29;
//.blklab4
blklab4:;
			//const %30 = 0 : int
			_30 = 0;
			//update %3[%8] = %30 : int[] -> int[]
			x[i] = _30;
			//const %31 = 2 : int
			_31 = 2;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//ifge %32, %1 goto blklab5 : int
			if(_32>=n){goto blklab5;}
			//const %33 = 2 : int
			_33 = 2;
			//add %34 = %8, %33 : int
			_34=i+_33;
			//mul %35 = %34, %1 : int
			_35=_34*n;
			//add %36 = %35, %7 : int
			_36=_35+j;
			//indexof %37 = %0, %36 : int[]
			_37=moves[_36];
			//update %3[%8] = %37 : int[] -> int[]
			x[i] = _37;
//.blklab5
blklab5:;
			//const %38 = 0 : int
			_38 = 0;
			//update %5[%8] = %38 : int[] -> int[]
			z[i] = _38;
			//const %39 = 1 : int
			_39 = 1;
			//sub %40 = %7, %39 : int
			_40=j-_39;
			//const %41 = 0 : int
			_41 = 0;
			//ifle %40, %41 goto blklab6 : int
			if(_40<=_41){goto blklab6;}
			//mul %42 = %8, %1 : int
			_42=i*n;
			//add %43 = %42, %7 : int
			_43=_42+j;
			//const %44 = 2 : int
			_44 = 2;
			//sub %45 = %43, %44 : int
			_45=_43-_44;
			//indexof %46 = %0, %45 : int[]
			_46=moves[_45];
			//update %5[%8] = %46 : int[] -> int[]
			z[i] = _46;
//.blklab6
blklab6:;
			//indexof %47 = %3, %8 : int[]
			_47=x[i];
			//indexof %48 = %4, %8 : int[]
			_48=y[i];
			//ifle %47, %48 goto blklab7 : int
			if(_47<=_48){goto blklab7;}
			//indexof %49 = %4, %8 : int[]
			_49=y[i];
			//update %3[%8] = %49 : int[] -> int[]
			x[i] = _49;
//.blklab7
blklab7:;
			//indexof %50 = %5, %8 : int[]
			_50=z[i];
			//indexof %51 = %4, %8 : int[]
			_51=y[i];
			//ifle %50, %51 goto blklab8 : int
			if(_50<=_51){goto blklab8;}
			//indexof %52 = %4, %8 : int[]
			_52=y[i];
			//update %5[%8] = %52 : int[] -> int[]
			z[i] = _52;
//.blklab8
blklab8:;
			//indexof %53 = %3, %8 : int[]
			_53=x[i];
			//add %54 = %8, %53 : int
			_54=i+_53;
			//indexof %55 = %5, %8 : int[]
			_55=z[i];
			//add %56 = %7, %55 : int
			_56=j+_55;
			//ifle %54, %56 goto blklab9 : int
			if(_54<=_56){goto blklab9;}
			//indexof %57 = %3, %8 : int[]
			_57=x[i];
			//add %58 = %8, %57 : int
			_58=i+_57;
			//mul %59 = %8, %1 : int
			_59=i*n;
			//add %60 = %59, %7 : int
			_60=_59+j;
			//update %0[%60] = %58 : int[] -> int[]
			moves[_60] = _58;
			//goto blklab10
			goto blklab10;
//.blklab9
blklab9:;
			//indexof %61 = %5, %8 : int[]
			_61=z[i];
			//add %62 = %7, %61 : int
			_62=j+_61;
			//mul %63 = %8, %1 : int
			_63=i*n;
			//add %64 = %63, %7 : int
			_64=_63+j;
			//update %0[%64] = %62 : int[] -> int[]
			moves[_64] = _62;
//.blklab10
blklab10:;
			//const %65 = 1 : int
			_65 = 1;
			//add %66 = %7, %65 : int
			_66=j+_65;
			//assign %7 = %66  : int
			j = _66;
			//const %67 = 1 : int
			_67 = 1;
			//add %68 = %8, %67 : int
			_68=i+_67;
			//assign %8 = %68  : int
			i = _68;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %69 = 1 : int
		_69 = 1;
		//add %70 = %6, %69 : int
		_70=s+_69;
		//assign %6 = %70  : int
		s = _70;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	return moves;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	_DECL_1DARRAY(moves);
	long long sum_alice = 0;
	long long* _5;
	_DECL_2DARRAY(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_1DARRAY(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
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
	_GEN_1DARRAY(_11, _10, _9);
	//assign %3 = %11  : int[]
	_1DARRAY_UPDATE(moves, _11);
	//invoke (%12) = (%3, %2) CoinGame:findMoves : function(int[],int)->(int[])
	_1DARRAY_SIZE(_12, moves);
	_12 = findMoves(_1DARRAY_PARAM(moves), n);
	//assign %3 = %12  : int[]
	_1DARRAY_UPDATE(moves, _12);
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
	_NEW_ARRAY(_18, 50);
	_18[0] = 84; _18[1] = 104; _18[2] = 101; _18[3] = 32; _18[4] = 116; _18[5] = 111; _18[6] = 116; _18[7] = 97; _18[8] = 108; _18[9] = 32; _18[10] = 97; _18[11] = 109; _18[12] = 111; _18[13] = 117; _18[14] = 110; _18[15] = 116; _18[16] = 32; _18[17] = 111; _18[18] = 102; _18[19] = 32; _18[20] = 109; _18[21] = 111; _18[22] = 110; _18[23] = 101; _18[24] = 121; _18[25] = 32; _18[26] = 40; _18[27] = 109; _18[28] = 97; _18[29] = 120; _18[30] = 105; _18[31] = 109; _18[32] = 117; _18[33] = 109; _18[34] = 41; _18[35] = 32; _18[36] = 65; _18[37] = 108; _18[38] = 105; _18[39] = 99; _18[40] = 101; _18[41] = 32; _18[42] = 103; _18[43] = 101; _18[44] = 116; _18[45] = 115; _18[46] = 32; _18[47] = 105; _18[48] = 115; _18[49] = 32; 
	//indirectinvoke () = %17 (%18) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_18));
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %20 (%4) : method(any)->()
	printf("%lld\n", sum_alice);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_ARRAY(_23, 23);
	_23[0] = 80; _23[1] = 97; _23[2] = 115; _23[3] = 115; _23[4] = 32; _23[5] = 67; _23[6] = 111; _23[7] = 105; _23[8] = 110; _23[9] = 71; _23[10] = 97; _23[11] = 109; _23[12] = 101; _23[13] = 32; _23[14] = 116; _23[15] = 101; _23[16] = 115; _23[17] = 116; _23[18] = 32; _23[19] = 99; _23[20] = 97; _23[21] = 115; _23[22] = 101; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	println_s(_23, _23_size);
//.blklab11
blklab11:;
	//return
	exit(0);
}

