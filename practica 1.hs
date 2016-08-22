															--Conceptos Basicos--
sucesor :: Int -> Int
sucesor a = a + 1

sumador :: Int -> Int -> Int
sumador a b = a + b 

maximo :: Int -> Int -> Int 
maximo a b = if a > b
              then a
              else b


										--Defina las siguientes funciones utilizando pattern matching:

negar :: Bool -> Bool
negar True = False
negar False = True



andLogico :: Bool -> Bool -> Bool
andLogico False _ = False
andLogico True True = True			 

--Dados dos booleanos si alguno de ellos es T rue devuelve T rue, sino devuelve F alse. Definida en Haskell como ||


orLogico :: Bool -> Bool -> Bool
orLogico False False = False	
orLogico _ True  = True
orLogico True _ = True  

{-
Dado un par de numeros devuelve la primera componente.
Definida en Haskell como f st.
-}
primera :: (Int,Int) -> Int
primera (_,b) = 0
primera (a,b) = a 


{-
Dado un par de numeros devuelve la segunda componente.
Definida en Haskell como snd.
-}
segunda :: (Int,Int) -> Int
segunda (a,_) = 0
segunda (a,b) = b

--Dado un par de n ́meros devuelve su suma.
sumaPar :: (Int,Int) -> Int
sumaPar (a,b) = a+b

--Dado un par de n ́meros devuelve el mayor de estos.
maxDelPar :: (Int,Int) -> Int
maxDelPar (a,b) = if a > b 
					then a
					else b -- pregutnar  esta funcion

								--3. Defina las siguientes funciones polimorficas:
--Dado un elemento de alg ́n tipo devuelve ese mismo elemento.
loMismo :: a -> a
loMismo a = a

--Dado un elemento de algun tipo devuelve el numero 7
siempreSiete :: a -> Int
siempreSiete a = 7

--Dado un elemento de alg ́n tipo devuelve un par con ese elemento en ambas componentes.
duplicar :: a -> (a,a)
duplicar a = (a,a)

--Dado un elemento de alg ́n tipo devuelve una lista con este unico elemento.
singleton :: a -> [a]
singleton a = a:[]

						--Defina las siguientes funciones polim ́rficas utilizando pattern matching sobre listas

--Dada una lista de elementos, si es vacio devuelve True, sino devuelve False
isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty (x:xs) = False

--Dada una lista devuelve su primer elemento.
head2 :: [a] -> a
head2 (x:xs) = x

--Dada una lista devuelve esa lista menos el primer elemento
tail2 :: [a] -> [a]
tail2 (x:xs) = xs



												
												--Recursion sobre listas



--Dada una lista de enteros devuelve la suma de todos sus elementos.
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) =   x + sumatoria xs

--Dada una lista de elementos de alg´un tipo devuelve el largo de esa lista, es decir, la cantidad de elementos que posee.
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- no sse puede hacer con recursion 
promedio :: [Int] -> Float
promedio [] = 0
promedio x = div (sumatoria x)  (longitud x)-- la division no va a funcionar con INT, hay que usar float

--Dada una lista de pares, devuelve una nueva lista en la que cada elemento es el mayor de las componentes de cada par.
mapMaxDelPar :: [(Int,Int)] -> [Int] 
mapMaxDelPar = []
mapMaxDelPar (x:xs)	=  maxDelPar x : 


mapSucesor :: [Int] -> [Int] -- Dada una lista de enteros, devuelve la lista de los sucesores de cada entero.
mapSucesor []  = []
mapSucesor (x:xs) =	x + 1 :	mapSucesor xs 	


--Dada una lista de pares de enteros, devuelve una nueva lista en la que cada elemento es la suma de los elementos de cada par.
mapSumaPar :: [(Int,Int)] -> [Int] 
mapSumaPar [] =  []
mapSumaPar (x:xs) = sumarPar x : mapSumaPar xs

sumarPar :: (Int,Int) -> Int
sumarPar (a,b) =  a + b 	

--Dada una lista de booleanos devuelve T rue si todos sus elementos son T rue
todoVerdad :: [Bool] -> Bool
todoVerdad [] = True
todoVerdad (x:xs) = x && todoVerdad xs

--Dada una lista de booleanos devuelve T rue si alguno de sus elementos es T rue.
algunaVerdad :: [Bool] -> Bool
algunaVerdad [] = False
algunaVerdad (True:xs) = True	
algunaVerdad (x:xs) = algunaVerdad xs 

--Dados un elemento e y una lista xs devuelve True si existe un elemento en xs que sea igual a e.
pertenece :: Eq a => a -> [a] -> Bool
pertenece  _ [] = False
pertenece  a (x:xs) = if a == x
						then True
						else pertenece a xs

--Dados un elemento e y una lista xs cuenta la cantidad de apariciones de e en xs.
apariciones :: Eq a => a -> [a] -> Int
apariciones  _ [] = 0
apariciones a (x:xs) = if a == x
						then 1 + apariciones a xs
						else apariciones a xs

--Dados un numero n y una lista xs, devuelve todos los elementos de xs que son menores a n
filtrarMenoresA :: Int -> [Int] -> [Int]
filtrarMenoresA _ [] = []
filtrarMenoresA a (x:xs) =  if a > x 
							then x : filtrarMenoresA a xs
							else filtrarMenoresA a xs

--Dados un elemento y una lista filtra (elimina) todas las ocurrencias de ese elemento en la lista.
filtrarElemento :: Eq a => a -> [a] -> [a]
filtrarElemento _ [] = []
filtrarElemento a (x:xs) = if a == x
							then filtrarElemento a xs
							else x : filtrarElemento a xs


--Dada una lista de listas, devuelve la lista de sus longitudes. Aplique esta funcion a la lista de strings ["Estructuras", "de", "datos"] y observe el resultado.
mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = longitud x + mapLongitudes xs 

--Dados un numero n y una lista de listas, devuelve la lista de aquellas listas que tienen mas de n elementos.
longitudMayorA :: Int -> [[a]] -> [[a]]
longitudMayorA  _ [] = []
longitudMayorA a (x:xs) = if a > longitud x
							then x : longitudMayorA a xs
							else longitudMayorA a xs

intercalar :: a -> [a] -> [a]
intercalar _ [] = []
intercalar a (x:xs) x:(a:intercalar a xs)

snoc :: [a] -> a -> [a]
snoc  [] a = a:[]
snoc (x:xs) a = x:(snoc xs a) 



