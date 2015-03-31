--import Ejercicio2

-- copiado porque no puedo hacer funcionar el IMPORT
maxDelPar :: (Int, Int) -> Int
maxDelPar (a,b) = maximo a b 

-- copiado porque no puedo hacer funcionar el IMPORT
maximo :: Int -> Int -> Int 
maximo a b = if a > b
              then a
              else b

--2.1.5
mapSumaPar ::[(Int,Int)] -> [Int]
mapSumaPar [] = []
mapSumaPar ((y1,y2):ys) = (y1 + y2) : mapSumaPar ys
--mapSumaPar (y:ys) = sumarPar y : mapSumaPar ys

--2.1.1
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (y:ys) = y + sumatoria ys

--2.1.2
longitud :: [a] -> Int
longitud [] = 0
longitud (y:ys) = 1 + longitud ys

--2.1.3
{- HAY QUE VER EL MAMBO RARO QUE TIENE EL FLOAT
promedio :: [Int] -> Float
promedio [] = 0
-- la division no va a funcionar con INT, hay que usar float
promedio (x:xs) = sumatoria (x:xs) / longitud (x:xs)
-}

--2.1.4
mapSucesor :: [Int] -> [Int]
mapSucesor [] = []
mapSucesor (x:xs) = x+1 : mapSucesor xs

--2.1.6
mapMaxDelPar::[(Int,Int)] -> [Int]
mapMaxDelPar [] = []
mapMaxDelPar (x:xs) = maxDelPar x : mapMaxDelPar xs

--2.1.7
todoVerdad :: [Bool] -> Bool
todoVerdad [] = False
todoVerdad (x:xs) = (x == True) && todoVerdad xs

--2.1.8
algunaVerdad :: [Bool] -> Bool
algunaVerdad [] = False
algunaVerdad (x:xs) = (x == True) || algunaVerdad xs

--2.1.9
pertenece :: Eq a => a -> [a] -> Bool
pertenece x [] = False
pertenece x (y:ys) = x==y || pertenece x ys

--2.1.10
apariciones :: Eq a => a -> [a] -> Int
apariciones x [] = 0
apariciones x (y:ys) = if x==y 
                       then 1 + apariciones x ys 
                       else apariciones x ys

--2.1.11
filtrarMenoresA :: Int -> [Int] -> [Int]
filtrarMenoresA n [] = []
filtrarMenoresA n (x:xs) = if n < x    
                           then x : filtrarMenoresA n xs
                           else filtrarMenoresA n xs

--2.1.12
filtrarElemento :: Eq a => a -> [a] -> [a]
filtrarElemento a [] = []
filtrarElemento a (x:xs) = if a == x
                           then filtrarElemento a xs
                           else x : filtrarElemento a xs

--2.1.13
-- Dada una lista de listas, devuelve la lista de sus longitudes. 
-- Aplique esta funcion a la lista de strings ["Estructuras", "de", "datos"] y observe el resultado. -----> [11,2,5]
mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = longitud x : mapLongitudes xs

--2.1.14
--Dados un numero n y una lista de listas, devuelve la lista de aquellas listas que tienen mas de n elementos.
longitudMayorA :: Int -> [[a]] -> [[a]]
longitudMayorA n [] = []
longitudMayorA n (x:xs) = if longitud x > n
                          then x : longitudMayorA n xs
                          else longitudMayorA n xs

--2.1.15
--Dado un elemento e y una lista xs, ubica a e entre medio de todos los elementos de xs
intercalarm :: a -> [a] -> [a]
intercalarm e [] = []
intercalarm e (x:xs) = (x : []) ++ [e] ++ intercalar e xs -- mepaa q aca estas devolviendo una lista de listas

--2.1.15
intercalar :: a -> [a] -> [a]
intercalar _ [] = []
intercalar  a (x:xs) = x:(a:intercalar a xs)
 

--2.1.16
-- Dados una lista y un elemento, devuelve una lista con ese elemento agregado al final de la lista.
snocM :: [a] -> a -> [a]
snocM [] n = [n]
snocM ys n = ys ++ [n]

--2.1.16
-- lo hice asi pero no me anda en caso base, lo mande a la lista y fidel me dijo quye lo piense con recurcion
snoc :: [a] -> a -> [a]
snoc [] x = []
snoc y x  =  reverse (y:reverse x)

--2.1.17
-- Dadas dos listas devuelve la lista con todos los elementos de la primera lista y todos los
-- elementos de la segunda a continuacion. Definida en Haskell como ++
appendM :: [a] -> [a] -> [a]
appendM [] [] = []
appendM ys (x:xs) = appendM (snocM ys x) xs

--2.1.17 a este lo pense asi

append :: [a] -> [a] -> [a] --saco la linea DE  MI caso base append [] [] por que ta conteplada en la primer linea de codigo
append  [] x = x
append  p _ = p 
append z (x:xs) = append (snoc z x) xs

--2.1.18
--Dada una lista de listas, devuelve una unica lista con todos sus elementos.
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs
 --2.1.18
 --aplanar :: [[a]] -> [a] 
 --aplanar     [] = []
 --aplanar (x:p:xs) = append x p ++ aplanar xs   
 
--2.1.19
-- Dada una lista devuelve la lista con los mismos elementos de atras para adelante. Definida
-- en Haskell como reverse.
--reversa :: [a] -> [a]
--2.1.19
reversa :: [a] -> [a]
reversa [] = []
reversa s = last s : reversa (init s)


--2.1.20
--Dadas dos listas de enteros, devuelve una lista donde el elemento en la posicion n es el
--maximo entre el elemento n de la primera lista y de la segunda lista, teniendo en cuenta que
--las listas no necesariamente tienen la misma longitud.
zipMaximosM :: [Int] -> [Int] -> [Int]
zipMaximosM [] [] = []
zipMaximosM xs [] = xs
zipMaximosM [] xs = xs
zipMaximosM (x:xs) (y:ys) = (maximo x y) : (zipMaximos xs ys)

--2.1.20 me gusta mas tu solucion
zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos [] [] = []
zipMaximos (x:xs) (y:ys) = if x<y
                           then y:zipMaximos xs ys
                           else x:zipMaximos xs ys

--2.1.21
--Dadas dos listas de enteros de igual longitud, devuelve una lista de pares (min; max), donde
--min y max son el minimo y el maximo entre los elementos de ambas listas en la misma posicion.
zipSortm :: [Int] -> [Int] -> [(Int, Int)]
zipSortm [] [] = []
zipSortm (x:xs) (y:ys) = ( min x y , maximo x y) : (zipSort xs ys)

--2.1.21
--Precondicion: zipSort solo funciona con listas de igual longitudes 
zipSort :: [Int] -> [Int] -> [(Int,Int)]
zipSort [] [] = []
zipSort (x:xs) (y:ys) = if x<y
		then (x,y):zipSort xs ys
		else (y,x):zipSort xs ys  

