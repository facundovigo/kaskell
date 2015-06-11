#include "Stack.h"

struct StackHeader{
    int tam;
    StackNode* first;
};

struct StackNode{
    int valor;
    StackNode* next;
};


/*
void destroy(Stack& s){
    while(s != null)
        s = s->next;
};

-- otra imple mas copada
void destroy(Stack& s){
    while(s != null)
        pop(s);
};


void pop(Stack& s){
    Stack x= s;
    s=s->next;
    delete x;
};


imple menos copada
int pop(Stack& s){
    Stack tmp = s;
    int n = s->top;
    s=s->next;
    delete tmp;
    return n;
};
*/

//para que esta imple sea de orden 1 puedo
int size(Stack s){ // este debe ser O(1)
    if(s != NULL){
        return (s->tam);
        } //debo agregar el tamaño en la estructura, listo!
        else {
            return 0;} // en el caso de que la pila sea vacia
}


//-----------------------------------
//nueva version para mejorar la performance porque sino antes
//cada nodo guardaba el tamaño del stack y uso mucha memoria
//tengo un encabezado previo que guarda el tamaño y un puntero al primer nodo


//quita el primero
void pop(Stack& s){
    StackNode* t = s->first;
    s->first = s-> first->next;
    delete t;
};

// size queda igual que antes

Stack emptyS(){
    Stack s = new StackHeader;
    s->tam = 0;
    s->first = NULL;
    return s;
};

// tambien cambia el destroy un toque

void destroy(Stack& s){
    //esto elimina los nodos
    while(!isEmptyS(s))
        pop(s);
    //esto elimina el header
    delete s;
}

bool isEmptyS(Stack s){
    return(s->tam==0);
};

int top(Stack s){
    return (s->first->valor);
};

void push(int x, Stack& s){
    StackNode* n = new StackNode;
    n->valor = x;
    n->next = s->first;
    s->first = n;
    s->tam++;
};
