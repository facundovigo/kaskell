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
intercalar :: a -> [a] -> [a]
intercalar e [] = []
intercalar e (x:xs) = (x : []) ++ [e] ++ intercalar e xs

--2.1.16
-- Dados una lista y un elemento, devuelve una lista con ese elemento agregado al final de la lista.
snoc :: [a] -> a -> [a]
snoc [] n = [n]
snoc ys n = ys ++ [n]

--2.1.17 NO FUNCIONA, REVISAR
-- Dadas dos listas devuelve la lista con todos los elementos de la primera lista y todos los
-- elementos de la segunda a continuacion. Definida en Haskell como ++
append :: [a] -> [a] -> [a]
append [] [] = []
append (y:ys) (x:xs) = append (snoc (x:ys) x) xs

--2.1.18
--Dada una lista de listas, devuelve una unica lista con todos sus elementos.
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

--2.1.19
-- Dada una lista devuelve la lista con los mismos elementos de atras para adelante. Definida
-- en Haskell como reverse.
--reversa :: [a] -> [a]

--2.1.20
--Dadas dos listas de enteros, devuelve una lista donde el elemento en la posicion n es el
--maximo entre el elemento n de la primera lista y de la segunda lista, teniendo en cuenta que
--las listas no necesariamente tienen la misma longitud.
zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos [] [] = []
zipMaximos xs [] = xs
zipMaximos [] xs = xs
zipMaximos (x:xs) (y:ys) = (maximo x y) : (zipMaximos xs ys)

--2.1.21
--Dadas dos listas de enteros de igual longitud, devuelve una lista de pares (min; max), donde
--min y max son el minimo y el maximo entre los elementos de ambas listas en la misma posicion.
zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort [] [] = []
zipSort (x:xs) (y:ys) = ( min x y , maximo x y) : (zipSort xs ys)
