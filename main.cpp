/*this is a comment*/
#include <iostream>
#include <stdio.h>
class X {
public:
  int i=0;
  double j=0.0;

public:
  int getI(){ return i;}
  double getD() {return j;}
  ~X(){}
};


int main(){
	std::cout << "hello world" << std::endl;
	X x;
	std::cout << x.getI() << std::endl;
	std::cout << x.getD() << std::endl;
	//so we can programming in emacs. that's kind'a cool.
	return 0;
}

void donothing(){
  //this function do absolutely nothing
  //so why are you bothering reading it?

}
