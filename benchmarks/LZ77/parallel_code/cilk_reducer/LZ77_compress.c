#include "LZ77_compress.h"
#include <cilk/cilk.h>
#include <pthread.h>
#include <cilk/reducer.h>
int GRAINSIZE = 0; // Grainsize of 0 will use default grainsize by compiler

Match* copy_Match(Match* _Match){
	Match* new_Match = malloc(sizeof(Match));
	new_Match->len = _Match->len;
	new_Match->offset = _Match->offset;
	return new_Match;
}
Match** copy_array_Match(Match** _Match, size_t _Match_size){
	Match** new_Match = malloc(_Match_size*sizeof(Match*));
	for(int i=0;i<_Match_size;i++){
		new_Match[i] = copy_Match(_Match[i]);
	}
	return new_Match;
}
void free_Match(Match* match){
	free(match);
}
void printf_Match(Match* match){
	printf("{");
	printf(" len:");
	printf("%"PRId64, match->len);
	printf(" offset:");
	printf("%"PRId64, match->offset);
	printf("}");
}
int64_t _match_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t offset, int64_t end){
	int64_t length;
	int64_t pos;
	int64_t len;
	int64_t _6;
	int64_t _7;
	BYTE _8;
	BYTE _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	//assign %4 = %2  : int
	// isCopyEliminated = true
	pos = end;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	// isCopyEliminated = true
	len = _6;
	//loop (%1, %4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16)
	while(true){
		//ifge %1, %4 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//lengthof %7 = %0 : byte[]
		_7 = data_size;
		//ifge %4, %7 goto blklab3 : int
		if(pos>=_7){goto blklab3;}
		//indexof %8 = %0, %1 : byte[]
		_8=data[offset];
		//indexof %9 = %0, %4 : byte[]
		_9=data[pos];
		//ifne %8, %9 goto blklab3 : byte
		if(_8!=_9){goto blklab3;}
		//const %10 = 255 : int
		_10 = 255;
		//ifge %5, %10 goto blklab3 : int
		if(len>=_10){goto blklab3;}
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %1, %11 : int
		_12=offset+_11;
		//assign %1 = %12  : int
		// isCopyEliminated = true
		offset = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=pos+_13;
		//assign %4 = %14  : int
		// isCopyEliminated = true
		pos = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %5, %15 : int
		_16=len+_15;
		//assign %5 = %16  : int
		// isCopyEliminated = true
		len = _16;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %5
	_DEALLOC(data);
	return len;
	//return
}


// Initialize a match to be empty
void Match_init(Match* m) {
	m->len=0;
	m->offset=0;
}
void identity_Match(void* reducer, void* m)
{
	Match_init((Match*)m);
}
void reduce_Match(void* reducer, void* left, void* right)
{
	Match* l_m = (Match*)left;
	Match* r_m = (Match*)right;
	// Debug messages
	printf("l_m->len:%d\tl_m->offset:%d\tr_m->len:%d\tr_m->offset:%d\n", l_m->len, l_m->offset, r_m->len, r_m->offset);
	if(l_m-> len < r_m-> len){
		// Update 'left' reducer with larger 'right' reducer
		l_m->len = r_m->len;
		l_m->offset = r_m->offset;
	}
	// Empty right
	//Match_init(r_m);
}
// Define a customised reducer of 'Match' type
CILK_C_DECLARE_REDUCER(Match) my_match_reducer =
		CILK_C_INIT_REDUCER(Match,
							reduce_Match,
							identity_Match,
							__cilkrts_hyperobject_noop_destroy);

Match* _findLongestMatch_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t pos){
	Match* m;
	_DECL_DEALLOC(m);
	int64_t bestOffset = 0;
	int64_t bestLen = 0;
	int64_t start = 0;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	Match* _18;
	_DECL_DEALLOC(_18);
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	// isCopyEliminated = true
	bestOffset = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	// isCopyEliminated = true
	bestLen = _9;
	//const %11 = 255 : int
	_11 = 255;
	//sub %12 = %1, %11 : int
	_12=pos-_11;
	//const %13 = 0 : int
	_13 = 0;
	//invoke (%10) = (%12, %13) whiley/lang/Math:max : function(int,int)->(int)
	{
		_10 = max(_12, _13);
	}
	//assign %5 = %10  : int
	// isCopyEliminated = true
	start = _10;
	//assign %6 = %5  : int
	// isCopyEliminated = true
	offset = start;
	//loop (%3, %4, %6, %7, %14, %15, %16, %17)
	//int nthreads, tid;
	// Parallel loop region using cilk_for
	/*{
		// Initialize the mutex
		pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
		cilk_for (int _offset = start;_offset<pos;_offset++){
			//invoke (%14) = (%0, %6, %1) LZ77_compress:match : function(byte[],LZ77_compress:nat,LZ77_compress:nat)->(int)
			int64_t _len = 0;
			{
				// isCopyEliminated of '_0' = true
				_len = _match_(_1DARRAY_PARAM(data), false, _offset, pos);
				_RETAIN_DEALLOC(data, "false-false-true" , "match");
			}
			// Lock the resource to update the best length and offset
			pthread_mutex_lock(&mutex);
			if(_len > bestLen){
				bestLen = _len;
				bestOffset = pos - _offset;
			}
			pthread_mutex_unlock(&mutex);
			// Debug messages
			//printf("ID:%d\t_Len:%d\tOffset:%d\tLocalLen[%d]:%d\tLocalOffset[%d]:%d\n",id, _len, offset, id, localLen[id], id, localOffset[id]);
		}
	}*/
	// Refer to https://www.cilkplus.org/docs/doxygen/include-dir/page_reducers_in_c.html
	// User cilk_for and customised cilk reducer to improve the parallelism
	{

		// // Register the reducer with Intel Cilk runtime
		// CILK_C_REGISTER_REDUCER(my_match_reducer);
		// Initialize the reducer
		Match_init(&REDUCER_VIEW(my_match_reducer));
		// Execute the offset loop in parallel
		// Define the grain size (https://software.intel.com/en-us/articles/why-is-cilk-plus-not-speeding-up-my-program-part-1)
		// #pragma cilk grainsize = ((pos - start)/__cilkrts_get_nworkers())
		// #pragma cilk grainsize = min(2048, (pos - start) / (8*__cilkrts_get_nworkers()))
		#pragma cilk grainsize = GRAINSIZE
		cilk_for (int _offset = start;_offset<pos;_offset++){
			//invoke (%14) = (%0, %6, %1) LZ77_compress:match : function(byte[],LZ77_compress:nat,LZ77_compress:nat)->(int)
			int64_t _len = 0;
			{
				// isCopyEliminated of '_0' = true
				_len = _match_(_1DARRAY_PARAM(data), false, _offset, pos);
				_RETAIN_DEALLOC(data, "false-false-true" , "match");
			}
			// Get the current view of the reducer
			Match* m= &REDUCER_VIEW(my_match_reducer);
			// Update reducer with a better length (and its offset)
			if(_len > m->len){
				m->len = _len;
				m->offset = pos - _offset;
			}
			// Debug messages
			printf("POS:%d\toffset:%d\t_Len:%d\tm->len:%d\tm->offset:%d\n", pos, _offset, _len, m->len, m->offset);
		}
		// // Unregister the reducer with Intel Cilk runtime
		// CILK_C_UNREGISTER_REDUCER(my_match_reducer);
		// Obtain the best length and its offset
		Match* m = &REDUCER_VIEW(my_match_reducer);
		bestLen = m->len;
		bestOffset = m->offset;
		// Debug messages
		printf("POS:%d\tbestLen:%d\tbestOffset:%d\n", pos, bestLen, bestOffset);
	}
	//.blklab3
	blklab3:;
	//
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_DEALLOC_STRUCT(_18, Match);
	_18 = malloc(sizeof(Match));
	// isCopyEliminated = true
	_18->len = bestLen;
	// isCopyEliminated = true
	_18->offset = bestOffset;
	_ADD_DEALLOC(_18);
	//return %18
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	return _18;
	//return
}

