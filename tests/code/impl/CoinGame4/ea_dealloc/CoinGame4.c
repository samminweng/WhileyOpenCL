#include "CoinGame4.h"
void _play_(FILE* sys, _DECL_1DARRAY_PARAM(moves), int64_t n){
	_DECL_DEALLOC(moves);
	int64_t left;
	int64_t right;
	int64_t i;
	int64_t sum_alice;
	int64_t sum_bob;
	int64_t coin;
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
	void* _33;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	void* _36;
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	void* _39;
	void* _41;
	_DECL_1DARRAY(_43);
	_DECL_DEALLOC(_43);
	void* _44;
	void* _46;
	_DECL_1DARRAY(_48);
	_DECL_DEALLOC(_48);
	int64_t _49;
	int64_t _50;
	int64_t _51;
	int64_t _52;
	void* _53;
	_DECL_1DARRAY(_55);
	_DECL_DEALLOC(_55);
	int64_t _56;
	void* _57;
	_DECL_1DARRAY(_59);
	_DECL_DEALLOC(_59);
	int64_t _60;
	int64_t _61;
	void* _62;
	_DECL_1DARRAY(_64);
	_DECL_DEALLOC(_64);
	void* _65;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	left = _9;
	//const %10 = 1 : int
	_10 = 1;
	//sub %11 = %2, %10 : int
	_11=n-_10;
	//assign %4 = %11  : int
	right = _11;
	//const %12 = 0 : int
	_12 = 0;
	//assign %5 = %12  : int
	i = _12;
	//const %13 = 0 : int
	_13 = 0;
	//assign %6 = %13  : int
	sum_alice = _13;
	//const %14 = 0 : int
	_14 = 0;
	//assign %7 = %14  : int
	sum_bob = _14;
	//loop (%3, %4, %5, %6, %7, %8, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61)
	while(true){
		//ifge %5, %2 goto blklab0 : int
		if(i>=n){goto blklab0;}
		//const %15 = 0 : int
		_15 = 0;
		//assign %8 = %15  : int
		coin = _15;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %3, %16 : int
		_17=left+_16;
		//mul %18 = %17, %2 : int
		_18=_17*n;
		//add %19 = %18, %4 : int
		_19=_18+right;
		//indexof %20 = %1, %19 : int[]
		_20=moves[_19];
		//mul %21 = %3, %2 : int
		_21=left*n;
		//add %22 = %21, %4 : int
		_22=_21+right;
		//const %23 = 1 : int
		_23 = 1;
		//sub %24 = %22, %23 : int
		_24=_22-_23;
		//indexof %25 = %1, %24 : int[]
		_25=moves[_24];
		//ifgt %20, %25 goto blklab2 : int
		if(_20>_25){goto blklab2;}
		//assign %8 = %3  : int
		coin = left;
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %3, %26 : int
		_27=left+_26;
		//assign %3 = %27  : int
		left = _27;
		//goto blklab3
		goto blklab3;
//.blklab2
blklab2:;
		//assign %8 = %4  : int
		coin = right;
		//const %28 = 1 : int
		_28 = 1;
		//sub %29 = %4, %28 : int
		_29=right-_28;
		//assign %4 = %29  : int
		right = _29;
//.blklab3
blklab3:;
		//const %30 = 2 : int
		_30 = 2;
		//rem %31 = %5, %30 : int
		_31=i%_30;
		//const %32 = 0 : int
		_32 = 0;
		//ifne %31, %32 goto blklab4 : int
		if(_31!=_32){goto blklab4;}
		//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %35 = [65,108,105,99,101,32,116,97,107,101,32,99,111,105,110,32,40,32] : int[]
		_DEALLOC(_35);
		_NEW_1DARRAY_int64_t(_35, 18, 0);
		_35[0] = 65; _35[1] = 108; _35[2] = 105; _35[3] = 99; _35[4] = 101; _35[5] = 32; _35[6] = 116; _35[7] = 97; _35[8] = 107; _35[9] = 101; _35[10] = 32; _35[11] = 99; _35[12] = 111; _35[13] = 105; _35[14] = 110; _35[15] = 32; _35[16] = 40; _35[17] = 32; 
		_35_dealloc = true;
		//indirectinvoke () = %34 (%35) : method(int[])->()
		{
			printf_s(_35, _35_size);
		}
		//goto blklab5
		goto blklab5;
//.blklab4
blklab4:;
		//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %37 = %36 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %38 = [66,111,98,32,116,97,107,101,32,99,111,105,110,32,40,32] : int[]
		_DEALLOC(_38);
		_NEW_1DARRAY_int64_t(_38, 16, 0);
		_38[0] = 66; _38[1] = 111; _38[2] = 98; _38[3] = 32; _38[4] = 116; _38[5] = 97; _38[6] = 107; _38[7] = 101; _38[8] = 32; _38[9] = 99; _38[10] = 111; _38[11] = 105; _38[12] = 110; _38[13] = 32; _38[14] = 40; _38[15] = 32; 
		_38_dealloc = true;
		//indirectinvoke () = %37 (%38) : method(int[])->()
		{
			printf_s(_38, _38_size);
		}
//.blklab5
blklab5:;
		//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %40 = %39 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %40 (%5) : method(any)->()
		{
			printf("%"PRId64, i);
		}
		//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %42 = %41 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %43 = [32,44,32] : int[]
		_DEALLOC(_43);
		_NEW_1DARRAY_int64_t(_43, 3, 0);
		_43[0] = 32; _43[1] = 44; _43[2] = 32; 
		_43_dealloc = true;
		//indirectinvoke () = %42 (%43) : method(int[])->()
		{
			printf_s(_43, _43_size);
		}
		//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %45 = %44 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %45 (%8) : method(any)->()
		{
			printf("%"PRId64, coin);
		}
		//fieldload %46 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %47 = %46 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %48 = [32,41] : int[]
		_DEALLOC(_48);
		_NEW_1DARRAY_int64_t(_48, 2, 0);
		_48[0] = 32; _48[1] = 41; 
		_48_dealloc = true;
		//indirectinvoke () = %47 (%48) : method(int[])->()
		{
			printf_s(_48, _48_size);
		}
		//const %49 = 2 : int
		_49 = 2;
		//rem %50 = %5, %49 : int
		_50=i%_49;
		//const %51 = 0 : int
		_51 = 0;
		//ifne %50, %51 goto blklab6 : int
		if(_50!=_51){goto blklab6;}
		//add %52 = %6, %8 : int
		_52=sum_alice+coin;
		//assign %6 = %52  : int
		sum_alice = _52;
		//fieldload %53 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %54 = %53 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %55 = [44,32] : int[]
		_DEALLOC(_55);
		_NEW_1DARRAY_int64_t(_55, 2, 0);
		_55[0] = 44; _55[1] = 32; 
		_55_dealloc = true;
		//indirectinvoke () = %54 (%55) : method(int[])->()
		{
			printf_s(_55, _55_size);
		}
		//goto blklab7
		goto blklab7;
//.blklab6
blklab6:;
		//add %56 = %7, %8 : int
		_56=sum_bob+coin;
		//assign %7 = %56  : int
		sum_bob = _56;
		//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %58 = %57 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %59 = [32] : int[]
		_DEALLOC(_59);
		_NEW_1DARRAY_int64_t(_59, 1, 0);
		_59[0] = 32; 
		_59_dealloc = true;
		//indirectinvoke () = %58 (%59) : method(int[])->()
		{
			println_s(_59, _59_size);
		}
//.blklab7
blklab7:;
		//const %60 = 1 : int
		_60 = 1;
		//add %61 = %5, %60 : int
		_61=i+_60;
		//assign %5 = %61  : int
		i = _61;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//assert
	{
		//ifge %6, %7 goto blklab8 : int
		if(sum_alice>=sum_bob){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %62 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %63 = %62 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %64 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,66,111,98,32,103,101,116,115,32,105,115,32] : int[]
	_DEALLOC(_64);
	_NEW_1DARRAY_int64_t(_64, 48, 0);
	_64[0] = 84; _64[1] = 104; _64[2] = 101; _64[3] = 32; _64[4] = 116; _64[5] = 111; _64[6] = 116; _64[7] = 97; _64[8] = 108; _64[9] = 32; _64[10] = 97; _64[11] = 109; _64[12] = 111; _64[13] = 117; _64[14] = 110; _64[15] = 116; _64[16] = 32; _64[17] = 111; _64[18] = 102; _64[19] = 32; _64[20] = 109; _64[21] = 111; _64[22] = 110; _64[23] = 101; _64[24] = 121; _64[25] = 32; _64[26] = 40; _64[27] = 109; _64[28] = 97; _64[29] = 120; _64[30] = 105; _64[31] = 109; _64[32] = 117; _64[33] = 109; _64[34] = 41; _64[35] = 32; _64[36] = 66; _64[37] = 111; _64[38] = 98; _64[39] = 32; _64[40] = 103; _64[41] = 101; _64[42] = 116; _64[43] = 115; _64[44] = 32; _64[45] = 105; _64[46] = 115; _64[47] = 32; 
	_64_dealloc = true;
	//indirectinvoke () = %63 (%64) : method(int[])->()
	{
		printf_s(_64, _64_size);
	}
	//fieldload %65 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %66 = %65 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %66 (%7) : method(any)->()
	{
		printf("%"PRId64"\n", sum_bob);
	}
	//return
	_DEALLOC(moves);
	_DEALLOC(_35);
	_DEALLOC(_38);
	_DEALLOC(_43);
	_DEALLOC(_48);
	_DEALLOC(_55);
	_DEALLOC(_59);
	_DEALLOC(_64);
	return;
}

int64_t _findMin_(int64_t a, int64_t b){
	int64_t _2;
	//ifge %0, %1 goto blklab9 : int
	if(a>=b){goto blklab9;}
	//return %0
	return a;
//.blklab9
blklab9:;
	//return %1
	return b;
	//return
}

int64_t _findMax_(int64_t a, int64_t b){
	int64_t _2;
	//ifle %0, %1 goto blklab10 : int
	if(a<=b){goto blklab10;}
	//return %0
	return a;
//.blklab10
blklab10:;
	//return %1
	return b;
	//return
}

int64_t* _pickCoin_(_DECL_1DARRAY_PARAM(moves), int64_t i, int64_t j, int64_t n, int64_t x, int64_t y, int64_t z, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(moves);
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	//invoke (%9) = (%4, %5) CoinGame4:findMin : function(int,int)->(int)
	{
		_9 = _findMin_(x, y);
	}
	//add %10 = %1, %9 : int
	_10=i+_9;
	//invoke (%11) = (%5, %6) CoinGame4:findMin : function(int,int)->(int)
	{
		_11 = _findMin_(y, z);
	}
	//add %12 = %2, %11 : int
	_12=j+_11;
	//invoke (%8) = (%10, %12) CoinGame4:findMax : function(int,int)->(int)
	{
		_8 = _findMax_(_10, _12);
	}
	//mul %13 = %1, %3 : int
	_13=i*n;
	//add %14 = %13, %2 : int
	_14=_13+j;
	//update %0[%14] = %8 : int[] -> int[]
	moves[_14] = _8;
	//return %0
	_DEALLOC(_7);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(moves);
	return moves;
	//return
}

int64_t* _findMoves_(_DECL_1DARRAY_PARAM(moves), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(moves);
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
	_DECL_1DARRAY(_41);
	_DECL_DEALLOC(_41);
	int64_t _42;
	int64_t _43;
	int64_t _44;
	int64_t _45;
	int64_t _46;
	int64_t _47;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47)
	while(true){
		//ifge %3, %1 goto blklab11 : int
		if(s>=n){goto blklab11;}
		//assign %4 = %3  : int
		j = s;
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		i = _10;
		//loop (%0, %4, %5, %6, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45)
		while(true){
			//ifge %4, %1 goto blklab13 : int
			if(j>=n){goto blklab13;}
			//const %11 = 0 : int
			_11 = 0;
			//assign %6 = %11  : int
			y = _11;
			//const %12 = 1 : int
			_12 = 1;
			//add %13 = %5, %12 : int
			_13=i+_12;
			//ifge %13, %1 goto blklab15 : int
			if(_13>=n){goto blklab15;}
			//const %14 = 1 : int
			_14 = 1;
			//sub %15 = %4, %14 : int
			_15=j-_14;
			//const %16 = 0 : int
			_16 = 0;
			//iflt %15, %16 goto blklab15 : int
			if(_15<_16){goto blklab15;}
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
//.blklab15
blklab15:;
			//const %24 = 0 : int
			_24 = 0;
			//assign %7 = %24  : int
			x = _24;
			//const %25 = 2 : int
			_25 = 2;
			//add %26 = %5, %25 : int
			_26=i+_25;
			//ifge %26, %1 goto blklab16 : int
			if(_26>=n){goto blklab16;}
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
//.blklab16
blklab16:;
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
			//ifle %34, %35 goto blklab17 : int
			if(_34<=_35){goto blklab17;}
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
//.blklab17
blklab17:;
			//invoke (%41) = (%0, %5, %4, %1, %7, %6, %8) CoinGame4:pickCoin : function(int[],int,int,int,int,int,int)->(int[])
			{
				_FUNCTIONCALL_COPY_PRE(_41, moves, 0, "liveness: moves = false, readonly: moves = false, return:moves = ALWAYS_RETURN" , "pickCoin");
				_DEALLOC(_41);
				void* tmp_moves;
				_COPY_1DARRAY_PARAM(moves, tmp_moves, int64_t);
				_41 = _pickCoin_(tmp_moves, moves_size, i, j, n, x, y, z, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_41));
				_41_dealloc = true;
			}
			//assign %0 = %41  : int[]
			_ADD_DEALLOC(moves, _41, int64_t);
			//const %42 = 1 : int
			_42 = 1;
			//add %43 = %4, %42 : int
			_43=j+_42;
			//assign %4 = %43  : int
			j = _43;
			//const %44 = 1 : int
			_44 = 1;
			//add %45 = %5, %44 : int
			_45=i+_44;
			//assign %5 = %45  : int
			i = _45;
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
		//const %46 = 1 : int
		_46 = 1;
		//add %47 = %3, %46 : int
		_47=s+_46;
		//assign %3 = %47  : int
		s = _47;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(_41);
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
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
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
	//invoke (%8) = (%2, %1) CoinGame4:findMoves : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_8, moves, 0, "liveness: moves = false, readonly: moves = false, return:moves = MAYBE_RETURN" , "findMoves");
		_DEALLOC(_8);
		void* tmp_moves;
		_COPY_1DARRAY_PARAM(moves, tmp_moves, int64_t);
		_8 = _findMoves_(tmp_moves, moves_size, n, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		if( _8 == tmp_moves ){
			_8_dealloc = true;
		} else {
			_8_dealloc = true;
			free(tmp_moves);
		}
	}
	//assign %2 = %8  : int[]
	_ADD_DEALLOC(moves, _8, int64_t);
	//invoke () = (%0, %2, %1) CoinGame4:play : method(whiley/lang/System:Console,int[],int)->()
	{
		_FUNCTIONCALL_COPY_PRE(, moves, 1, "liveness: moves = true, readonly: moves = true, return:moves = NEVER_RETURN" , "play");
		void* tmp_moves;
		_COPY_1DARRAY_PARAM(moves, tmp_moves, int64_t);
		_play_(stdout, tmp_moves, moves_size, n);
		free(tmp_moves);
	}
	//const %9 = 1 : int
	_9 = 1;
	//sub %10 = %1, %9 : int
	_10=n-_9;
	//indexof %11 = %2, %10 : int[]
	_11=moves[_10];
	//assign %3 = %11  : int
	sum_alice = _11;
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, 50, 0);
	_14[0] = 84; _14[1] = 104; _14[2] = 101; _14[3] = 32; _14[4] = 116; _14[5] = 111; _14[6] = 116; _14[7] = 97; _14[8] = 108; _14[9] = 32; _14[10] = 97; _14[11] = 109; _14[12] = 111; _14[13] = 117; _14[14] = 110; _14[15] = 116; _14[16] = 32; _14[17] = 111; _14[18] = 102; _14[19] = 32; _14[20] = 109; _14[21] = 111; _14[22] = 110; _14[23] = 101; _14[24] = 121; _14[25] = 32; _14[26] = 40; _14[27] = 109; _14[28] = 97; _14[29] = 120; _14[30] = 105; _14[31] = 109; _14[32] = 117; _14[33] = 109; _14[34] = 41; _14[35] = 32; _14[36] = 65; _14[37] = 108; _14[38] = 105; _14[39] = 99; _14[40] = 101; _14[41] = 32; _14[42] = 103; _14[43] = 101; _14[44] = 116; _14[45] = 115; _14[46] = 32; _14[47] = 105; _14[48] = 115; _14[49] = 32; 
	_14_dealloc = true;
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", sum_alice);
	}
	//assert
	{
		//const %17 = 25 : int
		_17 = 25;
		//ifeq %3, %17 goto blklab18 : int
		if(sum_alice==_17){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//return
	_DEALLOC(moves);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_14);
	exit(0);
}

