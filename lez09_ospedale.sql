DROP DATABASE IF EXISTS lez09_ospedale;
CREATE DATABASE lez09_ospedale;
USE lez09_ospedale;

CREATE TABLE Paziente(
	pazienteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    cod_fis VARCHAR(255) NOT NULL UNIQUE,
    data_nas DATE CHECK (data_nas >= "1900-01-01")
);

CREATE TABLE Reparto(
	repartoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE,
    max_paz INTEGER NOT NULL DEFAULT 1 CHECK (max_paz >= 0) 
);

INSERT INTO Reparto(nome) VALUES ("Cardiologia"), ("Pneumologia");

CREATE TABLE Esame(
	esameID INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL CHECK (tipo IN ("Urine", "Feci", "Sangue")),
    esito TEXT,
    data_esame DATETIME DEFAULT CURRENT_TIMESTAMP,
    pazienteRIF INTEGER NOT NULL,
    FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE
    );
    
-- INSERT INTO Esame(tipo, esito) VALUES ("Urine", "Colore giallo");
-- SELECT * FROM Esame;
SELECT CURRENT_TIMESTAMP;

SELECT UUID();

CREATE TABLE Medico(
	medicoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    identificativo VARCHAR(255) NOT NULL DEFAULT (UUID()),
    nominativo VARCHAR(255) NOT NULL,
    specializzazione VARCHAR(255) NOT NULL,
    repartoRIF INTEGER,
    FOREIGN KEY (repartoRIF) REFERENCES Reparto(repartoID) ON DELETE SET NULL
);

-- INSERT INTO Medico(nominativo, specializzazione, repartoRIF) VALUES
-- ("Giovanni", "Pneumologo", 2);
-- SELECT * FROM Medico;


CREATE TABLE Ricovero(
	ricoveroID INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_ricovero DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_uscita DATETIME,
    repartoRIF INTEGER NOT NULL,
    pazienteRIF INTEGER NOT NULL,
	FOREIGN KEY (repartoRIF) REFERENCES Reparto(repartoID) ON DELETE CASCADE,
	FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE
);


CREATE TABLE Visita(
	visitaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_visita DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    note TEXT,
    medicoRIF INTEGER NOT NULL,
    pazienteRIF INTEGER NOT NULL,
    ricoveroRIF  INTEGER,
    FOREIGN KEY (medicoRIF) REFERENCES Medico(medicoID) ON DELETE CASCADE,
	FOREIGN KEY (pazienteRIF) REFERENCES Paziente(pazienteID) ON DELETE CASCADE,
	FOREIGN KEY (ricoveroRIF) REFERENCES Ricovero(ricoveroID) ON DELETE CASCADE
);

INSERT INTO Paziente (nome, cognome, cod_fis, data_nas) VALUES
("Luca", "Rossi", "RSSLCU80A01H501Z", "1980-01-01"),
("Maria", "Bianchi", "BNCMRA85C15H501Y", "1985-03-15"),
("Giulia", "Verdi", "VRDGLI90D20H501X", "1990-04-20"),
("Marco", "Neri", "NERMRC75E10H501W", "1975-05-10"),
("Elena", "Russo", "RSSLNE92F05H501V", "1992-06-05"),
("Paolo", "Ferrari", "FRRPLA88G18H501U", "1988-07-18"),
("Chiara", "Romano", "RMNCHR95H22H501T", "1995-08-22"),
("Davide", "Gallo", "GLLDVD70L30H501S", "1970-12-30"),
("Sara", "Fontana", "FNTSSR93M12H501R", "1993-12-12"),
("Andrea", "Greco", "GRCNDR82B28H501Q", "1982-02-28");

INSERT INTO Reparto (nome, max_paz) VALUES
("Neurologia", 20),
("Ortopedia", 25),
("Oncologia", 30),
("Ginecologia", 15),
("Pediatria", 18),
("Dermatologia", 12),
("Chirurgia", 22),
("Oculistica", 10);

INSERT INTO Medico (nominativo, specializzazione, repartoRIF) VALUES
("Giovanni Esposito", "Cardiologo", 1),
("Francesca Marino", "Pneumologo", 2),
("Alberto De Luca", "Neurologo", 3),
("Serena Vitale", "Ortopedico", 4),
("Matteo Rinaldi", "Oncologo", 5),
("Laura Conti", "Ginecologa", 6),
("Riccardo Serra", "Pediatra", 7),
("Silvia Moretti", "Dermatologa", 8),
("Giorgio Palmieri", "Chirurgo", 9),
("Valentina Costa", "Oculista", 10);

