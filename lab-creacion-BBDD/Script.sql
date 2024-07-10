-- Drop de la base de datos lab1 si existe
DROP DATABASE IF EXISTS lab1;

-- Creación de la base de datos lab1
CREATE DATABASE lab1;

-- Usar la base de datos lab1
USE lab1;

CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(255),
    director VARCHAR(255),
    ano_estreno INT,
    pais_origen VARCHAR(255)
);

CREATE TABLE GenerosPelicula (
    id_genero INT PRIMARY KEY,
    nombre_genero VARCHAR(255)
);

CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre_actor VARCHAR(255)
);

CREATE TABLE Peliculas_Actores (
    id_pelicula INT,
    id_actor INT,
    rol VARCHAR(255),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

-- Solución 2: Base de Datos de Coches
CREATE TABLE Coches (
    id_coche INT PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    ano INT
);

CREATE TABLE PropietariosCoche (
    id_propietario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(255)
);

CREATE TABLE Talleres (
    id_taller INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Coches_Propietarios (
    id_coche INT,
    id_propietario INT,
    FOREIGN KEY (id_coche) REFERENCES Coches(id_coche),
    FOREIGN KEY (id_propietario) REFERENCES PropietariosCoche(id_propietario)
);

CREATE TABLE Coches_Talleres (
    id_coche INT,
    id_taller INT,
    FOREIGN KEY (id_coche) REFERENCES Coches(id_coche),
    FOREIGN KEY (id_taller) REFERENCES Talleres(id_taller)
);

-- Solución 3: Base de Datos de Equipos de Fútbol
CREATE TABLE Equipos (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    estadio VARCHAR(255),
    ciudad VARCHAR(255)
);

CREATE TABLE Entrenadores (
    id_entrenador INT PRIMARY KEY,
    nombre_entrenador VARCHAR(255)
);

CREATE TABLE Jugadores (
    id_jugador INT PRIMARY KEY,
    nombre_jugador VARCHAR(255)
);

CREATE TABLE Equipos_Entrenadores (
    id_equipo INT,
    id_entrenador INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo),
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

CREATE TABLE Equipos_Jugadores (
    id_equipo INT,
    id_jugador INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);

-- Solución 4: Base de Datos de Canciones


CREATE TABLE Artistas (
    id_artista INT PRIMARY KEY,
    nombre_artista VARCHAR(255)
);

CREATE TABLE Albumes (
    id_album INT PRIMARY KEY,
    nombre_album VARCHAR(255)
);

CREATE TABLE GenerosMusica (
    id_genero INT PRIMARY KEY,
    nombre_genero VARCHAR(255)
);

CREATE TABLE Compositores (
    id_compositor INT PRIMARY KEY,
    nombre_compositor VARCHAR(255)
);

CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY,
    titulo VARCHAR(255),
    id_artista INT,
    id_album INT,
    ano_lanzamiento INT,
    duracion TIME,
    id_compositor INT,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista),
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album),
    FOREIGN KEY (id_compositor) REFERENCES Compositores(id_compositor)
);

-- Solución 5: Base de Datos de Animales
CREATE TABLE Animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(255),
    especie VARCHAR(255),
    edad INT
);

CREATE TABLE PropietariosAnimales (
    id_propietario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE Animales_Propietarios (
    id_animal INT,
    id_propietario INT,
    FOREIGN KEY (id_animal) REFERENCES Animales(id_animal),
    FOREIGN KEY (id_propietario) REFERENCES PropietariosAnimales(id_propietario)
);

CREATE TABLE Animales_Veterinarios (
    id_animal INT,
    id_veterinario INT,
    FOREIGN KEY (id_animal) REFERENCES Animales(id_animal),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);

-- Inserción de datos en las soluciones
-- Solución 1
INSERT INTO Peliculas (id_pelicula, titulo, director, ano_estreno, pais_origen) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'USA'),
(2, 'The Godfather', 'Francis Ford Coppola', 1972, 'USA'),
(3, 'The Dark Knight', 'Christopher Nolan', 2008, 'USA'),
(4, 'Forrest Gump', 'Robert Zemeckis', 1994, 'USA'),
(5, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'USA'),
(6, 'Inception', 'Christopher Nolan', 2010, 'USA'),
(7, 'Titanic', 'James Cameron', 1997, 'USA'),
(8, 'The Matrix', 'The Wachowskis', 1999, 'USA'),
(9, 'Avatar', 'James Cameron', 2009, 'USA'),
(10, 'Gladiator', 'Ridley Scott', 2000, 'USA');

-- Insertar datos en la tabla Actores
INSERT INTO Actores (id_actor, nombre_actor) VALUES
(1, 'Tim Robbins'),
(2, 'Morgan Freeman'),
(3, 'Marlon Brando'),
(4, 'Al Pacino'),
(5, 'Christian Bale'),
(6, 'Heath Ledger'),
(7, 'Tom Hanks'),
(8, 'Robin Wright'),
(9, 'John Travolta'),
(10, 'Samuel L. Jackson');

