#include "Cashtill_original.h"
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
	_DEALLOC(cash);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(cash, _13);
	_TRANSFER_DEALLOC(cash, _13);
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
	//invoke (%7) = () Cashtill_original:Cash : function()->(Cashtill_original:Cash)
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
		_DEALLOC(tmp);
		// isCopyEliminated = false
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
			_DEALLOC(_17);
			// isCopyEliminated of '_4' = true
			_17 = _calculateChange_(tmp, tmp_size, false, _20, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_17));
			_RETAIN_DEALLOC(tmp, "false-false-false" , "calculateChange");
			_RETAIN_DEALLOC_POST(_17, tmp);
		}
		//assign %5 = %17  : null|int[]
		_DEALLOC(chg);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(chg, _17);
		_TRANSFER_DEALLOC(chg, _17);
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
	_DEALLOC(r);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _6);
	_TRANSFER_DEALLOC(r, _6);
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
			_ADD_DEALLOC(_13);
		}
		//assign %2 = %13  : int[]
		_DEALLOC(r);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(r, _13);
		_TRANSFER_DEALLOC(r, _13);
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
			_ADD_DEALLOC(_17);
		}
		//invoke (%16) = (%2, %17) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_16);
			_16 = Array_Append(r, r_size , _17, _17_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
			_ADD_DEALLOC(_16);
		}
		//assign %2 = %16  : int[]
		_DEALLOC(r);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(r, _16);
		_TRANSFER_DEALLOC(r, _16);
		//const %19 = [32,120,32] : int[]
		_DEALLOC(_19);
		_NEW_1DARRAY_int64_t(_19, 3, 0);
		_19[0] = 32; _19[1] = 120; _19[2] = 32; 
		_ADD_DEALLOC(_19);
		//invoke (%18) = (%2, %19) whiley/lang/Array:append : function(int[],int[])->(int[])
		{
			_DEALLOC(_18);
			_18 = Array_Append(r, r_size , _19, _19_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
			_ADD_DEALLOC(_18);
		}
		//assign %2 = %18  : int[]
		_DEALLOC(r);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(r, _18);
		_TRANSFER_DEALLOC(r, _18);
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
			_20 = Array_Append(r, r_size , _22, _22_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
			_ADD_DEALLOC(_20);
		}
		//assign %2 = %20  : int[]
		_DEALLOC(r);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(r, _20);
		_TRANSFER_DEALLOC(r, _20);
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
	_DEALLOC(r);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _26);
	_TRANSFER_DEALLOC(r, _26);
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

