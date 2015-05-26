#include <iostream>
#include "Pokemon.h"
#include "Fraccion.h"

using namespace std;

int main()
{

    Pokemon pika = crearPokemon("pikachu");

    cout << "Mi nombre es: " << getNombre(pika) << endl;

    cambiarNombre(pika, "bruno");

    cout << "Mi nombre es: " << getNombre(pika) << endl;

    cout << "Cantidad de vida: " << getVida(pika) << endl;

    cout << "esta vivo: " << estaVivo(pika) << endl;

    restarVida(pika);

    cout << "esta vivo: " << estaVivo(pika) << endl;

    destruir(pika);

    //---------FRACCIONES----------//

cout << "Creo dos fracciones... " << endl;

    Fraccion f = fraccion(1, 2);
    Fraccion g = fraccion(1, 1);

cout << "numerador: "<< num(f) << endl;
cout << "denominador: "<< den(f) << endl;


cout << "hago la suma" << endl;

Fraccion sum = sumar(f,g);

cout << "suma: "<< endl;
cout << "numerador: "<< num(sum) << endl;
cout << "denominador: "<< den(sum) << endl;

    return 0;
}
