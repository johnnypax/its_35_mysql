DROP DATABASE IF EXISTS lez02_anagrafe;
CREATE DATABASE lez02_anagrafe;
USE lez02_anagrafe;

-- DROP TABLE IF EXISTS Persona;
CREATE TABLE Persona(
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis VARCHAR(16) NOT NULL UNIQUE,
    telefono VARCHAR(50)
);

ALTER TABLE Persona ADD COLUMN email VARCHAR(250) NOT NULL;
ALTER TABLE Persona ADD COLUMN altezza FLOAT AFTER cognome;
ALTER TABLE Persona DROP COLUMN altezza;
ALTER TABLE Persona MODIFY COLUMN email VARCHAR(100);

-- DML
INSERT INTO Persona (nome, cognome, cod_fis, telefono)
VALUES
('Luca', 'Rossi', 'RSL123456B', '3456789012'),
('Giulia', 'Verdi', 'VRD987654C', '0987654321'),
('Alessandro', 'Bianchi', 'BLH543210D', '8765432109'),
('Francesca', 'Migliori', 'MGZ321099E', '1234567890'),
('Matteo', 'Gialli', 'GLL890123F', '0987654321'),
('Sara', 'Bassi', 'BSN654321G', '9876543210'),
('Marco', 'Rosso', 'RSM321094H', '7654321098'),
('Lorenzo', 'Grigi', 'GRD549834I', '1234567890'),
('Elena', 'Blu', 'BLU278949J', '0987654321'),
('Giorgio', 'Neri', 'NER976543K', '9876543210');

-- SET SESSION sql_safe_updates = 0;
-- SET SESSION sql_safe_deletes = 0;
-- DELETE FROM Persona WHERE cod_fis = 'NER976543K';
-- UPDATE Persona SET nome = "Elenuccia", cognome = "Bluetti" WHERE cod_fis = "BLU278949J";

-- QL
SELECT * FROM Persona;