-- Insertar datos en la tabla Generos
INSERT INTO GenerosPelicula (id_genero, nombre_genero) VALUES
(1, 'Drama'),
(2, 'Crime'),
(3, 'Action'),
(4, 'Romance'),
(5, 'Sci-Fi');

-- Insertar datos en la tabla Peliculas_Actores
INSERT INTO Peliculas_Actores (id_pelicula, id_actor, rol) VALUES
(1, 1, 'Andy Dufresne'),
(1, 2, 'Ellis Boyd "Red" Redding'),
(2, 3, 'Don Vito Corleone'),
(2, 4, 'Michael Corleone'),
(3, 5, 'Bruce Wayne / Batman'),
(3, 6, 'Joker'),
(4, 7, 'Forrest Gump'),
(4, 8, 'Jenny Curran'),
(5, 9, 'Vincent Vega'),
(5, 10, 'Jules Winnfield');

-- Solución 2
INSERT INTO Coches (id_coche, marca, modelo, ano) VALUES
(1, 'Toyota', 'Corolla', 2018),
(2, 'Honda', 'Civic', 2017),
(3, 'Ford', 'Mustang', 2020),
(4, 'Chevrolet', 'Camaro', 2019),
(5, 'Nissan', 'Altima', 2016),
(6, 'BMW', 'X5', 2021),
(7, 'Mercedes-Benz', 'C-Class', 2019),
(8, 'Audi', 'A4', 2018),
(9, 'Hyundai', 'Elantra', 2017),
(10, 'Kia', 'Optima', 2019);

-- Insertar datos en la tabla Propietarios
INSERT INTO PropietariosCoche (id_propietario, nombre, direccion, telefono) VALUES
(1, 'Juan Pérez', 'Calle Principal 123', '123-456-7890'),
(2, 'María López', 'Avenida Libertad 456', '987-654-3210'),
(3, 'Pedro García', 'Calle Sur 789', '456-789-0123'),
(4, 'Ana Martínez', 'Calle Este 567', '321-654-0987'),
(5, 'Luisa Torres', 'Avenida Central 789', '789-012-3456'),
(6, 'Carlos Ruiz', 'Calle Norte 345', '210-987-6543'),
(7, 'Sofía Rodríguez', 'Avenida Oeste 890', '543-210-9876'),
(8, 'Javier Gómez', 'Calle Este 789', '012-345-6789'),
(9, 'Laura Sánchez', 'Avenida Libertad 678', '876-543-2109'),
(10, 'Diego Martín', 'Calle Principal 567', '234-567-8901');

-- Insertar datos en la tabla Talleres
INSERT INTO Talleres (id_taller, nombre, direccion) VALUES
(1, 'Taller Juan', 'Avenida Central 456'),
(2, 'Taller Martínez', 'Calle Independencia 789'),
(3, 'Taller Rodríguez', 'Avenida Norte 123'),
(4, 'Taller Sánchez', 'Avenida Oeste 567'),
(5, 'Taller Gómez', 'Calle Principal 234'),
(6, 'Taller López', 'Avenida Sur 890'),
(7, 'Taller Martín', 'Calle Este 678'),
(8, 'Taller Pérez', 'Avenida Norte 345'),
(9, 'Taller Hernández', 'Calle Sur 456'),
(10, 'Taller Ruiz', 'Avenida Central 678');

-- Solución 3
INSERT INTO Equipos (id_equipo, nombre_equipo, estadio, ciudad) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 'Madrid'),
(2, 'FC Barcelona', 'Camp Nou', 'Barcelona'),
(3, 'Liverpool FC', 'Anfield', 'Liverpool'),
(4, 'Manchester City', 'Etihad Stadium', 'Manchester'),
(5, 'Juventus FC', 'Allianz Stadium', 'Turín'),
(6, 'Bayern Munich', 'Allianz Arena', 'Múnich'),
(7, 'Paris Saint-Germain', 'Parc des Princes', 'París'),
(8, 'Chelsea FC', 'Stamford Bridge', 'Londres'),
(9, 'Atlético de Madrid', 'Wanda Metropolitano', 'Madrid'),
(10, 'AC Milan', 'San Siro', 'Milán');

-- Insertar datos en la tabla Entrenadores
INSERT INTO Entrenadores (id_entrenador, nombre_entrenador) VALUES
(1, 'Carlo Ancelotti'),
(2, 'Ronald Koeman'),
(3, 'Jürgen Klopp'),
(4, 'Pep Guardiola'),
(5, 'Massimiliano Allegri'),
(6, 'Julian Nagelsmann'),
(7, 'Mauricio Pochettino'),
(8, 'Thomas Tuchel'),
(9, 'Diego Simeone'),
(10, 'Stefano Pioli');

