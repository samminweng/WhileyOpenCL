#include "CoinGame3.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(moves);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(x);
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(y);
	_DECL_DEALLOC(y);
	_DECL_1DARRAY(z);
	_DECL_DEALLOC(z);
	int64_t s;
	int64_t j;
	int64_t i;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
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
	//const %9 = 0 : int
	_9 = 0;
	//arraygen %10 = [9; 1] : int[]
	_NEW1DARRAY_DEALLOC(_10, _9, n, int64_t);
	//assign %3 = %10  : int[]
	_ADD_DEALLOC(x, _10, int64_t);
	//const %11 = 0 : int
	_11 = 0;
	//arraygen %12 = [11; 1] : int[]
	_NEW1DARRAY_DEALLOC(_12, _11, n, int64_t);
	//assign %4 = %12  : int[]
	_ADD_DEALLOC(y, _12, int64_t);
	//const %13 = 0 : int
	_13 = 0;
	//arraygen %14 = [13; 1] : int[]
	_NEW1DARRAY_DEALLOC(_14, _13, n, int64_t);
	//assign %5 = %14  : int[]
	_ADD_DEALLOC(z, _14, int64_t);
	//const %15 = 0 : int
	_15 = 0;
	//assign %6 = %15  : int
	s = _15;
	//loop (%0, %3, %4, %5, %6, %7, %8, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69)
	while(true){
		//ifge %6, %1 goto blklab0 : int
		if(s>=n){goto blklab0;}
		//assign %7 = %6  : int
		j = s;
		//const %16 = 0 : int
		_16 = 0;
		//assign %8 = %16  : int
		i = _16;
		//loop (%0, %3, %4, %5, %7, %8, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67)
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
			//indexof %23 = %4, %8 : int[]
			_23=y[i];
			//const %24 = 1 : int
			_24 = 1;
			//add %25 = %8, %24 : int
			_25=i+_24;
			//mul %26 = %25, %1 : int
			_26=_25*n;
			//add %27 = %26, %7 : int
			_27=_26+j;
			//const %28 = 1 : int
			_28 = 1;
			//sub %29 = %27, %28 : int
			_29=_27-_28;
			//indexof %30 = %0, %29 : int[]
			_30=moves[_29];
			//add %31 = %23, %30 : int
			_31=_23+_30;
			//update %4[%8] = %31 : int[] -> int[]
			y[i] = _31;
//.blklab4
blklab4:;
			//const %32 = 0 : int
			_32 = 0;
			//update %3[%8] = %32 : int[] -> int[]
			x[i] = _32;
			//const %33 = 2 : int
			_33 = 2;
			//add %34 = %8, %33 : int
			_34=i+_33;
			//ifge %34, %1 goto blklab5 : int
			if(_34>=n){goto blklab5;}
			//indexof %35 = %3, %8 : int[]
			_35=x[i];
			//const %36 = 2 : int
			_36 = 2;
			//add %37 = %8, %36 : int
			_37=i+_36;
			//mul %38 = %37, %1 : int
			_38=_37*n;
			//add %39 = %38, %7 : int
			_39=_38+j;
			//indexof %40 = %0, %39 : int[]
			_40=moves[_39];
			//add %41 = %35, %40 : int
			_41=_35+_40;
			//update %3[%8] = %41 : int[] -> int[]
			x[i] = _41;
//.blklab5
blklab5:;
			//const %42 = 0 : int
			_42 = 0;
			//update %5[%8] = %42 : int[] -> int[]
			z[i] = _42;
			//const %43 = 1 : int
			_43 = 1;
			//sub %44 = %7, %43 : int
			_44=j-_43;
			//const %45 = 0 : int
			_45 = 0;
			//ifle %44, %45 goto blklab6 : int
			if(_44<=_45){goto blklab6;}
			//indexof %46 = %5, %8 : int[]
			_46=z[i];
			//mul %47 = %8, %1 : int
			_47=i*n;
			//add %48 = %47, %7 : int
			_48=_47+j;
			//const %49 = 2 : int
			_49 = 2;
			//sub %50 = %48, %49 : int
			_50=_48-_49;
			//indexof %51 = %0, %50 : int[]
			_51=moves[_50];
			//add %52 = %46, %51 : int
			_52=_46+_51;
			//update %5[%8] = %52 : int[] -> int[]
			z[i] = _52;
//.blklab6
blklab6:;
			//indexof %55 = %3, %8 : int[]
			_55=x[i];
			//indexof %56 = %4, %8 : int[]
			_56=y[i];
			//invoke (%54) = (%55, %56) whiley/lang/Math:min : function(int,int)->(int)
			{
				_54 = min(_55, _56);
			}
			//add %57 = %8, %54 : int
			_57=i+_54;
			//indexof %59 = %4, %8 : int[]
			_59=y[i];
			//indexof %60 = %5, %8 : int[]
			_60=z[i];
			//invoke (%58) = (%59, %60) whiley/lang/Math:min : function(int,int)->(int)
			{
				_58 = min(_59, _60);
			}
			//add %61 = %7, %58 : int
			_61=j+_58;
			//invoke (%53) = (%57, %61) whiley/lang/Math:max : function(int,int)->(int)
			{
				_53 = max(_57, _61);
			}
			//mul %62 = %8, %1 : int
			_62=i*n;
			//add %63 = %62, %7 : int
			_63=_62+j;
			//update %0[%63] = %53 : int[] -> int[]
			moves[_63] = _53;
			//const %64 = 1 : int
			_64 = 1;
			//add %65 = %7, %64 : int
			_65=j+_64;
			//assign %7 = %65  : int
			j = _65;
			//const %66 = 1 : int
			_66 = 1;
			//add %67 = %8, %66 : int
			_67=i+_66;
			//assign %8 = %67  : int
			i = _67;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %68 = 1 : int
		_68 = 1;
		//add %69 = %6, %68 : int
		_69=s+_68;
		//assign %6 = %69  : int
		s = _69;
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
	_DEALLOC(_10);
	_DEALLOC(_12);
	_DEALLOC(_14);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(moves);
	return moves;
	//return
}

