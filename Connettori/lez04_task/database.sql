DROP DATABASE IF EXISTS lez04_scuola;
CREATE DATABASE lez04_scuola;
USE lez04_scuola;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    matricola VARCHAR(255) NOT NULL UNIQUE    
);

INSERT INTO Studente (nome, cognome, email, matricola) VALUES
('Mickey', 'Mouse', 'mickey.mouse@disneyuni.com', 'DIS001'),
('Donald', 'Duck', 'donald.duck@disneyuni.com', 'DIS002'),
('Goofy', 'Goof', 'goofy.goof@disneyuni.com', 'DIS003'),
('Minnie', 'Mouse', 'minnie.mouse@disneyuni.com', 'DIS004'),
('Daisy', 'Duck', 'daisy.duck@disneyuni.com', 'DIS005'),
('Simba', 'Lion', 'simba.lion@disneyuni.com', 'DIS006'),
('Ariel', 'Mermaid', 'ariel.mermaid@disneyuni.com', 'DIS007'),
('Aladdin', 'Agrabah', 'aladdin.agrabah@disneyuni.com', 'DIS008'),
('Elsa', 'Arendelle', 'elsa.arendelle@disneyuni.com', 'DIS009'),
('Buzz', 'Lightyear', 'buzz.lightyear@disneyuni.com', 'DIS010');

SELECT * FROM Studente;