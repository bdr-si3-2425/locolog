DROP TABLE IF EXISTS Trains CASCADE;
CREATE TABLE Trains (
    idTrain INT PRIMARY KEY,
    type VARCHAR(255),
    capacite INT,
    heuresCumulees INT
);

DROP TABLE IF EXISTS Gares CASCADE;
CREATE TABLE Gares (
    idGare INT PRIMARY KEY,
    localisation VARCHAR(255),
    nom VARCHAR(255),
    nbQuais INT
);

DROP TABLE IF EXISTS Lignes CASCADE;
CREATE TABLE Lignes (
    idLigne INT PRIMARY KEY
);

DROP TABLE IF EXISTS Maintenances CASCADE;
CREATE TABLE Maintenances (
    nom VARCHAR(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Trajets CASCADE;
CREATE TABLE Trajets (
    train INT,
   	depart INT,
   	arrivee INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (train, depart, arrivee, date, heure),
    FOREIGN KEY (train) REFERENCES Trains(idTrain) ON DELETE CASCADE,
    FOREIGN KEY (depart) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (arrivee) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Equipements CASCADE;
CREATE TABLE Equipements (
    nom VARCHAR(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Incidents CASCADE;
CREATE TABLE Incidents (
    type VARCHAR(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Dessert CASCADE;
CREATE TABLE Dessert (
    idGare INT,
    idLigne INT,
    PRIMARY KEY (idGare, idLigne),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Est_equipee CASCADE;
CREATE TABLE Est_equipee (
    idGare INT,
    nomEquipement VARCHAR(255),
    quantite INT,
    PRIMARY KEY (idGare, nomEquipement),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (nomEquipement) REFERENCES Equipements(nom) ON DELETE CASCADE
);

-- Tables de jointure de Maintenances

DROP TABLE IF EXISTS Maintenances_de_Train CASCADE;
CREATE TABLE Maintenances_de_Train (
    nom VARCHAR(255),
    idTrain INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (nom, idTrain, date, heure),
    FOREIGN KEY (nom) REFERENCES Maintenances(nom) ON DELETE CASCADE,
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Maintenances_de_Gare CASCADE;
CREATE TABLE Maintenances_de_Gare (
    nom VARCHAR(255),
    idGare INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (nom, idGare, date, heure),
    FOREIGN KEY (nom) REFERENCES Maintenances(nom) ON DELETE CASCADE,
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Maintenances_de_Ligne CASCADE;
CREATE TABLE Maintenances_de_Ligne (
    nom VARCHAR(255),
    idLigne INT,
    date DATE,
    heure TIME,
    gareDebut INT,
    gareFin INT,
    duree INTERVAL,
    PRIMARY KEY (nom, idLigne, date, heure, gareDebut, gareFin),
    FOREIGN KEY (nom) REFERENCES Maintenances(nom) ON DELETE CASCADE,
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne) ON DELETE CASCADE,
    FOREIGN KEY (gareDebut) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (gareFin) REFERENCES Gares(idGare) ON DELETE CASCADE
);

-- Tables de jointure de Incidents

DROP TABLE IF EXISTS Incidents_de_Train CASCADE;
CREATE TABLE Incidents_de_Train (
    type VARCHAR(255),
    idTrain INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (type, idTrain, date, heure),
    FOREIGN KEY (type) REFERENCES Incidents(type) ON DELETE CASCADE,
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Incidents_de_Gare CASCADE;
CREATE TABLE Incidents_de_Gare (
    type VARCHAR(255),
    idGare INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (type, idGare, date, heure),
    FOREIGN KEY (type) REFERENCES Incidents(type) ON DELETE CASCADE,
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Incidents_de_Ligne CASCADE;
CREATE TABLE Incidents_de_Ligne (
    type VARCHAR(255),
    idLigne INT,
    date DATE,
    heure TIME,
    gareDebut INT,
    gareFin INT,
    duree INTERVAL,
    PRIMARY KEY (type, idLigne, date, heure, gareDebut, gareFin),
    FOREIGN KEY (type) REFERENCES Incidents(type) ON DELETE CASCADE,
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne) ON DELETE CASCADE,
    FOREIGN KEY (gareDebut) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (gareFin) REFERENCES Gares(idGare) ON DELETE CASCADE
);
