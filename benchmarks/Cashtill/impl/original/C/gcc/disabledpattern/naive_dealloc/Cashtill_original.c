#include "Cashtill_original.h"
int64_t* _Cash_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	_DECL_DEALLOC(_0);
	int64_t _1 = 0;
	int64_t _2 = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
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
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, 8, 0);
	_9[0] = _1; _9[1] = _2; _9[2] = _3; _9[3] = _4; _9[4] = _5; _9[5] = _6; _9[6] = _7; _9[7] = _8; 
	_ADD_DEALLOC(_9);
	//return %9
	_DEALLOC(_0);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_9);
	return _9;
	//return
}

int64_t* _Cash_1_(_DECL_1DARRAY_PARAM(coins), _DECL_DEALLOC_PARAM(coins), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(cash);
	_DECL_DEALLOC(cash);
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
	_DECL_DEALLOC(_13);
	int64_t _14 = 0;
	int64_t _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
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
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 8, 0);
	_13[0] = _5; _13[1] = _6; _13[2] = _7; _13[3] = _8; _13[4] = _9; _13[5] = _10; _13[6] = _11; _13[7] = _12; 
	_ADD_DEALLOC(_13);
	//assign %2 = %13  : int[]
	_DEALLOC(cash);
	_COPY_1DARRAY_int64_t(cash, _13);
	_ADD_DEALLOC(cash);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	i = _14;
	//loop (%2, %3, %4, %15, %16, %17, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
	while(true){
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
	_DEALLOC(coins);
	_DEALLOC(_1);
	_DEALLOC(_13);
	_DEALLOC(_16);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(cash);
	return cash;
	//return
}

int64_t _total_(_DECL_1DARRAY_PARAM(c), _DECL_DEALLOC_PARAM(c)){
	int64_t _1 = 0;
	int64_t r = 0;
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
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
		_DEALLOC(_7);
		_NEW_1DARRAY_int64_t(_7, 8, 0);
		_7[0] = 1; _7[1] = 5; _7[2] = 10; _7[3] = 20; _7[4] = 50; _7[5] = 100; _7[6] = 500; _7[7] = 1000; 
		_ADD_DEALLOC(_7);
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
	_DEALLOC(c);
	_DEALLOC(_7);
	return r;
	//return
}

int64_t _contained_(_DECL_1DARRAY_PARAM(first), _DECL_DEALLOC_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_DEALLOC_PARAM(second)){
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
		_DEALLOC(first);
		_DEALLOC(second);
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
	_DEALLOC(first);
	_DEALLOC(second);
	return _11;
	//return
}

int64_t* _add_(_DECL_1DARRAY_PARAM(first), _DECL_DEALLOC_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_DEALLOC_PARAM(second), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
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
	_DEALLOC(second);
	_DEALLOC(r);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(first);
	return first;
	//return
}

int64_t* _subtract_(_DECL_1DARRAY_PARAM(first), _DECL_DEALLOC_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_DEALLOC_PARAM(second), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
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
	_DEALLOC(second);
	_DEALLOC(r);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(first);
	return first;
	//return
}

int64_t* _calculateChange_(_DECL_1DARRAY_PARAM(till), _DECL_DEALLOC_PARAM(till), int64_t change, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t i = 0;
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	_DECL_1DARRAY(chg);
	_DECL_DEALLOC(chg);
	int64_t _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	void* _26;
	//const %6 = 0 : int
	_6 = 0;
	//ifne %1, %6 goto blklab25 : int
	if(change!=_6){goto blklab25;}
	//invoke (%7) = () Cashtill_original:Cash : function()->(Cashtill_original:Cash)
	{
		_DEALLOC(_7);
		_7 = _Cash_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_ADD_DEALLOC(_7);
	}
	//return %7
	_DEALLOC(till);
	_DEALLOC(r);
	_DEALLOC(tmp);
	_DEALLOC(chg);
	_DEALLOC(_12);
	_DEALLOC(_17);
	_DEALLOC(_18);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_7);
	return _7;
	//goto blklab26
	goto blklab26;
