#include "CoinGame4.h"
long long* pickCoin(_DECL_1DARRAY_PARAM(moves), _DECL_OWNERSHIP_PARAM(moves), long long i, long long j, long long n, long long x, long long y, long long z){
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	//add %8 = %1, %4 : int
	_8=i+x;
	//add %9 = %2, %6 : int
	_9=j+z;
	//ifle %8, %9 goto blklab0 : int
	if(_8<=_9){goto blklab0;}
	//add %10 = %1, %4 : int
	_10=i+x;
	//mul %11 = %1, %3 : int
	_11=i*n;
	//add %12 = %11, %2 : int
	_12=_11+j;
	//update %0[%12] = %10 : int[] -> int[]
	moves[_12] = _10;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//add %13 = %2, %6 : int
	_13=j+z;
	//mul %14 = %1, %3 : int
	_14=i*n;
	//add %15 = %14, %2 : int
	_15=_14+j;
	//update %0[%15] = %13 : int[] -> int[]
	moves[_15] = _13;
//.blklab1
blklab1:;
	//return %0
	_FREE(_7);
	return moves;
	//return
}

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
	_DECL_1DARRAY(_41);
	_DECL_OWNERSHIP(_41);
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	s = _9;
	//loop (%0, %3, %4, %5, %6, %7, %8, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47)
	while(true){
		//ifge %3, %1 goto blklab2 : int
		if(s>=n){goto blklab2;}
		//assign %4 = %3  : int
		j = s;
		//const %10 = 0 : int
		_10 = 0;
		//assign %5 = %10  : int
		i = _10;
		//loop (%0, %4, %5, %6, %7, %8, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45)
		while(true){
			//ifge %4, %1 goto blklab4 : int
			if(j>=n){goto blklab4;}
			//const %11 = 0 : int
			_11 = 0;
			//assign %6 = %11  : int
			y = _11;
			//const %12 = 1 : int
			_12 = 1;
			//add %13 = %5, %12 : int
			_13=i+_12;
			//ifge %13, %1 goto blklab6 : int
			if(_13>=n){goto blklab6;}
			//const %14 = 1 : int
			_14 = 1;
			//sub %15 = %4, %14 : int
			_15=j-_14;
			//const %16 = 0 : int
			_16 = 0;
			//iflt %15, %16 goto blklab6 : int
			if(_15<_16){goto blklab6;}
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
//.blklab6
blklab6:;
			//const %24 = 0 : int
			_24 = 0;
			//assign %7 = %24  : int
			x = _24;
			//const %25 = 2 : int
			_25 = 2;
			//add %26 = %5, %25 : int
			_26=i+_25;
			//ifge %26, %1 goto blklab7 : int
			if(_26>=n){goto blklab7;}
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
//.blklab7
blklab7:;
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
			//ifle %34, %35 goto blklab8 : int
			if(_34<=_35){goto blklab8;}
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
//.blklab8
blklab8:;
			//ifle %7, %6 goto blklab9 : int
			if(x<=y){goto blklab9;}
			//assign %7 = %6  : int
			x = y;
//.blklab9
blklab9:;
			//ifle %8, %6 goto blklab10 : int
			if(z<=y){goto blklab10;}
			//assign %8 = %6  : int
			z = y;
//.blklab10
blklab10:;
			//invoke (%41) = (%0, %5, %4, %1, %7, %6, %8) CoinGame4:pickCoin : function(int[],int,int,int,int,int,int)->(int[])
			_FREE(_41);
			_1DARRAY_SIZE(_41, moves);
			_41 = pickCoin(_1DARRAY_COPY_PARAM(moves), true, i, j, n, x, y, z);
			_ADD_OWNERSHIP(_41);
			//assign %0 = %41  : int[]
			_FREE(moves);
			_1DARRAY_COPY(moves, _41);
			_ADD_OWNERSHIP(moves);
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
//.blklab5
blklab5:;
		}
//.blklab4
blklab4:;
		//const %46 = 1 : int
		_46 = 1;
		//add %47 = %3, %46 : int
		_47=s+_46;
		//assign %3 = %47  : int
		s = _47;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %0
	_FREE(_2);
	_FREE(_41);
	return moves;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	_DECL_1DARRAY(moves);
	_DECL_OWNERSHIP(moves);
	long long sum_alice = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_OWNERSHIP(_14);
	void* _15;
	long long _17 = 0;
	//const %4 = 10 : int
	_4 = 10;
	//assign %1 = %4  : int
	n = _4;
	//const %5 = 0 : int
	_5 = 0;
	//mul %6 = %1, %1 : int
	_6=n*n;
	//arraygen %7 = [5; 6] : int[]
	_FREE(_7);
	_GEN_1DARRAY(_7, _6, _5);
	_ADD_OWNERSHIP(_7);
	//assign %2 = %7  : int[]
	_FREE(moves);
	_1DARRAY_COPY(moves, _7);
	_ADD_OWNERSHIP(moves);
	//invoke (%8) = (%2, %1) CoinGame4:findMoves : function(int[],int)->(int[])
	_FREE(_8);
	_1DARRAY_SIZE(_8, moves);
	_8 = findMoves(_1DARRAY_COPY_PARAM(moves), true, n);
	_ADD_OWNERSHIP(_8);
	//assign %2 = %8  : int[]
	_FREE(moves);
	_1DARRAY_COPY(moves, _8);
	_ADD_OWNERSHIP(moves);
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
	_FREE(_14);
	_NEW_ARRAY(_14, 50);
	_14[0] = 84; _14[1] = 104; _14[2] = 101; _14[3] = 32; _14[4] = 116; _14[5] = 111; _14[6] = 116; _14[7] = 97; _14[8] = 108; _14[9] = 32; _14[10] = 97; _14[11] = 109; _14[12] = 111; _14[13] = 117; _14[14] = 110; _14[15] = 116; _14[16] = 32; _14[17] = 111; _14[18] = 102; _14[19] = 32; _14[20] = 109; _14[21] = 111; _14[22] = 110; _14[23] = 101; _14[24] = 121; _14[25] = 32; _14[26] = 40; _14[27] = 109; _14[28] = 97; _14[29] = 120; _14[30] = 105; _14[31] = 109; _14[32] = 117; _14[33] = 109; _14[34] = 41; _14[35] = 32; _14[36] = 65; _14[37] = 108; _14[38] = 105; _14[39] = 99; _14[40] = 101; _14[41] = 32; _14[42] = 103; _14[43] = 101; _14[44] = 116; _14[45] = 115; _14[46] = 32; _14[47] = 105; _14[48] = 115; _14[49] = 32; 
	_ADD_OWNERSHIP(_14);
	//indirectinvoke () = %13 (%14) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_14));
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%3) : method(any)->()
	printf("%lld\n", sum_alice);
	//assert
	{
		//const %17 = 25 : int
		_17 = 25;
		//ifeq %3, %17 goto blklab11 : int
		if(sum_alice==_17){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//return
	_FREE(moves);
	_FREE(_7);
	_FREE(_8);
	_FREE(_14);
	exit(0);
}

