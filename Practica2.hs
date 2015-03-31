-- Tipos de datos definidos por el usuario

--1. Definir el tipo de dato Dir, con las alternativas Norte, Sur, Este y Oeste. Luego implementar las siguientes funciones:

data Dir = Norte | Sur | Este | Oeste

opuesto :: Dir -> Dir
-- Dada una direccion devuelve su opuesta
opuesto Norte = Sur
opuesto Este = Oeste
opuesto Sur = Norte
opuesto Oeste = Este

siguiente :: Dir -> Dir
-- Dada una direccion devuelve su siguiente, en sentido horario.
siguiente Norte = Este
siguiente Este = Sur
siguiente Sur = Oeste
siguiente Oeste = Norte

--2. Definir el tipo de dato Persona, como un nombre la edad de la persona. Realizar las siguientes funciones:

--ConsPersona :: nombre -> edad -> Persona
data Persona = ConsPersona Nombre Edad deriving Show
type Nombre = String
type Edad = Int

nombre :: Persona -> String
--Devuelve el nombre de una persona
nombre (ConsPersona nom edad) = nom

edad :: Persona -> Int
--Devuelve la edad de una persona
edad (ConsPersona nom edad) = edad

crecer :: Persona -> Persona
--Dada una persona la devuelve con su edad aumentada en 1.
crecer (ConsPersona nom edad) = ConsPersona nom (edad+1)

cambioDeNombre :: String -> Persona -> Persona
--Dados un nombre y una persona, reemplaza el nombre de la persona por este otro.
cambioDeNombre nuevoNom (ConsPersona nom edad) = ConsPersona nuevoNom edad

esMenorQueLaOtra :: Persona -> Persona -> Bool
--Dadas dos personas indica si la primera es mas joven que la segunda.
esMenorQueLaOtra (ConsPersona nom1 edad1) (ConsPersona nom2 edad2) = edad1<edad2

mayoresA :: Int -> [Persona] -> [Persona]
--Dados una edad y una lista de personas devuelve todas las personas que son mayores a esa edad.
mayoresA n [] = []
mayoresA n (x:xs) = if n < (edad x)
                    then x : mayoresA n xs
                    else mayoresA n xs

promedioEdad :: [Persona] -> Int
--Dada una lista de personas devuelve el promedio de edad entre esas personas. La lista al menos posee una persona.
-- EL PROMEDIO NO SE PUEDE RESOLVER POR RECURSION, debo usar el metodo iterativo
promedioEdad xs = (sumaEdades xs) `div` (length xs)

sumaEdades :: [Persona] -> Int
sumaEdades [] = 0
sumaEdades (x:xs) = edad x + sumaEdades xs

elMasViejo :: [Persona] -> Persona
--Dada una lista de personas devuelve la persona mas vieja de la lista. La lista al menos posee una persona.
-- PRECONDICIÓN: la lista posee una persona
elMasViejo [x] = x
elMasViejo (x:xs) = if edad x > edad (elMasViejo xs)
                    then x
                    else elMasViejo xs

--3. Definir los tipos de datos Pokemon, como un TipoDePokemon (agua, fuego o planta) y un porcentaje de energıa; 
--y Entrenador, como un nombre y una lista de Pokemon. Luego definir las siguientes funciones:

data Pokemon = ConsPokemon TipoDePokemon PorcentajeEnergia deriving Show
data TipoDePokemon = Agua | Fuego | Planta deriving Show
type PorcentajeEnergia = Int

data Entrenador = ConsEntrenador Nombre [Pokemon] 

esIgual :: TipoDePokemon -> TipoDePokemon -> Bool
esIgual Agua Agua = True
esIgual Fuego Fuego = True
esIgual Planta Planta = True
esIgual Agua Fuego = False
esIgual Fuego Agua = False
esIgual Agua Planta = False
esIgual Planta Agua = False
esIgual Fuego Planta = False
esIgual Planta Fuego= False

dameTipo :: Pokemon -> TipoDePokemon
dameTipo (ConsPokemon t pe) = t

elementoGanador :: TipoDePokemon -> TipoDePokemon
--Dado un TipoDePokemon devuelve el elemento que le gana a ese. 
--Agua le gana a fuego, 
--fuego a planta y 
--planta a agua.
elementoGanador Agua = Fuego
elementoGanador Fuego = Planta
elementoGanador Planta = Agua