//.blklab25
blklab25:;
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	i = _8;
	//loop (%3, %4, %5, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//lengthof %9 = %0 : int[]
		_9 = till_size;
		//ifge %3, %9 goto blklab27 : int
		if(i>=_9){goto blklab27;}
		//indexof %10 = %0, %3 : int[]
		_10=till[i];
		//const %11 = 0 : int
		_11 = 0;
		//ifle %10, %11 goto blklab29 : int
		if(_10<=_11){goto blklab29;}
		//const %12 = [1,5,10,20,50,100,500,1000] : int[]
		_DEALLOC(_12);
		_NEW_1DARRAY_int64_t(_12, 8, 0);
		_12[0] = 1; _12[1] = 5; _12[2] = 10; _12[3] = 20; _12[4] = 50; _12[5] = 100; _12[6] = 500; _12[7] = 1000; 
		_ADD_DEALLOC(_12);
		//indexof %13 = %12, %3 : int[]
		_13=_12[i];
		//ifgt %13, %1 goto blklab29 : int
		if(_13>change){goto blklab29;}
		//assign %4 = %0  : int[]
		_DEALLOC(tmp);
		_COPY_1DARRAY_int64_t(tmp, till);
		_ADD_DEALLOC(tmp);
		//indexof %14 = %4, %3 : int[]
		_14=tmp[i];
		//const %15 = 1 : int
		_15 = 1;
		//sub %16 = %14, %15 : int
		_16=_14-_15;
		//update %4[%3] = %16 : int[] -> int[]
		tmp[i] = _16;
		//const %18 = [1,5,10,20,50,100,500,1000] : int[]
		_DEALLOC(_18);
		_NEW_1DARRAY_int64_t(_18, 8, 0);
		_18[0] = 1; _18[1] = 5; _18[2] = 10; _18[3] = 20; _18[4] = 50; _18[5] = 100; _18[6] = 500; _18[7] = 1000; 
		_ADD_DEALLOC(_18);
		//indexof %19 = %18, %3 : int[]
		_19=_18[i];
		//sub %20 = %1, %19 : int
		_20=change-_19;
		//invoke (%17) = (%4, %20) Cashtill_original:calculateChange : function(Cashtill_original:Cash,Cashtill_original:nat)->(Cashtill_original:Cash|null)
		{
			void* tmp_tmp;
			_DEALLOC(_17);
			_17 = _calculateChange_(_COPY_1DARRAY_PARAM_int64_t(tmp), true, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
			_CALLEE_DEALLOC(tmp, "false-false-false" , "calculateChange");
			_ADD_DEALLOC(_17);
		}
		//assign %5 = %17  : null|int[]
		_DEALLOC(chg);
		_COPY_1DARRAY_int64_t(chg, _17);
		_ADD_DEALLOC(chg);
		//ifis %5, null goto blklab30 : null|int[]
		if(chg == NULL) { goto blklab30;}
		//indexof %21 = %5, %3 : int[]
		_21=chg[i];
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %21, %22 : int
		_23=_21+_22;
		//update %5[%3] = %23 : int[] -> int[]
		chg[i] = _23;
		//return %5
		_DEALLOC(till);
		_DEALLOC(r);
		_DEALLOC(tmp);
		_DEALLOC(_7);
		_DEALLOC(_12);
		_DEALLOC(_17);
		_DEALLOC(_18);
		_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(chg);
		return chg;
//.blklab30
blklab30:;
//.blklab29
blklab29:;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %3, %24 : int
		_25=i+_24;
		//assign %3 = %25  : int
		i = _25;
//.blklab28
blklab28:;
	}
//.blklab27
blklab27:;
	//const %26 = null : null
	_26 = NULL;
	//return %26
	_DEALLOC(till);
	_DEALLOC(r);
	_DEALLOC(tmp);
	_DEALLOC(chg);
	_DEALLOC(_7);
	_DEALLOC(_12);
	_DEALLOC(_17);
	_DEALLOC(_18);
	return _26;
//.blklab26
blklab26:;
	//return
}

