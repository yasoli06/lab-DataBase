-- Drop de la base de datos labmyBBDD si existe
DROP DATABASE IF EXISTS labmyBBDD;

-- Creación de la base de datos labmyBBDD
CREATE DATABASE labmyBBDD;

-- Usar la base de datos labmyBBDD
USE labmyBBDD;

-- relación Many-to-One con la tabla principal:
CREATE TABLE Editoriales (
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- tabla principal 
CREATE TABLE libros (
id_libro INT primary key,
titulo VARCHAR(200) not null,
anio_publicacion year not null,
genero VARCHAR(100) not null,
id_editorial INT,
foreign key (id_editorial) references editoriales(id_editorial)
);

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Ejemplares (
    id_ejemplar INT PRIMARY KEY,
    id_libro INT,
    ubicacion VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);
-- relación Many-to-Many

CREATE TABLE LibroAutor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

INSERT INTO Editoriales (id_editorial, nombre) VALUES
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Simon & Schuster'),
(4, 'Hachette Book Group'),
(5, 'Macmillan Publishers');

INSERT INTO Autores (id_autor, nombre) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien'),
(4, 'Stephen King'),
(5, 'Agatha Christie');

INSERT INTO Libros (id_libro, titulo, anio_publicacion, genero, id_editorial) VALUES
(1, 'Harry Potter and the Sorcerer\'s Stone', 1997, 'Fantasy', 1),
(2, 'A Game of Thrones', 1996, 'Fantasy', 2),
(3, 'The Hobbit', 1937, 'Fantasy', 3),
(4, 'The Shining', 1977, 'Horror', 4),
(5, 'Murder on the Orient Express', 1934, 'Mystery', 5);


INSERT INTO Ejemplares (id_ejemplar, id_libro, ubicacion, estado) VALUES
(1, 1, 'Aisle 1, Shelf 2', 'Disponible'),
(2, 2, 'Aisle 1, Shelf 3', 'Prestado'),
(3, 3, 'Aisle 2, Shelf 1', 'Disponible'),
(4, 4, 'Aisle 2, Shelf 2', 'Dañado'),
(5, 5, 'Aisle 3, Shelf 1', 'Disponible');


INSERT INTO LibroAutor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);




















