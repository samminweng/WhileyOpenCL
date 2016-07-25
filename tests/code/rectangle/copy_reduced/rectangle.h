#include "Util.h"
typedef struct{
	long long x;
	long long y;
} Point;
void printf_Point(Point* _point);
Point* copy_Point(Point* _point);
void free_Point(Point* _point);
typedef struct{
	Point* p1;
	Point* p2;
} Rectangle;
void printf_Rectangle(Rectangle* _rectangle);
Rectangle* copy_Rectangle(Rectangle* _rectangle);
void free_Rectangle(Rectangle* _rectangle);
Rectangle* updateRec(Rectangle* rec, Point* p);
int main(int argc, char** args);
