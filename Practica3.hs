
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

-- 10 Dado un arbol devuelve su cantidad de hojas.
--Nota: una hoja (leaf en ingles) es un nodo que no tiene hijos.
leaves :: Tree a -> Int
leaves EmptyT = 0
leaves (NodeT x t1 t2) = if esPadreConHijos (NodeT x t1 t2)
                         then leaves t1 + leaves t2
                         else 1 -- entonces es hoja

esPadreConHijos :: Tree a -> Bool
esPadreConHijos (NodeT x EmptyT EmptyT) = False
esPadreConHijos (NodeT x t1 t2) = True

-- 11 Dado un arbol devuelve su altura.
--Nota: la altura (height en ingles) de un arbol es la cantidad maxima de nodos entre la raız y alguna de sus hojas. La altura de un arbol vacıo es cero y la de una hoja es 1.
heightT :: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT x t1 t2) = 1 + maxHeightT (heightT t1) (heightT t2)

maxHeightT :: Int -> Int -> Int
maxHeightT n m = if n>m
                 then n
                 else m

-- 12 Dado un arbol devuelve el numero de nodos que no son hojas. ¿Como podrıa resolverla sin utilizar recursion? Primero defınala con recursion y despues sin ella.
nodes :: Tree a -> Int
nodes EmptyT = 0
nodes (NodeT x t1 t2) =  if esPadreConHijos (NodeT x t1 t2)
                         then 1 + nodes t1 + nodes t2
                         else 0 

-- 13 Dado un arbol devuelve el arbol resultante de intercambiar el hijo izquierdo con el derecho, en cada nodo del arbol.
espejoT :: Tree a -> Tree a
espejoT EmptyT = EmptyT
espejoT (NodeT x t1 t2) = (NodeT x (espejoT t2) (espejoT t1))

-- 14 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo in-order.
--Nota: En el modo in-order primero se procesan los elementos del hijo izquierdo, luego la raiz y luego los elementos del hijo derecho.
listInOrder :: Tree a -> [a]
listInOrder EmptyT = []
listInOrder (NodeT x t1 t2) = listInOrder t1 ++ [x] ++ listInOrder t2

-- 15 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo pre-order.
--Nota: En el modo pre-order primero se procesa la raiz, luego los elementos del hijo izquierdo, a continuacion los elementos del hijo derecho.
listPreOrder :: Tree a -> [a]
listPreOrder EmptyT = []
listPreOrder (NodeT x t1 t2) = (x : listPreOrder t1) ++ listPreOrder t2

-- 16 Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo post-order.
--Nota: En el modo post-order primero se procesan los elementos del hijo izquierdo, a continuacion los elementos del hijo derecho y finalmente la raiz.
listPosOrder :: Tree a -> [a]
listPosOrder EmptyT = []
listPosOrder (NodeT x t1 t2) = listPosOrder t1 ++ listPosOrder t2 ++ [x]

-- 17 Dado un arbol de listas devuelve la concatenacion de todas esas listas. El recorrido debe ser in-order.
concatenarListasT :: Tree [a] -> [a]
concatenarListasT t = listInOrder t


-- 18 Dados un numero n y un arbol devuelve una lista con los nodos de nivel n.
--Nota: El primer nivel de un arbol (su raız) es 0.
levelN :: Int -> Tree a -> [a]
levelN n EmptyT = []
levelN 0 (NodeT x t1 t2) = [x]
levelN n (NodeT x t1 t2) = (levelN (n-1) t1) ++ (levelN (n-1) t2)

{-
-- 19 Dado un arbol devuelve una lista de listas en la que cada elemento representa un nivel de dicho arbol.
listPerLevel :: Tree a -> [[a]]

-- 20 Dado un arbol devuelve su ancho (width en ingl ́es), que es la cantidad de nodos del nivel con mayor cantidad de nodos.
widthT :: Tree a -> Int
-}


-------------------------------Expresiones aritmeticas-----------------------------------
--Ejercicio 1
{-
Sea el tipo Exp, modelando expresiones aritmeticas:
BinOp por OpBinaria 
UnOp por OpUnaria
BinExp por ConsExpBinaria 
UnExp por ConsExpUnaria
Const por Constante

data Exp = Constante Int | ConsExpUnaria OpUnaria Exp | ConsExpBinaria OpBinaria Exp Exp

data OpUnaria = Neg

data OpBinaria = Suma | Resta | Mult | Div

--Implementar las siguientes funciones:
--Dada una expresion evalue esta expresion y retorne su valor. ¿Que casos hacen que eval sea una funcion parcial?
eval :: Exp -> Int
eval (Constante n) = n
eval (ConsExpUnaria opU e) = - (eval e)
eval (ConsExpBinaria opB e1 e2) = operacionBinaria(opB (eval e1) (eval e2))

operacionBinaria :: Int -> Int -> Int
operacionBinaria (Suma e1 e2) = e1 + e2
operacionBinaria (Resta e1 e2) = e1 - e2
operacionBinaria (Mult e1 e2) = e1 * e2
operacionBinaria (Div e1 e2) = e1 `div` e2
-}
{-
Dada una expresion la simplifica segun los siguientes criterios:
a) 0 + x = x + 0 = x
b) x − 0 = x
c) 0 − x = −x
d ) x × 1 = 1 × x = x
e) x × 0 = 0 × x = 0
f ) x ÷ 1 = x
g) 0 ÷ x = 0, x = 0

simplificar :: Exp -> Exp
-}
{-
Ejercicio 2
Agregamos ahora dos nuevos operadores unarios a nuestro tipo de expresiones:
data OpUnaria = Neg | Inc | Dec
Modificar eval y simplificar incluyendo el manejo de estas nuevas operaciones unarias (Inc y Dec significan incrementar y decrementar respectivamente). Para simplificar, considerar estos criterios de simplificacion adicionales:
1. Reemplazar x + 1 = 1 + x por Inc x
2. Reemplazar x − 1 por Dec x
3. Reemplazar 1 − x por -(Dec x)
-}
