
-- Practica 4
-- 1.2
-- Rol Implementador

module Colas (Queue, emptyQ, queueQ, firstQ, isEmptyQ, deQueueQ)
where

data Queue a = Consq [a] deriving Show

-- funcion de acceso
dameLista :: Queue a -> [a]
dameLista (Consq [a]) = [a]

-- retorna una cola vacia
emptyQ :: Queue a
emptyQ = Consq []

-- agrega un elemento a la cola
queueQ :: Queue a -> a -> Queue a
queueQ q n = (Consq (n : dameLista q))

-- retorna el primer elemento de la cola
firstQ :: Queue a -> a 
firstQ q = last (dameLista q)

-- pregunta si la cola esta vacia
isEmptyQ :: Queue a -> Bool
isEmptyQ q = null (dameLista q)

-- quita el primero elemento de la cola y devuelve el resto
deQueueQ :: Queue a -> Queue a
deQueueQ q = Consq (init (dameLista q))
