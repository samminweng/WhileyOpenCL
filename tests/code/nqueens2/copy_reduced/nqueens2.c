#include "nqueens2.h"
POS* copy_POS(POS* _POS){
	POS* new_POS = malloc(sizeof(POS));
	new_POS->r = _POS->r;
	new_POS->c = _POS->c;
	return new_POS;
}
POS** copy_array_POS(POS** _POS, long long _POS_size){
	POS** new_POS = malloc(_POS_size*sizeof(POS*));
	for(int i=0;i<_POS_size;i++){
		new_POS[i] = copy_POS(_POS[i]);
	}
	return new_POS;
}
void free_POS(POS* pos){
	free(pos);
}
void printf_POS(POS* pos){
	printf("{");
	printf(" r:");
	printf("%lld", pos->r);
	printf(" c:");
	printf("%lld", pos->c);
	printf("}");
}
long long conflict(POS* p, long long row, long long col){
	long long _3;
	long long r = 0;
	long long c = 0;
	long long colDiff = 0;
	long long rowDiff = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15;
	//fieldload %8 = %0 r : {int c,int r}
	_8 = p->r;
	//assign %4 = %8  : int
	r = _8;
	//fieldload %9 = %0 c : {int c,int r}
	_9 = p->c;
	//assign %5 = %9  : int
	c = _9;
	//ifeq %4, %1 goto blklab1 : int
	if(r==row){goto blklab1;}
	//ifne %5, %2 goto blklab0 : int
	if(c!=col){goto blklab0;}
//.blklab1
blklab1:;
	//const %10 = true : bool
	_10 = true;
	//return %10
	return _10;
//.blklab0
blklab0:;
	//sub %12 = %5, %2 : int
	_12=c-col;
	//invoke (%11) = (%12) whiley/lang/Math:abs : function(int)->(int)
	_11 = llabs(_12);
	//assign %6 = %11  : int
	colDiff = _11;
	//sub %14 = %4, %1 : int
	_14=r-row;
	//invoke (%13) = (%14) whiley/lang/Math:abs : function(int)->(int)
	_13 = llabs(_14);
	//assign %7 = %13  : int
	rowDiff = _13;
	//ifeq %6, %7 goto blklab2 : int
	if(colDiff==rowDiff){goto blklab2;}
	//const %15 = false : bool
	_15 = false;
	//goto blklab3
	goto blklab3;
//.blklab2
blklab2:;
	//const %15 = true : bool
	_15 = true;
//.blklab3
blklab3:;
	//return %15
	return _15;
	//return
}

