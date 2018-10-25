#include "functioncall4_3Vars_test432.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), int64_t i, int64_t j, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	//indexof %4 = %0, %1 : int[]
	_4=a[i];
	//indexof %5 = %0, %2 : int[]
	_5=a[j];
	//ifge %4, %5 goto blklab0 : int
	if(_4>=_5){goto blklab0;}
	//const %6 = 0 : int
	_6 = 0;
	//assign %1 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%0, %1, %7, %8, %9)
	while(true){
		//ifge %1, %2 goto blklab2 : int
		if(i>=j){goto blklab2;}
		//indexof %7 = %0, %2 : int[]
		_7=a[j];
		//update %0[%1] = %7 : int[] -> int[]
		a[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %1, %8 : int
		_9=i+_8;
		//assign %1 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %0
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %2, %10 : int
	_11=j+_10;
	//assign %1 = %11  : int
	// isCopyEliminated = true
	i = _11;
	//loop (%0, %1, %12, %13, %14, %15)
	while(true){
		//lengthof %12 = %0 : int[]
		_12 = a_size;
		//ifge %1, %12 goto blklab4 : int
		if(i>=_12){goto blklab4;}
		//indexof %13 = %0, %2 : int[]
		_13=a[j];
		//update %0[%1] = %13 : int[] -> int[]
		a[i] = _13;
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %1, %14 : int
		_15=i+_14;
		//assign %1 = %15  : int
		// isCopyEliminated = true
		i = _15;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %0
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t j;
	int64_t i;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12;
	int64_t _13;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 5 : int
	_7 = 5;
	//arraygen %8 = [6; 7] : int[]
	_NEW1DARRAY_DEALLOC(_8, _6, _7, int64_t);
	//assign %1 = %8  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _8);
	//const %9 = 2 : int
	_9 = 2;
	//const %10 = 5 : int
	_10 = 5;
	//arraygen %11 = [9; 10] : int[]
	_NEW1DARRAY_DEALLOC(_11, _9, _10, int64_t);
	//assign %2 = %11  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _11);
	//const %12 = 3 : int
	_12 = 3;
	//const %13 = 5 : int
	_13 = 5;
	//arraygen %14 = [12; 13] : int[]
	_NEW1DARRAY_DEALLOC(_14, _12, _13, int64_t);
	//assign %3 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _14);
	//const %15 = 0 : int
	_15 = 0;
	//assign %4 = %15  : int
	// isCopyEliminated = true
	j = _15;
	//loop (%1, %2, %3, %4, %5, %16, %17, %18, %19, %20, %21, %22, %23)
	while(true){
		//const %16 = 10 : int
		_16 = 10;
		//ifge %4, %16 goto blklab6 : int
		if(j>=_16){goto blklab6;}
		//assign %2 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, c);
		//assign %1 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(a, b, int64_t);
		//assign %3 = %2  : int[]
		// isCopyEliminated = false
		_ADD_DEALLOC(c, b, int64_t);
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %2, %17 : int[]
		_18=b[_17];
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
		//assign %2 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(b, a);
		//assign %1 = %3  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, c);
		//assign %3 = %1  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(c, a);
		//const %20 = 2 : int
		_20 = 2;
		//const %21 = 3 : int
		_21 = 3;
		//invoke (%19) = (%2, %20, %21) functioncall4_3Vars_test432:func : function(int[],int,int)->(int[])
		{
			_FUNCTIONCALL_NO_COPY_PRE(_19, b, "true-ALWAYS_RETURN-false" , "func");
			_DEALLOC(_19);
			// isCopyEliminated of '_2' = true
			_19 = _func_(b, b_size, _20, _21, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_19));
			_19_dealloc = b_dealloc;
			b_dealloc = false;
		}
		//assign %1 = %19  : int[]
		// isCopyEliminated = true
		_TRANSFER_DEALLOC(a, _19);
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %4, %22 : int
		_23=j+_22;
		//assign %4 = %23  : int
		// isCopyEliminated = true
		j = _23;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_19);
	exit(0);
}

