/*
Definir un tipo abstracto para representar fracciones, con la siguiente interfaz:
*/
#include "Fraccion.h"

struct FraccionSt
{
    int numerador;
    int denominador;
};


// PROP: realiza el producto de dos numeros
int producto(int& a , int& b){
    return (a*b);
}

int num(Fraccion& f){
    return f->numerador;
}

int den(Fraccion& f){
    return f->denominador;
}

Fraccion fraccion(int x, int y)
{
    Fraccion f = new FraccionSt;
    f->numerador = x;
    f->numerador = y;
    return f;
};

Fraccion sumar(Fraccion f1, Fraccion f2)
{
    return(fraccion(producto(f2->denominador, f1->numerador)+
                    producto(f1->denominador, f2->numerador),
                    producto(f1->denominador, f2->denominador)
                    )
            );
};
Fraccion restar(Fraccion f1, Fraccion f2)
{
    return(fraccion(producto(f2->denominador, f1->numerador)-
                    producto(f1->denominador, f2->numerador),
                    producto(f1->denominador, f2->denominador)
                    )
            );
};

Fraccion multiplicar(Fraccion f1, Fraccion f2)
{
    return fraccion(producto(f1->numerador, f2->numerador),
                    producto(f1->denominador, f2->denominador)
                    );
};

Fraccion dividir(Fraccion f1, Fraccion f2)
{
    return fraccion(producto(f1->numerador, f2->denominador),
                    producto(f1->denominador, f2->numerador)
                    );
};

void invertir(Fraccion& f1)
{
    int aux = f1->numerador;
    f1->numerador = f1->denominador;
    f1->denominador = aux;
};

void simplificar(Fraccion& f1)
{

};

void destruir(Fraccion& f1)
{
    delete f1;
};
