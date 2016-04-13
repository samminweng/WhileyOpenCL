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

long long* gcd_array(_DECL_1DARRAY_PARAM(data), long long n){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(gcds);
	long long i = 0;
	long long j = 0;
	long long a = 0;
	long long b = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
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
	//const %8 = 0 : int
	_8 = 0;
	//mul %9 = %1, %1 : int
	_9=n*n;
	//arraygen %10 = [8; 9] : int[]
	_GEN_1DARRAY(_10, _9, _8);
	//assign %3 = %10  : int[]
	_1DARRAY_UPDATE(gcds, _10);
	//const %11 = 0 : int
	_11 = 0;
	//assign %4 = %11  : int
	i = _11;
	//loop (%3, %4, %5, %6, %7, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
	while(true){
		//ifge %4, %1 goto blklab7 : int
		if(i>=n){goto blklab7;}
		//const %12 = 0 : int
		_12 = 0;
		//assign %5 = %12  : int
		j = _12;
		//loop (%3, %5, %6, %7, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//ifge %5, %1 goto blklab9 : int
			if(j>=n){goto blklab9;}
			//indexof %13 = %0, %4 : int[]
			_13=data[i];
			//assign %6 = %13  : int
			a = _13;
			//indexof %14 = %0, %5 : int[]
			_14=data[j];
			//assign %7 = %14  : int
			b = _14;
			//const %15 = 0 : int
			_15 = 0;
			//ifne %6, %15 goto blklab11 : int
			if(a!=_15){goto blklab11;}
			//mul %16 = %4, %1 : int
			_16=i*n;
			//add %17 = %16, %5 : int
			_17=_16+j;
			//indexof %18 = %3, %17 : int[]
			_18=gcds[_17];
			//add %19 = %18, %7 : int
			_19=_18+b;
			//mul %20 = %4, %1 : int
			_20=i*n;
			//add %21 = %20, %5 : int
			_21=_20+j;
			//update %3[%21] = %19 : int[] -> int[]
			gcds[_21] = _19;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//loop (%6, %7, %22, %23, %24, %25)
			while(true){
				//invariant
				{
					//const %22 = 0 : int
					_22 = 0;
					//ifge %6, %22 goto blklab15 : int
					if(a>=_22){goto blklab15;}
					//fail
					fprintf(stderr,"fail");
					exit(-1);
//.blklab15
blklab15:;
				//invariant
				}
				//const %23 = 0 : int
				_23 = 0;
				//ifeq %7, %23 goto blklab13 : int
				if(b==_23){goto blklab13;}
				//ifle %6, %7 goto blklab16 : int
				if(a<=b){goto blklab16;}
				//sub %24 = %6, %7 : int
				_24=a-b;
				//assign %6 = %24  : int
				a = _24;
				//goto blklab17
				goto blklab17;
//.blklab16
blklab16:;
				//sub %25 = %7, %6 : int
				_25=b-a;
				//assign %7 = %25  : int
				b = _25;
//.blklab17
blklab17:;
//.blklab14
blklab14:;
			}
//.blklab13
blklab13:;
			//mul %26 = %4, %1 : int
			_26=i*n;
			//add %27 = %26, %5 : int
			_27=_26+j;
			//indexof %28 = %3, %27 : int[]
			_28=gcds[_27];
			//add %29 = %28, %6 : int
			_29=_28+a;
			//mul %30 = %4, %1 : int
			_30=i*n;
			//add %31 = %30, %5 : int
			_31=_30+j;
			//update %3[%31] = %29 : int[] -> int[]
			gcds[_31] = _29;
//.blklab12
blklab12:;
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %5, %32 : int
			_33=j+_32;
			//assign %5 = %33  : int
			j = _33;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %4, %34 : int
		_35=i+_34;
		//assign %4 = %35  : int
		i = _35;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %3
	return gcds;
	//return
}

long long* init(long long n){
	_DECL_1DARRAY(_1);
	_DECL_1DARRAY(data);
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
	_1DARRAY_UPDATE(data, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %7, %8, %9, %10)
	while(true){
		//ifge %3, %0 goto blklab18 : int
		if(i>=n){goto blklab18;}
		//indexof %7 = %2, %3 : int[]
		_7=data[i];
		//add %8 = %7, %3 : int
		_8=_7+i;
		//update %2[%3] = %8 : int[] -> int[]
		data[i] = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
	//return %2
	return data;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(gcds);
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long* _8;
	_DECL_2DARRAY(_9);
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_1DARRAY(_12);
	_DECL_1DARRAY(_13);
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
	void* _25;
	_DECL_1DARRAY(_27);
	void* _28;
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_8, _11);
	//assign %1 = %8  : null|int
	max = _8;
	//ifis %1, null goto blklab20 : null|int
	if(max == NULL) { goto blklab20;}
	//assign %2 = %1  : int
	n = *max;
	//invoke (%12) = (%2) GCD:init : function(int)->(int[])
	_12 = init(n);
	//assign %3 = %12  : int[]
	_1DARRAY_UPDATE(data, _12);
	//invoke (%13) = (%3, %2) GCD:gcd_array : function(int[],int)->(int[])
	_1DARRAY_SIZE(_13, data);
	_13 = gcd_array(_1DARRAY_PARAM(data), n);
	//assign %4 = %13  : int[]
	_1DARRAY_UPDATE(gcds, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %5 = %14  : int
	sum = _14;
	//const %15 = 0 : int
	_15 = 0;
	//assign %6 = %15  : int
	i = _15;
	//loop (%5, %6, %7, %16, %17, %18, %19, %20, %21, %22, %23, %24)
	while(true){
		//ifge %6, %2 goto blklab21 : int
		if(i>=n){goto blklab21;}
		//const %16 = 0 : int
		_16 = 0;
		//assign %7 = %16  : int
		j = _16;
		//loop (%5, %7, %17, %18, %19, %20, %21, %22)
		while(true){
			//ifge %7, %2 goto blklab23 : int
			if(j>=n){goto blklab23;}
			//mul %17 = %6, %2 : int
			_17=i*n;
			//add %18 = %17, %7 : int
			_18=_17+j;
			//indexof %19 = %4, %18 : int[]
			_19=gcds[_18];
			//add %20 = %5, %19 : int
			_20=sum+_19;
			//assign %5 = %20  : int
			sum = _20;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %7, %21 : int
			_22=j+_21;
			//assign %7 = %22  : int
			j = _22;
//.blklab24
blklab24:;
		}
//.blklab23
blklab23:;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %6, %23 : int
		_24=i+_23;
		//assign %6 = %24  : int
		i = _24;
//.blklab22
blklab22:;
	}
//.blklab21
blklab21:;
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [83,85,77,58] : int[]
	_NEW_ARRAY(_27, 4);
	_27[0] = 83; _27[1] = 85; _27[2] = 77; _27[3] = 58; 
	//indirectinvoke () = %26 (%27) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_27));
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %29 (%5) : method(any)->()
	printf("%lld\n", sum);
//.blklab20
blklab20:;
	//return
	exit(0);
}

