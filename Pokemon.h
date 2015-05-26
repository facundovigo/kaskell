/*
 * Definir el tipo abstracto de datos Pokemon como un numero entero
 * que representa la vida y un nombre. Su interfaz es la siguiente:
 * Implementar esta interfaz destructiva, utilizando memoria de Heap.
*/
#include <iostream>
using namespace std;

struct PokemonSt;
typedef PokemonSt* Pokemon;

Pokemon crearPokemon(string nombre);
void restarVida(Pokemon& p);
void cambiarNombre(Pokemon& p, string nombre);
bool estaVivo(Pokemon p);
string getNombre(Pokemon p);
int getVida(Pokemon p);
//void luchar(Pokemon& p, Pokemon& r);
//void lucharN(int n, Pokemon& p, Pokemon& r);
void destruir(Pokemon& p);
