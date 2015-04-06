
-- Rol Implementador

data Queue a = Consq [a] deriving Show


-- retorna una cola vacia
emptyQ :: Queue a
emptyQ = Consq []

-- agrega un elemento a la cola
queueQ :: Queue a -> a -> Queue a
queueQ (Consq [a]) n = (Consq (n : [a]))

-- retorna el primer elemento de la cola
firstQ :: Queue a -> a 
firstQ (Consq [a]) = last [a]

-- pregunta si la cola esta vacia
isEmptyQ :: Queue a -> Bool
isEmptyQ (Consq [a]) = null [a]

-- quita el primero elemento de la cola y devuelve el resto
deQueueQ :: Queue a -> Queue a
deQueueQ (Consq [a]) = Consq (init [a])
