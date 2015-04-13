
-- Practica 4
-- 1.1
-- Rol Usuario desarrollador

module ColasUsuario
where
import Colas

-- Cuenta la cantidad de elementos de la cola.
largoQ :: Queue a -> Int
largoQ emptyQ = 0
largoQ q      = 1 + largoQ (deQueueQ q)

-- Convierte una lista en una cola. Los elementos se encolan en el orden en que aparecen en la lista.
--listToQueue :: [a] -> Queue a
--listToQueue [] = 
--listToQueue xs = .... listToQueue xs

-- Convierte una cola en una lista.
queueToList :: Queue a -> [a]
queueToList emptyQ = []
queueToList q = (firstQ q : queueToList(deQueueQ q) )

-- Inserta todos los elementos de la segunda cola en la primera.
unirQ :: Queue a -> Queue a -> Queue a
unirQ emptyQ = emptyQ
unirQ q = unirQ( Queue(firstQ q) )
