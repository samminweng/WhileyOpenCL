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
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long a = 0;
	long long b = 0;
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
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
	//const %9 = 0 : int
	_9 = 0;
	//mul %10 = %1, %1 : int
	_10=n*n;
	//arraygen %11 = [9; 10] : int[]
	_GEN_1DARRAY(_11, _10, _9);
	//assign %3 = %11  : int[]
	_1DARRAY_UPDATE(gcds, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %4 = %12  : int
	sum = _12;
	//const %13 = 0 : int
	_13 = 0;
	//assign %5 = %13  : int
	i = _13;
	//loop (%3, %5, %6, %7, %8, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//ifge %5, %1 goto blklab7 : int
		if(i>=n){goto blklab7;}
		//const %14 = 0 : int
		_14 = 0;
		//assign %6 = %14  : int
		j = _14;
		//loop (%3, %6, %7, %8, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
		while(true){
			//ifge %6, %1 goto blklab9 : int
			if(j>=n){goto blklab9;}
			//indexof %15 = %0, %5 : int[]
			_15=data[i];
			//assign %7 = %15  : int
			a = _15;
			//indexof %16 = %0, %6 : int[]
			_16=data[j];
			//assign %8 = %16  : int
			b = _16;
			//const %17 = 0 : int
			_17 = 0;
			//ifne %7, %17 goto blklab11 : int
			if(a!=_17){goto blklab11;}
			//mul %18 = %5, %1 : int
			_18=i*n;
			//add %19 = %18, %6 : int
			_19=_18+j;
			//indexof %20 = %3, %19 : int[]
			_20=gcds[_19];
			//add %21 = %20, %8 : int
			_21=_20+b;
			//mul %22 = %5, %1 : int
			_22=i*n;
			//add %23 = %22, %6 : int
			_23=_22+j;
			//update %3[%23] = %21 : int[] -> int[]
			gcds[_23] = _21;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//loop (%7, %8, %24, %25, %26, %27)
			while(true){
				//invariant
				{
					//const %24 = 0 : int
					_24 = 0;
					//ifge %7, %24 goto blklab15 : int
					if(a>=_24){goto blklab15;}
					//fail
					fprintf(stderr,"fail");
					exit(-1);
//.blklab15
blklab15:;
				//invariant
				}
				//const %25 = 0 : int
				_25 = 0;
				//ifeq %8, %25 goto blklab13 : int
				if(b==_25){goto blklab13;}
				//ifle %7, %8 goto blklab16 : int
				if(a<=b){goto blklab16;}
				//sub %26 = %7, %8 : int
				_26=a-b;
				//assign %7 = %26  : int
				a = _26;
				//goto blklab17
				goto blklab17;
//.blklab16
blklab16:;
				//sub %27 = %8, %7 : int
				_27=b-a;
				//assign %8 = %27  : int
				b = _27;
//.blklab17
blklab17:;
//.blklab14
blklab14:;
			}
//.blklab13
blklab13:;
			//mul %28 = %5, %1 : int
			_28=i*n;
			//add %29 = %28, %6 : int
			_29=_28+j;
			//indexof %30 = %3, %29 : int[]
			_30=gcds[_29];
			//add %31 = %30, %7 : int
			_31=_30+a;
			//mul %32 = %5, %1 : int
			_32=i*n;
			//add %33 = %32, %6 : int
			_33=_32+j;
			//update %3[%33] = %31 : int[] -> int[]
			gcds[_33] = _31;
//.blklab12
blklab12:;
			//const %34 = 1 : int
			_34 = 1;
			//add %35 = %6, %34 : int
			_35=j+_34;
			//assign %6 = %35  : int
			j = _35;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %36 = 1 : int
		_36 = 1;
		//add %37 = %5, %36 : int
		_37=i+_36;
		//assign %5 = %37  : int
		i = _37;
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
	long long n = 0;
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(gcds);
	long long sum = 0;
	long long i = 0;
	long long j = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
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
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	//const %7 = 1000 : int
	_7 = 1000;
	//assign %1 = %7  : int
	n = _7;
	//invoke (%8) = (%1) GCD:init : function(int)->(int[])
	_8 = init(n);
	//assign %2 = %8  : int[]
	_1DARRAY_UPDATE(data, _8);
	//invoke (%9) = (%2, %1) GCD:gcd_array : function(int[],int)->(int[])
	_1DARRAY_SIZE(_9, data);
	_9 = gcd_array(_1DARRAY_PARAM(data), n);
	//assign %3 = %9  : int[]
	_1DARRAY_UPDATE(gcds, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	sum = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	i = _11;
	//loop (%4, %5, %6, %12, %13, %14, %15, %16, %17, %18, %19, %20)
	while(true){
		//ifge %5, %1 goto blklab20 : int
		if(i>=n){goto blklab20;}
		//const %12 = 0 : int
		_12 = 0;
		//assign %6 = %12  : int
		j = _12;
		//loop (%4, %6, %13, %14, %15, %16, %17, %18)
		while(true){
			//ifge %6, %1 goto blklab22 : int
			if(j>=n){goto blklab22;}
			//mul %13 = %5, %1 : int
			_13=i*n;
			//add %14 = %13, %6 : int
			_14=_13+j;
			//indexof %15 = %3, %14 : int[]
			_15=gcds[_14];
			//add %16 = %4, %15 : int
			_16=sum+_15;
			//assign %4 = %16  : int
			sum = _16;
			//const %17 = 1 : int
			_17 = 1;
			//add %18 = %6, %17 : int
			_18=j+_17;
			//assign %6 = %18  : int
			j = _18;
//.blklab23
blklab23:;
		}
//.blklab22
blklab22:;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %5, %19 : int
		_20=i+_19;
		//assign %5 = %20  : int
		i = _20;
//.blklab21
blklab21:;
	}
//.blklab20
blklab20:;
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [83,85,77,58] : int[]
	_NEW_ARRAY(_23, 4);
	_23[0] = 83; _23[1] = 85; _23[2] = 77; _23[3] = 58; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %25 (%4) : method(any)->()
	printf("%lld\n", sum);
	//return
	exit(0);
}

