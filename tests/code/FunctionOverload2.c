#include "FunctionOverload2.h"
int64_t* _Cash_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	int64_t _1 = 0;
	int64_t _2 = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	//const %1 = 0 : int
	_1 = 0;
	//const %2 = 0 : int
	_2 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//newlist %9 = (%1, %2, %3, %4, %5, %6, %7, %8) : int[]
	_NEW_1DARRAY_int64_t(_9, 8, 0);
	_9[0] = _1; _9[1] = _2; _9[2] = _3; _9[3] = _4; _9[4] = _5; _9[5] = _6; _9[6] = _7; _9[7] = _8; 
	//return %9
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_9);
	return _9;
	//return
}

int64_t* _Cash_1_(_DECL_1DARRAY_PARAM(coins), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_1DARRAY(cash);
	int64_t i = 0;
	int64_t coin = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	_DECL_1DARRAY(_13);
	int64_t _14 = 0;
	int64_t _15 = 0;
	_DECL_1DARRAY(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 0 : int
	_10 = 0;
	//const %11 = 0 : int
	_11 = 0;
	//const %12 = 0 : int
	_12 = 0;
	//newlist %13 = (%5, %6, %7, %8, %9, %10, %11, %12) : int[]
	_NEW_1DARRAY_int64_t(_13, 8, 0);
	_13[0] = _5; _13[1] = _6; _13[2] = _7; _13[3] = _8; _13[4] = _9; _13[5] = _10; _13[6] = _11; _13[7] = _12; 
	//assign %2 = %13  : int[]
	_UPDATE_1DARRAY(cash, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	i = _14;
	//loop (%2, %3, %4, %15, %16, %17, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
	while(true){
		//invariant
		{
			//lengthof %15 = %2 : int[]
			_15 = cash_size;
			//const %16 = [1,5,10,20,50,100,500,1000] : int[]
			_NEW_1DARRAY_int64_t(_16, 8, 0);
			_16[0] = 1; _16[1] = 5; _16[2] = 10; _16[3] = 20; _16[4] = 50; _16[5] = 100; _16[6] = 500; _16[7] = 1000; 
			//lengthof %17 = %16 : int[]
			_17 = _16_size;
			//ifne %15, %17 goto blklab7 : int
			if(_15!=_17){goto blklab7;}
			//const %19 = 0 : int
			_19 = 0;
			//lengthof %20 = %2 : int[]
			_20 = cash_size;
			//quantify %18 in %19..%20(%21, %22)
			while(true){
				//indexof %21 = %2, %18 : int[]
				_21=cash[_18];
				//const %22 = 0 : int
				_22 = 0;
				//iflt %21, %22 goto blklab8 : int
				if(_21<_22){goto blklab8;}
			}
			//goto blklab6
			goto blklab6;
//.blklab8
blklab8:;
//.blklab7
blklab7:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab6
blklab6:;
		//invariant
		}
		//lengthof %23 = %0 : int[]
		_23 = coins_size;
		//ifge %3, %23 goto blklab4 : int
		if(i>=_23){goto blklab4;}
		//indexof %24 = %0, %3 : int[]
		_24=coins[i];
		//assign %4 = %24  : int
		coin = _24;
		//indexof %25 = %2, %4 : int[]
		_25=cash[coin];
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %25, %26 : int
		_27=_25+_26;
		//update %2[%4] = %27 : int[] -> int[]
		cash[coin] = _27;
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %3, %28 : int
		_29=i+_28;
		//assign %3 = %29  : int
		i = _29;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(cash);
	return cash;
	//return
}

