-- Drop de la base de datos peliculas_db si existe
DROP DATABASE IF EXISTS peliculas_db;

-- Creación de la base de datos peliculas_db
CREATE DATABASE peliculas_db;

-- Usar la base de datos peliculas_db
USE peliculas_db;

CREATE TABLE Peliculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    director VARCHAR(255) NOT NULL,
    actor_principal VARCHAR(255) NOT NULL,
    actor_secundario VARCHAR(255) NOT NULL,
    genero VARCHAR(255) NOT NULL
);

INSERT INTO Peliculas (titulo, anio, director, actor_principal, actor_secundario, genero) VALUES
('Inception', 2010, 'Christopher Nolan', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Sci-Fi'),
('The Dark Knight', 2008, 'Christopher Nolan', 'Christian Bale', 'Heath Ledger', 'Action'),
('Interstellar', 2014, 'Christopher Nolan', 'Matthew McConaughey', 'Anne Hathaway', 'Sci-Fi'),
('Titanic', 1997, 'James Cameron', 'Leonardo DiCaprio', 'Kate Winslet', 'Romance'),
('Avatar', 2009, 'James Cameron', 'Sam Worthington', 'Zoe Saldana', 'Sci-Fi'),
('The Godfather', 1972, 'Francis Ford Coppola', 'Marlon Brando', 'Al Pacino', 'Crime'),
('Pulp Fiction', 1994, 'Quentin Tarantino', 'John Travolta', 'Samuel L. Jackson', 'Crime'),
('The Shawshank Redemption', 1994, 'Frank Darabont', 'Tim Robbins', 'Morgan Freeman', 'Drama'),
('The Matrix', 1999, 'Lana Wachowski', 'Keanu Reeves', 'Laurence Fishburne', 'Sci-Fi'),
('Fight Club', 1999, 'David Fincher', 'Brad Pitt', 'Edward Norton', 'Drama'),
('Gladiator', 2000, 'Ridley Scott', 'Russell Crowe', 'Joaquin Phoenix', 'Action'),
('Forrest Gump', 1994, 'Robert Zemeckis', 'Tom Hanks', 'Robin Wright', 'Drama'),
('The Lion King', 1994, 'Roger Allers', 'Matthew Broderick', 'Jeremy Irons', 'Animation'),
('Goodfellas', 1990, 'Martin Scorsese', 'Ray Liotta', 'Joe Pesci', 'Crime'),
('Se7en', 1995, 'David Fincher', 'Brad Pitt', 'Morgan Freeman', 'Thriller'),
('Braveheart', 1995, 'Mel Gibson', 'Mel Gibson', 'Sophie Marceau', 'Drama'),
('The Silence of the Lambs', 1991, 'Jonathan Demme', 'Jodie Foster', 'Anthony Hopkins', 'Thriller'),
('Schindler\'s List', 1993, 'Steven Spielberg', 'Liam Neeson', 'Ralph Fiennes', 'Drama'),
('Saving Private Ryan', 1998, 'Steven Spielberg', 'Tom Hanks', 'Matt Damon', 'War'),
('Jurassic Park', 1993, 'Steven Spielberg', 'Sam Neill', 'Laura Dern', 'Sci-Fi'),
('The Green Mile', 1999, 'Frank Darabont', 'Tom Hanks', 'Michael Clarke Duncan', 'Drama'),
('The Terminator', 1984, 'James Cameron', 'Arnold Schwarzenegger', 'Linda Hamilton', 'Sci-Fi'),
('The Prestige', 2006, 'Christopher Nolan', 'Christian Bale', 'Hugh Jackman', 'Drama'),
('Memento', 2000, 'Christopher Nolan', 'Guy Pearce', 'Carrie-Anne Moss', 'Mystery'),
('The Departed', 2006, 'Martin Scorsese', 'Leonardo DiCaprio', 'Matt Damon', 'Crime'),
('The Wolf of Wall Street', 2013, 'Martin Scorsese', 'Leonardo DiCaprio', 'Jonah Hill', 'Biography'),
('Inglourious Basterds', 2009, 'Quentin Tarantino', 'Brad Pitt', 'Christoph Waltz', 'Adventure'),
('Django Unchained', 2012, 'Quentin Tarantino', 'Jamie Foxx', 'Christoph Waltz', 'Drama'),
('The Hateful Eight', 2015, 'Quentin Tarantino', 'Samuel L. Jackson', 'Kurt Russell', 'Drama'),
('The Revenant', 2015, 'Alejandro González Iñárritu', 'Leonardo DiCaprio', 'Tom Hardy', 'Adventure'),
('Birdman', 2014, 'Alejandro González Iñárritu', 'Michael Keaton', 'Edward Norton', 'Comedy'),
('Gravity', 2013, 'Alfonso Cuarón', 'Sandra Bullock', 'George Clooney', 'Sci-Fi'),
('Mad Max: Fury Road', 2015, 'George Miller', 'Tom Hardy', 'Charlize Theron', 'Action'),
('Black Swan', 2010, 'Darren Aronofsky', 'Natalie Portman', 'Mila Kunis', 'Thriller'),
('Whiplash', 2014, 'Damien Chazelle', 'Miles Teller', 'J.K. Simmons', 'Drama'),
('La La Land', 2016, 'Damien Chazelle', 'Ryan Gosling', 'Emma Stone', 'Comedy'),
('The Grand Budapest Hotel', 2014, 'Wes Anderson', 'Ralph Fiennes', 'Tony Revolori', 'Comedy'),
('Moonrise Kingdom', 2012, 'Wes Anderson', 'Jared Gilman', 'Kara Hayward', 'Comedy'),
('The Social Network', 2010, 'David Fincher', 'Jesse Eisenberg', 'Andrew Garfield', 'Biography'),
('Gone Girl', 2014, 'David Fincher', 'Ben Affleck', 'Rosamund Pike', 'Thriller'),
('The Girl with the Dragon Tattoo', 2011, 'David Fincher', 'Daniel Craig', 'Rooney Mara', 'Thriller'),
('12 Years a Slave', 2013, 'Steve McQueen', 'Chiwetel Ejiofor', 'Michael Fassbender', 'Biography'),
('Shutter Island', 2010, 'Martin Scorsese', 'Leonardo DiCaprio', 'Mark Ruffalo', 'Thriller'),
('The Aviator', 2004, 'Martin Scorsese', 'Leonardo DiCaprio', 'Cate Blanchett', 'Biography'),
('Catch Me If You Can', 2002, 'Steven Spielberg', 'Leonardo DiCaprio', 'Tom Hanks', 'Biography'),
('Munich', 2005, 'Steven Spielberg', 'Eric Bana', 'Daniel Craig', 'Drama'),
('A Beautiful Mind', 2001, 'Ron Howard', 'Russell Crowe', 'Jennifer Connelly', 'Biography'),
('The Truman Show', 1998, 'Peter Weir', 'Jim Carrey', 'Ed Harris', 'Comedy'),
('Eternal Sunshine of the Spotless Mind', 2004, 'Michel Gondry', 'Jim Carrey', 'Kate Winslet', 'Romance');

-- Consulta que devuelva todas las películas:
SELECT * FROM Peliculas;
-- Consulta que devuelva las películas de Christopher Nolan:
SELECT * FROM Peliculas WHERE director = 'Christopher Nolan';
-- Consulta que ordene las películas por orden descendente en función al año:
SELECT * FROM Peliculas ORDER BY anio DESC;
-- Consulta que devuelva las películas entre los años 1990 y 2000:
SELECT * FROM Peliculas WHERE anio BETWEEN 1990 AND 2000;
-- Consulta que devuelva cuántas películas hay de cada género:
SELECT genero, COUNT(*) as cantidad FROM Peliculas GROUP BY genero;


