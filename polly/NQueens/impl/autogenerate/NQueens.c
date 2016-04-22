#include "NQueens.h"
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
long long conflict(POS* p, _DECL_OWNERSHIP_PARAM(p), long long row, long long col){
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
	_FREE_STRUCT(p, POS);
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
	_FREE_STRUCT(p, POS);
	return _15;
	//return
}

long long run(POS** queens, long long queens_size, _DECL_OWNERSHIP_PARAM(queens), long long n, long long dim){
	long long _3 = 0;
	long long num_solutions = 0;
	long long col = 0;
	long long solution;
	long long i = 0;
	POS* p;
	_DECL_OWNERSHIP(p);
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
	_DECL_OWNERSHIP(_19);
	long long _20;
	long long _21;
	long long _22;
	long long _23 = 0;
	long long _24 = 0;
	long long _25;
	POS* _26;
	_DECL_OWNERSHIP(_26);
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	//ifne %2, %1 goto blklab6 : int
	if(dim!=n){goto blklab6;}
	//const %9 = 1 : int
	_9 = 1;
	//return %9
	_FREE(queens);
	_FREE_STRUCT(p, POS);
	_FREE_STRUCT(_19, POS);
	_FREE_STRUCT(_26, POS);
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
	//loop (%0, %4, %5, %6, %7, %8, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
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
		solution = _14;
		//const %15 = 0 : int
		_15 = 0;
		//assign %7 = %15  : int
		i = _15;
		//loop (%6, %7, %8, %16, %17, %18, %19, %20, %21, %22, %23, %24)
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
			_FREE(_19);
			_19 = copy_POS(queens[i]);
			_ADD_OWNERSHIP(_19);
			//assign %8 = %19  : {int c,int r}
			_FREE_STRUCT(p, POS);
			p = _19;
			_ADD_OWNERSHIP(p);
			_REMOVE_OWNERSHIP(_19);
			//invoke (%20) = (%8, %1, %5) NQueens:conflict : function(NQueens:POS,int,int)->(bool)
			_20 = conflict(_STRUCT_PARAM(p), false, n, col);
			//const %21 = true : bool
			_21 = true;
			//ifeq %20, %21 goto blklab18 : bool
			if(_20==_21){goto blklab18;}
			//goto blklab17
			goto blklab17;
//.blklab18
blklab18:;
			//const %22 = false : bool
			_22 = false;
			//assign %6 = %22  : bool
			solution = _22;
			//goto blklab12
			goto blklab12;
//.blklab17
blklab17:;
			//const %23 = 1 : int
			_23 = 1;
			//add %24 = %7, %23 : int
			_24=i+_23;
			//assign %7 = %24  : int
			i = _24;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %25 = true : bool
		_25 = true;
		//ifne %6, %25 goto blklab19 : bool
		if(solution!=_25){goto blklab19;}
		//newrecord %26 = (%5, %1) : {int c,int r}
		_FREE_STRUCT(_26, POS);
		_26 = malloc(sizeof(POS));
		_26->c = col;
		_26->r = n;
		_ADD_OWNERSHIP(_26);
		//update %0[%1] = %26 : {int c,int r}[] -> {int c,int r}[]
		queens[n] = _26;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %1, %28 : int
		_29=n+_28;
		//invoke (%27) = (%0, %29, %2) NQueens:run : function(NQueens:POS[],int,int)->(int)
		_27 = run(_1DARRAY_PARAM(queens), false, _29, dim);
		//add %30 = %4, %27 : int
		_30=num_solutions+_27;
		//assign %4 = %30  : int
		num_solutions = _30;
//.blklab19
blklab19:;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %5, %31 : int
		_32=col+_31;
		//assign %5 = %32  : int
		col = _32;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %4
	_FREE(queens);
	_FREE_STRUCT(p, POS);
	_FREE_STRUCT(_19, POS);
	_FREE_STRUCT(_26, POS);
	return num_solutions;
//.blklab7
blklab7:;
	//return
}

