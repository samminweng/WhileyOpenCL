#include "CoinGame_array.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAY_PARAM(x), _DECL_1DARRAY_PARAM(y), _DECL_1DARRAY_PARAM(z), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_5);
	int64_t s = 0;
	int64_t j = 0;
	int64_t i = 0;
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
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	int64_t _58 = 0;
	int64_t _59 = 0;
	int64_t _60 = 0;
	int64_t _61 = 0;
	int64_t _62 = 0;
	int64_t _63 = 0;
	int64_t _64 = 0;
	int64_t _65 = 0;
	int64_t _66 = 0;
	int64_t _67 = 0;
	int64_t _68 = 0;
	int64_t _69 = 0;
	int64_t _70 = 0;
	int64_t _71 = 0;
	int64_t _72 = 0;
	int64_t _73 = 0;
	int64_t _74 = 0;
	int64_t _75 = 0;
	int64_t _76 = 0;
	int64_t _77 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//assign %6 = %9  : int
	s = _9;
	//loop (%0, %2, %3, %4, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77)
	while(true){
		//ifge %6, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %7 = %6  : int
		j = s;
		//const %10 = 0 : int
		_10 = 0;
		//assign %8 = %10  : int
		i = _10;
		//loop (%0, %2, %3, %4, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75)
		while(true){
			//ifge %7, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %11 = 0 : int
			_11 = 0;
			//mul %12 = %8, %1 : int
			_12=i*n;
			//add %13 = %12, %7 : int
			_13=_12+j;
			//update %3[%13] = %11 : int[] -> int[]
			y[_13] = _11;
			//const %14 = 1 : int
			_14 = 1;
			//add %15 = %8, %14 : int
			_15=i+_14;
			//ifge %15, %1 goto blklab4 : int
			if(_15>=n){goto blklab4;}
			//const %16 = 1 : int
			_16 = 1;
			//sub %17 = %7, %16 : int
			_17=j-_16;
			//const %18 = 0 : int
			_18 = 0;
			//iflt %17, %18 goto blklab4 : int
			if(_17<_18){goto blklab4;}
			//const %19 = 1 : int
			_19 = 1;
			//add %20 = %8, %19 : int
			_20=i+_19;
			//mul %21 = %20, %1 : int
			_21=_20*n;
			//add %22 = %21, %7 : int
			_22=_21+j;
			//const %23 = 1 : int
			_23 = 1;
			//sub %24 = %22, %23 : int
			_24=_22-_23;
			//indexof %25 = %0, %24 : int[]
			_25=moves[_24];
			//mul %26 = %8, %1 : int
			_26=i*n;
			//add %27 = %26, %7 : int
			_27=_26+j;
			//update %3[%27] = %25 : int[] -> int[]
			y[_27] = _25;
//.blklab4
blklab4:;
			//const %28 = 0 : int
			_28 = 0;
			//mul %29 = %8, %1 : int
			_29=i*n;
			//add %30 = %29, %7 : int
			_30=_29+j;
			//update %2[%30] = %28 : int[] -> int[]
			x[_30] = _28;
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
			//mul %38 = %8, %1 : int
			_38=i*n;
			//add %39 = %38, %7 : int
			_39=_38+j;
			//update %2[%39] = %37 : int[] -> int[]
			x[_39] = _37;
//.blklab5
blklab5:;
			//const %40 = 0 : int
			_40 = 0;
			//mul %41 = %8, %1 : int
			_41=i*n;
			//add %42 = %41, %7 : int
			_42=_41+j;
			//update %4[%42] = %40 : int[] -> int[]
			z[_42] = _40;
			//const %43 = 1 : int
			_43 = 1;
			//sub %44 = %7, %43 : int
			_44=j-_43;
			//const %45 = 0 : int
			_45 = 0;
			//ifle %44, %45 goto blklab6 : int
			if(_44<=_45){goto blklab6;}
			//mul %46 = %8, %1 : int
			_46=i*n;
			//add %47 = %46, %7 : int
			_47=_46+j;
			//const %48 = 2 : int
			_48 = 2;
			//sub %49 = %47, %48 : int
			_49=_47-_48;
			//indexof %50 = %0, %49 : int[]
			_50=moves[_49];
			//mul %51 = %8, %1 : int
			_51=i*n;
			//add %52 = %51, %7 : int
			_52=_51+j;
			//update %4[%52] = %50 : int[] -> int[]
			z[_52] = _50;
//.blklab6
blklab6:;
			//mul %55 = %8, %1 : int
			_55=i*n;
			//add %56 = %55, %7 : int
			_56=_55+j;
			//indexof %57 = %2, %56 : int[]
			_57=x[_56];
			//mul %58 = %8, %1 : int
			_58=i*n;
			//add %59 = %58, %7 : int
			_59=_58+j;
			//indexof %60 = %3, %59 : int[]
			_60=y[_59];
			//invoke (%54) = (%57, %60) whiley/lang/Math:min : function(int,int)->(int)
			{
				_54 = min(_57, _60);
			}
			//add %61 = %8, %54 : int
			_61=i+_54;
			//mul %63 = %8, %1 : int
			_63=i*n;
			//add %64 = %63, %7 : int
			_64=_63+j;
			//indexof %65 = %3, %64 : int[]
			_65=y[_64];
			//mul %66 = %8, %1 : int
			_66=i*n;
			//add %67 = %66, %7 : int
			_67=_66+j;
			//indexof %68 = %4, %67 : int[]
			_68=z[_67];
			//invoke (%62) = (%65, %68) whiley/lang/Math:min : function(int,int)->(int)
			{
				_62 = min(_65, _68);
			}
			//add %69 = %7, %62 : int
			_69=j+_62;
			//invoke (%53) = (%61, %69) whiley/lang/Math:max : function(int,int)->(int)
			{
				_53 = max(_61, _69);
			}
			//mul %70 = %8, %1 : int
			_70=i*n;
			//add %71 = %70, %7 : int
			_71=_70+j;
			//update %0[%71] = %53 : int[] -> int[]
			moves[_71] = _53;
			//const %72 = 1 : int
			_72 = 1;
			//add %73 = %7, %72 : int
			_73=j+_72;
			//assign %7 = %73  : int
			j = _73;
			//const %74 = 1 : int
			_74 = 1;
			//add %75 = %8, %74 : int
			_75=i+_74;
			//assign %8 = %75  : int
			i = _75;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %76 = 1 : int
		_76 = 1;
		//add %77 = %6, %76 : int
		_77=s+_76;
		//assign %6 = %77  : int
		s = _77;
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
	_DECL_1DARRAY(x);
	_DECL_1DARRAY(y);
	_DECL_1DARRAY(z);
	int64_t sum_alice = 0;
	int64_t* _8;
	_DECL_2DARRAY(_9);
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	_DECL_1DARRAY(_17);
	int64_t _18 = 0;
	int64_t _19 = 0;
	_DECL_1DARRAY(_20);
	int64_t _21 = 0;
	int64_t _22 = 0;
	_DECL_1DARRAY(_23);
	_DECL_1DARRAY(_24);
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	void* _28;
	_DECL_1DARRAY(_30);
	void* _31;
	void* _33;
	_DECL_1DARRAY(_35);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
	}
	//assign %1 = %8  : null|int
	max = _8;
	//ifis %1, null goto blklab7 : null|int
	if(max == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	n = *max;
	//const %12 = 0 : int
	_12 = 0;
	//mul %13 = %2, %2 : int
	_13=n*n;
	//arraygen %14 = [12; 13] : int[]
	_NEW_1DARRAY_int64_t(_14, _13, _12);
	//assign %3 = %14  : int[]
	_UPDATE_1DARRAY(moves, _14);
	//const %15 = 0 : int
	_15 = 0;
	//mul %16 = %2, %2 : int
	_16=n*n;
	//arraygen %17 = [15; 16] : int[]
	_NEW_1DARRAY_int64_t(_17, _16, _15);
	//assign %4 = %17  : int[]
	_UPDATE_1DARRAY(x, _17);
	//const %18 = 0 : int
	_18 = 0;
	//mul %19 = %2, %2 : int
	_19=n*n;
	//arraygen %20 = [18; 19] : int[]
	_NEW_1DARRAY_int64_t(_20, _19, _18);
	//assign %5 = %20  : int[]
	_UPDATE_1DARRAY(y, _20);
	//const %21 = 0 : int
	_21 = 0;
	//mul %22 = %2, %2 : int
	_22=n*n;
	//arraygen %23 = [21; 22] : int[]
	_NEW_1DARRAY_int64_t(_23, _22, _21);
	//assign %6 = %23  : int[]
	_UPDATE_1DARRAY(z, _23);
	//invoke (%24) = (%3, %2, %4, %5, %6) CoinGame_array:findMoves : function(int[],int,int[],int[],int[])->(int[])
	{
		_24 = _findMoves_(_1DARRAY_PARAM(moves), n, _1DARRAY_PARAM(x), _1DARRAY_PARAM(y), _1DARRAY_PARAM(z), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
	}
	//assign %3 = %24  : int[]
	_UPDATE_1DARRAY(moves, _24);
	//const %25 = 1 : int
	_25 = 1;
	//sub %26 = %2, %25 : int
	_26=n-_25;
	//indexof %27 = %3, %26 : int[]
	_27=moves[_26];
	//assign %7 = %27  : int
	sum_alice = _27;
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_1DARRAY_int64_t(_30, 50, 0);
	_30[0] = 84; _30[1] = 104; _30[2] = 101; _30[3] = 32; _30[4] = 116; _30[5] = 111; _30[6] = 116; _30[7] = 97; _30[8] = 108; _30[9] = 32; _30[10] = 97; _30[11] = 109; _30[12] = 111; _30[13] = 117; _30[14] = 110; _30[15] = 116; _30[16] = 32; _30[17] = 111; _30[18] = 102; _30[19] = 32; _30[20] = 109; _30[21] = 111; _30[22] = 110; _30[23] = 101; _30[24] = 121; _30[25] = 32; _30[26] = 40; _30[27] = 109; _30[28] = 97; _30[29] = 120; _30[30] = 105; _30[31] = 109; _30[32] = 117; _30[33] = 109; _30[34] = 41; _30[35] = 32; _30[36] = 65; _30[37] = 108; _30[38] = 105; _30[39] = 99; _30[40] = 101; _30[41] = 32; _30[42] = 103; _30[43] = 101; _30[44] = 116; _30[45] = 115; _30[46] = 32; _30[47] = 105; _30[48] = 115; _30[49] = 32; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_30));
	}
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %32 (%7) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %34 = %33 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %35 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_35, 23, 0);
	_35[0] = 80; _35[1] = 97; _35[2] = 115; _35[3] = 115; _35[4] = 32; _35[5] = 67; _35[6] = 111; _35[7] = 105; _35[8] = 110; _35[9] = 71; _35[10] = 97; _35[11] = 109; _35[12] = 101; _35[13] = 32; _35[14] = 116; _35[15] = 101; _35[16] = 115; _35[17] = 116; _35[18] = 32; _35[19] = 99; _35[20] = 97; _35[21] = 115; _35[22] = 101; 
	//indirectinvoke () = %34 (%35) : method(int[])->()
	{
		println_s(_35, _35_size);
	}
//.blklab7
blklab7:;
	//return
	exit(0);
}

