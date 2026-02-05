CREATE DATABASE lez07_oto_anagrafe;
USE lez07_oto_anagrafe;

CREATE TABLE Persona(
	personaID INTEGER AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    email VARCHAR(10) NOT NULL,
    PRIMARY KEY(personaID),
    UNIQUE(email)
);

CREATE TABLE CartaIdentita(
	cartaID INTEGER AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(250) NOT NULL,
    scadenza DATE NOT NULL,
    personaRIF INTEGER NOT NULL UNIQUE,
    FOREIGN KEY(personaRIF) REFERENCES Persona(personaID) ON DELETE CASCADE
);