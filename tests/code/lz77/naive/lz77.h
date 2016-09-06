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
long long match(Data* input, long long offset, long long end);
Match* findLongestMatch(Data* input, long long pos);
Data* append_byte(Data* data, BYTE item);
Data* write_u1(Data* data, long long u1);
Data* compress(Data* input);
Data* decompress(Data* input);
Data* init(long long repeat);
int main(int argc, char** args);
