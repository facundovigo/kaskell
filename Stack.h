#include <iostream>
using namespace std;
//Ejercicio 4

struct StackHeader;
struct StackNode;
typedef StackHeader* Stack;

Stack emptyS();
bool isEmptyS(Stack s);
void push(int x, Stack& s);
int top(Stack s);
void destroyS(Stack& s);
void pop(Stack& s);
int size(Stack s);