long long run(POS** queens, long long queens_size, long long n, long long dim){
	long long _3 = 0;
	long long num_solutions = 0;
	long long col = 0;
	long long isSolution;
	long long i = 0;
	POS* p;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	POS* _19;
	long long _20;
	long long _21;
	long long _22;
	long long _23;
	long long _24 = 0;
	long long _25 = 0;
	long long _26;
	POS* _27;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	//ifne %2, %1 goto blklab6 : int
	if(dim!=n){goto blklab6;}
	//const %9 = 1 : int
	_9 = 1;
	//return %9
	return _9;
	//goto blklab7
	goto blklab7;
//.blklab6
blklab6:;
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	num_solutions = _10;
	//const %11 = 0 : int
	_11 = 0;
	//assign %5 = %11  : int
	col = _11;
	//loop (%0, %4, %5, %6, %7, %8, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
	while(true){
		//invariant
		{
			//lengthof %12 = %0 : {int c,int r}[]
			_12 = queens_size;
			//ifge %1, %12 goto blklab11 : int
			if(n>=_12){goto blklab11;}
			//lengthof %13 = %0 : {int c,int r}[]
			_13 = queens_size;
			//ifeq %2, %13 goto blklab10 : int
			if(dim==_13){goto blklab10;}
//.blklab11
blklab11:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab10
blklab10:;
		//invariant
		}
		//ifge %5, %2 goto blklab8 : int
		if(col>=dim){goto blklab8;}
		//const %14 = true : bool
		_14 = true;
		//assign %6 = %14  : bool
		isSolution = _14;
		//const %15 = 0 : int
		_15 = 0;
		//assign %7 = %15  : int
		i = _15;
		//loop (%6, %7, %8, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
		while(true){
			//invariant
			{
				//lengthof %16 = %0 : {int c,int r}[]
				_16 = queens_size;
				//ifge %1, %16 goto blklab15 : int
				if(n>=_16){goto blklab15;}
				//const %17 = 0 : int
				_17 = 0;
				//iflt %7, %17 goto blklab16 : int
				if(i<_17){goto blklab16;}
				//lengthof %18 = %0 : {int c,int r}[]
				_18 = queens_size;
				//ifeq %2, %18 goto blklab14 : int
				if(dim==_18){goto blklab14;}
//.blklab16
blklab16:;
//.blklab15
blklab15:;
				//fail
				fprintf(stderr,"fail");
				exit(-1);
//.blklab14
blklab14:;
			//invariant
			}
			//ifge %7, %1 goto blklab12 : int
			if(i>=n){goto blklab12;}
			//indexof %19 = %0, %7 : {int c,int r}[]
			_19=queens[i];
			//assign %8 = %19  : {int c,int r}
			p = _19;
			//const %20 = true : bool
			_20 = true;
			//ifeq %6, %20 goto blklab20 : bool
			if(isSolution==_20){goto blklab20;}
			//goto blklab19
			goto blklab19;
//.blklab20
blklab20:;
			//invoke (%21) = (%8, %1, %5) nqueens2:conflict : function(nqueens2:POS,int,int)->(bool)
			{
				_21 = conflict(_STRUCT_PARAM(p), n, col);
			}
			//const %22 = true : bool
			_22 = true;
			//ifeq %21, %22 goto blklab21 : bool
			if(_21==_22){goto blklab21;}
			//goto blklab17
			goto blklab17;
//.blklab21
blklab21:;
//.blklab19
blklab19:;
			//const %23 = false : bool
			_23 = false;
			//goto blklab18
			goto blklab18;
//.blklab17
blklab17:;
			//const %23 = true : bool
			_23 = true;
//.blklab18
blklab18:;
			//assign %6 = %23  : bool
			isSolution = _23;
			//const %24 = 1 : int
			_24 = 1;
			//add %25 = %7, %24 : int
			_25=i+_24;
			//assign %7 = %25  : int
			i = _25;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %26 = true : bool
		_26 = true;
		//ifne %6, %26 goto blklab22 : bool
		if(isSolution!=_26){goto blklab22;}
		//newrecord %27 = (%5, %1) : {int c,int r}
		_27 = malloc(sizeof(POS));
		_27->c = col;
		_27->r = n;
		//update %0[%1] = %27 : {int c,int r}[] -> {int c,int r}[]
		queens[n] = _27;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %1, %29 : int
		_30=n+_29;
		//invoke (%28) = (%0, %30, %2) nqueens2:run : function(nqueens2:POS[],int,int)->(int)
		{
			void* queens_tmp;
			_28 = run(queens_tmp = copy_array_POS(queens, queens_size), queens_size, _30, dim);
		}
		//add %31 = %4, %28 : int
		_31=num_solutions+_28;
		//assign %4 = %31  : int
		num_solutions = _31;
//.blklab22
blklab22:;
		//const %32 = 1 : int
		_32 = 1;
		//add %33 = %5, %32 : int
		_33=col+_32;
		//assign %5 = %33  : int
		col = _33;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %4
	return num_solutions;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	long long n = 0;
	POS** queens;
	long long queens_size = 0;
	long long num_solutions = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	POS* _7;
	POS** _8;
	long long _8_size = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	void* _18;
	long long _20 = 0;
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	void* _26;
	_DECL_1DARRAY(_28);
	//const %4 = 8 : int
	_4 = 8;
	//assign %1 = %4  : int
	n = _4;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//newrecord %7 = (%5, %6) : {int c,int r}
	_7 = malloc(sizeof(POS));
	_7->c = _5;
	_7->r = _6;
	//arraygen %8 = [7; 1] : {int c,int r}[]
	_NEW_1DARRAY_STRUCT(_8, n, _7, POS);
	//assign %2 = %8  : {int c,int r}[]
	_UPDATE_1DARRAY(queens, _8);
	//const %10 = 0 : int
	_10 = 0;
	//invoke (%9) = (%2, %10, %1) nqueens2:run : function(nqueens2:POS[],int,int)->(int)
	{
		void* queens_tmp;
		_9 = run(queens_tmp = copy_array_POS(queens, queens_size), queens_size, _10, n);
	}
	//assign %3 = %9  : int
	num_solutions = _9;
	//assert
	{
		//const %11 = 92 : int
		_11 = 92;
		//ifeq %3, %11 goto blklab23 : int
		if(num_solutions==_11){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [78,45,81,117,101,101,110,32,80,114,111,98,108,101,109,32,111,110,32,97,32,78,32,88,32,78,32,66,111,97,114,100,46] : int[]
	_NEW_1DARRAY(_14, 33, 0);
	_14[0] = 78; _14[1] = 45; _14[2] = 81; _14[3] = 117; _14[4] = 101; _14[5] = 101; _14[6] = 110; _14[7] = 32; _14[8] = 80; _14[9] = 114; _14[10] = 111; _14[11] = 98; _14[12] = 108; _14[13] = 101; _14[14] = 109; _14[15] = 32; _14[16] = 111; _14[17] = 110; _14[18] = 32; _14[19] = 97; _14[20] = 32; _14[21] = 78; _14[22] = 32; _14[23] = 88; _14[24] = 32; _14[25] = 78; _14[26] = 32; _14[27] = 66; _14[28] = 111; _14[29] = 97; _14[30] = 114; _14[31] = 100; _14[32] = 46; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	println_s(_14, _14_size);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [78,32,61,32] : int[]
	_NEW_1DARRAY(_17, 4, 0);
	_17[0] = 78; _17[1] = 32; _17[2] = 61; _17[3] = 32; 
	//indirectinvoke () = %16 (%17) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_17));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %20 = %2 : {int c,int r}[]
	_20 = queens_size;
	//indirectinvoke () = %19 (%20) : method(any)->()
	printf("%lld\n", _20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [70,111,117,110,100,32] : int[]
	_NEW_1DARRAY(_23, 6, 0);
	_23[0] = 70; _23[1] = 111; _23[2] = 117; _23[3] = 110; _23[4] = 100; _23[5] = 32; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_23));
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %25 (%3) : method(any)->()
	printf("%lld", num_solutions);
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [32,115,111,108,117,116,105,111,110,115,46] : int[]
	_NEW_1DARRAY(_28, 11, 0);
	_28[0] = 32; _28[1] = 115; _28[2] = 111; _28[3] = 108; _28[4] = 117; _28[5] = 116; _28[6] = 105; _28[7] = 111; _28[8] = 110; _28[9] = 115; _28[10] = 46; 
	//indirectinvoke () = %27 (%28) : method(int[])->()
	println_s(_28, _28_size);
	//return
	exit(0);
}

