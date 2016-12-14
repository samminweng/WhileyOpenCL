#include "Util.h"
#define ONE_CENT 0
#define FIVE_CENTS 1
#define TEN_CENTS 2
#define TWENTY_CENTS 3
#define FIFTY_CENTS 4
#define ONE_DOLLAR 5
#define FIVE_DOLLARS 6
#define TEN_DOLLARS 7
#define Value [1,5,10,20,50,100,500,1000]
#define Descriptions [[49,99],[53,99],[49,48,99],[50,48,99],[53,48,99],[36,49],[36,53],[36,49,48]]
typedef int64_t nat;
typedef int64_t* Cash;
int64_t* cash();
int64_t* cash(_DECL_1DARRAY_PARAM(coins));
int64_t total(_DECL_1DARRAY_PARAM(c));
int64_t contained(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second));
int64_t* add(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second));
int64_t* subtract(_DECL_1DARRAY_PARAM(first), _DECL_1DARRAY_PARAM(second));
int64_t* calculateChange(_DECL_1DARRAY_PARAM(till), int64_t change);
BYTE* toString(_DECL_1DARRAY_PARAM(c));
int64_t* buy(FILE* console, _DECL_1DARRAY_PARAM(till), _DECL_1DARRAY_PARAM(given), int64_t cost);
int main(int argc, char** args);