-- Insertar datos en la tabla Jugadores
INSERT INTO Jugadores (id_jugador, nombre_jugador) VALUES
(1, 'Karim Benzema'),
(2, 'Luka Modric'),
(3, 'Sergio Ramos'),
(4, 'Lionel Messi'),
(5, 'Gerard Piqué'),
(6, 'Sergio Busquets'),
(7, 'Mohamed Salah'),
(8, 'Virgil van Dijk'),
(9, 'Sadio Mané'),
(10, 'Kevin De Bruyne');

-- Solución 4
-- Insertar datos en la tabla Artistas
INSERT INTO Artistas (id_artista, nombre_artista) VALUES
(1, 'Queen'),
(2, 'Ed Sheeran'),
(3, 'Adele'),
(4, 'Luis Fonsi'),
(5, 'Michael Jackson'),
(6, 'Eagles'),
(7, 'Led Zeppelin');

-- Insertar datos en la tabla Albumes
INSERT INTO Albumes (id_album, nombre_album) VALUES
(1, 'A Night at the Opera'),
(2, '÷'),
(3, '21'),
(4, 'Vida'),
(5, 'Thriller'),
(6, 'Hotel California'),
(7, 'Led Zeppelin IV'),
(8, '×'),
(9, '÷ (Divide)');

-- Insertar datos en la tabla Compositores
INSERT INTO Compositores (id_compositor, nombre_compositor) VALUES
(1, 'Freddie Mercury'),
(2, 'Ed Sheeran'),
(3, 'Adele Adkins'),
(4, 'Luis Fonsi, Daddy Yankee'),
(5, 'Michael Jackson'),
(6, 'Don Felder, Glenn Frey, Don Henley'),
(7, 'Jimmy Page, Robert Plant'),
(8, 'Ed Sheeran, Amy Wadge'),
(9, 'Rod Temperton');

INSERT INTO Canciones (id_cancion, titulo, id_artista, id_album, ano_lanzamiento, duracion, id_compositor) VALUES
(1, 'Bohemian Rhapsody', 1, 1, 1975, '00:05:55', 1),
(2, 'Shape of You', 2, 2, 2017, '00:03:53', 2),
(3, 'Rolling in the Deep', 3, 3, 2010, '00:03:48', 3),
(4, 'Despacito', 4, 4, 2017, '00:03:48', 4),
(5, 'Billie Jean', 5, 5, 1982, '00:04:54', 5),
(6, 'Hotel California', 6, 6, 1976, '00:06:30', 6),
(7, 'Stairway to Heaven', 7, 7, 1971, '00:08:02', 7),
(8, 'Thinking Out Loud', 2, 8, 2014, '00:04:41', 2),
(9, 'Shape of You', 2, 9, 2017, '00:03:54', 2),
(10, 'Thriller', 5, 5, 1982, '00:05:57', 8);


-- Solución 5
INSERT INTO Animales (id_animal, nombre, especie, edad) VALUES
(1, 'Max', 'Perro', 5),
(2, 'Whiskers', 'Gato', 3),
(3, 'Buddy', 'Perro', 7),
(4, 'Oliver', 'Gato', 2),
(5, 'Luna', 'Perro', 4),
(6, 'Simba', 'Gato', 1),
(7, 'Charlie', 'Perro', 6),
(8, 'Milo', 'Gato', 5),
(9, 'Bella', 'Perro', 3),
(10, 'Oreo', 'Gato', 2);

-- Insertar datos en la tabla PropietariosAnimales
INSERT INTO PropietariosAnimales (id_propietario, nombre, direccion) VALUES
(1, 'Ana Martínez', 'Calle Principal 123'),
(2, 'Luisa Rodríguez', 'Calle Libertad 456'),
(3, 'Carlos Sánchez', 'Avenida Norte 789'),
(4, 'Laura Pérez', 'Calle Oeste 567'),
(5, 'Diego Gómez', 'Calle Principal 234'),
(6, 'María López', 'Avenida Sur 890'),
(7, 'Javier Ruiz', 'Calle Este 678'),
(8, 'Sofía Martín', 'Avenida Norte 345'),
(9, 'Pablo Hernández', 'Calle Oeste 678'),
(10, 'Lucía Rodríguez', 'Calle Libertad 890');

-- Insertar datos en la tabla Veterinarios
INSERT INTO Veterinarios (id_veterinario, nombre, direccion) VALUES
(1, 'Dr. Pérez', 'Avenida Central 456'),
(2, 'Dr. Gómez', 'Avenida Sur 789'),
(3, 'Dra. López', 'Calle Este 123'),
(4, 'Dr. Martínez', 'Avenida Central 890'),
(5, 'Dra. Rodríguez', 'Avenida Libertad 678'),
(6, 'Dr. Hernández', 'Calle Norte 345'),
(7, 'Dra. Sánchez', 'Avenida Oeste 456'),
(8, 'Dr. Pérez', 'Calle Principal 567'),
(9, 'Dra. Gómez', 'Avenida Central 789'),
(10, 'Dr. Martínez', 'Avenida Sur 456');