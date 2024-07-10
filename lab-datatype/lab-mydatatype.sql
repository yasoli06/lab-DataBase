-- PARTE 2: Base de Datos Propia
-- Drop de la base de datos lab-MiDataBase si existe
DROP DATABASE IF EXISTS labMiDataBase;

-- Creación de la base de datos lab-MiDataBase
CREATE DATABASE labMiDataBase;

-- Usar la base de datos lab-MiDataBase
USE labMiDataBase;

CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    director VARCHAR(100) NOT NULL,
    anio YEAR NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion INT NOT NULL
);

INSERT INTO Peliculas (id_pelicula, titulo, director, anio, genero, duracion) VALUES
(1, 'Blade Runner', 'Ridley Scott', 1982, 'Ciencia Ficción', 117),
(2, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 'Ciencia Ficción', 136),
(3, 'Inception', 'Christopher Nolan', 2010, 'Ciencia Ficción', 148),
(4, 'Interstellar', 'Christopher Nolan', 2014, 'Ciencia Ficción', 169),
(5, 'The Terminator', 'James Cameron', 1984, 'Ciencia Ficción', 107),
(6, 'Star Wars: Episode IV - A New Hope', 'George Lucas', 1977, 'Ciencia Ficción', 121),
(7, 'Alien', 'Ridley Scott', 1979, 'Ciencia Ficción', 117),
(8, 'Back to the Future', 'Robert Zemeckis', 1985, 'Ciencia Ficción', 116),
(9, 'E.T. the Extra-Terrestrial', 'Steven Spielberg', 1982, 'Ciencia Ficción', 115),
(10, '2001: A Space Odyssey', 'Stanley Kubrick', 1968, 'Ciencia Ficción', 149);

CREATE TABLE Directores (
    id_director INT PRIMARY KEY,
    nombre_director VARCHAR(100) NOT NULL
);

CREATE TABLE Generos (
    id_genero INT PRIMARY KEY,
    nombre_genero VARCHAR(50) NOT NULL
);

CREATE TABLE misPeliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    anio YEAR NOT NULL,
    duracion INT NOT NULL,
    id_director INT,
    id_genero INT,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director),
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero)
);

-- INT porque es un valor numérico entero secuencial, ideal para claves primaria
-- VARCHAR(200) para permitir una longitud suficiente para la mayoría de los títulos de películas.
-- VARCHAR(100) para almacenar nombres de directores, que generalmente no superan esta longitud.
-- YEAR para almacenar el año de lanzamiento de la película de forma precisa y adecuada.
-- INT para almacenar la duración en minutos, que es un valor numérico entero.

INSERT INTO Directores (id_director, nombre_director) VALUES
(1, 'Ridley Scott'),
(2, 'Lana Wachowski, Lilly Wachowski'),
(3, 'Christopher Nolan'),
(4, 'James Cameron'),
(5, 'George Lucas'),
(6, 'Robert Zemeckis'),
(7, 'Steven Spielberg'),
(8, 'Stanley Kubrick');

INSERT INTO Generos (id_genero, nombre_genero) VALUES
(1, 'Ciencia Ficción');

INSERT into misPeliculas (id_pelicula, titulo, anio, duracion, id_director, id_genero) VALUES
(1, 'Blade Runner', 1982, 117, 1, 1),
(2, 'The Matrix', 1999, 136, 2, 1),
(3, 'Inception', 2010, 148, 3, 1),
(4, 'Interstellar', 2014, 169, 3, 1),
(5, 'The Terminator', 1984, 107, 4, 1),
(6, 'Star Wars: Episode IV - A New Hope', 1977, 121, 5, 1),
(7, 'Alien', 1979, 117, 1, 1),
(8, 'Back to the Future', 1985, 116, 6, 1),
(9, 'E.T. the Extra-Terrestrial', 1982, 115, 7, 1),
(10, '2001: A Space Odyssey', 1968, 149, 8, 1);


