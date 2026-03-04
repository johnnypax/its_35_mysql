-- DDL
CREATE DATABASE lez01_anagrafe;
USE lez01_anagrafe;

CREATE TABLE Persona(
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis VARCHAR(16) NOT NULL UNIQUE,
    telefono VARCHAR(50)
);

-- DML
INSERT INTO Persona(nome, cognome, telefono, cod_fis) VALUES
("Giovanni", "Pace", "12345", "PCAGNN");

-- QL
SELECT * FROM Persona;
