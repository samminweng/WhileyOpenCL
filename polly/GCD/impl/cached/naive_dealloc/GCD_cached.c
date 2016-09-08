#include "GCD_cached.h"
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

long long gcd_cached(long long a, long long b, long long n, _DECL_1DARRAY_PARAM(gcds), _DECL_DEALLOC_PARAM(gcds)){
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
	_DEALLOC(gcds);
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
	_DEALLOC(gcds);
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
	_DEALLOC(gcds);
	return _11;
//.blklab10
blklab10:;
//.blklab8
blklab8:;
	//return
}

int main(int argc, char** args){
	long long* max;
	_DECL_DEALLOC(max);
	long long n = 0;
	_DECL_1DARRAY(gcds);
	_DECL_DEALLOC(gcds);
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long* _7;
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	long long _16 = 0;
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
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
	void* _33;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	void* _36;
	void* _38;
	_DECL_1DARRAY(_40);
	_DECL_DEALLOC(_40);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DArray(_8, T_INT);
	_CONV_ARGS(_8);
	_ADD_DEALLOC(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_REMOVE_DEALLOC(_10);
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_7, _10);
	_ADD_DEALLOC(_7);
	_REMOVE_DEALLOC(_10);
	//assign %1 = %7  : null|int
	_DEALLOC(max);
	_NEW_INTEGER_POINTER(max, _7);
	_ADD_DEALLOC(max);
	//ifis %1, null goto blklab13 : null|int
	if(max == NULL) { goto blklab13;}
	//assign %2 = %1  : int
	n = *max;
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [78,32,61,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY(_13, 4, 0, T_INT);
	_13[0] = 78; _13[1] = 32; _13[2] = 61; _13[3] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %15 (%2) : method(any)->()
	printf("%lld\n", n);
	//const %16 = 0 : int
	_16 = 0;
	//mul %17 = %2, %2 : int
	_17=n*n;
	//arraygen %18 = [16; 17] : int[]
	_DEALLOC(_18);
	_NEW_1DARRAY(_18, _17, _16, T_INT);
	_ADD_DEALLOC(_18);
	//assign %3 = %18  : int[]
	_DEALLOC(gcds);
	_COPY_1DARRAY(gcds, _18, T_INT);
	_ADD_DEALLOC(gcds);
	//const %19 = 0 : int
	_19 = 0;
	//assign %4 = %19  : int
	sum = _19;
	//const %20 = 0 : int
	_20 = 0;
	//assign %5 = %20  : int
	i = _20;
	//loop (%3, %4, %5, %6, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//ifge %5, %2 goto blklab14 : int
		if(i>=n){goto blklab14;}
		//const %21 = 0 : int
		_21 = 0;
		//assign %6 = %21  : int
		j = _21;
		//loop (%3, %4, %6, %22, %23, %24, %25, %26, %27, %28, %29, %30)
		while(true){
			//ifge %6, %2 goto blklab16 : int
			if(j>=n){goto blklab16;}
			//invoke (%22) = (%5, %6, %2, %3) GCD_cached:gcd_cached : function(int,int,int,int[])->(int)
			{
				void* gcds_tmp;
				_22 = gcd_cached(i, j, n, gcds_tmp = _COPY_1DARRAY_PARAM(gcds, T_INT), true);
				_CALLEE_DEALLOC(gcds, "false-false-true");
			}
			//mul %23 = %5, %2 : int
			_23=i*n;
			//add %24 = %23, %6 : int
			_24=_23+j;
			//update %3[%24] = %22 : int[] -> int[]
			gcds[_24] = _22;
			//mul %25 = %5, %2 : int
			_25=i*n;
			//add %26 = %25, %6 : int
			_26=_25+j;
			//indexof %27 = %3, %26 : int[]
			_27=gcds[_26];
			//add %28 = %4, %27 : int
			_28=sum+_27;
			//assign %4 = %28  : int
			sum = _28;
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %6, %29 : int
			_30=j+_29;
			//assign %6 = %30  : int
			j = _30;
//.blklab17
blklab17:;
		}
//.blklab16
blklab16:;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %5, %31 : int
		_32=i+_31;
		//assign %5 = %32  : int
		i = _32;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
	//fieldload %33 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %34 = %33 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %35 = [83,117,109,58,32] : int[]
	_DEALLOC(_35);
	_NEW_1DARRAY(_35, 5, 0, T_INT);
	_35[0] = 83; _35[1] = 117; _35[2] = 109; _35[3] = 58; _35[4] = 32; 
	_ADD_DEALLOC(_35);
	//indirectinvoke () = %34 (%35) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_35));
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %37 (%4) : method(any)->()
	printf("%lld\n", sum);
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %40 = [80,97,115,115,32,99,97,99,104,101,100,32,69,117,99,108,105,100,32,71,67,68,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_40);
	_NEW_1DARRAY(_40, 32, 0, T_INT);
	_40[0] = 80; _40[1] = 97; _40[2] = 115; _40[3] = 115; _40[4] = 32; _40[5] = 99; _40[6] = 97; _40[7] = 99; _40[8] = 104; _40[9] = 101; _40[10] = 100; _40[11] = 32; _40[12] = 69; _40[13] = 117; _40[14] = 99; _40[15] = 108; _40[16] = 105; _40[17] = 100; _40[18] = 32; _40[19] = 71; _40[20] = 67; _40[21] = 68; _40[22] = 32; _40[23] = 116; _40[24] = 101; _40[25] = 115; _40[26] = 116; _40[27] = 32; _40[28] = 99; _40[29] = 97; _40[30] = 115; _40[31] = 101; 
	_ADD_DEALLOC(_40);
	//indirectinvoke () = %39 (%40) : method(int[])->()
	println_s(_40, _40_size);
//.blklab13
blklab13:;
	//return
	_DEALLOC(max);
	_DEALLOC(gcds);
	_DEALLOC(_7);
	_DEALLOC_2DArray(_8, T_INT);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_18);
	_DEALLOC(_35);
	_DEALLOC(_40);
	exit(0);
}

