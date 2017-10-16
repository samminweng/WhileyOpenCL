#include "CoinGame1.h"
int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), _DECL_DEALLOC_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t s;
	int64_t j;
	int64_t i;
	int64_t y;
	int64_t x;
	int64_t z;
	int64_t _9;
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
	_DEALLOC(_2);
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
	_DEALLOC(_7);
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	_ADD_DEALLOC(_7);
	//assign %2 = %7  : int[]
	_DEALLOC(moves);
	_COPY_1DARRAY_int64_t(moves, _7);
	_ADD_DEALLOC(moves);
	//invoke (%8) = (%2, %1) CoinGame1:findMoves : function(int[],int)->(int[])
	{
		void* tmp_moves_0;
		_COPY_1DARRAY_PARAM(moves, tmp_moves_0, int64_t);
		_DEALLOC(_8);
		_8 = _findMoves_(tmp_moves_0, moves_size, false, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_CALLER_DEALLOC(moves, "true-true-false" , "findMoves");
		_CALLER_DEALLOC_POST(_8, tmp_moves_0);
	}
	//assign %2 = %8  : int[]
	_DEALLOC(moves);
	_COPY_1DARRAY_int64_t(moves, _8);
	_ADD_DEALLOC(moves);
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
	_ADD_DEALLOC(_15);
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
	_ADD_DEALLOC(_20);
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

