CREATE DATABASE lez08_museo;
USE lez08_museo;

CREATE TABLE Museo(
	museoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    citta VARCHAR(255) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    direttore VARCHAR(255) NOT NULL,
    UNIQUE(nome, indirizzo)
);

CREATE TABLE Artista (
	artistaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    nazionalita VARCHAR(255) NOT NULL,
    data_nas DATE NOT NULL,
    data_mor DATE
);

CREATE TABLE Dipinto(
	dipintoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(255) NOT NULL UNIQUE,
    titolo VARCHAR(255) NOT NULL,
    anno_crea INTEGER NOT NULL,
    tipo_pitt VARCHAR(255) NOT NULL,
    dimensioni VARCHAR(255) NOT NULL,
    museoRIF INTEGER,
    artistaRIF INTEGER,
    FOREIGN KEY (museoRIF) REFERENCES Museo(museoID) ON DELETE SET NULL,
    FOREIGN KEY (artistaRIF) REFERENCES Artista(artistaID) ON DELETE SET NULL
);


CREATE TABLE Scultura(
	sculturaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(255) NOT NULL UNIQUE,
    titolo VARCHAR(255) NOT NULL,
    anno_crea INTEGER NOT NULL,
	materiale VARCHAR(255) NOT NULL,
    altezza DECIMAL(5,2) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    museoRIF INTEGER,
    artistaRIF INTEGER,
    FOREIGN KEY (museoRIF) REFERENCES Museo(museoID) ON DELETE SET NULL,
    FOREIGN KEY (artistaRIF) REFERENCES Artista(artistaID) ON DELETE SET NULL
);

