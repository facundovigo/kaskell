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
data Persona = ConsPersona Nombre Edad 
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