int main(int argc, char** args){
	int64_t n;
	_DECL_1DARRAY(moves);
	_DECL_DEALLOC(moves);
	int64_t sum_alice;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	void* _13;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	void* _16;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	//const %4 = 10 : int
	_4 = 10;
	//assign %1 = %4  : int
	n = _4;
	//const %5 = 0 : int
	_5 = 0;
	//mul %6 = %1, %1 : int
	_6=n*n;
	//arraygen %7 = [5; 6] : int[]
	_NEW1DARRAY_DEALLOC(_7, _5, _6, int64_t);
	//assign %2 = %7  : int[]
	_ADD_DEALLOC(moves, _7, int64_t);
	//invoke (%8) = (%2, %1) CoinGame3:findMoves : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_8, moves, "true-MAYBE_RETURN-false" , "findMoves");
		_DEALLOC(_8);
		void* tmp_moves;
		_COPY_1DARRAY_PARAM(moves, tmp_moves, int64_t);
		_8 = _findMoves_(tmp_moves, moves_size, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		if(_8 != tmp_moves ){
			free(tmp_moves);
		}
		_8_dealloc = true;
	}
	//assign %2 = %8  : int[]
	_ADD_DEALLOC(moves, _8, int64_t);
	//const %9 = 1 : int
	_9 = 1;
	//sub %10 = %1, %9 : int
	_10=n-_9;
	//indexof %11 = %2, %10 : int[]
	_11=moves[_10];
	//assign %3 = %11  : int
	sum_alice = _11;
	//assert
	{
		//const %12 = 25 : int
		_12 = 25;
		//ifeq %3, %12 goto blklab7 : int
		if(sum_alice==_12){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %15 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_DEALLOC(_15);
	_NEW_1DARRAY_int64_t(_15, 50, 0);
	_15[0] = 84; _15[1] = 104; _15[2] = 101; _15[3] = 32; _15[4] = 116; _15[5] = 111; _15[6] = 116; _15[7] = 97; _15[8] = 108; _15[9] = 32; _15[10] = 97; _15[11] = 109; _15[12] = 111; _15[13] = 117; _15[14] = 110; _15[15] = 116; _15[16] = 32; _15[17] = 111; _15[18] = 102; _15[19] = 32; _15[20] = 109; _15[21] = 111; _15[22] = 110; _15[23] = 101; _15[24] = 121; _15[25] = 32; _15[26] = 40; _15[27] = 109; _15[28] = 97; _15[29] = 120; _15[30] = 105; _15[31] = 109; _15[32] = 117; _15[33] = 109; _15[34] = 41; _15[35] = 32; _15[36] = 65; _15[37] = 108; _15[38] = 105; _15[39] = 99; _15[40] = 101; _15[41] = 32; _15[42] = 103; _15[43] = 101; _15[44] = 116; _15[45] = 115; _15[46] = 32; _15[47] = 105; _15[48] = 115; _15[49] = 32; 
	_15_dealloc = true;
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
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 23, 0);
	_20[0] = 80; _20[1] = 97; _20[2] = 115; _20[3] = 115; _20[4] = 32; _20[5] = 67; _20[6] = 111; _20[7] = 105; _20[8] = 110; _20[9] = 71; _20[10] = 97; _20[11] = 109; _20[12] = 101; _20[13] = 32; _20[14] = 116; _20[15] = 101; _20[16] = 115; _20[17] = 116; _20[18] = 32; _20[19] = 99; _20[20] = 97; _20[21] = 115; _20[22] = 101; 
	_20_dealloc = true;
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//return
	_DEALLOC(moves);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_15);
	_DEALLOC(_20);
	exit(0);
}

