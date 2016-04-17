#include "GCD.h"
long long gcd(long long a, long long b){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//ifne %0, %3 goto blklab1 : int
	if(a!=_3){goto blklab1;}
	//return %1
	return b;
//.blklab1
blklab1:;
	//loop (%0, %1, %4, %5, %6, %7)
	while(true){
		//invariant
		{
			//const %4 = 0 : int
			_4 = 0;
			//ifge %0, %4 goto blklab4 : int
			if(a>=_4){goto blklab4;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab4
blklab4:;
		//invariant
		}
		//const %5 = 0 : int
		_5 = 0;
		//ifeq %1, %5 goto blklab2 : int
		if(b==_5){goto blklab2;}
		//ifle %0, %1 goto blklab5 : int
		if(a<=b){goto blklab5;}
		//sub %6 = %0, %1 : int
		_6=a-b;
		//assign %0 = %6  : int
		a = _6;
		//goto blklab6
		goto blklab6;
//.blklab5
blklab5:;
		//sub %7 = %1, %0 : int
		_7=b-a;
		//assign %1 = %7  : int
		b = _7;
//.blklab6
blklab6:;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %0
	return a;
	//return
}

long long gcd_cached(long long a, long long b, long long n, _DECL_1DARRAY_PARAM(gcds), _DECL_OWNERSHIP_PARAM(gcds)){
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//ifne %0, %5 goto blklab7 : int
	if(a!=_5){goto blklab7;}
	//return %1
	_FREE(gcds);
	return b;
	//goto blklab8
	goto blklab8;
//.blklab7
blklab7:;
	//const %6 = 0 : int
	_6 = 0;
	//ifne %1, %6 goto blklab9 : int
	if(b!=_6){goto blklab9;}
	//return %0
	_FREE(gcds);
	return a;
	//goto blklab10
	goto blklab10;
//.blklab9
blklab9:;
	//ifle %0, %1 goto blklab11 : int
	if(a<=b){goto blklab11;}
	//sub %7 = %0, %1 : int
	_7=a-b;
	//assign %0 = %7  : int
	a = _7;
	//goto blklab12
	goto blklab12;
//.blklab11
blklab11:;
	//sub %8 = %1, %0 : int
	_8=b-a;
	//assign %1 = %8  : int
	b = _8;
//.blklab12
blklab12:;
	//mul %9 = %0, %2 : int
	_9=a*n;
	//add %10 = %9, %1 : int
	_10=_9+b;
	//indexof %11 = %3, %10 : int[]
	_11=gcds[_10];
	//return %11
	_FREE(gcds);
	return _11;
//.blklab10
blklab10:;
//.blklab8
blklab8:;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	_DECL_1DARRAY(gcds);
	_DECL_OWNERSHIP(gcds);
	long long i = 0;
	long long j = 0;
	long long* _6;
	_DECL_2DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_OWNERSHIP(_12);
	void* _13;
	long long _15 = 0;
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	void* _27;
	_DECL_1DARRAY(_29);
	_DECL_OWNERSHIP(_29);
	void* _30;
	void* _32;
	_DECL_1DARRAY(_34);
	_DECL_OWNERSHIP(_34);
	void* _35;
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_OWNERSHIP(_39);
	void* _40;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
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
	//ifis %1, null goto blklab13 : null|int
	if(max == NULL) { goto blklab13;}
	//assign %2 = %1  : int
	n = *max;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [78,32,61,32] : int[]
	_FREE(_12);
	_NEW_ARRAY(_12, 4);
	_12[0] = 78; _12[1] = 32; _12[2] = 61; _12[3] = 32; 
	_ADD_OWNERSHIP(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_12));
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %14 (%2) : method(any)->()
	printf("%lld\n", n);
	//const %15 = 0 : int
	_15 = 0;
	//mul %16 = %2, %2 : int
	_16=n*n;
	//arraygen %17 = [15; 16] : int[]
	_FREE(_17);
	_GEN_1DARRAY(_17, _16, _15);
	_ADD_OWNERSHIP(_17);
	//assign %3 = %17  : int[]
	_FREE(gcds);
	_1DARRAY_UPDATE(gcds, _17);
	_ADD_OWNERSHIP(gcds);
	_REMOVE_OWNERSHIP(_17);
	//const %18 = 0 : int
	_18 = 0;
	//assign %4 = %18  : int
	i = _18;
	//loop (%3, %4, %5, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48)
	while(true){
		//ifge %4, %2 goto blklab14 : int
		if(i>=n){goto blklab14;}
		//const %19 = 0 : int
		_19 = 0;
		//assign %5 = %19  : int
		j = _19;
		//loop (%3, %5, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46)
		while(true){
			//ifge %5, %2 goto blklab16 : int
			if(j>=n){goto blklab16;}
			//invoke (%20) = (%4, %5, %2, %3) GCD:gcd_cached : function(int,int,int,int[])->(int)
			_ADD_OWNERSHIP(gcds);
			_20 = gcd_cached(i, j, n, _1DARRAY_PARAM(gcds), false);
			//mul %21 = %4, %2 : int
			_21=i*n;
			//add %22 = %21, %5 : int
			_22=_21+j;
			//update %3[%22] = %20 : int[] -> int[]
			gcds[_22] = _20;
			//assert
			{
				//mul %23 = %4, %2 : int
				_23=i*n;
				//add %24 = %23, %5 : int
				_24=_23+j;
				//indexof %25 = %3, %24 : int[]
				_25=gcds[_24];
				//invoke (%26) = (%4, %5) GCD:gcd : function(int,int)->(int)
				_26 = gcd(i, j);
				//ifeq %25, %26 goto blklab18 : int
				if(_25==_26){goto blklab18;}
				//fail
				fprintf(stderr,"fail");
				exit(-1);
//.blklab18
blklab18:;
			//assert
			}
			//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %28 = %27 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %29 = [78,117,109,98,101,114,58,32] : int[]
			_FREE(_29);
			_NEW_ARRAY(_29, 8);
			_29[0] = 78; _29[1] = 117; _29[2] = 109; _29[3] = 98; _29[4] = 101; _29[5] = 114; _29[6] = 58; _29[7] = 32; 
			_ADD_OWNERSHIP(_29);
			//indirectinvoke () = %28 (%29) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_29));
			//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %31 = %30 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %31 (%4) : method(any)->()
			printf("%lld", i);
			//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %34 = [32,78,117,109,98,101,114,58,32] : int[]
			_FREE(_34);
			_NEW_ARRAY(_34, 9);
			_34[0] = 32; _34[1] = 78; _34[2] = 117; _34[3] = 109; _34[4] = 98; _34[5] = 101; _34[6] = 114; _34[7] = 58; _34[8] = 32; 
			_ADD_OWNERSHIP(_34);
			//indirectinvoke () = %33 (%34) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_34));
			//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %36 = %35 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %36 (%5) : method(any)->()
			printf("%lld", j);
			//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %38 = %37 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %39 = [32,71,67,68,58] : int[]
			_FREE(_39);
			_NEW_ARRAY(_39, 5);
			_39[0] = 32; _39[1] = 71; _39[2] = 67; _39[3] = 68; _39[4] = 58; 
			_ADD_OWNERSHIP(_39);
			//indirectinvoke () = %38 (%39) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_39));
			//fieldload %40 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %41 = %40 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %42 = %4, %2 : int
			_42=i*n;
			//add %43 = %42, %5 : int
			_43=_42+j;
			//indexof %44 = %3, %43 : int[]
			_44=gcds[_43];
			//indirectinvoke () = %41 (%44) : method(any)->()
			printf("%lld\n", _44);
			//const %45 = 1 : int
			_45 = 1;
			//add %46 = %5, %45 : int
			_46=j+_45;
			//assign %5 = %46  : int
			j = _46;
//.blklab17
blklab17:;
		}
//.blklab16
blklab16:;
		//const %47 = 1 : int
		_47 = 1;
		//add %48 = %4, %47 : int
		_48=i+_47;
		//assign %4 = %48  : int
		i = _48;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
//.blklab13
blklab13:;
	//return
	_FREE(gcds);
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_12);
	_FREE(_17);
	_FREE(_29);
	_FREE(_34);
	_FREE(_39);
	exit(0);
}

