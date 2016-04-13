#include "CoinGame.h"
long long* init(long long n){
	_DECL_1DARRAY(_1);
	_DECL_1DARRAY(coins);
	long long i = 0;
	long long _4 = 0;
	_DECL_1DARRAY(_5);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 0] : int[]
	_GEN_1DARRAY(_5, n, _4);
	//assign %2 = %5  : int[]
	_1DARRAY_COPY(coins, _5);
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
	return coins;
	//return
}

void play(FILE* sys, _DECL_1DARRAY_PARAM(moves), _DECL_1DARRAY_PARAM(coins), long long n){
	long long left = 0;
	long long right = 0;
	long long i = 0;
	long long sum_alice = 0;
	long long sum_bob = 0;
	long long coin = 0;
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
	void* _36;
	_DECL_1DARRAY(_38);
	void* _39;
	_DECL_1DARRAY(_41);
	void* _42;
	void* _44;
	_DECL_1DARRAY(_46);
	void* _47;
	void* _49;
	_DECL_1DARRAY(_51);
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	void* _56;
	_DECL_1DARRAY(_58);
	long long _59 = 0;
	void* _60;
	_DECL_1DARRAY(_62);
	long long _63 = 0;
	long long _64 = 0;
	void* _65;
	_DECL_1DARRAY(_67);
	void* _68;
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	left = _10;
	//const %11 = 1 : int
	_11 = 1;
	//sub %12 = %3, %11 : int
	_12=n-_11;
	//assign %5 = %12  : int
	right = _12;
	//const %13 = 0 : int
	_13 = 0;
	//assign %6 = %13  : int
	i = _13;
	//const %14 = 0 : int
	_14 = 0;
	//assign %7 = %14  : int
	sum_alice = _14;
	//const %15 = 0 : int
	_15 = 0;
	//assign %8 = %15  : int
	sum_bob = _15;
	//loop (%4, %5, %6, %7, %8, %9, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64)
	while(true){
		//ifge %6, %3 goto blklab2 : int
		if(i>=n){goto blklab2;}
		//const %16 = 0 : int
		_16 = 0;
		//assign %9 = %16  : int
		coin = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %4, %17 : int
		_18=left+_17;
		//mul %19 = %18, %3 : int
		_19=_18*n;
		//add %20 = %19, %5 : int
		_20=_19+right;
		//indexof %21 = %1, %20 : int[]
		_21=moves[_20];
		//mul %22 = %4, %3 : int
		_22=left*n;
		//add %23 = %22, %5 : int
		_23=_22+right;
		//const %24 = 1 : int
		_24 = 1;
		//sub %25 = %23, %24 : int
		_25=_23-_24;
		//indexof %26 = %1, %25 : int[]
		_26=moves[_25];
		//ifgt %21, %26 goto blklab4 : int
		if(_21>_26){goto blklab4;}
		//indexof %27 = %2, %4 : int[]
		_27=coins[left];
		//assign %9 = %27  : int
		coin = _27;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %4, %28 : int
		_29=left+_28;
		//assign %4 = %29  : int
		left = _29;
		//goto blklab5
		goto blklab5;
//.blklab4
blklab4:;
		//indexof %30 = %2, %5 : int[]
		_30=coins[right];
		//assign %9 = %30  : int
		coin = _30;
		//const %31 = 1 : int
		_31 = 1;
		//sub %32 = %5, %31 : int
		_32=right-_31;
		//assign %5 = %32  : int
		right = _32;
//.blklab5
blklab5:;
		//const %33 = 2 : int
		_33 = 2;
		//rem %34 = %6, %33 : int
		_34=i%_33;
		//const %35 = 0 : int
		_35 = 0;
		//ifne %34, %35 goto blklab6 : int
		if(_34!=_35){goto blklab6;}
		//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %37 = %36 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %38 = [65,108,105,99,101,32,116,97,107,101,32,99,111,105,110,32,40,32] : int[]
		_NEW_ARRAY(_38, 18);
		_38[0] = 65; _38[1] = 108; _38[2] = 105; _38[3] = 99; _38[4] = 101; _38[5] = 32; _38[6] = 116; _38[7] = 97; _38[8] = 107; _38[9] = 101; _38[10] = 32; _38[11] = 99; _38[12] = 111; _38[13] = 105; _38[14] = 110; _38[15] = 32; _38[16] = 40; _38[17] = 32; 
		//indirectinvoke () = %37 (%38) : method(int[])->()
		printf_s(_1DARRAY_PARAM(_38));
		//goto blklab7
		goto blklab7;
//.blklab6
blklab6:;
		//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %40 = %39 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %41 = [66,111,98,32,116,97,107,101,32,99,111,105,110,32,40,32] : int[]
		_NEW_ARRAY(_41, 16);
		_41[0] = 66; _41[1] = 111; _41[2] = 98; _41[3] = 32; _41[4] = 116; _41[5] = 97; _41[6] = 107; _41[7] = 101; _41[8] = 32; _41[9] = 99; _41[10] = 111; _41[11] = 105; _41[12] = 110; _41[13] = 32; _41[14] = 40; _41[15] = 32; 
		//indirectinvoke () = %40 (%41) : method(int[])->()
		printf_s(_1DARRAY_PARAM(_41));
//.blklab7
blklab7:;
		//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %43 = %42 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %43 (%6) : method(any)->()
		printf("%lld", i);
		//fieldload %44 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %45 = %44 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %46 = [32,44,32] : int[]
		_NEW_ARRAY(_46, 3);
		_46[0] = 32; _46[1] = 44; _46[2] = 32; 
		//indirectinvoke () = %45 (%46) : method(int[])->()
		printf_s(_1DARRAY_PARAM(_46));
		//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %48 = %47 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %48 (%9) : method(any)->()
		printf("%lld", coin);
		//fieldload %49 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %50 = %49 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %51 = [32,41] : int[]
		_NEW_ARRAY(_51, 2);
		_51[0] = 32; _51[1] = 41; 
		//indirectinvoke () = %50 (%51) : method(int[])->()
		printf_s(_1DARRAY_PARAM(_51));
		//const %52 = 2 : int
		_52 = 2;
		//rem %53 = %6, %52 : int
		_53=i%_52;
		//const %54 = 0 : int
		_54 = 0;
		//ifne %53, %54 goto blklab8 : int
		if(_53!=_54){goto blklab8;}
		//add %55 = %7, %9 : int
		_55=sum_alice+coin;
		//assign %7 = %55  : int
		sum_alice = _55;
		//fieldload %56 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %57 = %56 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %58 = [44,32] : int[]
		_NEW_ARRAY(_58, 2);
		_58[0] = 44; _58[1] = 32; 
		//indirectinvoke () = %57 (%58) : method(int[])->()
		printf_s(_1DARRAY_PARAM(_58));
		//goto blklab9
		goto blklab9;
//.blklab8
blklab8:;
		//add %59 = %8, %9 : int
		_59=sum_bob+coin;
		//assign %8 = %59  : int
		sum_bob = _59;
		//fieldload %60 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %61 = %60 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %62 = [32] : int[]
		_NEW_ARRAY(_62, 1);
		_62[0] = 32; 
		//indirectinvoke () = %61 (%62) : method(int[])->()
		println_s(_1DARRAY_PARAM(_62));
//.blklab9
blklab9:;
		//const %63 = 1 : int
		_63 = 1;
		//add %64 = %6, %63 : int
		_64=i+_63;
		//assign %6 = %64  : int
		i = _64;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//assert
	{
		//ifge %7, %8 goto blklab10 : int
		if(sum_alice>=sum_bob){goto blklab10;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab10
blklab10:;
	//assert
	}
	//fieldload %65 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %66 = %65 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %67 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,66,111,98,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_ARRAY(_67, 48);
	_67[0] = 84; _67[1] = 104; _67[2] = 101; _67[3] = 32; _67[4] = 116; _67[5] = 111; _67[6] = 116; _67[7] = 97; _67[8] = 108; _67[9] = 32; _67[10] = 97; _67[11] = 109; _67[12] = 111; _67[13] = 117; _67[14] = 110; _67[15] = 116; _67[16] = 32; _67[17] = 111; _67[18] = 102; _67[19] = 32; _67[20] = 109; _67[21] = 111; _67[22] = 110; _67[23] = 101; _67[24] = 121; _67[25] = 32; _67[26] = 40; _67[27] = 109; _67[28] = 97; _67[29] = 120; _67[30] = 105; _67[31] = 109; _67[32] = 117; _67[33] = 109; _67[34] = 41; _67[35] = 32; _67[36] = 66; _67[37] = 111; _67[38] = 98; _67[39] = 32; _67[40] = 103; _67[41] = 101; _67[42] = 116; _67[43] = 115; _67[44] = 32; _67[45] = 105; _67[46] = 115; _67[47] = 32; 
	//indirectinvoke () = %66 (%67) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_67));
	//fieldload %68 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %69 = %68 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %69 (%8) : method(any)->()
	printf("%lld\n", sum_bob);
	//return
	return;
}

long long* findMoves(_DECL_1DARRAY_PARAM(coins), long long n){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(moves);
	long long s = 0;
	long long j = 0;
	long long i = 0;
	long long y = 0;
	long long x = 0;
	long long z = 0;
	long long _10 = 0;
	long long _11 = 0;
	_DECL_1DARRAY(_12);
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
	_GEN_1DARRAY(_12, _11, _10);
	//assign %3 = %12  : int[]
	_1DARRAY_COPY(moves, _12);
	//const %13 = 0 : int
	_13 = 0;
	//assign %4 = %13  : int
	s = _13;
	//loop (%3, %4, %5, %6, %7, %8, %9, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62)
	while(true){
		//ifge %4, %1 goto blklab11 : int
		if(s>=n){goto blklab11;}
		//assign %5 = %4  : int
		j = s;
		//const %14 = 0 : int
		_14 = 0;
		//assign %6 = %14  : int
		i = _14;
		//loop (%3, %5, %6, %7, %8, %9, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60)
		while(true){
			//ifge %5, %1 goto blklab13 : int
			if(j>=n){goto blklab13;}
			//const %15 = 0 : int
			_15 = 0;
			//assign %7 = %15  : int
			y = _15;
			//const %16 = 1 : int
			_16 = 1;
			//add %17 = %6, %16 : int
			_17=i+_16;
			//ifge %17, %1 goto blklab15 : int
			if(_17>=n){goto blklab15;}
			//const %18 = 1 : int
			_18 = 1;
			//sub %19 = %5, %18 : int
			_19=j-_18;
			//const %20 = 0 : int
			_20 = 0;
			//iflt %19, %20 goto blklab15 : int
			if(_19<_20){goto blklab15;}
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
//.blklab15
blklab15:;
			//const %28 = 0 : int
			_28 = 0;
			//assign %8 = %28  : int
			x = _28;
			//const %29 = 2 : int
			_29 = 2;
			//add %30 = %6, %29 : int
			_30=i+_29;
			//ifge %30, %1 goto blklab16 : int
			if(_30>=n){goto blklab16;}
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
//.blklab16
blklab16:;
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
			//ifle %38, %39 goto blklab17 : int
			if(_38<=_39){goto blklab17;}
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
//.blklab17
blklab17:;
			//ifle %8, %7 goto blklab18 : int
			if(x<=y){goto blklab18;}
			//assign %8 = %7  : int
			x = y;
//.blklab18
blklab18:;
			//ifle %9, %7 goto blklab19 : int
			if(z<=y){goto blklab19;}
			//assign %9 = %7  : int
			z = y;
//.blklab19
blklab19:;
			//indexof %45 = %0, %6 : int[]
			_45=coins[i];
			//add %46 = %45, %8 : int
			_46=_45+x;
			//indexof %47 = %0, %5 : int[]
			_47=coins[j];
			//add %48 = %47, %9 : int
			_48=_47+z;
			//ifle %46, %48 goto blklab20 : int
			if(_46<=_48){goto blklab20;}
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
			//goto blklab21
			goto blklab21;
//.blklab20
blklab20:;
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
//.blklab21
blklab21:;
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
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
		//const %61 = 1 : int
		_61 = 1;
		//add %62 = %4, %61 : int
		_62=s+_61;
		//assign %4 = %62  : int
		s = _62;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//return %3
	return moves;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	_DECL_1DARRAY(coins);
	_DECL_1DARRAY(moves);
	long long sum_alice = 0;
	long long _5 = 0;
	_DECL_1DARRAY(_6);
	_DECL_1DARRAY(_7);
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	long long _16 = 0;
	//const %5 = 10 : int
	_5 = 10;
	//assign %1 = %5  : int
	n = _5;
	//invoke (%6) = (%1) CoinGame:init : function(int)->(int[])
	_6 = init(n);
	//assign %2 = %6  : int[]
	_1DARRAY_COPY(coins, _6);
	//invoke (%7) = (%2, %1) CoinGame:findMoves : function(int[],int)->(int[])
	_1DARRAY_SIZE(_7, coins);
	_7 = findMoves(_1DARRAY_COPY_PARAM(coins), n);
	//assign %3 = %7  : int[]
	_1DARRAY_COPY(moves, _7);
	//const %8 = 1 : int
	_8 = 1;
	//sub %9 = %1, %8 : int
	_9=n-_8;
	//indexof %10 = %3, %9 : int[]
	_10=moves[_9];
	//assign %4 = %10  : int
	sum_alice = _10;
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [84,104,101,32,116,111,116,97,108,32,97,109,111,117,110,116,32,111,102,32,109,111,110,101,121,32,40,109,97,120,105,109,117,109,41,32,65,108,105,99,101,32,103,101,116,115,32,105,115,32] : int[]
	_NEW_ARRAY(_13, 50);
	_13[0] = 84; _13[1] = 104; _13[2] = 101; _13[3] = 32; _13[4] = 116; _13[5] = 111; _13[6] = 116; _13[7] = 97; _13[8] = 108; _13[9] = 32; _13[10] = 97; _13[11] = 109; _13[12] = 111; _13[13] = 117; _13[14] = 110; _13[15] = 116; _13[16] = 32; _13[17] = 111; _13[18] = 102; _13[19] = 32; _13[20] = 109; _13[21] = 111; _13[22] = 110; _13[23] = 101; _13[24] = 121; _13[25] = 32; _13[26] = 40; _13[27] = 109; _13[28] = 97; _13[29] = 120; _13[30] = 105; _13[31] = 109; _13[32] = 117; _13[33] = 109; _13[34] = 41; _13[35] = 32; _13[36] = 65; _13[37] = 108; _13[38] = 105; _13[39] = 99; _13[40] = 101; _13[41] = 32; _13[42] = 103; _13[43] = 101; _13[44] = 116; _13[45] = 115; _13[46] = 32; _13[47] = 105; _13[48] = 115; _13[49] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %15 (%4) : method(any)->()
	printf("%lld\n", sum_alice);
	//assert
	{
		//const %16 = 25 : int
		_16 = 25;
		//ifeq %4, %16 goto blklab22 : int
		if(sum_alice==_16){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//return
	exit(0);
}

