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
long long match(BYTE* data, long long data_size, long long offset, long long end);
Match* findLongestMatch(BYTE* data, long long data_size, long long pos);
BYTE* append_byte(BYTE* items, long long items_size, BYTE item);
BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1);
Data* compress(Data* data);
int main(int argc, char** args);
