DROP DATABASE IF EXISTS lez04_otm_fedelta;
CREATE DATABASE lez04_otm_fedelta;
USE lez04_otm_fedelta;

CREATE TABLE Persona(
	personaID INTEGER AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    email VARCHAR(10) NOT NULL,
    PRIMARY KEY(personaID),
    UNIQUE(email)
);

CREATE TABLE Carta(
	cartaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(10) NOT NULL UNIQUE,
    negozio VARCHAR(50) NOT NULL,
    personaRIF INTEGER NOT NULL,
    FOREIGN KEY (personaRIF) REFERENCES Persona(personaID) ON DELETE CASCADE 
);

INSERT INTO Persona(nome, cognome, email) VALUES
("Giovanni", "Pace", "gio@pac.it"),
("Valeria", "Verdi", "val@ver.it"),
("Mario", "Rossi", "mar@ros.it"),
("Marika", "Mariko", "mar@mar.it");

INSERT INTO Carta(codice, negozio, personaRIF) VALUES
("CC001", "Conad", 1),
("CC002", "Conad", 2),
("CC003", "Conad", 3),
("PP01", "Coop", 1),
("PP02", "Coop", 2),
("TT001", "Tigotà", 2);

-- INSERT INTO Carta(codice, negozio, personaRIF) VALUES
-- ("CC999", "Conad", 899);

SELECT * FROM Persona;
SELECT * FROM Carta;

DELETE FROM Persona WHERE email = "gio@pac.it";