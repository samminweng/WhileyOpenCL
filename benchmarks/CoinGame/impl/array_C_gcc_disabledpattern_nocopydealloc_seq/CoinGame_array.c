#include "CoinGame_array.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), _DECL_DEALLOC_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(x);
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(y);
	_DECL_DEALLOC(y);
	_DECL_1DARRAY(z);
	_DECL_DEALLOC(z);
	int64_t s = 0;
	int64_t j = 0;
	int64_t i = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
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
	int64_t _78 = 0;
	int64_t _79 = 0;
	int64_t _80 = 0;
	int64_t _81 = 0;
	int64_t _82 = 0;
	int64_t _83 = 0;
	int64_t _84 = 0;
	int64_t _85 = 0;
	int64_t _86 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//mul %10 = %1, %1 : int
	_10=n*n;
	//arraygen %11 = [9; 10] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, _10, _9);
	_ADD_DEALLOC(_11);
	//assign %3 = %11  : int[]
	_DEALLOC(x);
	_UPDATE_1DARRAY(x, _11);
	_TRANSFER_DEALLOC(x, _11);
	//const %12 = 0 : int
	_12 = 0;
	//mul %13 = %1, %1 : int
	_13=n*n;
	//arraygen %14 = [12; 13] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, _13, _12);
	_ADD_DEALLOC(_14);
	//assign %4 = %14  : int[]
	_DEALLOC(y);
	_UPDATE_1DARRAY(y, _14);
	_TRANSFER_DEALLOC(y, _14);
	//const %15 = 0 : int
	_15 = 0;
	//mul %16 = %1, %1 : int
	_16=n*n;
	//arraygen %17 = [15; 16] : int[]
	_DEALLOC(_17);
	_NEW_1DARRAY_int64_t(_17, _16, _15);
	_ADD_DEALLOC(_17);
	//assign %5 = %17  : int[]
	_DEALLOC(z);
	_UPDATE_1DARRAY(z, _17);
	_TRANSFER_DEALLOC(z, _17);
	//const %18 = 0 : int
	_18 = 0;
	//assign %6 = %18  : int
	s = _18;
	//loop (%0, %3, %4, %5, %6, %7, %8, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84, %85, %86)
	while(true){
		//ifge %6, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %7 = %6  : int
		j = s;
		//const %19 = 0 : int
		_19 = 0;
		//assign %8 = %19  : int
		i = _19;
		//loop (%0, %3, %4, %5, %7, %8, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84)
		while(true){
			//ifge %7, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %20 = 0 : int
			_20 = 0;
			//mul %21 = %8, %1 : int
			_21=i*n;
			//add %22 = %21, %7 : int
			_22=_21+j;
			//update %4[%22] = %20 : int[] -> int[]
			y[_22] = _20;
			//const %23 = 1 : int
			_23 = 1;
			//add %24 = %8, %23 : int
			_24=i+_23;
			//ifge %24, %1 goto blklab4 : int
			if(_24>=n){goto blklab4;}
			//const %25 = 1 : int
			_25 = 1;
			//sub %26 = %7, %25 : int
			_26=j-_25;
			//const %27 = 0 : int
			_27 = 0;
			//iflt %26, %27 goto blklab4 : int
			if(_26<_27){goto blklab4;}
			//const %28 = 1 : int
			_28 = 1;
			//add %29 = %8, %28 : int
			_29=i+_28;
			//mul %30 = %29, %1 : int
			_30=_29*n;
			//add %31 = %30, %7 : int
			_31=_30+j;
			//const %32 = 1 : int
			_32 = 1;
			//sub %33 = %31, %32 : int
			_33=_31-_32;
			//indexof %34 = %0, %33 : int[]
			_34=moves[_33];
			//mul %35 = %8, %1 : int
			_35=i*n;
			//add %36 = %35, %7 : int
			_36=_35+j;
			//update %4[%36] = %34 : int[] -> int[]
			y[_36] = _34;
//.blklab4
blklab4:;
			//const %37 = 0 : int
			_37 = 0;
			//mul %38 = %8, %1 : int
			_38=i*n;
			//add %39 = %38, %7 : int
			_39=_38+j;
			//update %3[%39] = %37 : int[] -> int[]
			x[_39] = _37;
			//const %40 = 2 : int
			_40 = 2;
			//add %41 = %8, %40 : int
			_41=i+_40;
			//ifge %41, %1 goto blklab5 : int
			if(_41>=n){goto blklab5;}
			//const %42 = 2 : int
			_42 = 2;
			//add %43 = %8, %42 : int
			_43=i+_42;
			//mul %44 = %43, %1 : int
			_44=_43*n;
			//add %45 = %44, %7 : int
			_45=_44+j;
			//indexof %46 = %0, %45 : int[]
			_46=moves[_45];
			//mul %47 = %8, %1 : int
			_47=i*n;
			//add %48 = %47, %7 : int
			_48=_47+j;
			//update %3[%48] = %46 : int[] -> int[]
			x[_48] = _46;
//.blklab5
blklab5:;
			//const %49 = 0 : int
			_49 = 0;
			//mul %50 = %8, %1 : int
			_50=i*n;
			//add %51 = %50, %7 : int
			_51=_50+j;
			//update %5[%51] = %49 : int[] -> int[]
			z[_51] = _49;
			//const %52 = 1 : int
			_52 = 1;
			//sub %53 = %7, %52 : int
			_53=j-_52;
			//const %54 = 0 : int
			_54 = 0;
			//ifle %53, %54 goto blklab6 : int
			if(_53<=_54){goto blklab6;}
			//mul %55 = %8, %1 : int
			_55=i*n;
			//add %56 = %55, %7 : int
			_56=_55+j;
			//const %57 = 2 : int
			_57 = 2;
			//sub %58 = %56, %57 : int
			_58=_56-_57;
			//indexof %59 = %0, %58 : int[]
			_59=moves[_58];
			//mul %60 = %8, %1 : int
			_60=i*n;
			//add %61 = %60, %7 : int
			_61=_60+j;
			//update %5[%61] = %59 : int[] -> int[]
			z[_61] = _59;
//.blklab6
blklab6:;
			//mul %64 = %8, %1 : int
			_64=i*n;
			//add %65 = %64, %7 : int
			_65=_64+j;
			//indexof %66 = %3, %65 : int[]
			_66=x[_65];
			//mul %67 = %8, %1 : int
			_67=i*n;
			//add %68 = %67, %7 : int
			_68=_67+j;
			//indexof %69 = %4, %68 : int[]
			_69=y[_68];
			//invoke (%63) = (%66, %69) whiley/lang/Math:min : function(int,int)->(int)
			{
				_63 = min(_66, _69);
			}
			//add %70 = %8, %63 : int
			_70=i+_63;
			//mul %72 = %8, %1 : int
			_72=i*n;
			//add %73 = %72, %7 : int
			_73=_72+j;
			//indexof %74 = %4, %73 : int[]
			_74=y[_73];
			//mul %75 = %8, %1 : int
			_75=i*n;
			//add %76 = %75, %7 : int
			_76=_75+j;
			//indexof %77 = %5, %76 : int[]
			_77=z[_76];
			//invoke (%71) = (%74, %77) whiley/lang/Math:min : function(int,int)->(int)
			{
				_71 = min(_74, _77);
			}
			//add %78 = %7, %71 : int
			_78=j+_71;
			//invoke (%62) = (%70, %78) whiley/lang/Math:max : function(int,int)->(int)
			{
				_62 = max(_70, _78);
			}
			//mul %79 = %8, %1 : int
			_79=i*n;
			//add %80 = %79, %7 : int
			_80=_79+j;
			//update %0[%80] = %62 : int[] -> int[]
			moves[_80] = _62;
			//const %81 = 1 : int
			_81 = 1;
			//add %82 = %7, %81 : int
			_82=j+_81;
			//assign %7 = %82  : int
			j = _82;
			//const %83 = 1 : int
			_83 = 1;
			//add %84 = %8, %83 : int
			_84=i+_83;
			//assign %8 = %84  : int
			i = _84;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %85 = 1 : int
		_85 = 1;
		//add %86 = %6, %85 : int
		_86=s+_85;
		//assign %6 = %86  : int
		s = _86;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(x);
	_DEALLOC(y);
	_DEALLOC(z);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_17);
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
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	void* _19;
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
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
	max = _5;
	_TRANSFER_DEALLOC(max, _5);
	//ifis %1, null goto blklab7 : null|int
	if(max == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	n = *max;
	//const %9 = 0 : int
	_9 = 0;
	//mul %10 = %2, %2 : int
	_10=n*n;
	//arraygen %11 = [9; 10] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, _10, _9);
	_ADD_DEALLOC(_11);
	//assign %3 = %11  : int[]
	_DEALLOC(moves);
	_UPDATE_1DARRAY(moves, _11);
	_TRANSFER_DEALLOC(moves, _11);
	//invoke (%12) = (%3, %2) CoinGame_array:findMoves : function(int[],int)->(int[])
	{
		_DEALLOC(_12);
		_12 = _findMoves_(_1DARRAY_PARAM(moves), false, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_12));
		_RESET_DEALLOC(moves, "true-true-false" , "findMoves");
		_ADD_DEALLOC(_12);
	}
	//assign %3 = %12  : int[]
	_DEALLOC(moves);
	_UPDATE_1DARRAY(moves, _12);
	_TRANSFER_DEALLOC(moves, _12);
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
	_DEALLOC(_18);
	_NEW_1DARRAY_int64_t(_18, 50, 0);
	_18[0] = 84; _18[1] = 104; _18[2] = 101; _18[3] = 32; _18[4] = 116; _18[5] = 111; _18[6] = 116; _18[7] = 97; _18[8] = 108; _18[9] = 32; _18[10] = 97; _18[11] = 109; _18[12] = 111; _18[13] = 117; _18[14] = 110; _18[15] = 116; _18[16] = 32; _18[17] = 111; _18[18] = 102; _18[19] = 32; _18[20] = 109; _18[21] = 111; _18[22] = 110; _18[23] = 101; _18[24] = 121; _18[25] = 32; _18[26] = 40; _18[27] = 109; _18[28] = 97; _18[29] = 120; _18[30] = 105; _18[31] = 109; _18[32] = 117; _18[33] = 109; _18[34] = 41; _18[35] = 32; _18[36] = 65; _18[37] = 108; _18[38] = 105; _18[39] = 99; _18[40] = 101; _18[41] = 32; _18[42] = 103; _18[43] = 101; _18[44] = 116; _18[45] = 115; _18[46] = 32; _18[47] = 105; _18[48] = 115; _18[49] = 32; 
	_ADD_DEALLOC(_18);
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
	_DEALLOC(_23);
	_NEW_1DARRAY_int64_t(_23, 23, 0);
	_23[0] = 80; _23[1] = 97; _23[2] = 115; _23[3] = 115; _23[4] = 32; _23[5] = 67; _23[6] = 111; _23[7] = 105; _23[8] = 110; _23[9] = 71; _23[10] = 97; _23[11] = 109; _23[12] = 101; _23[13] = 32; _23[14] = 116; _23[15] = 101; _23[16] = 115; _23[17] = 116; _23[18] = 32; _23[19] = 99; _23[20] = 97; _23[21] = 115; _23[22] = 101; 
	_ADD_DEALLOC(_23);
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
//.blklab7
blklab7:;
	//return
	_DEALLOC(max);
	_DEALLOC(moves);
	_DEALLOC(_5);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_12);
	_DEALLOC(_18);
	_DEALLOC(_23);
	exit(0);
}

