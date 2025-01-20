CREATE TABLE Gares (
    idGare INT PRIMARY KEY,
    Localisation VARCHAR(255),
    Nom VARCHAR(255),
    Nb_quais INT
);

CREATE TABLE Trains (
    idTrain INT PRIMARY KEY,
    Type VARCHAR(255),
    Capacite INT,
    HeuresCumulees INT
);

CREATE TABLE Lignes (
    idLigne INT PRIMARY KEY,
    Gares_idGARE INT,
    Trains_idTrain INT,
    FOREIGN KEY (Gares_idGARE) REFERENCES Gares(idGare),
    FOREIGN KEY (Trains_idTrain) REFERENCES Trains(idTrain)
);

CREATE TABLE Maintenance (
    nomM VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Trajet (
   	Ville1 VARCHAR(255),
   	Ville2 VARCHAR(255),
    PRIMARY KEY (Ville1, Ville2)
);

CREATE TABLE Passe_par (
    idTrain INT,
    idGare INT,
    PRIMARY KEY (idTrain, idGare),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare)
);

CREATE TABLE Equipements (
    Nom VARCHAR(255),
    idGare INT,
    nombre INT,
    PRIMARY KEY (Nom, idGare),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare)
);

CREATE TABLE Incidents (
    id_inci INT PRIMARY KEY,
    idLigne INT,
    Type VARCHAR(255),
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne)
);


CREATE TABLE Affecte (
    id_inci INT,
    idGare INT,
    PRIMARY KEY (id_inci, idGare),
    FOREIGN KEY (id_inci) REFERENCES Incidents(id_inci),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare)
);


CREATE TABLE Maintenance_de_Train (
    nomM VARCHAR(255),
    idTrain INT,
    PRIMARY KEY (nomM, idTrain),
    FOREIGN KEY (nomM) REFERENCES Maintenance(nomM),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain)
);

CREATE TABLE Maintenance_de_Gares (
    nomM VARCHAR(255),
    idGare INT,
    PRIMARY KEY (nomM, idGare),
    FOREIGN KEY (nomM) REFERENCES Maintenance(nomM),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare)
);

CREATE TABLE Maintenance_de_Ligne (
    nomM VARCHAR(255),
    idLigne INT,
    PRIMARY KEY (nomM, idLigne),
    FOREIGN KEY (nomM) REFERENCES Maintenance(nomM),
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne)
);

CREATE TABLE Dessert (
    idGare INT,
    idLigne INT,
    PRIMARY KEY (idGare, idLigne),
    FOREIGN KEY (idGare) REFERENCES Gares(idGare),
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne)
);

CREATE TABLE Horaires (
    idTrain INT,
    idLigne INT,
    Heure TIME,
    PRIMARY KEY (idTrain, idLigne, Heure),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain),
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne)
);

CREATE TABLE Retarde (
    id_inci INT,
    idTrain INT,
    idLigne INT,
    Heure TIME,
    Décalage TIME,
    PRIMARY KEY (id_inci, idTrain, idLigne),
    FOREIGN KEY (id_inci) REFERENCES Incidents(id_inci),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain),
    FOREIGN KEY (idLigne) REFERENCES Lignes(idLigne)
);

CREATE TABLE Effectue (
	idTrain INT,
	Ville1 VARCHAR(255), 
	Ville2 VARCHAR(255),
	PRIMARY KEY (idTrain, Ville1, Ville2),
    FOREIGN KEY (idTrain) REFERENCES Trains(idTrain),
    FOREIGN KEY (Ville1, Ville2) REFERENCES Trajet(Ville1, Ville2)
);