INSERT INTO Ricovero (data_ricovero, data_uscita, repartoRIF, pazienteRIF) VALUES
("2024-01-10 10:00:00", "2024-01-15 12:00:00", 1, 1),
("2024-02-05 09:30:00", NULL, 2, 2),
("2024-03-12 14:00:00", "2024-03-20 09:00:00", 3, 3),
("2024-04-01 08:00:00", NULL, 4, 4),
("2024-05-18 11:15:00", "2024-05-25 16:00:00", 5, 5),
("2024-06-22 17:45:00", NULL, 6, 6),
("2024-07-10 13:20:00", "2024-07-14 10:00:00", 7, 7),
("2024-08-03 07:50:00", NULL, 8, 8),
("2024-09-19 19:00:00", "2024-09-22 09:30:00", 9, 9),
("2024-10-25 10:10:00", NULL, 10, 10);


INSERT INTO Esame (tipo, esito, data_esame, pazienteRIF) VALUES
("Sangue", "Valori nella norma", "2024-01-11 09:00:00", 1),
("Urine", "Leggera disidratazione", "2024-02-06 10:30:00", 2),
("Feci", "Nessuna anomalia", "2024-03-13 11:00:00", 3),
("Sangue", "Colesterolo alto", "2024-04-02 08:45:00", 4),
("Urine", "Presenza di proteine", "2024-05-19 12:00:00", 5),
("Feci", "Infezione batterica", "2024-06-23 15:20:00", 6),
("Sangue", "Anemia lieve", "2024-07-11 09:15:00", 7),
("Urine", "Normale", "2024-08-04 10:10:00", 8),
("Feci", "Parassiti assenti", "2024-09-20 14:40:00", 9),
("Sangue", "Glicemia alta", "2024-10-26 11:50:00", 10);

INSERT INTO Visita (data_visita, note, medicoRIF, pazienteRIF, ricoveroRIF) VALUES
("2024-01-12 10:00:00", "Controllo cardiaco", 1, 1, 1),
("2024-02-07 11:30:00", "Valutazione respiratoria", 2, 2, 2),
("2024-03-14 09:45:00", "Test neurologici", 3, 3, 3),
("2024-04-03 16:00:00", "Controllo post-operatorio", 4, 4, 4),
("2024-05-20 10:20:00", "Monitoraggio terapia", 5, 5, 5),
("2024-06-24 14:10:00", "Visita ginecologica", 6, 6, 6),
("2024-07-12 08:30:00", "Controllo pediatrico", 7, 7, 7),
("2024-08-05 12:00:00", "Valutazione dermatologica", 8, 8, 8),
("2024-09-21 15:00:00", "Follow-up chirurgico", 9, 9, 9),
("2024-10-27 09:40:00", "Esame oculistico", 10, 10, 10);


-- Tutti i pazienti di un reparto
SELECT * 
	FROM Reparto
    JOIN Ricovero ON Reparto.repartoID = Ricovero.repartoRIF
    JOIN Paziente ON Ricovero.pazienteRIF = Paziente.pazienteID;
    
-- 
SELECT Reparto.nome AS "reparto", Paziente.nome, cognome, cod_fis, data_ricovero, data_uscita
	FROM Reparto
    JOIN Ricovero ON Reparto.repartoID = Ricovero.repartoRIF
    JOIN Paziente ON Ricovero.pazienteRIF = Paziente.pazienteID;
    
CREATE VIEW dettaglio_ricoveri AS
	SELECT Reparto.nome AS "reparto", Paziente.nome, cognome, cod_fis, data_ricovero, data_uscita
		FROM Reparto
		JOIN Ricovero ON Reparto.repartoID = Ricovero.repartoRIF
		JOIN Paziente ON Ricovero.pazienteRIF = Paziente.pazienteID;

DROP VIEW dettaglio_ricoveri;

SELECT * 
	FROM dettaglio_ricoveri 
    WHERE reparto IN("Pediatria", "Neurologia") AND data_uscita IS NOT NULL;

-- Tutti i pazienti visitati da uno specifico medico
CREATE VIEW dati_visite AS
	SELECT 	nominativo AS "medico", 
			data_visita, 
			note, 
			CONCAT(nome, " ",cognome) AS Paziente
		FROM Medico
		JOIN Visita ON Medico.medicoID = Visita.medicoRIF
		JOIN Paziente ON Visita.pazienteRIF = Paziente.pazienteID;

SELECT * FROM dati_visite;