BYTE* _append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	BYTE _11;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//lengthof %5 = %0 : byte[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : byte[]
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	_ADD_DEALLOC(_8);
	//assign %2 = %8  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _8);
	_TRANSFER_DEALLOC(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = items_size;
		//ifge %3, %10 goto blklab6 : int
		if(i>=_10){goto blklab6;}
		//indexof %11 = %0, %3 : byte[]
		_11=items[i];
		//update %2[%3] = %11 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
		i = _13;
		//.blklab7
		blklab7:;
	}
	//.blklab6
	blklab6:;
	//update %2[%3] = %1 : byte[] -> byte[]
	// isCopyEliminated = true
	nitems[i] = item;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_ADD_DEALLOC(_5);
	//assign %2 = %5  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	_TRANSFER_DEALLOC(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab10 : int
		if(i>=size){goto blklab10;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
		//.blklab11
		blklab11:;
	}
	//.blklab10
	blklab10:;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	Match* m;
	_DECL_DEALLOC(m);
	BYTE offset;
	BYTE length;
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	Match* _11;
	_DECL_DEALLOC(_11);
	BYTE _12;
	int64_t _13 = 0;
	BYTE _14;
	int64_t _15 = 0;
	BYTE _16;
	BYTE _17;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	_DECL_1DARRAY_BYTE(_22);
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	_DECL_1DARRAY_BYTE(_33);
	_DECL_DEALLOC(_33);
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	// isCopyEliminated = true
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//const %24 = 2 : int
	_24 = 2;
	//lengthof %25 = %0 : byte[]
	_25 = data_size;
	//mul %26 = %24, %25 : int
	_26=_24*_25;
	//arraygen %9 = [7; 26] : byte[]
	_DEALLOC(_9);
	_NEW_1DARRAY_BYTE(_9, _26, _7);
	_ADD_DEALLOC(_9);
	//const %27 = 0 : int
	_27 = 0;
	//assign %28 = %27  : int
	// isCopyEliminated = true
	_28 = _27;
	//assign %1 = %9  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _9);
	_TRANSFER_DEALLOC(output, _9);
	// Register the reducer with Intel Cilk runtime
	CILK_C_REGISTER_REDUCER(my_match_reducer);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %28)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab12 : int
		if(pos>=_10){goto blklab12;}
		//invoke (%11) = (%0, %2) LZ77_compress:findLongestMatch : function(byte[],LZ77_compress:nat)->(LZ77_compress:Match)
		{
			_DEALLOC_STRUCT(_11, Match);
			// isCopyEliminated of '_0' = true
			_11 = _findLongestMatch_(_1DARRAY_PARAM(data), false, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "findLongestMatch");
			_ADD_DEALLOC(_11);
		}
		//assign %3 = %11  : {int len,int offset}
		_DEALLOC_STRUCT(m, Match);
		// isCopyEliminated = true
		m = _11;
		_TRANSFER_DEALLOC(m, _11);
		//fieldload %13 = %3 offset : {int len,int offset}
		_13 = m->offset;
		//invoke (%12) = (%13) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_12 = (BYTE)_13;
		}
		//assign %4 = %12  : byte
		// isCopyEliminated = true
		offset = _12;
		//fieldload %15 = %3 len : {int len,int offset}
		_15 = m->len;
		//invoke (%14) = (%15) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_14 = (BYTE)_15;
		}
		//assign %5 = %14  : byte
		// isCopyEliminated = true
		length = _14;
		//const %16 = 00000000b : byte
		_16 = 0b00000000;
		//ifne %4, %16 goto blklab14 : byte
		if(offset!=_16){goto blklab14;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//assign %5 = %17  : byte
		// isCopyEliminated = true
		length = _17;
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=pos+_18;
		//assign %2 = %19  : int
		// isCopyEliminated = true
		pos = _19;
		//goto blklab15
		goto blklab15;
		//.blklab14
		blklab14:;
		//fieldload %20 = %3 len : {int len,int offset}
		_20 = m->len;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		// isCopyEliminated = true
		pos = _21;
		//.blklab15
		blklab15:;
		//update %1[%28] = %4 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_28] = offset;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %28, %29 : int
		_30=_28+_29;
		//assign %28 = %30  : int
		// isCopyEliminated = true
		_28 = _30;
		//update %1[%28] = %5 : byte[] -> byte[]
		// isCopyEliminated = false
		output[_28] = length;
		//const %31 = 1 : int
		_31 = 1;
		//add %32 = %28, %31 : int
		_32=_28+_31;
		//assign %28 = %32  : int
		// isCopyEliminated = true
		_28 = _32;
		//.blklab13
		blklab13:;
	}

	//.blklab12
	blklab12:;
	//assert
	{
		//ifle %28, %26 goto blklab22 : int
		if(_28<=_26){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
		//.blklab22
		blklab22:;
		//assert
	}
	//invoke (%33) = (%1, %28) LZ77_compress:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_33);
		// isCopyEliminated of '_1' = true
		_33 = _resize_(_1DARRAY_PARAM(output), false, _28, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_33));
		_RETAIN_DEALLOC(output, "false-false-false" , "resize");
		_ADD_DEALLOC(_33);
	}
	// Unregister the reducer with Intel Cilk runtime
	CILK_C_UNREGISTER_REDUCER(my_match_reducer);
	//assign %1 = %33  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _33);
	_TRANSFER_DEALLOC(output, _33);
	//return %1
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_9);
	_DEALLOC_STRUCT(_11, Match);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_33);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos = 0;
	BYTE header;
	BYTE item;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t start = 0;
	int64_t i = 0;
	BYTE _9;
	int64_t _10 = 0;
	_DECL_1DARRAY_BYTE(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	BYTE _16;
	int64_t _17 = 0;
	int64_t _18 = 0;
	BYTE _19;
	int64_t _20 = 0;
	int64_t _21 = 0;
	BYTE _22;
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	_DECL_DEALLOC(_30);
	int64_t _31 = 0;
	int64_t _32 = 0;
	//const %9 = 00000000b : byte
	_9 = 0b00000000;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [9; 10] : byte[]
	_DEALLOC(_11);
	_NEW_1DARRAY_BYTE(_11, _10, _9);
	_ADD_DEALLOC(_11);
	//assign %1 = %11  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _11);
	_TRANSFER_DEALLOC(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %2 = %12  : int
	// isCopyEliminated = true
	pos = _12;
	//loop (%1, %2, %3, %4, %5, %6, %7, %8, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %2, %13 : int
		_14=pos+_13;
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %14, %15 goto blklab16 : int
		if(_14>=_15){goto blklab16;}
		//indexof %16 = %0, %2 : byte[]
		_16=data[pos];
		//assign %3 = %16  : byte
		// isCopyEliminated = true
		header = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %2, %17 : int
		_18=pos+_17;
		//indexof %19 = %0, %18 : byte[]
		_19=data[_18];
		//assign %4 = %19  : byte
		// isCopyEliminated = true
		item = _19;
		//const %20 = 2 : int
		_20 = 2;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		// isCopyEliminated = true
		pos = _21;
		//const %22 = 00000000b : byte
		_22 = 0b00000000;
		//ifne %3, %22 goto blklab18 : byte
		if(header!=_22){goto blklab18;}
		//invoke (%23) = (%1, %4) LZ77_compress:append : function(byte[],byte)->(byte[])
		{
			_DEALLOC(_23);
			// isCopyEliminated of '_1' = true
			_23 = _append_(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
			_RETAIN_DEALLOC(output, "false-false-false" , "append");
			_ADD_DEALLOC(_23);
		}
		//assign %1 = %23  : byte[]
		_DEALLOC(output);
		// isCopyEliminated = true
		_UPDATE_1DARRAY(output, _23);
		_TRANSFER_DEALLOC(output, _23);
		//goto blklab19
		goto blklab19;
		//.blklab18
		blklab18:;
		//invoke (%24) = (%3) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_24 = (unsigned int)header;
		}
		//assign %5 = %24  : int
		// isCopyEliminated = true
		offset = _24;
		//invoke (%25) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_25 = (unsigned int)item;
		}
		//assign %6 = %25  : int
		// isCopyEliminated = true
		len = _25;
		//lengthof %26 = %1 : byte[]
		_26 = output_size;
		//sub %27 = %26, %5 : int
		_27=_26-offset;
		//assign %7 = %27  : int
		// isCopyEliminated = true
		start = _27;
		//assign %8 = %7  : int
		// isCopyEliminated = false
		i = start;
		//loop (%1, %4, %8, %28, %29, %30, %31, %32)
		while(true){
			//add %28 = %7, %6 : int
			_28=start+len;
			//ifge %8, %28 goto blklab20 : int
			if(i>=_28){goto blklab20;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			// isCopyEliminated = true
			item = _29;
			//invoke (%30) = (%1, %4) LZ77_compress:append : function(byte[],byte)->(byte[])
			{
				_DEALLOC(_30);
				// isCopyEliminated of '_1' = true
				_30 = _append_(_1DARRAY_PARAM(output), false, item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
				_RETAIN_DEALLOC(output, "false-false-false" , "append");
				_ADD_DEALLOC(_30);
			}
			//assign %1 = %30  : byte[]
			_DEALLOC(output);
			// isCopyEliminated = true
			_UPDATE_1DARRAY(output, _30);
			_TRANSFER_DEALLOC(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			// isCopyEliminated = true
			i = _32;
			//.blklab21
			blklab21:;
		}
		//.blklab20
		blklab20:;
		//.blklab19
		blklab19:;
		//.blklab17
		blklab17:;
	}
	//.blklab16
	blklab16:;
	//return %1
	_DEALLOC(data);
	_DEALLOC(_11);
	_DEALLOC(_23);
	_DEALLOC(_30);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_DEALLOC(compress_data);
	FILE* writer;
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_2DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	void* _17;
	int64_t _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	_DECL_1DARRAY_BYTE(_23);
	_DECL_DEALLOC(_23);
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	void* _27;
	int64_t _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	void* _33;
	_DECL_DEALLOC(_33);
	_DECL_2DARRAY(_34);
	_DECL_DEALLOC(_34);
	int64_t _35 = 0;
	_DECL_1DARRAY(_36);
	_DECL_DEALLOC(_36);
	int64_t _37 = 0;
	GRAINSIZE = atoi(args[3]);
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
	//invoke (%5) = (%8) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_8, _8_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _5;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(file, &_9_size);
		_ADD_DEALLOC(_9);
	}
	//assign %2 = %9  : byte[]
	_DEALLOC(data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(data, _9);
	_TRANSFER_DEALLOC(data, _9);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 14, 0);
	_13[0] = 68; _13[1] = 97; _13[2] = 116; _13[3] = 97; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32;
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		println_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_16);
		_16 = fromBytes(data, data_size);
		_16_size = data_size;
		_ADD_DEALLOC(_16);
	}
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %19 = %2 : byte[]
	_19 = data_size;
	//indirectinvoke () = %18 (%19) : method(any)->()
	{
		printf("%"PRId64, _19);
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 6, 0);
	_22[0] = 32; _22[1] = 98; _22[2] = 121; _22[3] = 116; _22[4] = 101; _22[5] = 115;
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		println_s(_22, _22_size);
	}
	//invoke (%23) = (%2) LZ77_compress:compress : function(byte[])->(byte[])
	{
		_DEALLOC(_23);
		// isCopyEliminated of '_2' = true
		_23 = _compress_(_1DARRAY_PARAM(data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		_RETAIN_DEALLOC(data, "false-false-false" , "compress");
		_ADD_DEALLOC(_23);
	}
	//assign %3 = %23  : byte[]
	_DEALLOC(compress_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(compress_data, _23);
	_TRANSFER_DEALLOC(compress_data, _23);
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 19, 0);
	_26[0] = 67; _26[1] = 79; _26[2] = 77; _26[3] = 80; _26[4] = 82; _26[5] = 69; _26[6] = 83; _26[7] = 83; _26[8] = 69; _26[9] = 68; _26[10] = 32; _26[11] = 68; _26[12] = 97; _26[13] = 116; _26[14] = 97; _26[15] = 58; _26[16] = 32; _26[17] = 32; _26[18] = 32;
	_ADD_DEALLOC(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		println_s(_26, _26_size);
	}
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %29 = %3 : byte[]
	_29 = compress_data_size;
	//indirectinvoke () = %28 (%29) : method(any)->()
	{
		printf("%"PRId64, _29);
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_32);
	_NEW_1DARRAY_int64_t(_32, 6, 0);
	_32[0] = 32; _32[1] = 98; _32[2] = 121; _32[3] = 116; _32[4] = 101; _32[5] = 115;
	_ADD_DEALLOC(_32);
	//indirectinvoke () = %31 (%32) : method(int[])->()
	{
		println_s(_32, _32_size);
	}
	//fieldload %34 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_34);
	_CONV_ARGS(_34);
	_ADD_DEALLOC(_34);
	//const %35 = 1 : int
	_35 = 1;
	//indexof %36 = %34, %35 : int[][]
	_36=_34[_35];
	_36_size = _34_size_size;
	_REMOVE_DEALLOC(_36);
	//invoke (%33) = (%36) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_33 = Writer(_36, _36_size);
	}
	//assign %4 = %33  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	// isCopyEliminated = true
	writer = _33;
	//fieldload %38 = %4 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%37) = %38 (%3) : method(byte[])->(int)
	{
		writeAll(writer, compress_data, compress_data_size);
	}
	//fieldload %39 = %4 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %39 () : method()->()
	{
		fclose(writer);
		writer = NULL;
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(compress_data);
	if(writer != NULL){fclose(writer); writer = NULL;}
	_DEALLOC_2DARRAY_int64_t(_6);
	_DEALLOC(_8);
	_DEALLOC(_9);
	_DEALLOC(_13);
	_DEALLOC(_16);
	_DEALLOC(_22);
	_DEALLOC(_23);
	_DEALLOC(_26);
	_DEALLOC(_32);
	_DEALLOC_2DARRAY_int64_t(_34);
	_DEALLOC(_36);
	exit(0);
}
