#include "Util.h"
#define text [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b]
typedef long long nat;
typedef struct{
	long long len;
	long long offset;
} Match;
void printf_Match(Match* _match);
Match* copy_Match(Match* _match);
void free_Match(Match* _match);
typedef struct{
	long long length;
	_DECL_1DARRAY_MEMBER_BYTE(items);
} Data;
void printf_Data(Data* _data);
Data* copy_Data(Data* _data);
void free_Data(Data* _data);
long long match(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), long long offset, long long end);
Match* findLongestMatch(Data* input, _DECL_DEALLOC_PARAM(input), long long pos);
Data* append_byte(Data* data, _DECL_DEALLOC_PARAM(data), BYTE item);
Data* write_u1(Data* data, _DECL_DEALLOC_PARAM(data), long long u1);
Data* compress(Data* input, _DECL_DEALLOC_PARAM(input));
int main(int argc, char** args);
