#include <iostream>
#include <memory>
using namespace std;

class Vector {
public:
  int x = 2;
  int y = 3;
};


int main(int argc, char *argv[]){
  //Vector p1;
  //cout<<p1.x;
  
  shared_ptr<Vector> p1(new Vector);
  shared_ptr<Vector> p2 = p1; //Shared pointer
  
  //unique_ptr<int> p1(new int(5));
  p2->x=5;
  p1->x=3;

  cout<<p1->x<<endl;
  cout<<p2->x<<endl;

  cout<<"----"<<endl;
  p2.reset();
  cout<<p1->x<<endl;// Still able to access the value
  cout<<p2->x<<endl;
  p1.reset(); // Delete allocated memory
  cout<<p1->x<<endl;

  /* unique_ptr<Vector> p3(new Vector);
  cout<<p3->x<<endl;
  //unique_ptr<Vector> p4 = p3; // Compiler error
  unique_ptr<Vector> p4 = move(p3);
  p3.reset();
  cout<<p4->x<<endl;*/
  
  return 0;
}
