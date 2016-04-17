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

long long* gcd_cached(long long n){
	_DECL_1DARRAY(_1);
	_DECL_OWNERSHIP(_1);
	_DECL_1DARRAY(gcds);
	_DECL_OWNERSHIP(gcds);
	long long i = 0;
	long long j = 0;
	long long a = 0;
	long long b = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
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
	//const %7 = 0 : int
	_7 = 0;
	//mul %8 = %0, %0 : int
	_8=n*n;
	//arraygen %9 = [7; 8] : int[]
	_FREE(_9);
	_GEN_1DARRAY(_9, _8, _7);
	_ADD_OWNERSHIP(_9);
	//assign %2 = %9  : int[]
	_FREE(gcds);
	_1DARRAY_UPDATE(gcds, _9);
	_ADD_OWNERSHIP(gcds);
	_REMOVE_OWNERSHIP(_9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %3 = %10  : int
	i = _10;
	//loop (%2, %3, %4, %5, %6, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
	while(true){
		//ifge %3, %0 goto blklab7 : int
		if(i>=n){goto blklab7;}
		//const %11 = 0 : int
		_11 = 0;
		//assign %4 = %11  : int
		j = _11;
		//loop (%2, %4, %5, %6, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26)
		while(true){
			//ifge %4, %0 goto blklab9 : int
			if(j>=n){goto blklab9;}
			//assign %5 = %3  : int
			a = i;
			//assign %6 = %4  : int
			b = j;
			//const %12 = 0 : int
			_12 = 0;
			//ifne %5, %12 goto blklab11 : int
			if(a!=_12){goto blklab11;}
			//mul %13 = %3, %0 : int
			_13=i*n;
			//add %14 = %13, %4 : int
			_14=_13+j;
			//update %2[%14] = %6 : int[] -> int[]
			gcds[_14] = b;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//const %15 = 0 : int
			_15 = 0;
			//ifne %6, %15 goto blklab13 : int
			if(b!=_15){goto blklab13;}
			//mul %16 = %3, %0 : int
			_16=i*n;
			//add %17 = %16, %4 : int
			_17=_16+j;
			//update %2[%17] = %5 : int[] -> int[]
			gcds[_17] = a;
			//goto blklab14
			goto blklab14;
//.blklab13
blklab13:;
			//ifle %5, %6 goto blklab15 : int
			if(a<=b){goto blklab15;}
			//sub %18 = %5, %6 : int
			_18=a-b;
			//assign %5 = %18  : int
			a = _18;
			//goto blklab16
			goto blklab16;
//.blklab15
blklab15:;
			//sub %19 = %6, %5 : int
			_19=b-a;
			//assign %6 = %19  : int
			b = _19;
//.blklab16
blklab16:;
			//mul %20 = %5, %0 : int
			_20=a*n;
			//add %21 = %20, %6 : int
			_21=_20+b;
			//indexof %22 = %2, %21 : int[]
			_22=gcds[_21];
			//mul %23 = %3, %0 : int
			_23=i*n;
			//add %24 = %23, %4 : int
			_24=_23+j;
			//update %2[%24] = %22 : int[] -> int[]
			gcds[_24] = _22;
//.blklab14
blklab14:;
//.blklab12
blklab12:;
			//const %25 = 1 : int
			_25 = 1;
			//add %26 = %4, %25 : int
			_26=j+_25;
			//assign %4 = %26  : int
			j = _26;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %3, %27 : int
		_28=i+_27;
		//assign %3 = %28  : int
		i = _28;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %2
	_FREE(_1);
	_FREE(_9);
	return gcds;
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
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
	long long _16 = 0;
	long long _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_OWNERSHIP(_20);
	void* _21;
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_OWNERSHIP(_25);
	void* _26;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_OWNERSHIP(_30);
	void* _31;
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
	//ifis %1, null goto blklab17 : null|int
	if(max == NULL) { goto blklab17;}
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
	//indirectinvoke () = %14 (%1) : method(any)->()
	printf("%d\n", max);
	//invoke (%15) = (%2) GCD:gcd_cached : function(int)->(int[])
	_FREE(_15);
	_15 = gcd_cached(n);
	_ADD_OWNERSHIP(_15);
	//assign %3 = %15  : int[]
	_FREE(gcds);
	_1DARRAY_UPDATE(gcds, _15);
	_ADD_OWNERSHIP(gcds);
	_REMOVE_OWNERSHIP(_15);
	//const %16 = 0 : int
	_16 = 0;
	//assign %4 = %16  : int
	i = _16;
	//loop (%4, %5, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43)
	while(true){
		//ifge %4, %2 goto blklab18 : int
		if(i>=n){goto blklab18;}
		//const %17 = 0 : int
		_17 = 0;
		//assign %5 = %17  : int
		j = _17;
		//loop (%5, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
		while(true){
			//ifge %5, %2 goto blklab20 : int
			if(j>=n){goto blklab20;}
			//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %20 = [78,117,109,98,101,114,58,32] : int[]
			_FREE(_20);
			_NEW_ARRAY(_20, 8);
			_20[0] = 78; _20[1] = 117; _20[2] = 109; _20[3] = 98; _20[4] = 101; _20[5] = 114; _20[6] = 58; _20[7] = 32; 
			_ADD_OWNERSHIP(_20);
			//indirectinvoke () = %19 (%20) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_20));
			//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %22 = %21 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %22 (%4) : method(any)->()
			printf("%lld", i);
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = [32,78,117,109,98,101,114,58,32] : int[]
			_FREE(_25);
			_NEW_ARRAY(_25, 9);
			_25[0] = 32; _25[1] = 78; _25[2] = 117; _25[3] = 109; _25[4] = 98; _25[5] = 101; _25[6] = 114; _25[7] = 58; _25[8] = 32; 
			_ADD_OWNERSHIP(_25);
			//indirectinvoke () = %24 (%25) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_25));
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %27 (%5) : method(any)->()
			printf("%lld", j);
			//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %30 = [32,71,67,68,58] : int[]
			_FREE(_30);
			_NEW_ARRAY(_30, 5);
			_30[0] = 32; _30[1] = 71; _30[2] = 67; _30[3] = 68; _30[4] = 58; 
			_ADD_OWNERSHIP(_30);
			//indirectinvoke () = %29 (%30) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_30));
			//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %32 = %31 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//mul %33 = %4, %2 : int
			_33=i*n;
			//add %34 = %33, %5 : int
			_34=_33+j;
			//indexof %35 = %3, %34 : int[]
			_35=gcds[_34];
			//indirectinvoke () = %32 (%35) : method(any)->()
			printf("%lld\n", _35);
			//assert
			{
				//mul %36 = %4, %2 : int
				_36=i*n;
				//add %37 = %36, %5 : int
				_37=_36+j;
				//indexof %38 = %3, %37 : int[]
				_38=gcds[_37];
				//invoke (%39) = (%4, %5) GCD:gcd : function(GCD:nat,GCD:nat)->(GCD:nat)
				_39 = gcd(i, j);
				//ifeq %38, %39 goto blklab22 : int
				if(_38==_39){goto blklab22;}
				//fail
				fprintf(stderr,"fail");
				exit(-1);
//.blklab22
blklab22:;
			//assert
			}
			//const %40 = 1 : int
			_40 = 1;
			//add %41 = %5, %40 : int
			_41=j+_40;
			//assign %5 = %41  : int
			j = _41;
//.blklab21
blklab21:;
		}
//.blklab20
blklab20:;
		//const %42 = 1 : int
		_42 = 1;
		//add %43 = %4, %42 : int
		_43=i+_42;
		//assign %4 = %43  : int
		i = _43;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
//.blklab17
blklab17:;
	//return
	_FREE(gcds);
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_12);
	_FREE(_15);
	_FREE(_20);
	_FREE(_25);
	_FREE(_30);
	exit(0);
}

