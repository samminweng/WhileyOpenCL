#include "ArrayAppend3.h"
int64_t* _toString_(_DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	bool firstTime;
	int64_t i;
	int64_t amt;
	void* _6;
	size_t _6_size = 0;
	_DECL_DEALLOC(_6);
	bool _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	bool _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	bool _15;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	_DECL_2DARRAY(_21);
	_DECL_DEALLOC(_21);
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	int64_t _23;
	int64_t _24;
	void* _25;
	size_t _25_size = 0;
	_DECL_DEALLOC(_25);
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	//const %6 = [] : void[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 0, 0);
	_6_dealloc = true;
	//assign %2 = %6  : void[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _6);
	_ADD_DEALLOC_POST(r, _6);
	//const %7 = true : bool
	_7 = true;
	//assign %3 = %7  : bool
	firstTime = _7;
	//const %8 = 0 : int
	_8 = 0;
	//assign %4 = %8  : int
	i = _8;
	//loop (%2, %3, %4, %5, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24)
	while(true){
		//lengthof %9 = %0 : int[]
		_9 = c_size;
		//ifge %4, %9 goto blklab2 : int
		if(i>=_9){goto blklab2;}
		//indexof %10 = %0, %4 : int[]
		_10=c[i];
		//assign %5 = %10  : int
		amt = _10;
		//const %11 = 0 : int
		_11 = 0;
		//ifeq %5, %11 goto blklab4 : int
		if(amt==_11){goto blklab4;}
		//const %12 = true : bool
		_12 = true;
		//ifeq %3, %12 goto blklab5 : bool
		if(firstTime==_12){goto blklab5;}
		//const %14 = [44,32] : int[]
		_DEALLOC(_14);
		_NEW_1DARRAY_int64_t(_14, 2, 0);
		_14[0] = 44; _14[1] = 32; 
		_14_dealloc = true;
		//invoke (%13) = (%2, %14) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_13);
			_13 = Array_Append(r, r_size , _14, _14_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
			_13_dealloc = true;
		}
		//assign %2 = %13  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _13);
		_ADD_DEALLOC_POST(r, _13);
//.blklab5
blklab5:;
		//const %15 = false : bool
		_15 = false;
		//assign %3 = %15  : bool
		firstTime = _15;
		//invoke (%17) = (%5) whiley/lang/Int:toString : function(int)->(whiley/lang/ASCII:string)
		{
			_DEALLOC(_17);
			_17 = Int_toString(amt, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
			_17_dealloc = true;
		}
		//invoke (%16) = (%2, %17) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_16);
			_16 = Array_Append(r, r_size , _17, _17_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
			_16_dealloc = true;
		}
		//assign %2 = %16  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _16);
		_ADD_DEALLOC_POST(r, _16);
		//const %19 = [32,120,32] : int[]
		_DEALLOC(_19);
		_NEW_1DARRAY_int64_t(_19, 3, 0);
		_19[0] = 32; _19[1] = 120; _19[2] = 32; 
		_19_dealloc = true;
		//invoke (%18) = (%2, %19) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_18);
			_18 = Array_Append(r, r_size , _19, _19_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
			_18_dealloc = true;
		}
		//assign %2 = %18  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _18);
		_ADD_DEALLOC_POST(r, _18);
		//const %21 = [[49,99],[53,99],[49,48,99],[50,48,99],[53,48,99],[36,49],[36,53],[36,49,48]] : int[][]
		_DEALLOC_2DARRAY(_21);
		_NEW_2DARRAY_int64_t_EMPTY(_21, 8, 3);
		{
			int64_t tmp[] = {49, 99, '\0'};
			memcpy(_21[0], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {53, 99, '\0'};
			memcpy(_21[1], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {49, 48, 99};
			memcpy(_21[2], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {50, 48, 99};
			memcpy(_21[3], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {53, 48, 99};
			memcpy(_21[4], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {36, 49, '\0'};
			memcpy(_21[5], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {36, 53, '\0'};
			memcpy(_21[6], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {36, 49, 48};
			memcpy(_21[7], tmp, 3*sizeof(int64_t));
		}

		_21_dealloc = true;
		//indexof %22 = %21, %4 : int[][]
		_22=_21[i];
		_22_size = _21_size_size;
		_22_dealloc = false;
		//invoke (%20) = (%2, %22) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_20);
			_20 = Array_Append(r, r_size , _22, _22_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_20_dealloc = true;
		}
		//assign %2 = %20  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _20);
		_ADD_DEALLOC_POST(r, _20);
//.blklab4
blklab4:;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %4, %23 : int
		_24=i+_23;
		//assign %4 = %24  : int
		i = _24;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//const %25 = [] : void[]
	_DEALLOC(_25);
	_NEW_1DARRAY_int64_t(_25, 0, 0);
	_25_dealloc = true;
	//ifne %2, %25 goto blklab6 : int[]
	if(r!=_25){goto blklab6;}
	//const %26 = [40,110,111,116,104,105,110,103,41] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 9, 0);
	_26[0] = 40; _26[1] = 110; _26[2] = 111; _26[3] = 116; _26[4] = 104; _26[5] = 105; _26[6] = 110; _26[7] = 103; _26[8] = 41; 
	_26_dealloc = true;
	//assign %2 = %26  : int[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _26);
	_ADD_DEALLOC_POST(r, _26);
//.blklab6
blklab6:;
	//return %2
	_DEALLOC(c);
	_DEALLOC(_1);
	_DEALLOC(_6);
	_DEALLOC(_13);
	_DEALLOC(_14);
	_DEALLOC(_16);
	_DEALLOC(_17);
	_DEALLOC(_18);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC_2DARRAY(_21);
	_DEALLOC(_22);
	_DEALLOC(_25);
	_DEALLOC(_26);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(till);
	_DECL_DEALLOC(till);
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	//const %2 = 5 : int
	_2 = 5;
	//const %3 = 3 : int
	_3 = 3;
	//const %4 = 3 : int
	_4 = 3;
	//const %5 = 1 : int
	_5 = 1;
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 3 : int
	_7 = 3;
	//const %8 = 0 : int
	_8 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//newlist %10 = (%2, %3, %4, %5, %6, %7, %8, %9) : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, 8, 0);
	_10[0] = _2; _10[1] = _3; _10[2] = _4; _10[3] = _5; _10[4] = _6; _10[5] = _7; _10[6] = _8; _10[7] = _9; 
	_10_dealloc = true;
	//assign %1 = %10  : int[]
	_ADD_DEALLOC(till, _10, int64_t);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [84,105,108,108,58,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 6, 0);
	_13[0] = 84; _13[1] = 105; _13[2] = 108; _13[3] = 108; _13[4] = 58; _13[5] = 32; 
	_13_dealloc = true;
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%1) ArrayAppend3:toString : function(ArrayAppend3:Cash)->(whiley/lang/ASCII:string)
	{
		_FUNCTIONCALL_COPY_PRE(_16, till, 0, "liveness: till = false, readonly: till = true, return:till = NEVER_RETURN" , "toString");
		_DEALLOC(_16);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(till, tmp_c, int64_t);
		_16 = _toString_(tmp_c, till_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_16_dealloc = true;
		free(tmp_c);
	}
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//return
	_DEALLOC(till);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_16);
	exit(0);
}

