#include <iostream>
#define ELEM_TYPE int

struct lNode{
    ELEM_TYPE value;
    lNode*    next;
};

struct ListMem {
	Node* first ;
	Node* last ;
	int size ;
};

typedef ListMem* List ;

Interador init(List l);//crea un interador
bool hasFinished(Interador it);
void next2(Interador& it);
void finish(Interador& it);
