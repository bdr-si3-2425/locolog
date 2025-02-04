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
    nomG VARCHAR(255),
    nbQuais INT
);

DROP TABLE IF EXISTS Lignes CASCADE;
CREATE TABLE Lignes (
    idLigne INT PRIMARY KEY
);

DROP TABLE IF EXISTS Maintenances CASCADE;
CREATE TABLE Maintenances (
    nomM VARCHAR(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Trajets CASCADE;
CREATE TABLE Trajets (
    idTrain INT,
   	idGareDepart INT,
   	idGareArrivee INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (idTrain, idGareDepart, idGareArrivee, date, heure),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain) ON DELETE CASCADE,
    FOREIGN KEY (idGareDepart) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (idGareArrivee) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Equipements CASCADE;
CREATE TABLE Equipements (
    nomE VARCHAR(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Incidents CASCADE;
CREATE TABLE Incidents (
    typeI VARCHAR(255) PRIMARY KEY
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
    nomE VARCHAR(255),
    quantite INT,
    PRIMARY KEY (idGare, nomE),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (nomE) REFERENCES Equipements(nomE) ON DELETE CASCADE
);

-- Tables de jointure de Maintenances

DROP TABLE IF EXISTS Maintenances_de_Train CASCADE;
CREATE TABLE Maintenances_de_Train (
    nomM VARCHAR(255),
    idTrain INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (nomM, idTrain, date, heure),
    FOREIGN KEY (nomM) REFERENCES Maintenances(nomM) ON DELETE CASCADE,
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Maintenances_de_Gare CASCADE;
CREATE TABLE Maintenances_de_Gare (
    nomM VARCHAR(255),
    idGare INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (nomM, idGare, date, heure),
    FOREIGN KEY (nomM) REFERENCES Maintenances(nomM) ON DELETE CASCADE,
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Maintenances_de_Ligne CASCADE;
CREATE TABLE Maintenances_de_Ligne (
    nomM VARCHAR(255),
    idLigne INT,
    date DATE,
    heure TIME,
    idGareDebut INT,
    idGareArrivee INT,
    duree INTERVAL,
    PRIMARY KEY (nomM, idLigne, date, heure, idGareDebut, idGareArrivee),
    FOREIGN KEY (nomM) REFERENCES Maintenances(nomM) ON DELETE CASCADE,
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne) ON DELETE CASCADE,
    FOREIGN KEY (idGareDebut) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (idGareArrivee) REFERENCES Gares(idGare) ON DELETE CASCADE
);

-- Tables de jointure de Incidents

DROP TABLE IF EXISTS Incidents_de_Train CASCADE;
CREATE TABLE Incidents_de_Train (
    typeI VARCHAR(255),
    idTrain INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (typeI, idTrain, date, heure),
    FOREIGN KEY (typeI) REFERENCES Incidents(typeI) ON DELETE CASCADE,
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Incidents_de_Gare CASCADE;
CREATE TABLE Incidents_de_Gare (
    typeI VARCHAR(255),
    idGare INT,
    date DATE,
    heure TIME,
    duree INTERVAL,
    PRIMARY KEY (typeI, idGare, date, heure),
    FOREIGN KEY (typeI) REFERENCES Incidents(typeI) ON DELETE CASCADE,
    FOREIGN KEY (idGare) REFERENCES Gares(idGare) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Incidents_de_Ligne CASCADE;
CREATE TABLE Incidents_de_Ligne (
    typeI VARCHAR(255),
    idLigne INT,
    date DATE,
    heure TIME,
    idGareDebut INT,
    idGareArrivee INT,
    duree INTERVAL,
    PRIMARY KEY (typeI, idLigne, date, heure, idGareDebut, idGareArrivee),
    FOREIGN KEY (typeI) REFERENCES Incidents(typeI) ON DELETE CASCADE,
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne) ON DELETE CASCADE,
    FOREIGN KEY (idGareDebut) REFERENCES Gares(idGare) ON DELETE CASCADE,
    FOREIGN KEY (idGareArrivee) REFERENCES Gares(idGare) ON DELETE CASCADE
);
