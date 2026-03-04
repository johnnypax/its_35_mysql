CREATE DATABASE lez11_affittacamere;
USE lez11_affittacamere;

CREATE TABLE Albergo(
	albergoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    valutazione INTEGER CHECK (valutazione BETWEEN 1 AND 5)
);

CREATE TABLE Camera(
	cameraID INTEGER PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(255) NOT NULL,
    albergoRIF INTEGER NOT NULL,
    capacita INTEGER CHECK (capacita <= 5),
    FOREIGN KEY (albergoRIF) REFERENCES Albergo(albergoID) ON DELETE CASCADE,
    UNIQUE(numero, albergoRIF)
);