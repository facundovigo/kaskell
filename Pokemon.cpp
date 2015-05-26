/*
 * Definir el tipo abstracto de datos Pokemon como un numero entero
 * que representa la vida y un nombre. Su interfaz es la siguiente:
 *
 * Implementar esta interfaz destructiva, utilizando memoria de Heap.
*/
#include "Pokemon.h"

struct PokemonSt {
    int vida;
    string nombre;
};

Pokemon crearPokemon(string nombre)
{
    Pokemon p = new PokemonSt;
    p->nombre = nombre;
    p->vida = 10;
    return p;
};

void restarVida(Pokemon& p)
{
    p->vida = p->vida - 10;
};

void cambiarNombre(Pokemon& p, string nombre)
{
    p->nombre = nombre;
};

bool estaVivo(Pokemon p)
{
    return(p->vida>0);
};

string getNombre(Pokemon p)
{
    return(p->nombre);
};

int getVida(Pokemon p)
{
    return(p->vida);
};

/*
void luchar(Pokemon& p, Pokemon& r)
{

};

void lucharN(int n, Pokemon& p, Pokemon& r)
{

};
*/

void destruir(Pokemon& p)
{
    delete p;
};
