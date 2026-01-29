DROP DATABASE IF EXISTS lez03_ferramenta;
CREATE DATABASE lez03_ferramenta;
USE lez03_ferramenta;

CREATE TABLE Oggetto(
	oggettoID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
    descrizione TEXT,
    categoria VARCHAR(50) NOT NULL DEFAULT "N.D.",
    prezzo DECIMAL(6,2),
    produzione DATE,
    codice VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO Oggetto (nome, descrizione, categoria, prezzo, produzione, codice)
VALUES
('Sedia', 'Comoda e confortevole sedia in pelle nera', 'Arredamento', 99.99, '2020-01-01', 'ODG123'),
('Pantofole', 'Calde e morbide pantofole per inverno', 'Accessori', 19.99, '2019-06-15', 'OAB456'),
('Sacco da viaggio', 'Sacco da viaggio robusto e leggero', 'Viaggi', 49.99, '2020-03-01', 'ODV789'),
('Libro di cucina', 'Guida completa per la preparazione di piatti deliziosi', 'Libri', 29.99, '2018-09-15', 'OQB012'),
('Tavolo da lavoro', 'Tavolo da lavoro robusto e leggero, ideale per lo studio', 'Arredamento', 69.99, '2020-05-01', 'OTA345'),
('Portaombrelli', 'Portaombrelli elegante e funzionale', 'Accessori', 39.99, '2019-02-15', 'OBA678'),
('Pomodoro da coltivare', 'Pomodoro da coltivare per un orto domestico', 'Giardinaggio', 14.99, '2020-07-01', 'OGD901'),
('Tazza da caffè', 'Tazza da caffè elegante e leggera', 'Accessori', 24.99, '2019-04-15', 'OBC123'),
('Schedario', 'Schedario completo con spazio per note e calendari', 'Scuola', 49.99, '2020-01-01', 'OSC456'),
('Libro di storia', 'Guida completa per la storia dell''Italia', 'Libri', 29.99, '2018-09-15', 'OBQ789');

SELECT * FROM Oggetto;

