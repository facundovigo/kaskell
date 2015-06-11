#include "Queue.h"

struct QueueHeader{
    int size;
    QueueNode* first;
    QueueNode* last;
};

struct QueueNode{
    int valor;
    QueueNode* next;
};

Queue emptyQ(){
    Queue q = new QueueHeader;
    q->size = 0;
    q->last = NULL;
    q->first = NULL;
    return q;

};

bool isEmptyQ(Queue q){
    return q->size==0;
};
//agrega
void queue(Queue& q, int x){
    QueueNode* n = new QueueNode;
    n->valor = x;
    n->next = NULL;
    q->size++;
    if(q->last != NULL) {
      q->last->next = n;
    }
    q->last = n;
    if(q->first == NULL) {
       q->first = q->last;
    }
};

int firstQ(Queue q){
    return q->first->valor;
};
//saca
void dequeue(Queue& q){
    QueueNode* aux = q->first;
    q->first = aux->next;
    q->size--;
    delete aux;
    if(q->size < 2) {
       q->last = q->first;
    }
};

void destroyQ(Queue& q){
    while (not isEmptyQ(q)){
        dequeue(q);
    }
    delete q;
};
