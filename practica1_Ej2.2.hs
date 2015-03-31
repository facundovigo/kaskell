--2.2. Recursion sobre numeros

--Dado un numero n se devuelve la multiplicacion de este numero y todos sus anteriores hasta
--llegar a 0. Si n es 0 devuelve 1. La funcion es parcial si n es negativo.
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--Dado un numero n devuelve una lista cuyos elementos sean los numeros comprendidos entre
--n y 1 (incluidos). Si el numero es inferior a 1, devuelve la lista vacia.
cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva n = n : cuentaRegresiva (n-1)

--Dado un numero n devuelve una lista cuyos elementos sean los numeros entre 1 y n (incluidos).
contarHasta :: Int -> [Int]
contarHasta 1 = [1] -- no se si esto esta medio al pedo
contarHasta n = reverse(cuentaRegresiva n)

--Dado un numero n y un elemento e devuelve una lista en la que el elemento e repite n veces.
replicarN :: Int -> a -> [a]
replicarN 0 e = []
replicarN n e = e : replicarN (n-1) e

--Dados dos numeros n y m devuelve una lista cuyos elementos sean los numeros entre n y m (incluidos).
-- PRECONDICIÓN: n debe ser <= m, nunca >
desdeHasta :: Int -> Int -> [Int]
desdeHasta n m = if n < m
                 then n : (desdeHasta (n+1) m)
                 else n : []

--Dados un numero n y una lista xs, devuelve una lista con los primeros n elementos de xs.
--Si xs posee menos de n elementos, se devuelve la lista completa.
takeN :: Int -> [a] -> [a]
takeN n ys = if n > length ys
             then ys
             else tomar n ys

tomar :: Int -> [a] -> [a]
tomar n [] = []
tomar n (x:xs) = if n > 0
                 then x : tomar (n-1) xs
                 else []

--Dados un numero n y una lista xs, devuelve una lista sin los primeros n elementos de lista
--recibida. Si la lista posee menos de n elementos, se devuelve una lista vacia.
dropN :: Int -> [a] -> [a]
dropN n ys = if n > length ys
             then []
             else quitar n ys

quitar :: Int -> [a] -> [a]
quitar n (x:xs) = if n > 0
                 then quitar (n-1) xs
                 else x:xs


--Dados un numero n y una lista xs, devuelve un par donde la primera componente es la lista que resulta de aplicar takeN a xs, y la segunda componente el resultado de aplicar dropN a xs. ¿Conviene utilizar recursion?
splitN :: Int -> [a] -> ([a], [a])
splitN n [] = ([],[])
splitN n xs = (takeN n xs,dropN n xs)
