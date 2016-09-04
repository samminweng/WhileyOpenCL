#include "Util.h"
#define text [01001100b,01011010b,00100000b,00110111b,00110111b,00100000b,01100011b,01101111b,01101101b,01110000b,01110010b,01100101b,01110011b,01110011b,01101001b,01101111b,01101110b]
typedef long long nat;
typedef struct{
	long long len;
	long long offset;
} Match;
void printf_Match(Match* _match);
Match* copy_Match(Match* _match);
void free_Match(Match* _match);
long long match(BYTE* data, long long data_size, long long offset, long long end);
Match* findLongestMatch(BYTE* data, long long data_size, long long pos);
BYTE* append_byte(BYTE* items, long long items_size, BYTE item);
BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1);
BYTE* compress(BYTE* data, long long data_size);
int main(int argc, char** args);
