#include <iostream>
using namespace std;
//Ejercicio 5

struct QueueHeader;
struct QueueNode;
typedef QueueHeader* Queue;

Queue emptyQ();
bool isEmptyQ(Queue q);
void queue(Queue& q, int x);
int firstQ(Queue q);
void queue(Queue& q);
void destroyQ(Queue& q);