int main(int argc, char** args){
	long long* max;
	long long n = 0;
	POS** init;
	long long init_size = 0;
	_DECL_OWNERSHIP(init);
	long long num_solutions = 0;
	long long* _5;
	_DECL_2DARRAY(_6);
	_DECL_OWNERSHIP(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	long long _10 = 0;
	POS* _11;
	_DECL_OWNERSHIP(_11);
	POS** _12;
	long long _12_size = 0;
	_DECL_OWNERSHIP(_12);
	long long _13 = 0;
	long long _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
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
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_6);
	_ADD_OWNERSHIP(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_5, _8);
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab20 : null|int
	if(max == NULL) { goto blklab20;}
	//assign %2 = %1  : int
	n = *max;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 0 : int
	_10 = 0;
	//newrecord %11 = (%9, %10) : {int c,int r}
	_FREE_STRUCT(_11, POS);
	_11 = malloc(sizeof(POS));
	_11->c = _9;
	_11->r = _10;
	_ADD_OWNERSHIP(_11);
	//arraygen %12 = [11; 2] : {int c,int r}[]
	_FREE(_12);
	_12 = malloc(n*sizeof(POS*));
	for(int _12_i=0;_12_i<n;_12_i++){_12[_12_i] = copy_POS(_11);}
	_12_size = n;
	_ADD_OWNERSHIP(_12);
	//assign %3 = %12  : {int c,int r}[]
	_FREE(init);
	_1DARRAY_UPDATE(init, _12);
	_ADD_OWNERSHIP(init);
	_REMOVE_OWNERSHIP(_12);
	//const %14 = 0 : int
	_14 = 0;
	//invoke (%13) = (%3, %14, %2) NQueens:run : function(NQueens:POS[],int,int)->(int)
	_13 = run(_1DARRAY_PARAM(init), false, _14, n);
	//assign %4 = %13  : int
	num_solutions = _13;
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [78,45,81,117,101,101,110,32,80,114,111,98,108,101,109,32,111,110,32,97,32,78,32,88,32,78,32,66,111,97,114,100,46] : int[]
	_FREE(_17);
	_NEW_ARRAY(_17, 33);
	_17[0] = 78; _17[1] = 45; _17[2] = 81; _17[3] = 117; _17[4] = 101; _17[5] = 101; _17[6] = 110; _17[7] = 32; _17[8] = 80; _17[9] = 114; _17[10] = 111; _17[11] = 98; _17[12] = 108; _17[13] = 101; _17[14] = 109; _17[15] = 32; _17[16] = 111; _17[17] = 110; _17[18] = 32; _17[19] = 97; _17[20] = 32; _17[21] = 78; _17[22] = 32; _17[23] = 88; _17[24] = 32; _17[25] = 78; _17[26] = 32; _17[27] = 66; _17[28] = 111; _17[29] = 97; _17[30] = 114; _17[31] = 100; _17[32] = 46; 
	_ADD_OWNERSHIP(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	println_s(_1DARRAY_PARAM(_17));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [78,32,61,32] : int[]
	_FREE(_20);
	_NEW_ARRAY(_20, 4);
	_20[0] = 78; _20[1] = 32; _20[2] = 61; _20[3] = 32; 
	_ADD_OWNERSHIP(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_20));
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %22 (%2) : method(any)->()
	printf("%lld\n", n);
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = [70,111,117,110,100,32] : int[]
	_FREE(_25);
	_NEW_ARRAY(_25, 6);
	_25[0] = 70; _25[1] = 111; _25[2] = 117; _25[3] = 110; _25[4] = 100; _25[5] = 32; 
	_ADD_OWNERSHIP(_25);
	//indirectinvoke () = %24 (%25) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_25));
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %27 (%4) : method(any)->()
	printf("%lld", num_solutions);
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [32,115,111,108,117,116,105,111,110,115,46] : int[]
	_FREE(_30);
	_NEW_ARRAY(_30, 11);
	_30[0] = 32; _30[1] = 115; _30[2] = 111; _30[3] = 108; _30[4] = 117; _30[5] = 116; _30[6] = 105; _30[7] = 111; _30[8] = 110; _30[9] = 115; _30[10] = 46; 
	_ADD_OWNERSHIP(_30);
	//indirectinvoke () = %29 (%30) : method(int[])->()
	println_s(_1DARRAY_PARAM(_30));
//.blklab20
blklab20:;
	//return
	_FREE(init);
	_FREE2DArray(_6);
	_FREE(_8);
	_FREE_STRUCT(_11, POS);
	_FREE(_12);
	_FREE(_17);
	_FREE(_20);
	_FREE(_25);
	_FREE(_30);
	exit(0);
}