int64_t* _toString_(_DECL_1DARRAY_PARAM(c), _DECL_DEALLOC_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t firstTime;
	int64_t i = 0;
	int64_t amt = 0;
	void* _6;
	size_t _6_size = 0;
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15;
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
	int64_t _23 = 0;
	int64_t _24 = 0;
	void* _25;
	size_t _25_size = 0;
	_DECL_DEALLOC(_25);
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	//const %6 = [] : void[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 0, 0);
	_ADD_DEALLOC(_6);
	//assign %2 = %6  : void[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _6);
	_ADD_DEALLOC(r);
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
		//ifge %4, %9 goto blklab31 : int
		if(i>=_9){goto blklab31;}
		//indexof %10 = %0, %4 : int[]
		_10=c[i];
		//assign %5 = %10  : int
		amt = _10;
		//const %11 = 0 : int
		_11 = 0;
		//ifeq %5, %11 goto blklab33 : int
		if(amt==_11){goto blklab33;}
		//const %12 = true : bool
		_12 = true;
		//ifeq %3, %12 goto blklab34 : bool
		if(firstTime==_12){goto blklab34;}
		//const %14 = [44,32] : int[]
		_DEALLOC(_14);
		_NEW_1DARRAY_int64_t(_14, 2, 0);
		_14[0] = 44; _14[1] = 32; 
		_ADD_DEALLOC(_14);
		//invoke (%13) = (%2, %14) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_13);
			_13 = Array_Append(_1DARRAY_PARAM(r), _1DARRAY_PARAM(_14), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
			_ADD_DEALLOC(_13);
		}
		//assign %2 = %13  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _13);
		_ADD_DEALLOC(r);
//.blklab34
blklab34:;
		//const %15 = false : bool
		_15 = false;
		//assign %3 = %15  : bool
		firstTime = _15;
		//invoke (%17) = (%5) whiley/lang/Int:toString : function(int)->(whiley/lang/ASCII:string)
		{
			_DEALLOC(_17);
			_17 = Int_toString(amt, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
			_ADD_DEALLOC(_17);
		}
		//invoke (%16) = (%2, %17) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_16);
			_16 = Array_Append(_1DARRAY_PARAM(r), _1DARRAY_PARAM(_17), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
			_ADD_DEALLOC(_16);
		}
		//assign %2 = %16  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _16);
		_ADD_DEALLOC(r);
		//const %19 = [32,120,32] : int[]
		_DEALLOC(_19);
		_NEW_1DARRAY_int64_t(_19, 3, 0);
		_19[0] = 32; _19[1] = 120; _19[2] = 32; 
		_ADD_DEALLOC(_19);
		//invoke (%18) = (%2, %19) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_18);
			_18 = Array_Append(_1DARRAY_PARAM(r), _1DARRAY_PARAM(_19), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
			_ADD_DEALLOC(_18);
		}
		//assign %2 = %18  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _18);
		_ADD_DEALLOC(r);
		//const %21 = [[32,49,99],[32,53,99],[49,48,99],[50,48,99],[53,48,99],[32,36,49],[32,36,53],[36,49,48]] : int[][]
		_DEALLOC_2DARRAY_int64_t(_21);
		_NEW_2DARRAY_int64_t_EMPTY(_21, 8, 3);
		{
			int64_t tmp[] = {32, 49, 99};
			memcpy(_21[0], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {32, 53, 99};
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
			int64_t tmp[] = {32, 36, 49};
			memcpy(_21[5], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {32, 36, 53};
			memcpy(_21[6], tmp, 3*sizeof(int64_t));
		}
		{
			int64_t tmp[] = {36, 49, 48};
			memcpy(_21[7], tmp, 3*sizeof(int64_t));
		}

		_ADD_DEALLOC(_21);
		//indexof %22 = %21, %4 : int[][]
		_22=_21[i];
		_22_size = _21_size_size;
		_REMOVE_DEALLOC(_22);
		//invoke (%20) = (%2, %22) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_20);
			_20 = Array_Append(_1DARRAY_PARAM(r), _1DARRAY_PARAM(_22), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_ADD_DEALLOC(_20);
		}
		//assign %2 = %20  : int[]
		_DEALLOC(r);
		_COPY_1DARRAY_int64_t(r, _20);
		_ADD_DEALLOC(r);
//.blklab33
blklab33:;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %4, %23 : int
		_24=i+_23;
		//assign %4 = %24  : int
		i = _24;
//.blklab32
blklab32:;
	}
//.blklab31
blklab31:;
	//const %25 = [] : void[]
	_DEALLOC(_25);
	_NEW_1DARRAY_int64_t(_25, 0, 0);
	_ADD_DEALLOC(_25);
	//ifne %2, %25 goto blklab35 : int[]
	if(r!=_25){goto blklab35;}
	//const %26 = [40,110,111,116,104,105,110,103,41] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 9, 0);
	_26[0] = 40; _26[1] = 110; _26[2] = 111; _26[3] = 116; _26[4] = 104; _26[5] = 105; _26[6] = 110; _26[7] = 103; _26[8] = 41; 
	_ADD_DEALLOC(_26);
	//assign %2 = %26  : int[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _26);
	_ADD_DEALLOC(r);
//.blklab35
blklab35:;
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
	_DEALLOC_2DARRAY_int64_t(_21);
	_DEALLOC(_22);
	_DEALLOC(_25);
	_DEALLOC(_26);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
	//return
}

int64_t* _buy_(FILE* console, _DECL_1DARRAY_PARAM(till), _DECL_DEALLOC_PARAM(till), _DECL_1DARRAY_PARAM(given), _DECL_DEALLOC_PARAM(given), int64_t cost, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_4);
	_DECL_DEALLOC(_4);
	_DECL_1DARRAY(change);
	_DECL_DEALLOC(change);
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	int64_t _29 = 0;
	int64_t _30 = 0;
	void* _31;
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	void* _34;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	_DECL_1DARRAY(_40);
	_DECL_DEALLOC(_40);
	_DECL_1DARRAY(_41);
	_DECL_DEALLOC(_41);
	void* _42;
	_DECL_1DARRAY(_44);
	_DECL_DEALLOC(_44);
	void* _45;
	_DECL_1DARRAY(_47);
	_DECL_DEALLOC(_47);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [45,45] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, 2, 0);
	_8[0] = 45; _8[1] = 45; 
	_ADD_DEALLOC(_8);
	//indirectinvoke () = %7 (%8) : method(int[])->()
	{
		println_s(_8, _8_size);
	}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [67,117,115,116,111,109,101,114,32,119,97,110,116,115,32,116,111,32,112,117,114,99,104,97,115,101,32,105,116,101,109,32,102,111,114,32] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, 36, 0);
	_11[0] = 67; _11[1] = 117; _11[2] = 115; _11[3] = 116; _11[4] = 111; _11[5] = 109; _11[6] = 101; _11[7] = 114; _11[8] = 32; _11[9] = 119; _11[10] = 97; _11[11] = 110; _11[12] = 116; _11[13] = 115; _11[14] = 32; _11[15] = 116; _11[16] = 111; _11[17] = 32; _11[18] = 112; _11[19] = 117; _11[20] = 114; _11[21] = 99; _11[22] = 104; _11[23] = 97; _11[24] = 115; _11[25] = 101; _11[26] = 32; _11[27] = 105; _11[28] = 116; _11[29] = 101; _11[30] = 109; _11[31] = 32; _11[32] = 102; _11[33] = 111; _11[34] = 114; _11[35] = 32; 
	_ADD_DEALLOC(_11);
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_11));
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/Int:toString : function(int)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_14);
		_14 = Int_toString(cost, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		_ADD_DEALLOC(_14);
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_14));
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [99,46] : int[]
	_DEALLOC(_17);
	_NEW_1DARRAY_int64_t(_17, 2, 0);
	_17[0] = 99; _17[1] = 46; 
	_ADD_DEALLOC(_17);
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		println_s(_17, _17_size);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [67,117,115,116,111,109,101,114,32,103,105,118,101,115,58,32] : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 16, 0);
	_20[0] = 67; _20[1] = 117; _20[2] = 115; _20[3] = 116; _20[4] = 111; _20[5] = 109; _20[6] = 101; _20[7] = 114; _20[8] = 32; _20[9] = 103; _20[10] = 105; _20[11] = 118; _20[12] = 101; _20[13] = 115; _20[14] = 58; _20[15] = 32; 
	_ADD_DEALLOC(_20);
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_20));
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%23) = (%2) Cashtill_original:toString : function(Cashtill_original:Cash)->(whiley/lang/ASCII:string)
	{
		void* given_tmp;
		_DEALLOC(_23);
		_23 = _toString_(_COPY_1DARRAY_PARAM_int64_t(given), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		_CALLEE_DEALLOC(given, "false-false-true" , "toString");
		_ADD_DEALLOC(_23);
	}
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
	//invoke (%24) = (%2) Cashtill_original:total : function(Cashtill_original:Cash)->(int)
	{
		void* given_tmp;
		_24 = _total_(_COPY_1DARRAY_PARAM_int64_t(given), true);
		_CALLEE_DEALLOC(given, "false-false-true" , "total");
	}
	//ifge %24, %3 goto blklab36 : int
	if(_24>=cost){goto blklab36;}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [67,117,115,116,111,109,101,114,32,104,97,115,32,110,111,116,32,103,105,118,101,110,32,101,110,111,117,103,104,32,99,97,115,104,33] : int[]
	_DEALLOC(_27);
	_NEW_1DARRAY_int64_t(_27, 35, 0);
	_27[0] = 67; _27[1] = 117; _27[2] = 115; _27[3] = 116; _27[4] = 111; _27[5] = 109; _27[6] = 101; _27[7] = 114; _27[8] = 32; _27[9] = 104; _27[10] = 97; _27[11] = 115; _27[12] = 32; _27[13] = 110; _27[14] = 111; _27[15] = 116; _27[16] = 32; _27[17] = 103; _27[18] = 105; _27[19] = 118; _27[20] = 101; _27[21] = 110; _27[22] = 32; _27[23] = 101; _27[24] = 110; _27[25] = 111; _27[26] = 117; _27[27] = 103; _27[28] = 104; _27[29] = 32; _27[30] = 99; _27[31] = 97; _27[32] = 115; _27[33] = 104; _27[34] = 33; 
	_ADD_DEALLOC(_27);
	//indirectinvoke () = %26 (%27) : method(int[])->()
	{
		println_s(_27, _27_size);
	}
	//goto blklab37
	goto blklab37;
//.blklab36
blklab36:;
	//invoke (%29) = (%2) Cashtill_original:total : function(Cashtill_original:Cash)->(int)
	{
		void* given_tmp;
		_29 = _total_(_COPY_1DARRAY_PARAM_int64_t(given), true);
		_CALLEE_DEALLOC(given, "false-false-true" , "total");
	}
	//sub %30 = %29, %3 : int
	_30=_29-cost;
	//invoke (%28) = (%1, %30) Cashtill_original:calculateChange : function(Cashtill_original:Cash,Cashtill_original:nat)->(Cashtill_original:Cash|null)
	{
		void* till_tmp;
		_DEALLOC(_28);
		_28 = _calculateChange_(_COPY_1DARRAY_PARAM_int64_t(till), true, _30, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_CALLEE_DEALLOC(till, "false-false-true" , "calculateChange");
		_ADD_DEALLOC(_28);
	}
	//assign %5 = %28  : null|int[]
	_DEALLOC(change);
	_COPY_1DARRAY_int64_t(change, _28);
	_ADD_DEALLOC(change);
	//ifis %5, null goto blklab40 : null|int[]
	if(change == NULL) { goto blklab40;}
	//goto blklab38
	goto blklab38;
//.blklab40
blklab40:;
	//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %32 = %31 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %33 = [67,97,115,104,32,116,105,108,108,32,99,97,110,110,111,116,32,103,105,118,101,32,101,120,97,99,116,32,99,104,97,110,103,101,33] : int[]
	_DEALLOC(_33);
	_NEW_1DARRAY_int64_t(_33, 35, 0);
	_33[0] = 67; _33[1] = 97; _33[2] = 115; _33[3] = 104; _33[4] = 32; _33[5] = 116; _33[6] = 105; _33[7] = 108; _33[8] = 108; _33[9] = 32; _33[10] = 99; _33[11] = 97; _33[12] = 110; _33[13] = 110; _33[14] = 111; _33[15] = 116; _33[16] = 32; _33[17] = 103; _33[18] = 105; _33[19] = 118; _33[20] = 101; _33[21] = 32; _33[22] = 101; _33[23] = 120; _33[24] = 97; _33[25] = 99; _33[26] = 116; _33[27] = 32; _33[28] = 99; _33[29] = 104; _33[30] = 97; _33[31] = 110; _33[32] = 103; _33[33] = 101; _33[34] = 33; 
	_ADD_DEALLOC(_33);
	//indirectinvoke () = %32 (%33) : method(int[])->()
	{
		println_s(_33, _33_size);
	}
	//goto blklab39
	goto blklab39;
//.blklab38
blklab38:;
	//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %35 = %34 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %36 = [67,104,97,110,103,101,32,103,105,118,101,110,58,32] : int[]
	_DEALLOC(_36);
	_NEW_1DARRAY_int64_t(_36, 14, 0);
	_36[0] = 67; _36[1] = 104; _36[2] = 97; _36[3] = 110; _36[4] = 103; _36[5] = 101; _36[6] = 32; _36[7] = 103; _36[8] = 105; _36[9] = 118; _36[10] = 101; _36[11] = 110; _36[12] = 58; _36[13] = 32; 
	_ADD_DEALLOC(_36);
	//indirectinvoke () = %35 (%36) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_36));
	}
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%39) = (%5) Cashtill_original:toString : function(Cashtill_original:Cash)->(whiley/lang/ASCII:string)
	{
		void* change_tmp;
		_DEALLOC(_39);
		_39 = _toString_(_COPY_1DARRAY_PARAM_int64_t(change), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
		_CALLEE_DEALLOC(change, "false-false-true" , "toString");
		_ADD_DEALLOC(_39);
	}
	//indirectinvoke () = %38 (%39) : method(int[])->()
	{
		println_s(_39, _39_size);
	}
	//invoke (%40) = (%1, %2) Cashtill_original:add : function(Cashtill_original:Cash,Cashtill_original:Cash)->(Cashtill_original:Cash)
	{
		void* till_tmp;
		void* given_tmp;
		_DEALLOC(_40);
		_40 = _add_(_COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(given), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_40));
		_CALLER_DEALLOC(_40, till, "true-true-false" , "add");
		_CALLEE_DEALLOC(given, "false-false-false" , "add");
		_ADD_DEALLOC(_40);
	}
	//assign %1 = %40  : int[]
	_DEALLOC(till);
	_COPY_1DARRAY_int64_t(till, _40);
	_ADD_DEALLOC(till);
	//invoke (%41) = (%1, %5) Cashtill_original:subtract : function(Cashtill_original:Cash,Cashtill_original:Cash)->(Cashtill_original:Cash)
	{
		void* till_tmp;
		void* change_tmp;
		_DEALLOC(_41);
		_41 = _subtract_(_COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(change), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_41));
		_CALLER_DEALLOC(_41, till, "true-true-false" , "subtract");
		_CALLEE_DEALLOC(change, "false-false-false" , "subtract");
		_ADD_DEALLOC(_41);
	}
	//assign %1 = %41  : int[]
	_DEALLOC(till);
	_COPY_1DARRAY_int64_t(till, _41);
	_ADD_DEALLOC(till);
	//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %43 = %42 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %44 = [84,105,108,108,58,32] : int[]
	_DEALLOC(_44);
	_NEW_1DARRAY_int64_t(_44, 6, 0);
	_44[0] = 84; _44[1] = 105; _44[2] = 108; _44[3] = 108; _44[4] = 58; _44[5] = 32; 
	_ADD_DEALLOC(_44);
	//indirectinvoke () = %43 (%44) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_44));
	}
	//fieldload %45 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %46 = %45 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%47) = (%1) Cashtill_original:toString : function(Cashtill_original:Cash)->(whiley/lang/ASCII:string)
	{
		void* till_tmp;
		_DEALLOC(_47);
		_47 = _toString_(_COPY_1DARRAY_PARAM_int64_t(till), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_47));
		_CALLEE_DEALLOC(till, "false-false-true" , "toString");
		_ADD_DEALLOC(_47);
	}
	//indirectinvoke () = %46 (%47) : method(int[])->()
	{
		println_s(_47, _47_size);
	}