--Dados dos pokemon indica si el primero le puede ganar al segundo. Se considera que gana si su elemento es opuesto al del otro pokemon. Si poseen el mismo elemento se considera que no gana.
leGanaA :: Pokemon -> Pokemon -> Bool
leGanaA (ConsPokemon t1 pe1) (ConsPokemon t2 pe2) = esIgual (elementoGanador t1) t2

--Agrega un pokemon a la lista de pokemon del entrenador.
capturarPokemon :: Pokemon -> Entrenador -> Entrenador
capturarPokemon p (ConsEntrenador nom xs) = ConsEntrenador nom (p:xs)

--Devuelve la cantidad de pokemons que posee el entrenador.
cantidadDePokemons :: Entrenador -> Int
cantidadDePokemons (ConsEntrenador nom xs) = length xs

--Devuelve la cantidad de pokemons de determinado tipo que posee el entrenador.
cantidadDePokemonsDeTipo :: TipoDePokemon -> Entrenador -> Int
cantidadDePokemonsDeTipo t (ConsEntrenador nom []) = 0
cantidadDePokemonsDeTipo t (ConsEntrenador nom (x:xs)) = if esIgual t (dameTipo x)
                                                         then 1 + (cantidadDePokemonsDeTipo t (ConsEntrenador nom xs))
                                                         else cantidadDePokemonsDeTipo t (ConsEntrenador nom xs)

--Dados un entrenador y un pokemon devuelve True si el entrenador posee un pokemon que le gane ese pokemon.
lePuedeGanar :: Entrenador -> Pokemon -> Bool
lePuedeGanar (ConsEntrenador nom []) p = False
lePuedeGanar (ConsEntrenador nom (x:xs)) p = leGanaA x p || lePuedeGanar (ConsEntrenador nom xs) p

-- Dados un tipo de pokemon y dos entrenadores, devuelve True si ambos entrenadores tiene al menos un pokemon de ese tipo y que tenga energia para pelear.
puedenPelear :: TipoDePokemon -> Entrenador -> Entrenador -> Bool
puedenPelear t e1 e2 = pelea t e1 && pelea t e2

pelea :: TipoDePokemon -> Entrenador -> Bool
pelea t (ConsEntrenador nom []) = False
pelea t (ConsEntrenador nom (x:xs)) = tieneEnergia x && esIgual t (dameTipo x) || (pelea t (ConsEntrenador nom xs))

tieneEnergia :: Pokemon -> Bool
tieneEnergia (ConsPokemon t pe) = pe>0

--Dado un entrenador devuelve True si ese entrenador posee al menos un pokemon de cada tipo posible.
esExperto :: Entrenador -> Bool
esExperto (ConsEntrenador nom []) = False
esExperto entrenador = cantidadDePokemonsDeTipo Agua entrenador > 0 &&
                       cantidadDePokemonsDeTipo Fuego entrenador > 0 &&
                       cantidadDePokemonsDeTipo Planta entrenador > 0
-- PRUEBAS
-- esExperto (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Fuego 2),(ConsPokemon Planta 3)]) ---> TRUE
-- esExperto (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Agua 2),(ConsPokemon Planta 3)]) ---> FALSE

--Dada una lista de entrenadores devuelve una lista con todos los pokemon de cada entrenador.
-- PRECONDICIÓN: supongo que no hay entrenadores sin pokemons asignados
fiestaPokemon :: [Entrenador] -> [Pokemon]
fiestaPokemon [] = []
fiestaPokemon ((ConsEntrenador nom xs):ys) = xs ++ fiestaPokemon ys
-- PRUEBAS
--cantidadDePokemonsDeTipo Agua (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Agua 2),(ConsPokemon Planta 3)])
--cantidadDePokemonsDeTipo Agua (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Agua 2),(ConsPokemon Agua 3)])
--cantidadDePokemonsDeTipo Planta (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Agua 2),(ConsPokemon Agua 3)])
--cantidadDePokemonsDeTipo Planta (ConsEntrenador "zaraza" [(ConsPokemon Agua 1),(ConsPokemon Agua 2),(ConsPokemon Planta 3)])
