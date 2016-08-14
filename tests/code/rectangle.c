#include "rectangle.h"
Point* copy_Point(Point* _Point){
	Point* new_Point = malloc(sizeof(Point));
	new_Point->x = _Point->x;
	new_Point->y = _Point->y;
	return new_Point;
}
Point** copy_array_Point(Point** _Point, long long _Point_size){
	Point** new_Point = malloc(_Point_size*sizeof(Point*));
	for(int i=0;i<_Point_size;i++){
		new_Point[i] = copy_Point(_Point[i]);
	}
	return new_Point;
}
void free_Point(Point* point){
	free(point);
}
void printf_Point(Point* point){
	printf("{");
	printf(" x:");
	printf("%lld", point->x);
	printf(" y:");
	printf("%lld", point->y);
	printf("}");
}
Rectangle* copy_Rectangle(Rectangle* _Rectangle){
	Rectangle* new_Rectangle = malloc(sizeof(Rectangle));
	new_Rectangle->p1 = copy_Point(_Rectangle->p1);
	new_Rectangle->p2 = copy_Point(_Rectangle->p2);
	return new_Rectangle;
}
Rectangle** copy_array_Rectangle(Rectangle** _Rectangle, long long _Rectangle_size){
	Rectangle** new_Rectangle = malloc(_Rectangle_size*sizeof(Rectangle*));
	for(int i=0;i<_Rectangle_size;i++){
		new_Rectangle[i] = copy_Rectangle(_Rectangle[i]);
	}
	return new_Rectangle;
}
void free_Rectangle(Rectangle* rectangle){
	free_Point(rectangle->p1);
	rectangle->p1 = NULL;
	free_Point(rectangle->p2);
	rectangle->p2 = NULL;
	free(rectangle);
}
void printf_Rectangle(Rectangle* rectangle){
	printf("{");
	printf(" p1:");
	printf_Point(rectangle->p1);
	printf(" p2:");
	printf_Point(rectangle->p2);
	printf("}");
}
