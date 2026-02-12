CREATE DATABASE lez10_soft_delete;
USE lez10_soft_delete;

CREATE TABLE Paziente(
	pazienteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    cod_fis VARCHAR(255) NOT NULL UNIQUE,
    data_nas DATE CHECK (data_nas >= "1900-01-01"),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    deleted_at DATETIME
);

INSERT INTO Paziente(nome, cognome, cod_fis, data_nas) VALUES
("Giovanni", "Pace", "PCAGNN", "2025-01-01"),
("Valeria", "Verdi", "VLRVRD", "2025-01-02");

UPDATE Paziente 
	SET deleted_at = CURRENT_TIMESTAMP 
    WHERE cod_fis = "VLRVRD";

CREATE VIEW elenco_pazienti AS
	SELECT * FROM Paziente WHERE deleted_at IS NULL;
    
SELECT * FROM elenco_pazienti;