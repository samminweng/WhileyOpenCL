#include "specialcase1.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t ra;
	int64_t rb;
	int64_t rc;
	_DECL_1DARRAY(y);
	_DECL_DEALLOC(y);
	_DECL_1DARRAY(x);
	_DECL_DEALLOC(x);
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %0, %11 : int[]
	_12=a[_11];
	//assign %4 = %12  : int
	// isCopyEliminated = true
	ra = _12;
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=b[_13];
	//assign %5 = %14  : int
	// isCopyEliminated = true
	rb = _14;
	//const %15 = 0 : int
	_15 = 0;
	//indexof %16 = %2, %15 : int[]
	_16=c[_15];
	//assign %6 = %16  : int
	// isCopyEliminated = true
	rc = _16;
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %0, %17 : int[]
	_18=a[_17];
	//const %19 = 0 : int
	_19 = 0;
	//indexof %20 = %1, %19 : int[]
	_20=b[_19];
	//ifne %18, %20 goto blklab0 : int
	if(_18!=_20){goto blklab0;}
	//assign %9 = %0  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(y, a);
	//assign %10 = %1  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(x, b);
	//return %10
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(y);
	_DEALLOC(x);
	_DEALLOC(y);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//assign %9 = %2  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(y, c);
	//assign %10 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(x, y);
	//return %10
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(y);
	_DEALLOC(x);
	_DEALLOC(y);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
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
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	//const %5 = 1 : int
	_5 = 1;
	//const %6 = 2 : int
	_6 = 2;
	//arraygen %7 = [5; 6] : int[]
	_NEW1DARRAY_DEALLOC(_7, _5, _6, int64_t);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _7);
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//arraygen %10 = [8; 9] : int[]
	_NEW1DARRAY_DEALLOC(_10, _8, _9, int64_t);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _10);
	//const %11 = 3 : int
	_11 = 3;
	//const %12 = 2 : int
	_12 = 2;
	//arraygen %13 = [11; 12] : int[]
	_NEW1DARRAY_DEALLOC(_13, _11, _12, int64_t);
	//assign %3 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _13);
	//invoke (%14) = (%1, %2, %3) specialcase1:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_14, c, "true-MAYBE_RETURN-true" , "func");
		_FUNCTIONCALL_COPY_PRE(_14, b, "true-MAYBE_RETURN-true" , "func");
		_FUNCTIONCALL_COPY_PRE(_14, a, "true-MAYBE_RETURN-true" , "func");
		_DEALLOC(_14);
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		// isCopyEliminated of '_1' = false
		// isCopyEliminated of '_2' = false
		// isCopyEliminated of '_3' = false
		_14 = _func_(tmp_a, a_size, tmp_b, b_size, tmp_c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		if( _14 == tmp_a ){
			_14_dealloc = true;
			free(tmp_b);
			free(tmp_c);
		} else if( _14 == tmp_b ){
			_14_dealloc = true;
			free(tmp_a);
			free(tmp_c);
		} else if( _14 == tmp_c ){
			_14_dealloc = true;
			free(tmp_a);
			free(tmp_b);
		} else {
			_14_dealloc = true;
			free(tmp_a);
			free(tmp_b);
			free(tmp_c);
		}
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _14);
	//assert
	{
		//const %15 = 0 : int
		_15 = 0;
		//indexof %16 = %1, %15 : int[]
		_16=a[_15];
		//const %17 = 1 : int
		_17 = 1;
		//ifeq %16, %17 goto blklab2 : int
		if(_16==_17){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//assert
	{
		//const %18 = 0 : int
		_18 = 0;
		//indexof %19 = %2, %18 : int[]
		_19=b[_18];
		//const %20 = 2 : int
		_20 = 2;
		//ifeq %19, %20 goto blklab3 : int
		if(_19==_20){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %21 = 0 : int
		_21 = 0;
		//indexof %22 = %3, %21 : int[]
		_22=c[_21];
		//const %23 = 3 : int
		_23 = 3;
		//ifeq %22, %23 goto blklab4 : int
		if(_22==_23){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//assert
	{
		//const %24 = 0 : int
		_24 = 0;
		//indexof %25 = %4, %24 : int[]
		_25=r[_24];
		//const %26 = 3 : int
		_26 = 3;
		//ifeq %25, %26 goto blklab5 : int
		if(_25==_26){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(r);
	_DEALLOC(_7);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_14);
	exit(0);
}