int64_t* _buy_(_DECL_1DARRAY_PARAM(till), _DECL_DEALLOC_PARAM(till), _DECL_1DARRAY_PARAM(given), _DECL_DEALLOC_PARAM(given), int64_t cost, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	_DECL_1DARRAY(change);
	_DECL_DEALLOC(change);
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	//invoke (%5) = (%1) Cashtill_original:total : function(Cashtill_original:Cash)->(int)
	{
		// isCopyEliminated of '_1' = true
		_5 = _total_(given, given_size, false);
		_RETAIN_DEALLOC(given, "false-false-true" , "total");
	}
	//iflt %5, %2 goto blklab36 : int
	if(_5<cost){goto blklab36;}
	//invoke (%7) = (%1) Cashtill_original:total : function(Cashtill_original:Cash)->(int)
	{
		// isCopyEliminated of '_1' = true
		_7 = _total_(given, given_size, false);
		_RETAIN_DEALLOC(given, "false-false-true" , "total");
	}
	//sub %8 = %7, %2 : int
	_8=_7-cost;
	//invoke (%6) = (%0, %8) Cashtill_original:calculateChange : function(Cashtill_original:Cash,Cashtill_original:nat)->(Cashtill_original:Cash|null)
	{
		_DEALLOC(_6);
		// isCopyEliminated of '_0' = true
		_6 = _calculateChange_(till, till_size, false, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_RETAIN_DEALLOC(till, "false-false-true" , "calculateChange");
		_RETAIN_DEALLOC_POST(_6, till);
	}
	//assign %4 = %6  : null|int[]
	_DEALLOC(change);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(change, _6);
	_TRANSFER_DEALLOC(change, _6);
	//ifis %4, null goto blklab37 : null|int[]
	if(change == NULL) { goto blklab37;}
	//invoke (%9) = (%0, %1) Cashtill_original:add : function(Cashtill_original:Cash,Cashtill_original:Cash)->(Cashtill_original:Cash)
	{
		_DEALLOC(_9);
		// isCopyEliminated of '_0' = true
		// isCopyEliminated of '_1' = true
		_9 = _add_(till, till_size, false, given, given_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_9));
		_RESET_DEALLOC(till, "true-true-false" , "add");
		_RESET_DEALLOC_POST(_9, till);
		_RETAIN_DEALLOC(given, "false-false-false" , "add");
		_RETAIN_DEALLOC_POST(_9, given);
	}
	//assign %0 = %9  : int[]
	_DEALLOC(till);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(till, _9);
	_TRANSFER_DEALLOC(till, _9);
	//invoke (%10) = (%0, %4) Cashtill_original:subtract : function(Cashtill_original:Cash,Cashtill_original:Cash)->(Cashtill_original:Cash)
	{
		_DEALLOC(_10);
		// isCopyEliminated of '_0' = true
		// isCopyEliminated of '_4' = true
		_10 = _subtract_(till, till_size, false, change, change_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_RESET_DEALLOC(till, "true-true-false" , "subtract");
		_RESET_DEALLOC_POST(_10, till);
		_RETAIN_DEALLOC(change, "false-false-false" , "subtract");
		_RETAIN_DEALLOC_POST(_10, change);
	}
	//assign %0 = %10  : int[]
	_DEALLOC(till);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(till, _10);
	_TRANSFER_DEALLOC(till, _10);
//.blklab37
blklab37:;
//.blklab36
blklab36:;
	//return %0
	_DEALLOC(given);
	_DEALLOC(_3);
	_DEALLOC(change);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(till);
	return till;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max;
	int64_t repeat;
	_DECL_1DARRAY(till);
	_DECL_DEALLOC(till);
	int64_t* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
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
	int64_t _21;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY(_23);
	_DECL_DEALLOC(_23);
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	int64_t _25;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	int64_t _27;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	int64_t _30;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	int64_t _32;
	_DECL_1DARRAY(_33);
	_DECL_DEALLOC(_33);
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	int64_t _35;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	int64_t _37;
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	int64_t _40;
	_DECL_1DARRAY(_41);
	_DECL_DEALLOC(_41);
	int64_t _42;
	void* _43;
	_DECL_1DARRAY(_45);
	_DECL_DEALLOC(_45);
	void* _46;
	_DECL_1DARRAY(_48);
	_DECL_DEALLOC(_48);
	void* _49;
	int64_t _51;
	int64_t _52;
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
	// isCopyEliminated = true
	n = _5;
	_TRANSFER_DEALLOC(n, _5);
	//ifis %1, null goto blklab38 : null|int
	if(n == NULL) { goto blklab38;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	max = *n;
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	repeat = _9;
	//loop (%3, %4, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52)
	while(true){
		//ifge %3, %2 goto blklab39 : int
		if(repeat>=max){goto blklab39;}
		//invoke (%10) = () Cashtill_original:Cash : function()->(Cashtill_original:Cash)
		{
			_DEALLOC(_10);
			_10 = _Cash_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
			_10_dealloc = true;
		}
		//assign %4 = %10  : int[]
		_DEALLOC(till);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _10);
		_TRANSFER_DEALLOC(till, _10);
		//const %11 = 2 : int
		_11 = 2;
		//rem %12 = %3, %11 : int
		_12=repeat%_11;
		//const %13 = 1 : int
		_13 = 1;
		//ifne %12, %13 goto blklab41 : int
		if(_12!=_13){goto blklab41;}
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
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _22);
		_TRANSFER_DEALLOC(till, _22);
//.blklab41
blklab41:;
		//const %25 = 5 : int
		_25 = 5;
		//newlist %26 = (%25) : int[]
		_DEALLOC(_26);
		_NEW_1DARRAY_int64_t(_26, 1, 0);
		_26[0] = _25; 
		_ADD_DEALLOC(_26);
		//invoke (%24) = (%26) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			_DEALLOC(_24);
			// isCopyEliminated of '_26' = true
			_24 = _Cash_1_(_26, _26_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
			_RETAIN_DEALLOC(_26, "false-false-false" , "Cash");
			_RETAIN_DEALLOC_POST(_24, _26);
		}
		//const %27 = 85 : int
		_27 = 85;
		//invoke (%23) = (%4, %24, %27) Cashtill_original:buy : function(Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			_DEALLOC(_23);
			// isCopyEliminated of '_4' = true
			// isCopyEliminated of '_24' = true
			_23 = _buy_(till, till_size, false, _24, _24_size, false, _27, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_RESET_DEALLOC(till, "true-true-false" , "buy");
			_RESET_DEALLOC_POST(_23, till);
			_RETAIN_DEALLOC(_24, "false-false-false" , "buy");
			_RETAIN_DEALLOC_POST(_23, _24);
		}
		//assign %4 = %23  : int[]
		_DEALLOC(till);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _23);
		_TRANSFER_DEALLOC(till, _23);
		//const %30 = 5 : int
		_30 = 5;
		//newlist %31 = (%30) : int[]
		_DEALLOC(_31);
		_NEW_1DARRAY_int64_t(_31, 1, 0);
		_31[0] = _30; 
		_ADD_DEALLOC(_31);
		//invoke (%29) = (%31) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			_DEALLOC(_29);
			// isCopyEliminated of '_31' = true
			_29 = _Cash_1_(_31, _31_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_29));
			_RETAIN_DEALLOC(_31, "false-false-false" , "Cash");
			_RETAIN_DEALLOC_POST(_29, _31);
		}
		//const %32 = 105 : int
		_32 = 105;
		//invoke (%28) = (%4, %29, %32) Cashtill_original:buy : function(Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			_DEALLOC(_28);
			// isCopyEliminated of '_4' = true
			// isCopyEliminated of '_29' = true
			_28 = _buy_(till, till_size, false, _29, _29_size, false, _32, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_28));
			_RESET_DEALLOC(till, "true-true-false" , "buy");
			_RESET_DEALLOC_POST(_28, till);
			_RETAIN_DEALLOC(_29, "false-false-false" , "buy");
			_RETAIN_DEALLOC_POST(_28, _29);
		}
		//assign %4 = %28  : int[]
		_DEALLOC(till);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _28);
		_TRANSFER_DEALLOC(till, _28);
		//const %35 = 7 : int
		_35 = 7;
		//newlist %36 = (%35) : int[]
		_DEALLOC(_36);
		_NEW_1DARRAY_int64_t(_36, 1, 0);
		_36[0] = _35; 
		_ADD_DEALLOC(_36);
		//invoke (%34) = (%36) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			_DEALLOC(_34);
			// isCopyEliminated of '_36' = true
			_34 = _Cash_1_(_36, _36_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_34));
			_RETAIN_DEALLOC(_36, "false-false-false" , "Cash");
			_RETAIN_DEALLOC_POST(_34, _36);
		}
		//const %37 = 5 : int
		_37 = 5;
		//invoke (%33) = (%4, %34, %37) Cashtill_original:buy : function(Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			_DEALLOC(_33);
			// isCopyEliminated of '_4' = true
			// isCopyEliminated of '_34' = true
			_33 = _buy_(till, till_size, false, _34, _34_size, false, _37, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
			_RESET_DEALLOC(till, "true-true-false" , "buy");
			_RESET_DEALLOC_POST(_33, till);
			_RETAIN_DEALLOC(_34, "false-false-false" , "buy");
			_RETAIN_DEALLOC_POST(_33, _34);
		}
		//assign %4 = %33  : int[]
		_DEALLOC(till);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _33);
		_TRANSFER_DEALLOC(till, _33);
		//const %40 = 6 : int
		_40 = 6;
		//newlist %41 = (%40) : int[]
		_DEALLOC(_41);
		_NEW_1DARRAY_int64_t(_41, 1, 0);
		_41[0] = _40; 
		_ADD_DEALLOC(_41);
		//invoke (%39) = (%41) Cashtill_original:Cash : function(Cashtill_original:nat[])->(Cashtill_original:Cash)
		{
			_DEALLOC(_39);
			// isCopyEliminated of '_41' = true
			_39 = _Cash_1_(_41, _41_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_39));
			_RETAIN_DEALLOC(_41, "false-false-false" , "Cash");
			_RETAIN_DEALLOC_POST(_39, _41);
		}
		//const %42 = 305 : int
		_42 = 305;
		//invoke (%38) = (%4, %39, %42) Cashtill_original:buy : function(Cashtill_original:Cash,Cashtill_original:Cash,int)->(Cashtill_original:Cash)
		{
			_DEALLOC(_38);
			// isCopyEliminated of '_4' = true
			// isCopyEliminated of '_39' = true
			_38 = _buy_(till, till_size, false, _39, _39_size, false, _42, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_38));
			_RESET_DEALLOC(till, "true-true-false" , "buy");
			_RESET_DEALLOC_POST(_38, till);
			_RETAIN_DEALLOC(_39, "false-false-false" , "buy");
			_RETAIN_DEALLOC_POST(_38, _39);
		}
		//assign %4 = %38  : int[]
		_DEALLOC(till);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(till, _38);
		_TRANSFER_DEALLOC(till, _38);
		//fieldload %43 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %44 = %43 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %45 = [84,105,108,108,58,32] : int[]
		_DEALLOC(_45);
		_NEW_1DARRAY_int64_t(_45, 6, 0);
		_45[0] = 84; _45[1] = 105; _45[2] = 108; _45[3] = 108; _45[4] = 58; _45[5] = 32; 
		_ADD_DEALLOC(_45);
		//indirectinvoke () = %44 (%45) : method(int[])->()
		{
			printf_s(_45, _45_size);
		}
		//fieldload %46 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %47 = %46 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//invoke (%48) = (%4) Cashtill_original:toString : function(Cashtill_original:Cash)->(whiley/lang/ASCII:string)
		{
			_DEALLOC(_48);
			// isCopyEliminated of '_4' = true
			_48 = _toString_(till, till_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_48));
			_RETAIN_DEALLOC(till, "false-false-false" , "toString");
			_RETAIN_DEALLOC_POST(_48, till);
		}
		//indirectinvoke () = %47 (%48) : method(int[])->()
		{
			println_s(_48, _48_size);
		}
		//fieldload %49 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %50 = %49 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indirectinvoke () = %50 (%3) : method(any)->()
		{
			printf("%"PRId64"\n", repeat);
		}
		//const %51 = 1 : int
		_51 = 1;
		//add %52 = %3, %51 : int
		_52=repeat+_51;
		//assign %3 = %52  : int
		// isCopyEliminated = true
		repeat = _52;
//.blklab40
blklab40:;
	}
//.blklab39
blklab39:;
//.blklab38
blklab38:;
	//return
	_DEALLOC(n);
	_DEALLOC(till);
	_DEALLOC(_5);
	_FREE_ARGS(_6);
	_DEALLOC(_8);
	_DEALLOC(_10);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_24);
	_DEALLOC(_26);
	_DEALLOC(_28);
	_DEALLOC(_29);
	_DEALLOC(_31);
	_DEALLOC(_33);
	_DEALLOC(_34);
	_DEALLOC(_36);
	_DEALLOC(_38);
	_DEALLOC(_39);
	_DEALLOC(_41);
	_DEALLOC(_45);
	_DEALLOC(_48);
	exit(0);
}

