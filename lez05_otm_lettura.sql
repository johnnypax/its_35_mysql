DROP DATABASE IF EXISTS lez05_otm_lettura;
CREATE DATABASE lez05_otm_lettura;
USE lez05_otm_lettura;

CREATE TABLE Libreria(
	libreriaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL
);

CREATE TABLE Libro(
	libroID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    autore VARCHAR(250) NOT NULL,
    genere VARCHAR(250) NOT NULL,
    isbn VARCHAR(250) NOT NULL,
    codice VARCHAR(250) NOT NULL UNIQUE,
    libreriaRIF INTEGER NOT NULL,
    FOREIGN KEY (libreriaRIF) REFERENCES Libreria(libreriaID) ON DELETE CASCADE
);

INSERT INTO Libreria (nome) VALUES
('Libreria Centrale'),
('La Pagina d’Oro'),
('Il Mondo dei Libri');

INSERT INTO Libro (nome, autore, genere, isbn, codice, libreriaRIF) VALUES
('Il Segreto dei Colli', 'Marco Bianchi', 'Narrativa', '9788800010011', 'LC001', 1),
('Ombre sul Mare', 'Laura Verdi', 'Thriller', '9788800010012', 'LC002', 1),
('Viaggio nel Tempo', 'Giorgio Neri', 'Fantascienza', '9788800010013', 'LC003', 1),
('La Casa di Pietra', 'Anna Russo', 'Horror', '9788800010014', 'LC004', 1),
('Il Bosco Incantato', 'Sara Fontana', 'Fantasy', '9788800010015', 'LC005', 1),
('Economia Facile', 'Paolo Conti', 'Saggistica', '9788800010016', 'LC006', 1),
('Storia d’Italia', 'Giulia Ferri', 'Storico', '9788800010017', 'LC007', 1),
('Il Cuore e la Luna', 'Marta Galli', 'Romantico', '9788800010018', 'LC008', 1),
('Matematica per Tutti', 'Luca Serra', 'Didattica', '9788800010019', 'LC009', 1),
('Il Codice Perduto', 'Davide Riva', 'Avventura', '9788800010020', 'LC010', 1);












SELECT * 
	FROM Libreria
    JOIN Libro ON Libreria.libreriaID = Libro.libreriaRIF
    WHERE Libreria.nome = "Libreria Centrale";
    
SELECT *
	FROM Libro
    JOIN Libreria ON Libro.libreriaRIF = Libreria.libreriaID
