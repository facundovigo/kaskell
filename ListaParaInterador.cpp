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

List nil(){

    List p = new  ListMem;
    p->first= NULL;
    p->last= NULL;
    p->size=0;

    return p;
}

bool isNil(List n){

    return n->first==NULL;
}

Node* createNode(ELEM_TYPE elem, Node* next){

    Node* p = new Node;
    p->elem=elem;
    p->next=next;

    return p;
}

void cons(List& l, ELEM_TYPE elem){

    Node* aux=createNode(elem,l->first);
    l->size++;
    if(isNil(l)){

     l->first= aux;
   }  else {
       l->first=aux;
       l->last=aux;
     }

}

void snoc(List& l, ELEM_TYPE elem){

    Node* aux=createNode(elem,NULL);
    l->size++;
    if(isNil(l)){
      l->first=aux;
      l->last=aux;
    }else{
           l->last=aux;

    }
}

void tail(List& l){

    Node* tmp=l->first;

    l->first= l->first->next;
    if(isNil(l)){
    l->last=NULL;
    }
    delete tmp;
    tmp=NULL;
}

int sizeL(List l) {

	return l->size;
}

void destroyL(List& l){

    Node* borrame;

    while(!isNil(l)){
    borrame=l->first;
    l->first=borrame->next;

    delete borrame;

    }
    delete l;
    l=NULL;
}

/////////Iterador////////



struct IteratorMem {
	Node* current;
};

typedef IteratorMem* Iterator



Iterator init(List xs) { 	// Dada una Cola xs, el puntero del iterador apunta al primer nodo que de xs

    Iterator p= new IteratorMem;

    p->current = xs->first;
    return p;

bool hasFinished( Iterator it ){

    return it->current==NULL;

}


