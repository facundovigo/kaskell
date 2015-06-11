#include <iostream>
#define ELEM_TYPE int

using namespace std;

struct Node {
	ELEM_TYPE elem ;
	Node* next;
};

struct ListMem {
	Node* first ;
	Node* last ;
	int size ;
};

typedef ListMem* List ;

List nil();
bool isNil(List n);

