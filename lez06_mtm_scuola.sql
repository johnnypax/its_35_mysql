CREATE DATABASE lez06_mtm_scuola;
USE lez06_mtm_scuola;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    matricola VARCHAR(255) NOT NULL UNIQUE    
);

CREATE TABLE Esame(
	esameID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_esame DATE NOT NULL
);

CREATE TABLE Studente_Esame(
	studenteRIF INTEGER NOT NULL,
    esameRIF INTEGER NOT NULL,
    FOREIGN KEY(studenteRIF) REFERENCES Studente(studenteID) ON DELETE CASCADE,
    FOREIGN KEY(esameRIF) REFERENCES Esame(esameID) ON DELETE CASCADE,
    PRIMARY KEY(studenteRIF, esameRIF)
);

INSERT INTO Studente(nome, cognome, matricola) VALUES
("Giovanni", "Pace", "AB12345"),
("Valeria", "Verdi", "AB12346"),
("Marika", "Mariko", "AB12347");

INSERT INTO Esame(nome, data_esame) VALUES
("Programmazione", "2026-01-01"),
("Programmazione", "2026-01-02"),
("Basi di dati", "2026-01-03"),
("Fisica", "2026-01-04"),
("Filosofia", "2026-01-05");

INSERT INTO Studente_Esame(studenteRIF, esameRIF) VALUES
(1,1),
(1,3),
(2,1),
(2,4);

SELECT * FROM Studente;
SELECT * FROM Esame;
SELECT * FROM Studente_Esame;

SELECT * 
	FROM Studente
    JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID
    WHERE matricola = "AB12345";

-- Visualizza tutti gli studenti iscritti ad esami e quelli non iscritti
SELECT * 
	FROM Studente
    LEFT JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    LEFT JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID;
    
-- Visualizza tutti gli esami che hanno iscritti e quelli che non ne hanno
SELECT * 
	FROM Studente
    RIGHT JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    RIGHT JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID;
    


-- Voglio tutti gli esami con studenti iscritti
SELECT * 
	FROM Esame
    JOIN Studente_Esame ON Esame.esameID = Studente_Esame.esameRIF
    JOIN Studente ON Studente_Esame.studenteRIF = Studente.studenteID;
    
-- Voglio tutti gli esami con studenti iscritti e senza iscritti
SELECT * 
	FROM Esame
    LEFT JOIN Studente_Esame ON Esame.esameID = Studente_Esame.esameRIF
    LEFT JOIN Studente ON Studente_Esame.studenteRIF = Studente.studenteID;
    
SELECT * 
	FROM Esame
    LEFT JOIN Studente_Esame ON Esame.esameID = Studente_Esame.esameRIF
    LEFT JOIN Studente ON Studente_Esame.studenteRIF = Studente.studenteID
UNION
SELECT * 
	FROM Esame
    RIGHT JOIN Studente_Esame ON Esame.esameID = Studente_Esame.esameRIF
    RIGHT JOIN Studente ON Studente_Esame.studenteRIF = Studente.studenteID;


    
