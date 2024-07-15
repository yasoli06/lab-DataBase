DROP DATABASE IF EXISTS peliculas_complejo;

CREATE DATABASE peliculas_complejo;

USE peliculas_complejo;

CREATE TABLE Directores (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Actores (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    genero VARCHAR(255) NOT NULL,
    id_director INT,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);

CREATE TABLE PeliculasActores (
    id_pelicula INT,
    id_actor INT,
    rol VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor, rol),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

INSERT INTO Directores (nombre) VALUES
('Christopher Nolan'),
('James Cameron'),
('Francis Ford Coppola'),
('Quentin Tarantino'),
('Frank Darabont'),
('Lana Wachowski'),
('David Fincher'),
('Ridley Scott'),
('Robert Zemeckis'),
('Roger Allers'),
('Martin Scorsese'),
('Jonathan Demme'),
('Steven Spielberg'),
('Mel Gibson'),
('Alejandro González Iñárritu'),
('Alfonso Cuarón'),
('Darren Aronofsky'),
('Damien Chazelle'),
('Wes Anderson'),
('Steve McQueen'),
('Guillermo del Toro'),
('Taika Waititi'),
('Sofia Coppola'),
('Greta Gerwig');

INSERT INTO Actores (nombre) VALUES
('Leonardo DiCaprio'),
('Christian Bale'),
('Matthew McConaughey'),
('Kate Winslet'),
('Sam Worthington'),
('Marlon Brando'),
('Al Pacino'),
('John Travolta'),
('Samuel L. Jackson'),
('Tim Robbins'),
('Morgan Freeman'),
('Keanu Reeves'),
('Brad Pitt'),
('Edward Norton'),
('Russell Crowe'),
('Joaquin Phoenix'),
('Tom Hanks'),
('Robin Wright'),
('Matthew Broderick'),
('Jeremy Irons'),
('Ray Liotta'),
('Joe Pesci'),
('Mel Gibson'),
('Sophie Marceau'),
('Jodie Foster'),
('Anthony Hopkins'),
('Liam Neeson'),
('Ralph Fiennes'),
('Matt Damon'),
('Sandra Bullock'),
('George Clooney'),
('Tom Hardy'),
('Charlize Theron'),
('Natalie Portman'),
('Mila Kunis'),
('Ryan Gosling'),
('Emma Stone'),
('Tony Revolori'),
('Jesse Eisenberg'),
('Andrew Garfield'),
('Ben Affleck'),
('Rosamund Pike'),
('Daniel Craig'),
('Rooney Mara'),
('Chiwetel Ejiofor'),
('Michael Fassbender'),
('Mark Ruffalo'),
('Jennifer Connelly'),
('Jim Carrey'),
('Ed Harris'),
('Uma Thurman'),
('Lucy Liu'),
('Vivica A. Fox'),
('Michael Madsen'),
('Daryl Hannah'),
('David Carradine');

INSERT INTO Peliculas (titulo, anio, genero, id_director) VALUES
('Inception', 2010, 'Sci-Fi', 1),
('The Dark Knight', 2008, 'Action', 1),
('Interstellar', 2014, 'Sci-Fi', 1),
('Titanic', 1997, 'Romance', 2),
('Avatar', 2009, 'Sci-Fi', 2),
('The Godfather', 1972, 'Crime', 3),
('Pulp Fiction', 1994, 'Crime', 4),
('The Shawshank Redemption', 1994, 'Drama', 5),
('The Matrix', 1999, 'Sci-Fi', 6),
('Fight Club', 1999, 'Drama', 7),
('Gladiator', 2000, 'Action', 8),
('Forrest Gump', 1994, 'Drama', 9),
('The Lion King', 1994, 'Animation', 10),
('Goodfellas', 1990, 'Crime', 11),
('Se7en', 1995, 'Thriller', 7),
('Braveheart', 1995, 'Drama', 12),
('The Silence of the Lambs', 1991, 'Thriller', 13),
('Schindler\'s List', 1993, 'Drama', 14),
('Saving Private Ryan', 1998, 'War', 14),
('Jurassic Park', 1993, 'Sci-Fi', 14),
('The Green Mile', 1999, 'Drama', 5),
('The Terminator', 1984, 'Sci-Fi', 2),
('The Prestige', 2006, 'Drama', 1),
('Memento', 2000, 'Mystery', 1),
('The Departed', 2006, 'Crime', 11),
('The Wolf of Wall Street', 2013, 'Biography', 11),
('Inglourious Basterds', 2009, 'Adventure', 4),
('Django Unchained', 2012, 'Drama', 4),
('The Hateful Eight', 2015, 'Drama', 4),
('The Revenant', 2015, 'Adventure', 15),
('Birdman', 2014, 'Comedy', 15),
('Gravity', 2013, 'Sci-Fi', 16),
('Mad Max: Fury Road', 2015, 'Action', 17),
('Black Swan', 2010, 'Thriller', 18),
('Whiplash', 2014, 'Drama', 19),
('La La Land', 2016, 'Comedy', 19),
('The Grand Budapest Hotel', 2014, 'Comedy', 20),
('Moonrise Kingdom', 2012, 'Comedy', 20),
('The Social Network', 2010, 'Biography', 7),
('Gone Girl', 2014, 'Thriller', 7),
('The Girl with the Dragon Tattoo', 2011, 'Thriller', 7),
('12 Years a Slave', 2013, 'Biography', 20),
('Shutter Island', 2010, 'Thriller', 11),
('The Aviator', 2004, 'Biography', 11),
('Catch Me If You Can', 2002, 'Biography', 14),
('Munich', 2005, 'Drama', 14),
('A Beautiful Mind', 2001, 'Biography', 22),
('The Truman Show', 1998, 'Comedy', 23),
('Eternal Sunshine of the Spotless Mind', 2004, 'Romance', 24),
('Kill Bill: Vol. 1', 2003, 'Action', 4);


INSERT INTO PeliculasActores (id_pelicula, id_actor, rol) VALUES
(1, 1, 'Principal'),
(1, 2, 'Secundario'),
(2, 2, 'Principal'),
(2, 10, 'Secundario'),
(3, 3, 'Principal'),
(3, 11, 'Secundario'),
(4, 1, 'Principal'),
(4, 4, 'Secundario'),
(5, 5, 'Principal'),
(5, 6, 'Secundario'),
(6, 7, 'Principal'),
(6, 8, 'Secundario'),
(7, 9, 'Principal'),
(7, 10, 'Secundario'),
(8, 10, 'Principal'),
(8, 11, 'Secundario'),
(9, 12, 'Principal'),
(9, 13, 'Secundario'),
(10, 14, 'Principal'),
(10, 15, 'Secundario'),
(11, 16, 'Principal'),
(11, 17, 'Secundario'),
(12, 18, 'Principal'),
(12, 19, 'Secundario'),
(13, 20, 'Principal'),
(13, 21, 'Secundario'),
(14, 22, 'Principal'),
(14, 23, 'Secundario'),
(15, 24, 'Principal'),
(15, 25, 'Secundario'),
(16, 26, 'Principal'),
(16, 27, 'Secundario'),
(17, 28, 'Principal'),
(17, 29, 'Secundario'),
(18, 30, 'Principal'),
(18, 31, 'Secundario'),
(19, 32, 'Principal'),
(19, 33, 'Secundario'),
(20, 34, 'Principal'),
(20, 35, 'Secundario'),
(21, 36, 'Principal'),
(21, 37, 'Secundario'),
(22, 38, 'Principal'),
(22, 39, 'Secundario'),
(23, 1, 'Principal'),
(23, 2, 'Secundario'),
(24, 2, 'Principal'),
(24, 11, 'Secundario'),
(25, 10, 'Principal'),
(25, 14, 'Secundario'),
(26, 15, 'Principal'),
(26, 16, 'Secundario'),
(27, 1, 'Principal'),
(27, 10, 'Secundario'),
(28, 5, 'Principal'),
(28, 6, 'Secundario'),
(29, 4, 'Principal'),
(29, 7, 'Secundario'),
(30, 1, 'Principal'),
(30, 15, 'Secundario'),
(31, 12, 'Principal'),
(31, 17, 'Secundario'),
(32, 18, 'Principal'),
(32, 22, 'Secundario'),
(33, 14, 'Principal'),
(33, 16, 'Secundario'),
(34, 13, 'Principal'),
(34, 14, 'Secundario'),
(35, 11, 'Principal'),
(35, 12, 'Secundario'),
(36, 1, 'Principal'),
(36, 13, 'Secundario'),
(37, 3, 'Principal'),
(37, 15, 'Secundario'),
(38, 7, 'Principal'),
(38, 8, 'Secundario'),
(39, 10, 'Principal'),
(39, 11, 'Secundario'),
(40, 9, 'Principal'),
(40, 14, 'Secundario'),
(41, 5, 'Principal'),
(41, 12, 'Secundario'),
(42, 2, 'Principal'),
(42, 14, 'Secundario'),
(43, 13, 'Principal'),
(43, 16, 'Secundario'),
(44, 8, 'Principal'),
(44, 11, 'Secundario'),
(45, 14, 'Principal'),
(45, 17, 'Secundario'),
(46, 5, 'Principal'),
(46, 12, 'Secundario'),
(47, 11, 'Principal'),
(47, 14, 'Secundario'),
(48, 9, 'Principal'),
(48, 13, 'Secundario'),
(49, 12, 'Principal'),
(49, 16, 'Secundario'),
(50, 3, 'Principal'),
(50, 7, 'Secundario');


-- Consulta que devuelve todas las películas
SELECT * FROM Peliculas;
-- Consulta que devuelve las películas entre 1980 y 2000
SELECT * FROM Peliculas WHERE anio BETWEEN 1980 AND 2000;
-- Consulta que devuelve la cantidad de películas de cada género bajo el nombre de "num_peliculas"
SELECT genero, COUNT(*) AS num_peliculas FROM Peliculas GROUP BY genero;
-- Consulta que devuelve todas las películas con sus actores principales y secundarios
SELECT p.titulo, a.nombre AS actor, pa.rol
FROM Peliculas p
JOIN PeliculasActores pa ON p.id_pelicula = pa.id_pelicula
JOIN Actores a ON pa.id_actor = a.id_actor ;
-- Consulta que selecciona todas las películas que tengan un actor específico
SELECT p.titulo
FROM Peliculas p
JOIN PeliculasActores pa ON p.id_pelicula = pa.id_pelicula
JOIN Actores a ON pa.id_actor = a.id_actor 
WHERE a.nombre = 'Tom Hanks';

START TRANSACTION;

-- Definir variables
SET @id_director = (SELECT id_director FROM Directores WHERE nombre = 'Christopher Nolan');
SET @id_actor = (SELECT id_actor FROM Actores WHERE nombre = 'Leonardo DiCaprio');
SET @id_actor = (SELECT id_actor FROM Actores WHERE nombre = 'Joseph Gordon-Levitt');

-- Insertar una nueva película
INSERT INTO Peliculas (titulo, anio, genero, id_director) VALUES ('Dunkirk', 2017, 'War', @id_director);

-- Obtener el id de la película recién insertada
SET @id_pelicula = LAST_INSERT_ID();

-- Insertar los actores en PeliculasActores
INSERT INTO PeliculasActores (id_pelicula, id_actor, rol) VALUES (@id_pelicula, @id_actor, 'Principal');
INSERT INTO PeliculasActores (id_pelicula, id_actor, rol) VALUES (@id_pelicula, @id_actor, 'Secundario');

COMMIT;


