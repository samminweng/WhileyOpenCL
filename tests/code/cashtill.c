#include "cashtill.h"
typedef int64_t* Cash;
int64_t* Cash(){
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

int64_t* Cash(_DECL_1DARRAY_PARAM(coins)){
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
	_COPY_1DARRAY_int64_t(cash, _13);
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

int64_t total(int64_t* c){
	int64_t _1 = 0;
	int64_t r = 0;
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	_DECL_1DARRAY(_7);
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	r = _4;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	i = _5;
	//loop (%2, %3, %6, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//lengthof %6 = %0 : int[]
		_6 = c_size;
		//ifge %3, %6 goto blklab9 : int
		if(i>=_6){goto blklab9;}
		//const %7 = [1,5,10,20,50,100,500,1000] : int[]
		_NEW_1DARRAY_int64_t(_7, 8, 0);
		_7[0] = 1; _7[1] = 5; _7[2] = 10; _7[3] = 20; _7[4] = 50; _7[5] = 100; _7[6] = 500; _7[7] = 1000; 
		//indexof %8 = %7, %3 : int[]
		_8=_7[i];
		//indexof %9 = %0, %3 : int[]
		_9=c[i];
		//mul %10 = %8, %9 : int
		_10=_8*_9;
		//add %11 = %2, %10 : int
		_11=r+_10;
		//assign %2 = %11  : int
		r = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//return %2
	return r;
	//return
}

int64_t contained(int64_t* first, int64_t* second){
	int64_t _2;
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	i = _4;
	//loop (%3, %5, %6, %7, %8, %9, %10)
	while(true){
		//lengthof %5 = %0 : int[]
		_5 = first_size;
		//ifge %3, %5 goto blklab11 : int
		if(i>=_5){goto blklab11;}
		//indexof %6 = %0, %3 : int[]
		_6=first[i];
		//indexof %7 = %1, %3 : int[]
		_7=second[i];
		//ifge %6, %7 goto blklab13 : int
		if(_6>=_7){goto blklab13;}
		//const %8 = false : bool
		_8 = false;
		//return %8
		return _8;
//.blklab13
blklab13:;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//const %11 = true : bool
	_11 = true;
	//return %11
	return _11;
	//return
}

int64_t* add(int64_t* first, int64_t* second){
	_DECL_1DARRAY(r);
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	i = _4;
	//loop (%0, %3, %5, %6, %7, %8, %9, %10)
	while(true){
		//lengthof %5 = %0 : int[]
		_5 = first_size;
		//ifge %3, %5 goto blklab15 : int
		if(i>=_5){goto blklab15;}
		//indexof %6 = %0, %3 : int[]
		_6=first[i];
		//indexof %7 = %1, %3 : int[]
		_7=second[i];
		//add %8 = %6, %7 : int
		_8=_6+_7;
		//update %0[%3] = %8 : int[] -> int[]
		first[i] = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab16
blklab16:;
	}
//.blklab15
blklab15:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(first);
	return first;
	//return
}

int64_t* subtract(int64_t* first, int64_t* second){
	_DECL_1DARRAY(r);
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	i = _4;
	//loop (%0, %3, %5, %6, %7, %8, %9, %10)
	while(true){
		//lengthof %5 = %0 : int[]
		_5 = first_size;
		//ifge %3, %5 goto blklab19 : int
		if(i>=_5){goto blklab19;}
		//indexof %6 = %0, %3 : int[]
		_6=first[i];
		//indexof %7 = %1, %3 : int[]
		_7=second[i];
		//sub %8 = %6, %7 : int
		_8=_6-_7;
		//update %0[%3] = %8 : int[] -> int[]
		first[i] = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=i+_9;
		//assign %3 = %10  : int
		i = _10;
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(first);
	return first;
	//return
}

