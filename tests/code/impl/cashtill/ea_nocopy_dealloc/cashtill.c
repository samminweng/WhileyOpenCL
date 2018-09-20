#include "cashtill.h"
int64_t* _Cash_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	_DECL_DEALLOC(_0);
	int64_t _1;
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
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
	int64_t i;
	int64_t coin;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
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
	int64_t _27;
	int64_t _28;
	int64_t _29;
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
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(cash, _13, 1);
	//const %14 = 0 : int
	_14 = 0;
	//assign %3 = %14  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
		// isCopyEliminated = true
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
	int64_t _1;
	int64_t r;
	int64_t i;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	// isCopyEliminated = true
	r = _4;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
		r = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
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

bool _contained_(_DECL_1DARRAY_PARAM(first), _DECL_DEALLOC_PARAM(first), _DECL_1DARRAY_PARAM(second), _DECL_DEALLOC_PARAM(second)){
	bool _2;
	int64_t i;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	bool _8;
	int64_t _9;
	int64_t _10;
	bool _11;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
	int64_t i;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
	int64_t i;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
	int64_t i;
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	_DECL_1DARRAY(chg);
	_DECL_DEALLOC(chg);
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	void* _26;
	//const %6 = 0 : int
	_6 = 0;
	//ifne %1, %6 goto blklab25 : int
	if(change!=_6){goto blklab25;}
	//invoke (%7) = () cashtill:Cash : function()->(cashtill:Cash)
	{
		_DEALLOC(_7);
		_7 = _Cash_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_7_dealloc = true;
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
	// isCopyEliminated = true
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
		// isCopyEliminated = false
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
		//invoke (%17) = (%4, %20) cashtill:calculateChange : function(cashtill:Cash,cashtill:nat)->(cashtill:Cash|null)
		{
			_DEALLOC(_17);
			// isCopyEliminated of '_4' = true
			_17 = _calculateChange_(tmp, tmp_size, false, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
			_RETAIN_DEALLOC(tmp, "false-false-false" , "calculateChange");
			_RETAIN_DEALLOC_POST(_17, tmp);
		}
		//assign %5 = %17  : null|int[]
		// isCopyEliminated = true
		_DEALLOC(chg);
		_UPDATE_1DARRAY(chg, _17);
		_TRANSFER_DEALLOC_STRUCT(chg, _17);
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
		// isCopyEliminated = true
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
	_ADD_DEALLOC(_6);
	//assign %2 = %6  : void[]
	// isCopyEliminated = true
	_DEALLOC(r);
	_UPDATE_1DARRAY(r, _6);
	_TRANSFER_DEALLOC_STRUCT(r, _6);
	//const %7 = true : bool
	_7 = true;
	//assign %3 = %7  : bool
	// isCopyEliminated = true
	firstTime = _7;
	//const %8 = 0 : int
	_8 = 0;
	//assign %4 = %8  : int
	// isCopyEliminated = true
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
		// isCopyEliminated = true
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
			_13 = Array_Append(r, r_size , _14, _14_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
			_13_dealloc = true;
		}
		//assign %2 = %13  : int[]
		// isCopyEliminated = true
		_DEALLOC(r);
		_UPDATE_1DARRAY(r, _13);
		_TRANSFER_DEALLOC_STRUCT(r, _13);
//.blklab34
blklab34:;
		//const %15 = false : bool
		_15 = false;
		//assign %3 = %15  : bool
		// isCopyEliminated = true
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
		// isCopyEliminated = true
		_DEALLOC(r);
		_UPDATE_1DARRAY(r, _16);
		_TRANSFER_DEALLOC_STRUCT(r, _16);
		//const %19 = [32,120,32] : int[]
		_DEALLOC(_19);
		_NEW_1DARRAY_int64_t(_19, 3, 0);
		_19[0] = 32; _19[1] = 120; _19[2] = 32; 
		_ADD_DEALLOC(_19);
		//invoke (%18) = (%2, %19) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_18);
			_18 = Array_Append(r, r_size , _19, _19_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
			_18_dealloc = true;
		}
		//assign %2 = %18  : int[]
		// isCopyEliminated = true
		_DEALLOC(r);
		_UPDATE_1DARRAY(r, _18);
		_TRANSFER_DEALLOC_STRUCT(r, _18);
		//const %21 = [[49,99],[53,99],[49,48,99],[50,48,99],[53,48,99],[36,49],[36,53],[36,49,48]] : int[][]
		_DEALLOC_2DARRAY_int64_t(_21);
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

		_ADD_DEALLOC(_21);
		//indexof %22 = %21, %4 : int[][]
		_22=_21[i];
		_22_size = _21_size_size;
		_REMOVE_DEALLOC(_22);
		//invoke (%20) = (%2, %22) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_20);
			_20 = Array_Append(r, r_size , _22, _22_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_20_dealloc = true;
		}
		//assign %2 = %20  : int[]
		// isCopyEliminated = true
		_DEALLOC(r);
		_UPDATE_1DARRAY(r, _20);
		_TRANSFER_DEALLOC_STRUCT(r, _20);
//.blklab33
blklab33:;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %4, %23 : int
		_24=i+_23;
		//assign %4 = %24  : int
		// isCopyEliminated = true
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
	// isCopyEliminated = true
	_DEALLOC(r);
	_UPDATE_1DARRAY(r, _26);
	_TRANSFER_DEALLOC_STRUCT(r, _26);
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
	int64_t _24;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	int64_t _29;
	int64_t _30;
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
		printf_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%3) whiley/lang/Int:toString : function(int)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_14);
		_14 = Int_toString(cost, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		_14_dealloc = true;
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_14, _14_size);
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
		printf_s(_20, _20_size);
	}
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%23) = (%2) cashtill:toString : function(cashtill:Cash)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_23);
		// isCopyEliminated of '_2' = true
		_23 = _toString_(given, given_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		_RETAIN_DEALLOC(given, "false-false-true" , "toString");
		_RETAIN_DEALLOC_POST(_23, given);
	}
	//indirectinvoke () = %22 (%23) : method(int[])->()
	{
		println_s(_23, _23_size);
	}
	//invoke (%24) = (%2) cashtill:total : function(cashtill:Cash)->(int)
	{
		// isCopyEliminated of '_2' = true
		_24 = _total_(given, given_size, false);
		_RETAIN_DEALLOC(given, "false-false-true" , "total");
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
	//invoke (%29) = (%2) cashtill:total : function(cashtill:Cash)->(int)
	{
		// isCopyEliminated of '_2' = true
		_29 = _total_(given, given_size, false);
		_RETAIN_DEALLOC(given, "false-false-true" , "total");
	}
	//sub %30 = %29, %3 : int
	_30=_29-cost;
	//invoke (%28) = (%1, %30) cashtill:calculateChange : function(cashtill:Cash,cashtill:nat)->(cashtill:Cash|null)
	{
		_DEALLOC(_28);
		// isCopyEliminated of '_1' = true
		_28 = _calculateChange_(till, till_size, false, _30, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_RETAIN_DEALLOC(till, "false-false-true" , "calculateChange");
		_RETAIN_DEALLOC_POST(_28, till);
	}
	//assign %5 = %28  : null|int[]
	// isCopyEliminated = true
	_DEALLOC(change);
	_UPDATE_1DARRAY(change, _28);
	_TRANSFER_DEALLOC_STRUCT(change, _28);
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
		printf_s(_36, _36_size);
	}
	//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %38 = %37 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%39) = (%5) cashtill:toString : function(cashtill:Cash)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_39);
		// isCopyEliminated of '_5' = true
		_39 = _toString_(change, change_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
		_RETAIN_DEALLOC(change, "false-false-true" , "toString");
		_RETAIN_DEALLOC_POST(_39, change);
	}
	//indirectinvoke () = %38 (%39) : method(int[])->()
	{
		println_s(_39, _39_size);
	}
	//invoke (%40) = (%1, %2) cashtill:add : function(cashtill:Cash,cashtill:Cash)->(cashtill:Cash)
	{
		_DEALLOC(_40);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		_40 = _add_(till, till_size, false, given, given_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_40));
		_RESET_DEALLOC(till, "true-true-false" , "add");
		_RESET_DEALLOC_POST(_40, till);
		_RETAIN_DEALLOC(given, "false-false-false" , "add");
		_RETAIN_DEALLOC_POST(_40, given);
	}
	//assign %1 = %40  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _40, 1);
	//invoke (%41) = (%1, %5) cashtill:subtract : function(cashtill:Cash,cashtill:Cash)->(cashtill:Cash)
	{
		_DEALLOC(_41);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_5' = true
		_41 = _subtract_(till, till_size, false, change, change_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_41));
		_RESET_DEALLOC(till, "true-true-false" , "subtract");
		_RESET_DEALLOC_POST(_41, till);
		_RETAIN_DEALLOC(change, "false-false-false" , "subtract");
		_RETAIN_DEALLOC_POST(_41, change);
	}
	//assign %1 = %41  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _41, 1);
	//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %43 = %42 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %44 = [84,105,108,108,58,32] : int[]
	_DEALLOC(_44);
	_NEW_1DARRAY_int64_t(_44, 6, 0);
	_44[0] = 84; _44[1] = 105; _44[2] = 108; _44[3] = 108; _44[4] = 58; _44[5] = 32; 
	_ADD_DEALLOC(_44);
	//indirectinvoke () = %43 (%44) : method(int[])->()
	{
		printf_s(_44, _44_size);
	}
	//fieldload %45 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %46 = %45 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%47) = (%1) cashtill:toString : function(cashtill:Cash)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_47);
		// isCopyEliminated of '_1' = true
		_47 = _toString_(till, till_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_47));
		_RETAIN_DEALLOC(till, "false-false-true" , "toString");
		_RETAIN_DEALLOC_POST(_47, till);
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
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	int64_t _21;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	int64_t _24;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	int64_t _26;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	int64_t _29;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	int64_t _31;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	int64_t _34;
	_DECL_1DARRAY(_35);
	_DECL_DEALLOC(_35);
	int64_t _36;
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
	_ADD_DEALLOC(_10);
	//assign %1 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _10, 1);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [84,105,108,108,58,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 6, 0);
	_13[0] = 84; _13[1] = 105; _13[2] = 108; _13[3] = 108; _13[4] = 58; _13[5] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%1) cashtill:toString : function(cashtill:Cash)->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_16);
		// isCopyEliminated of '_1' = true
		_16 = _toString_(till, till_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		_RETAIN_DEALLOC(till, "false-false-true" , "toString");
		_RETAIN_DEALLOC_POST(_16, till);
	}
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//const %19 = 5 : int
	_19 = 5;
	//newlist %20 = (%19) : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 1, 0);
	_20[0] = _19; 
	_ADD_DEALLOC(_20);
	//invoke (%18) = (%20) cashtill:Cash : function(cashtill:nat[])->(cashtill:Cash)
	{
		_DEALLOC(_18);
		// isCopyEliminated of '_20' = true
		_18 = _Cash_1_(_20, _20_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
		_RETAIN_DEALLOC(_20, "false-false-false" , "Cash");
		_RETAIN_DEALLOC_POST(_18, _20);
	}
	//const %21 = 85 : int
	_21 = 85;
	//invoke (%17) = (%0, %1, %18, %21) cashtill:buy : method(whiley/lang/System:Console,cashtill:Cash,cashtill:Cash,int)->(cashtill:Cash)
	{
		_DEALLOC(_17);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_18' = true
		_17 = _buy_(stdout, till, till_size, false, _18, _18_size, false, _21, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
		_RESET_DEALLOC(till, "true-true-false" , "buy");
		_RESET_DEALLOC_POST(_17, till);
		_RETAIN_DEALLOC(_18, "false-false-false" , "buy");
		_RETAIN_DEALLOC_POST(_17, _18);
	}
	//assign %1 = %17  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _17, 1);
	//const %24 = 5 : int
	_24 = 5;
	//newlist %25 = (%24) : int[]
	_DEALLOC(_25);
	_NEW_1DARRAY_int64_t(_25, 1, 0);
	_25[0] = _24; 
	_ADD_DEALLOC(_25);
	//invoke (%23) = (%25) cashtill:Cash : function(cashtill:nat[])->(cashtill:Cash)
	{
		_DEALLOC(_23);
		// isCopyEliminated of '_25' = true
		_23 = _Cash_1_(_25, _25_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		_RETAIN_DEALLOC(_25, "false-false-false" , "Cash");
		_RETAIN_DEALLOC_POST(_23, _25);
	}
	//const %26 = 105 : int
	_26 = 105;
	//invoke (%22) = (%0, %1, %23, %26) cashtill:buy : method(whiley/lang/System:Console,cashtill:Cash,cashtill:Cash,int)->(cashtill:Cash)
	{
		_DEALLOC(_22);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_23' = true
		_22 = _buy_(stdout, till, till_size, false, _23, _23_size, false, _26, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_22));
		_RESET_DEALLOC(till, "true-true-false" , "buy");
		_RESET_DEALLOC_POST(_22, till);
		_RETAIN_DEALLOC(_23, "false-false-false" , "buy");
		_RETAIN_DEALLOC_POST(_22, _23);
	}
	//assign %1 = %22  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _22, 1);
	//const %29 = 7 : int
	_29 = 7;
	//newlist %30 = (%29) : int[]
	_DEALLOC(_30);
	_NEW_1DARRAY_int64_t(_30, 1, 0);
	_30[0] = _29; 
	_ADD_DEALLOC(_30);
	//invoke (%28) = (%30) cashtill:Cash : function(cashtill:nat[])->(cashtill:Cash)
	{
		_DEALLOC(_28);
		// isCopyEliminated of '_30' = true
		_28 = _Cash_1_(_30, _30_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
		_RETAIN_DEALLOC(_30, "false-false-false" , "Cash");
		_RETAIN_DEALLOC_POST(_28, _30);
	}
	//const %31 = 5 : int
	_31 = 5;
	//invoke (%27) = (%0, %1, %28, %31) cashtill:buy : method(whiley/lang/System:Console,cashtill:Cash,cashtill:Cash,int)->(cashtill:Cash)
	{
		_DEALLOC(_27);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_28' = true
		_27 = _buy_(stdout, till, till_size, false, _28, _28_size, false, _31, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_27));
		_RESET_DEALLOC(till, "true-true-false" , "buy");
		_RESET_DEALLOC_POST(_27, till);
		_RETAIN_DEALLOC(_28, "false-false-false" , "buy");
		_RETAIN_DEALLOC_POST(_27, _28);
	}
	//assign %1 = %27  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _27, 1);
	//const %34 = 6 : int
	_34 = 6;
	//newlist %35 = (%34) : int[]
	_DEALLOC(_35);
	_NEW_1DARRAY_int64_t(_35, 1, 0);
	_35[0] = _34; 
	_ADD_DEALLOC(_35);
	//invoke (%33) = (%35) cashtill:Cash : function(cashtill:nat[])->(cashtill:Cash)
	{
		_DEALLOC(_33);
		// isCopyEliminated of '_35' = true
		_33 = _Cash_1_(_35, _35_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
		_RETAIN_DEALLOC(_35, "false-false-false" , "Cash");
		_RETAIN_DEALLOC_POST(_33, _35);
	}
	//const %36 = 305 : int
	_36 = 305;
	//invoke (%32) = (%0, %1, %33, %36) cashtill:buy : method(whiley/lang/System:Console,cashtill:Cash,cashtill:Cash,int)->(cashtill:Cash)
	{
		_DEALLOC(_32);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_33' = true
		_32 = _buy_(stdout, till, till_size, false, _33, _33_size, false, _36, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_32));
		_RESET_DEALLOC(till, "true-true-false" , "buy");
		_RESET_DEALLOC_POST(_32, till);
		_RETAIN_DEALLOC(_33, "false-false-false" , "buy");
		_RETAIN_DEALLOC_POST(_32, _33);
	}
	//assign %1 = %32  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(till, _32, 1);
	//return
	_DEALLOC(till);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_16);
	_DEALLOC(_17);
	_DEALLOC(_18);
	_DEALLOC(_20);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_25);
	_DEALLOC(_27);
	_DEALLOC(_28);
	_DEALLOC(_30);
	_DEALLOC(_32);
	_DEALLOC(_33);
	_DEALLOC(_35);
	exit(0);
}

