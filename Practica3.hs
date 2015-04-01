
--Arboles binarios

data Dir = Norte | Sur | Este | Oeste

opuesto :: Dir -> Dir
-- Dada una direccion devuelve su opuesta
opuesto Norte = Sur
opuesto Este = Oeste
opuesto Sur = Norte
opuesto Oeste = Este

-- Defina las siguientes funciones sobre arboles binarios utilizando recursion estructural segun corresponda:

data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving Show

-- 1. Dado un arbol binario de enteros devuelve la suma entre sus elementos.
sumarT :: Tree Int -> Int
sumarT EmptyT = 0
sumarT (NodeT x t1 t2) = x + sumarT t1 + sumarT t2

-- 2. Dado un arbol binario devuelve su cantidad de elementos, es decir, el tamano del arbol (size en ingles).
sizeT :: Tree a -> Int
sizeT EmptyT = 0
sizeT (NodeT x t1 t2) = 1 + sizeT t1 + sizeT t2

-- 3 Dado un arbol de enteros devuelve un arbol con el doble de cada numero.
mapDobleT :: Tree Int -> Tree Int
mapDobleT EmptyT = EmptyT
mapDobleT (NodeT x t1 t2) = NodeT (2*x) (mapDobleT t1) (mapDobleT t2)

-- 4 Dado un arbol de direcciones t devuelve un arbol con la direccion opuesta para cada elemento de t.
--Nota: Utilizar el tipo Dir ya definido.
mapOpuestoT :: Tree Dir -> Tree Dir
mapOpuestoT EmptyT = EmptyT
mapOpuestoT (NodeT x t1 t2) = NodeT (opuesto x) (mapOpuestoT t1) (mapOpuestoT t2)

-- 5 Dado un arbol de palabras devuelve un arbol con la longitud de cada palabra.
mapLongitudT :: Tree String -> Tree Int
mapLongitudT EmptyT = EmptyT
mapLongitudT (NodeT x t1 t2) = NodeT (length x) (mapLongitudT t1) (mapLongitudT t2)

-- 6 Dados un elemento y un arbol binario devuelve True si existe un elemento igual a ese en el arbol.
perteneceT :: Eq a => a -> Tree a -> Bool
perteneceT n EmptyT = False
perteneceT n (NodeT x t1 t2) = ( n == x ) || perteneceT n t1 || perteneceT n t2

-- 7 Dados un elemento e y un arbol binario devuelve la cantidad de elementos del arbol que son iguales a e.
aparicionesT :: Eq a => a -> Tree a -> Int
aparicionesT e EmptyT = 0
aparicionesT e (NodeT x t1 t2) = if e == x
                                 then 1 + aparicionesT e t1 + aparicionesT e t2
                                 else aparicionesT e t1 + aparicionesT e t2

-- 8 Dado un arbol de personas devuelve el promedio entre las edades de todas las personas.
--Definir las subtareas que sean necesarias para resolver esta funcion.
--Nota: Utilizar el tipo Persona ya definido.
--promedioEdadesT :: Tree Persona -> Int

-- 9 Dados dos arboles construye un arbol t en el que ambos arboles son hijos de t, y en la raız de t se guarda la suma de todos los elementos de los hijos de t. ¿Se utiliza recursion para definir esta funcion?
engancharYSumaEnRaiz :: Tree Int -> Tree Int -> Tree Int
engancharYSumaEnRaiz EmptyT EmptyT = EmptyT
engancharYSumaEnRaiz t1 t2 = NodeT (sumarT (NodeT 0 t1 t2)) t1 t2 -- NO HACE FALTA RECURSIVIDAD

{-
-- 10 Dado un arbol devuelve su cantidad de hojas.
--Nota: una hoja (leaf en ingles) es un nodo que no tiene hijos.
leaves :: Tree a -> Int
leaves EmptyT = 0
leaves NodeT x t1 t2 = if (t1 == EmptyT && t2 == EmptyT)
                       then 1 + leaves t1 + leaves t2
                       else leaves t1 + leaves t2

-- 11 Dado un arbol devuelve su altura.
--Nota: la altura (height en ingles) de un arbol es la cantidad maxima de nodos entre la raız y alguna de sus hojas. La altura de un arbol vacıo es cero y la de una hoja es 1.
heightT :: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT x t1 t2) = if (t1 == EmptyT && t2 == EmptyT)
                          then 

-- 12 Dado un arbol devuelve el numero de nodos que no son hojas. ¿Como podrıa resolverla sin utilizar recursion? Primero defınala con recursion y despues sin ella.
nodes :: Tree a -> Int

-- 13 Dado un arbol devuelve el arbol resultante de intercambiar el hijo izquierdo con el derecho, en cada nodo del arbol.
espejoT :: Tree a -> Tree a

-- 14 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo in-order.
--Nota: En el modo in-order primero se procesan los elementos del hijo izquierdo, luego la raiz y luego los elementos del hijo derecho.
listInOrder :: Tree a -> [a]

-- 15 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo pre-order.
--Nota: En el modo pre-order primero se procesa la raiz, luego los elementos del hijo izquierdo, a continuacion los elementos del hijo derecho.
listPreOrder :: Tree a -> [a]

-- 16 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo post-order.
--Nota: En el modo post-order primero se procesan los elementos del hijo izquierdo, a continuacion los elementos del hijo derecho y finalmente la raiz.
listPosOrder :: Tree a -> [a]

-- 17 Dado un arbol de listas devuelve la concatenacion de todas esas listas. El recorrido debe ser in-order.
concatenarListasT :: Tree [a] -> [a]

-- 18 Dados un numero n y un arbol devuelve una lista con los nodos de nivel n.
--Nota: El primer nivel de un arbol (su ra ́ız) es 0.
levelN :: Int -> Tree a -> [a]

-- 19 Dado un arbol devuelve una lista de listas en la que cada elemento representa un nivel de dicho arbol.
listPerLevel :: Tree a -> [[a]]

-- 20 Dado un arbol devuelve su ancho (width en ingl ́es), que es la cantidad de nodos del nivel con mayor cantidad de nodos.
widthT :: Tree a -> Int
-}