//.blklab39
blklab39:;
//.blklab37
blklab37:;
	//return %1
	_DEALLOC(given);
	_DEALLOC(_4);
	_DEALLOC(change);
	_DEALLOC(_8);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_17);
	_DEALLOC(_20);
	_DEALLOC(_23);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_33);
	_DEALLOC(_36);
	_DEALLOC(_39);
	_DEALLOC(_40);
	_DEALLOC(_41);
	_DEALLOC(_44);
	_DEALLOC(_47);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(till);
	return till;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max = 0;
	int64_t repeat = 0;
	_DECL_1DARRAY(till);
	_DECL_DEALLOC(till);
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	void* _26;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	int64_t _31 = 0;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	int64_t _33 = 0;
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	int64_t _36 = 0;
	_DECL_1DARRAY(_37);
	_DECL_DEALLOC(_37);
	int64_t _38 = 0;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	_DECL_1DARRAY(_40);
	_DECL_DEALLOC(_40);
	int64_t _41 = 0;
	_DECL_1DARRAY(_42);
	_DECL_DEALLOC(_42);
	int64_t _43 = 0;
	_DECL_1DARRAY(_44);
	_DECL_DEALLOC(_44);
	_DECL_1DARRAY(_45);
	_DECL_DEALLOC(_45);
	int64_t _46 = 0;
	_DECL_1DARRAY(_47);
	_DECL_DEALLOC(_47);
	int64_t _48 = 0;
	int64_t _49 = 0;
	int64_t _50 = 0;
	//fieldload %6 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_6);
	_CONV_ARGS(_6);
	_ADD_DEALLOC(_6);
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %6, %7 : int[][]
	_8=_6[_7];
	_8_size = _6_size_size;
	_REMOVE_DEALLOC(_8);
	//invoke (%5) = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_5, _8);
		_ADD_DEALLOC(_5);
		_REMOVE_DEALLOC(_8);
	}
	//assign %1 = %5  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _5);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab41 : null|int
	if(n == NULL) { goto blklab41;}
	//assign %2 = %1  : int
	max = *n;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	repeat = _9;
	//loop (%3, %4, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50)
	while(true){
		//ifge %3, %2 goto blklab42 : int
		if(repeat>=max){goto blklab42;}
		//invoke (%10) = () Cashtill_original:Cash : function()->(Cashtill_original:Cash)
		{
			_DEALLOC(_10);
			_10 = _Cash_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
			_ADD_DEALLOC(_10);
		}
		//assign %4 = %10  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _10);
		_ADD_DEALLOC(till);
		//const %11 = 2 : int
		_11 = 2;
		//rem %12 = %3, %11 : int
		_12=repeat%_11;
		//const %13 = 1 : int
		_13 = 1;
		//ifne %12, %13 goto blklab44 : int
		if(_12!=_13){goto blklab44;}
		//const %14 = 5 : int
		_14 = 5;
		//const %15 = 3 : int
		_15 = 3;
		//const %16 = 3 : int
		_16 = 3;
		//const %17 = 1 : int
		_17 = 1;
		//const %18 = 1 : int
		_18 = 1;
		//const %19 = 3 : int
		_19 = 3;
		//const %20 = 0 : int
		_20 = 0;
		//const %21 = 0 : int
		_21 = 0;
		//newlist %22 = (%14, %15, %16, %17, %18, %19, %20, %21) : int[]
		_DEALLOC(_22);
		_NEW_1DARRAY_int64_t(_22, 8, 0);
		_22[0] = _14; _22[1] = _15; _22[2] = _16; _22[3] = _17; _22[4] = _18; _22[5] = _19; _22[6] = _20; _22[7] = _21; 
		_ADD_DEALLOC(_22);
		//assign %4 = %22  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _22);
		_ADD_DEALLOC(till);
//.blklab44
blklab44:;
		//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %25 = [84,105,108,108,58,32] : int[]
		_DEALLOC(_25);
		_NEW_1DARRAY_int64_t(_25, 6, 0);
		_25[0] = 84; _25[1] = 105; _25[2] = 108; _25[3] = 108; _25[4] = 58; _25[5] = 32; 
		_ADD_DEALLOC(_25);
		//indirectinvoke () = %24 (%25) : method(int[])->()
		{
			printf_s(_1DARRAY_PARAM(_25));
		}
		//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//invoke (%28) = (%4) Cashtill_original:toString : function(Cashtill_original:Cash)->(whiley/lang/ASCII:string)
		{
			void* till_tmp;
			_DEALLOC(_28);
			_28 = _toString_(_COPY_1DARRAY_PARAM_int64_t(till), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
			_CALLEE_DEALLOC(till, "false-false-true" , "toString");
			_ADD_DEALLOC(_28);
		}
		//indirectinvoke () = %27 (%28) : method(int[])->()
		{
			println_s(_28, _28_size);
		}
		//const %31 = 5 : int
		_31 = 5;
		//newlist %32 = (%31) : int[]
		_DEALLOC(_32);
		_NEW_1DARRAY_int64_t(_32, 1, 0);
		_32[0] = _31; 
		_ADD_DEALLOC(_32);
		//invoke (%30) = (%32) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			void* _32_tmp;
			_DEALLOC(_30);
			_30 = _Cash_1_(_COPY_1DARRAY_PARAM_int64_t(_32), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			_CALLEE_DEALLOC(_32, "false-false-false" , "Cash");
			_ADD_DEALLOC(_30);
		}
		//const %33 = 85 : int
		_33 = 85;
		//invoke (%29) = (%0, %4, %30, %33) Cashtill_original:buy : method(whiley/lang/System:Console,Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			void* till_tmp;
			void* _30_tmp;
			_DEALLOC(_29);
			_29 = _buy_(stdout, _COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(_30), true, _33, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_29));
			_CALLER_DEALLOC(_29, till, "true-true-false" , "buy");
			_CALLEE_DEALLOC(_30, "false-false-false" , "buy");
			_ADD_DEALLOC(_29);
		}
		//assign %4 = %29  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _29);
		_ADD_DEALLOC(till);
		//const %36 = 5 : int
		_36 = 5;
		//newlist %37 = (%36) : int[]
		_DEALLOC(_37);
		_NEW_1DARRAY_int64_t(_37, 1, 0);
		_37[0] = _36; 
		_ADD_DEALLOC(_37);
		//invoke (%35) = (%37) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			void* _37_tmp;
			_DEALLOC(_35);
			_35 = _Cash_1_(_COPY_1DARRAY_PARAM_int64_t(_37), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_35));
			_CALLEE_DEALLOC(_37, "false-false-false" , "Cash");
			_ADD_DEALLOC(_35);
		}
		//const %38 = 105 : int
		_38 = 105;
		//invoke (%34) = (%0, %4, %35, %38) Cashtill_original:buy : method(whiley/lang/System:Console,Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			void* till_tmp;
			void* _35_tmp;
			_DEALLOC(_34);
			_34 = _buy_(stdout, _COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(_35), true, _38, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
			_CALLER_DEALLOC(_34, till, "true-true-false" , "buy");
			_CALLEE_DEALLOC(_35, "false-false-false" , "buy");
			_ADD_DEALLOC(_34);
		}
		//assign %4 = %34  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _34);
		_ADD_DEALLOC(till);
		//const %41 = 7 : int
		_41 = 7;
		//newlist %42 = (%41) : int[]
		_DEALLOC(_42);
		_NEW_1DARRAY_int64_t(_42, 1, 0);
		_42[0] = _41; 
		_ADD_DEALLOC(_42);
		//invoke (%40) = (%42) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			void* _42_tmp;
			_DEALLOC(_40);
			_40 = _Cash_1_(_COPY_1DARRAY_PARAM_int64_t(_42), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_40));
			_CALLEE_DEALLOC(_42, "false-false-false" , "Cash");
			_ADD_DEALLOC(_40);
		}
		//const %43 = 5 : int
		_43 = 5;
		//invoke (%39) = (%0, %4, %40, %43) Cashtill_original:buy : method(whiley/lang/System:Console,Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			void* till_tmp;
			void* _40_tmp;
			_DEALLOC(_39);
			_39 = _buy_(stdout, _COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(_40), true, _43, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
			_CALLER_DEALLOC(_39, till, "true-true-false" , "buy");
			_CALLEE_DEALLOC(_40, "false-false-false" , "buy");
			_ADD_DEALLOC(_39);
		}
		//assign %4 = %39  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _39);
		_ADD_DEALLOC(till);
		//const %46 = 6 : int
		_46 = 6;
		//newlist %47 = (%46) : int[]
		_DEALLOC(_47);
		_NEW_1DARRAY_int64_t(_47, 1, 0);
		_47[0] = _46; 
		_ADD_DEALLOC(_47);
		//invoke (%45) = (%47) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			void* _47_tmp;
			_DEALLOC(_45);
			_45 = _Cash_1_(_COPY_1DARRAY_PARAM_int64_t(_47), true, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_45));
			_CALLEE_DEALLOC(_47, "false-false-false" , "Cash");
			_ADD_DEALLOC(_45);
		}
		//const %48 = 305 : int
		_48 = 305;
		//invoke (%44) = (%0, %4, %45, %48) Cashtill_original:buy : method(whiley/lang/System:Console,Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			void* till_tmp;
			void* _45_tmp;
			_DEALLOC(_44);
			_44 = _buy_(stdout, _COPY_1DARRAY_PARAM_int64_t(till), false, _COPY_1DARRAY_PARAM_int64_t(_45), true, _48, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_44));
			_CALLER_DEALLOC(_44, till, "true-true-false" , "buy");
			_CALLEE_DEALLOC(_45, "false-false-false" , "buy");
			_ADD_DEALLOC(_44);
		}
		//assign %4 = %44  : int[]
		_DEALLOC(till);
		_COPY_1DARRAY_int64_t(till, _44);
		_ADD_DEALLOC(till);
		//const %49 = 1 : int
		_49 = 1;
		//add %50 = %3, %49 : int
		_50=repeat+_49;
		//assign %3 = %50  : int
		repeat = _50;
//.blklab43
blklab43:;
	}
//.blklab42
blklab42:;
//.blklab41
blklab41:;
	//return
	_DEALLOC(n);
	_DEALLOC(till);
	_DEALLOC(_5);
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_10);
	_DEALLOC(_22);
	_DEALLOC(_25);
	_DEALLOC(_28);
	_DEALLOC(_29);
	_DEALLOC(_30);
	_DEALLOC(_32);
	_DEALLOC(_34);
	_DEALLOC(_35);
	_DEALLOC(_37);
	_DEALLOC(_39);
	_DEALLOC(_40);
	_DEALLOC(_42);
	_DEALLOC(_44);
	_DEALLOC(_45);
	_DEALLOC(_47);
	exit(0);
}
