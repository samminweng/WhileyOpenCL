#include "CoinGame2.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t s;
	_DECL_1DARRAY(x);
	_DECL_1DARRAY(y);
	_DECL_1DARRAY(z);
	int64_t j;
	int64_t i;
	int64_t _9;
	int64_t _10;
	_DECL_1DARRAY(_11);
	int64_t _12;
	_DECL_1DARRAY(_13);
	int64_t _14;
	_DECL_1DARRAY(_15);
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
	int64_t _44;
	int64_t _45;
	int64_t _46;
	int64_t _47;
	int64_t _48;
	int64_t _49;
	int64_t _50;
	int64_t _51;
	int64_t _52;
	int64_t _53;
	int64_t _54;
	int64_t _55;
	int64_t _56;
	int64_t _57;
	int64_t _58;
	int64_t _59;
	int64_t _60;
	int64_t _61;
	int64_t _62;
	int64_t _63;
	int64_t _64;
	int64_t _65;
	int64_t _66;
	int64_t _67;
	int64_t _68;
	int64_t _69;
	int64_t _70;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70)
	while(true){
		//ifge %3, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//const %10 = 0 : int
		_10 = 0;
		//arraygen %11 = [10; 1] : int[]
		_NEW_1DARRAY_int64_t(_11, n, _10);
		//assign %4 = %11  : int[]
		// isCopyEliminated = true
		_UPDATE_1DARRAY(x, _11);
		//const %12 = 0 : int
		_12 = 0;
		//arraygen %13 = [12; 1] : int[]
		_NEW_1DARRAY_int64_t(_13, n, _12);
		//assign %5 = %13  : int[]
		// isCopyEliminated = true
		_UPDATE_1DARRAY(y, _13);
		//const %14 = 0 : int
		_14 = 0;
		//arraygen %15 = [14; 1] : int[]
		_NEW_1DARRAY_int64_t(_15, n, _14);
		//assign %6 = %15  : int[]
		// isCopyEliminated = true
		_UPDATE_1DARRAY(z, _15);
		//assign %7 = %3  : int
		// isCopyEliminated = false
		j = s;
		//const %16 = 0 : int
		_16 = 0;
		//assign %8 = %16  : int
		// isCopyEliminated = true
		i = _16;
		//loop (%0, %4, %5, %6, %7, %8, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68)
		while(true){
			//ifge %7, %1 goto blklab2 : int
			if(j>=n){goto blklab2;}
			//const %17 = 0 : int
			_17 = 0;
			//update %5[%8] = %17 : int[] -> int[]
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
			//update %5[%8] = %29 : int[] -> int[]
			y[i] = _29;
//.blklab4
blklab4:;
			//const %30 = 0 : int
			_30 = 0;
			//update %4[%8] = %30 : int[] -> int[]
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
			//update %4[%8] = %37 : int[] -> int[]
			x[i] = _37;
//.blklab5
blklab5:;
			//const %38 = 0 : int
			_38 = 0;
			//update %6[%8] = %38 : int[] -> int[]
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
			//update %6[%8] = %46 : int[] -> int[]
			z[i] = _46;
//.blklab6
blklab6:;
			//indexof %47 = %4, %8 : int[]
			_47=x[i];
			//indexof %48 = %5, %8 : int[]
			_48=y[i];
			//ifle %47, %48 goto blklab7 : int
			if(_47<=_48){goto blklab7;}
			//indexof %49 = %5, %8 : int[]
			_49=y[i];
			//update %4[%8] = %49 : int[] -> int[]
			x[i] = _49;
//.blklab7
blklab7:;
			//indexof %50 = %6, %8 : int[]
			_50=z[i];
			//indexof %51 = %5, %8 : int[]
			_51=y[i];
			//ifle %50, %51 goto blklab8 : int
			if(_50<=_51){goto blklab8;}
			//indexof %52 = %5, %8 : int[]
			_52=y[i];
			//update %6[%8] = %52 : int[] -> int[]
			z[i] = _52;
//.blklab8
blklab8:;
			//indexof %53 = %4, %8 : int[]
			_53=x[i];
			//add %54 = %8, %53 : int
			_54=i+_53;
			//indexof %55 = %6, %8 : int[]
			_55=z[i];
			//add %56 = %7, %55 : int
			_56=j+_55;
			//ifle %54, %56 goto blklab9 : int
			if(_54<=_56){goto blklab9;}
			//indexof %57 = %4, %8 : int[]
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
			//indexof %61 = %6, %8 : int[]
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
			// isCopyEliminated = true
			j = _66;
			//const %67 = 1 : int
			_67 = 1;
			//add %68 = %8, %67 : int
			_68=i+_67;
			//assign %8 = %68  : int
			// isCopyEliminated = true
			i = _68;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %69 = 1 : int
		_69 = 1;
		//add %70 = %3, %69 : int
		_70=s+_69;
		//assign %3 = %70  : int
		// isCopyEliminated = true
		s = _70;
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
	int64_t n;
	_DECL_1DARRAY(moves);
	int64_t sum_alice;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_1DARRAY(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	void* _13;
	_DECL_1DARRAY(_15);
	void* _16;
	void* _18;
	_DECL_1DARRAY(_20);
	//const %4 = 10 : int
	_4 = 10;
	//assign %1 = %4  : int
	// isCopyEliminated = true
	n = _4;
	//const %5 = 0 : int
	_5 = 0;
	//mul %6 = %1, %1 : int
	_6=n*n;
	//arraygen %7 = [5; 6] : int[]
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	//assign %2 = %7  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _7);
	//invoke (%8) = (%2, %1) CoinGame2:findMoves : function(int[],int)->(int[])
	{
		// isCopyEliminated of 'moves at 0' = true
		_8 = _findMoves_(moves, moves_size, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %2 = %8  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(moves, _8);
	//const %9 = 1 : int
	_9 = 1;
	//sub %10 = %1, %9 : int
	_10=n-_9;
	//indexof %11 = %2, %10 : int[]
	_11=moves[_10];
	//assign %3 = %11  : int
	// isCopyEliminated = true
	sum_alice = _11;
	//assert
	{
		//const %12 = 25 : int
		_12 = 25;
		//ifeq %3, %12 goto blklab11 : int
		if(sum_alice==_12){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %15 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_1DARRAY_int64_t(_15, 50, 0);
	_15[0] = 84; _15[1] = 104; _15[2] = 101; _15[3] = 32; _15[4] = 116; _15[5] = 111; _15[6] = 116; _15[7] = 97; _15[8] = 108; _15[9] = 32; _15[10] = 97; _15[11] = 109; _15[12] = 111; _15[13] = 117; _15[14] = 110; _15[15] = 116; _15[16] = 32; _15[17] = 111; _15[18] = 102; _15[19] = 32; _15[20] = 109; _15[21] = 111; _15[22] = 110; _15[23] = 101; _15[24] = 121; _15[25] = 32; _15[26] = 40; _15[27] = 109; _15[28] = 97; _15[29] = 120; _15[30] = 105; _15[31] = 109; _15[32] = 117; _15[33] = 109; _15[34] = 41; _15[35] = 32; _15[36] = 65; _15[37] = 108; _15[38] = 105; _15[39] = 99; _15[40] = 101; _15[41] = 32; _15[42] = 103; _15[43] = 101; _15[44] = 116; _15[45] = 115; _15[46] = 32; _15[47] = 105; _15[48] = 115; _15[49] = 32; 
	//indirectinvoke () = %14 (%15) : method(int[])->()
	{
		printf_s(_15, _15_size);
	}
	//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %17 = %16 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %17 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [80,97,115,115,32,67,111,105,110,71,97,109,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_20, 23, 0);
	_20[0] = 80; _20[1] = 97; _20[2] = 115; _20[3] = 115; _20[4] = 32; _20[5] = 67; _20[6] = 111; _20[7] = 105; _20[8] = 110; _20[9] = 71; _20[10] = 97; _20[11] = 109; _20[12] = 101; _20[13] = 32; _20[14] = 116; _20[15] = 101; _20[16] = 115; _20[17] = 116; _20[18] = 32; _20[19] = 99; _20[20] = 97; _20[21] = 115; _20[22] = 101; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//return
	exit(0);
}

