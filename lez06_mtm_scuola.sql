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


