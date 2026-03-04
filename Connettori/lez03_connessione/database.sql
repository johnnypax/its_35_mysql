CREATE DATABASE lez3_rubrica;
USE lez3_rubrica;

CREATE TABLE Utente(
	utenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Utente (nome, cognome, email) VALUES
('Luke', 'Skywalker', 'luke.skywalker@rebellion.org'),
('Leia', 'Organa', 'leia.organa@rebellion.org'),
('Han', 'Solo', 'han.solo@falcon.space'),
('Anakin', 'Skywalker', 'anakin.skywalker@jediorder.org'),
('Obi-Wan', 'Kenobi', 'obiwan.kenobi@jediorder.org'),
('Padme', 'Amidala', 'padme.amidala@naboo.gov'),
('Darth', 'Vader', 'darth.vader@empire.gov'),
('Sheev', 'Palpatine', 'sheev.palpatine@empire.gov'),
('Din', 'Djarin', 'din.djarin@mandalore.org'),
('Grogu', 'Unknown', 'grogu@mandalore.org');

SELECT * FROM Utente;