CREATE TABLE Personaggio(
	personaggioID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Personaggio_Dipinto(
	personaggioRIF INTEGER NOT NULL,
    dipintoRIF INTEGER NOT NULL,
    FOREIGN KEY  (personaggioRIF) REFERENCES Personaggio(personaggioID) ON DELETE CASCADE,
    FOREIGN KEY  (dipintoRIF) REFERENCES Dipinto(dipintoID) ON DELETE CASCADE,
    PRIMARY KEY (personaggioRIF, dipintoRIF)
);

CREATE TABLE Personaggio_Scultura(
	personaggioRIF INTEGER NOT NULL,
    sculturaRIF INTEGER NOT NULL,
    FOREIGN KEY  (personaggioRIF) REFERENCES Personaggio(personaggioID) ON DELETE CASCADE,
    FOREIGN KEY  (sculturaRIF) REFERENCES Scultura(sculturaID) ON DELETE CASCADE,
    PRIMARY KEY (personaggioRIF, sculturaRIF)
);

INSERT INTO Museo (nome, citta, indirizzo, direttore) VALUES
('Museo degli Uffizi', 'Firenze', 'Piazzale degli Uffizi 6', 'Marco Rossi'),
('Museo del Louvre', 'Parigi', 'Rue de Rivoli 99', 'Anne Dupont'),
('Museo del Prado', 'Madrid', 'Calle Ruiz 45', 'Carlos Martinez'),
('Galleria Borghese', 'Roma', 'Piazzale Scipione Borghese 5', 'Giulia Bianchi'),
('Museo Van Gogh', 'Amsterdam', 'Museumplein 6', 'Peter Janssen'),
('National Gallery', 'Londra', 'Trafalgar Square 1', 'Elizabeth Brown'),
('Metropolitan Museum of Art', 'New York', '5th Avenue 1000', 'John Smith'),
('Museo Egizio', 'Torino', 'Via Accademia delle Scienze 6', 'Luca Verdi'),
('Rijksmuseum', 'Amsterdam', 'Museumstraat 1', 'Karel De Vries'),
('Museo Archeologico Nazionale', 'Napoli', 'Piazza Museo 19', 'Francesco Romano');

INSERT INTO Artista (nome, nazionalita, data_nas, data_mor) VALUES
('Leonardo da Vinci', 'Italiana', '1452-04-15', '1519-05-02'),
('Vincent van Gogh', 'Olandese', '1853-03-30', '1890-07-29'),
('Pablo Picasso', 'Spagnola', '1881-10-25', '1973-04-08'),
('Michelangelo Buonarroti', 'Italiana', '1475-03-06', '1564-02-18'),
('Claude Monet', 'Francese', '1840-11-14', '1926-12-05'),
('Caravaggio', 'Italiana', '1571-09-29', '1610-07-18'),
('Salvador Dalí', 'Spagnola', '1904-05-11', '1989-01-23'),
('Sandro Botticelli', 'Italiana', '1445-03-01', '1510-05-17'),
('Auguste Rodin', 'Francese', '1840-11-12', '1917-11-17'),
('Jackson Pollock', 'Americana', '1912-01-28', '1956-08-11');

INSERT INTO Dipinto (codice, titolo, anno_crea, tipo_pitt, dimensioni, museoRIF, artistaRIF) VALUES
('D001', 'La Gioconda', 1503, 'Olio su tavola', '77x53 cm', 2, 1),
('D002', 'Notte stellata', 1889, 'Olio su tela', '74x92 cm', 5, 2),
('D003', 'Guernica', 1937, 'Olio su tela', '349x776 cm', 3, 3),
('D004', 'Nascita di Venere', 1486, 'Tempera su tela', '172x278 cm', 1, 8),
('D005', 'Il Giardino delle Ninfee', 1906, 'Olio su tela', '200x180 cm', 6, 5),
('D006', 'Vocazione di San Matteo', 1600, 'Olio su tela', '322x340 cm', 4, 6),
('D007', 'Persistenza della memoria', 1931, 'Olio su tela', '24x33 cm', 7, 7),
('D008', 'Autoritratto', 1889, 'Olio su tela', '65x54 cm', 5, 2),
('D009', 'Ultima Cena', 1498, 'Tempera su muro', '460x880 cm', 1, 1),
('D010', 'Donna che piange', 1937, 'Olio su tela', '60x49 cm', 3, 3);

INSERT INTO Scultura (codice, titolo, anno_crea, materiale, altezza, peso, museoRIF, artistaRIF) VALUES
('S001', 'David', 1504, 'Marmo', 517.00, 600.00, 4, 4),
('S002', 'Pietà', 1499, 'Marmo', 174.00, 600.00, 4, 4),
('S003', 'Il Pensatore', 1904, 'Bronzo', 186.00, 700.00, 9, 9),
('S004', 'Il Bacio', 1882, 'Marmo', 181.00, 800.00, 9, 9),
('S005', 'San Giorgio', 1417, 'Marmo', 209.00, 300.00, 1, 8),
('S006', 'Apollo e Dafne', 1625, 'Marmo', 243.00, 400.00, 4, 6),
('S007', 'La Porta dell’Inferno', 1917, 'Bronzo', 635.00, 800.00, 9, 9),
('S008', 'Ercole e Caco', 1534, 'Marmo', 520.00, 700.00, 1, 4),
('S009', 'Donna in piedi', 1930, 'Bronzo', 160.00, 300.00, 7, 7),
('S010', 'Figura sdraiata', 1951, 'Bronzo', 140.00, 250.00, 7, NULL);

INSERT INTO Personaggio (nome) VALUES
('Gesù'),
('Maria'),
('Giuda'),
('Venere'),
('San Matteo'),
('Minerva'),
('Ulisse'),
('Adamo'),
('Eva'),
('San Pietro');

INSERT INTO Personaggio_Dipinto (personaggioRIF, dipintoRIF) VALUES
(1, 9),
(2, 9),
(3, 9),
(4, 4),
(5, 6),
(1, 6),
(8, 9),
(9, 9),
(10, 6),
(4, 1),
(2, 1),
(1, 10);

INSERT INTO Personaggio_Scultura (personaggioRIF, sculturaRIF) VALUES
(4, 5),
(6, 5),
(1, 2),
(2, 2),
(8, 1),
(9, 1),
(7, 3),
(10, 6),
(4, 8),
(6, 8),
(1, 7);






