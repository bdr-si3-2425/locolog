-- ATTENTION : A CHAQUE EXECUTION, TOUTES LES DONNEES DISPARAITRONT
DELETE FROM Trains;
INSERT INTO Trains (idTrain, type, capacite, heuresCumulees) VALUES 
(101, 'TGV', 300, 1200),
(102, 'TER', 200, 800),
(103, 'Intercites', 250, 1000),
(104, 'TGV', 320, 1500),
(105, 'TER', 180, 600),
(106, 'Intercites', 260, 1100),
(107, 'TGV', 350, 1400),
(108, 'TER', 220, 900),
(109, 'Intercites', 240, 950),
(110, 'TGV', 330, 1300),
(111, 'TER', 210, 850),
(112, 'Intercites', 270, 1050);

DELETE FROM Gares;
INSERT INTO Gares (idGare, localisation, nom, nbQuais) VALUES 
(1, 'Paris', 'Gare du Nord', 15),
(2, 'Paris', 'Gare de Lyon', 13),
(3, 'Marseille', 'Gare Saint-Charles', 9),
(4, 'Bordeaux', 'Gare Saint-Jean', 8),
(5, 'Lyon', 'Gare Part-Dieu', 11),
(6, 'Nice', 'Gare de Nice-Ville', 12),
(7, 'Toulouse', 'Gare de Toulouse-Matabiau', 10),
(8, 'Lille', 'Gare de Lille-Flandres', 10),
(9, 'Strasbourg', 'Gare de Strasbourg', 13),
(10, 'Nantes', 'Gare de Nantes', 15),
(11, 'Montpellier', 'Gare de Montpellier-Saint-Roch', 9),
(12, 'Le Mans', 'Gare du Mans', 8),
(13, 'Dijon', 'Gare de Dijon-Ville', 5);

DELETE FROM Lignes;
INSERT INTO Lignes (idLigne) VALUES 
(1),
(2),
(3);

DELETE FROM Maintenances;
INSERT INTO Maintenances (nom) VALUES 
--Rien a signaler 
('R.A.S'),
--Maintenances de Gares 
('Bouches_egouts'),
('Panneaux_Affichage'),
('Quai_Endommage'),
('Escalator_Defectueux'),
('Panne_Wifi'),
--Maintenance de Trains
('Climatisation'),
('Lubrification'),
('Inspec_Roues'),
('Portes_Automatiques'),
--Maintenance de Lignes 
('Rails_fissure'),
('Debris_Sur_Voies'),
('Systeme_Drainage'),
('Tunnel_febrile'),
('Pont_febrile');

-- A REVOIR
DELETE FROM Trajets;
INSERT INTO Trajets (train, depart, arrivee, date, heure, duree) VALUES 
(101, 1, 5, DATE '2000-01-01', '00:00:00', '00:00:00'), --TGV
(101, 5, 3, DATE '2000-01-01', '00:00:00', '00:00:00'), --TGV
(101, 6, 3, DATE '2000-01-01', '00:00:00', '00:00:00'), --TER
(102, 2, 3, DATE '2000-01-01', '00:00:00', '00:00:00'),
(104, 1, 5, DATE '2000-01-01', '00:00:00', '00:00:00'),
(104, 5, 3, DATE '2000-01-01', '00:00:00', '00:00:00'),
(104, 6, 3, DATE '2000-01-01', '00:00:00', '00:00:00'),
(105, 12, 10, DATE '2000-01-01', '00:00:00', '00:00:00'),
(105, 10, 4, DATE '2000-01-01', '00:00:00', '00:00:00'),
(105, 7, 4, DATE '2000-01-01', '00:00:00', '00:00:00'),
(106, 6, 7, DATE '2000-01-01', '00:00:00', '00:00:00'),
(107, 7, 4, DATE '2000-01-01', '00:00:00', '00:00:00'),
(109, 6, 5, DATE '2000-01-01', '00:00:00', '00:00:00'),
(109, 6, 3, DATE '2000-01-01', '00:00:00', '00:00:00'),
(110, 5, 7, DATE '2000-01-01', '00:00:00', '00:00:00'),
(110, 7, 4, DATE '2000-01-01', '00:00:00', '00:00:00'),
(111, 13, 8, DATE '2000-01-01', '00:00:00', '00:00:00'),
(112, 6, 3, DATE '2000-01-01', '00:00:00', '00:00:00'),
(112, 6, 7, DATE '2000-01-01', '00:00:00', '00:00:00');

/*
('Marseille', 'Montpellier'), --TER
('Bordeaux', 'Marseille'), --Intercite
('Bordeaux', 'Lille'), --TGV
('Toulouse', 'Lille'), --TGV
('Strasbourg', 'Paris'), --TGV
('Strasbourg', 'Lyon'), --TGV
('Lyon', 'Lille'), --TGV
('Nantes', 'Paris'), --TGV
('Le Mans', 'Lyon'), -- TGV 
('Montpellier', 'Lyon'), --TGV
('Montpellier', 'Bordeaux'), --Intercite
('Montpellier', 'Toulouse'),--TER*/

DELETE FROM Equipements;
INSERT INTO Equipements (Nom) VALUES 
('Escalators'), -- Gare du Nord (Paris)
('Bornes Billets'),
('Ascenseurs'),
('WiFi'),
('Gilets de securite'),
('Autolaveuses'),
('Barrieres de securite'),
('Chariot de menage');

DELETE FROM Incidents;
INSERT INTO Incidents (type) VALUES 
('Affaissement'),
('Deraillement partiel'),
('');

DELETE FROM Dessert;
INSERT INTO Dessert (idGare, idLigne) VALUES 
(1, 1),
(2, 2),
(3, 3);

DELETE FROM Est_equipee;
INSERT INTO Est_equipee (idGare, nomEquipement, quantite) VALUES 
(1, 'Escalators', 5), -- Gare du Nord (Paris)
(1, 'Bornes Billets', 20),
(1, 'Ascenseurs', 10),
(1, 'WiFi', 15),
(1, 'Gilets de securite', 50),
(1, 'Autolaveuses', 4),
(1, 'Barrieres de securite', 25),
(1, 'Chariot de menage', 10),

(2, 'Escalators', 4), -- Gare de Lyon (Lyon)
(2, 'Bornes Billets', 10),
(2, 'Ascenseurs', 5),
(2, 'WiFi', 12),
(2, 'Gilets de securite', 40),
(2, 'Autolaveuses', 3),
(2, 'Barrieres de securite', 20),
(2, 'Chariot de menage', 8),

(3, 'Escalators', 3), -- Gare Saint-Charles (Marseille)
(3, 'Bornes Billets', 8),
(3, 'Ascenseurs', 3),
(3, 'WiFi', 10),
(3, 'Gilets de securite', 30),
(3, 'Autolaveuses', 2),
(3, 'Barrieres de securite', 15),
(3, 'Chariot de menage', 6),

(4, 'Escalators', 2), -- Gare Saint-Jean (Bordeaux)
(4, 'Bornes Billets', 7),
(4, 'Ascenseurs', 2),
(4, 'WiFi', 7),
(4, 'Gilets de securite', 25),
(4, 'Autolaveuses', 1),
(4, 'Barrieres de securite', 10),
(4, 'Chariot de menage', 5),

(5, 'Escalators', 4), -- Gare Part-Dieu (Lyon)
(5, 'Bornes Billets', 9),
(5, 'Ascenseurs', 4),
(5, 'WiFi', 10),
(5, 'Gilets de securite', 35),
(5, 'Autolaveuses', 3),
(5, 'Barrieres de securite', 15),
(5, 'Chariot de menage', 7),

(6, 'Escalators', 3), -- Gare de Nice-Ville (Nice)
(6, 'Bornes Billets', 8),
(6, 'Ascenseurs', 3),
(6, 'WiFi', 9),
(6, 'Gilets de securite', 30),
(6, 'Autolaveuses', 2),
(6, 'Barrieres de securite', 12),
(6, 'Chariot de menage', 6),

(7, 'Escalators', 3), -- Gare de Toulouse-Matabiau (Toulouse)
(7, 'Bornes Billets', 8),
(7, 'Ascenseurs', 3),
(7, 'WiFi', 9),
(7, 'Gilets de securite', 30),
(7, 'Autolaveuses', 2),
(7, 'Barrieres de securite', 12),
(7, 'Chariot de menage', 6),

(8, 'Escalators', 3), -- Gare de Lille-Flandres (Lille)
(8, 'Bornes Billets', 8),
(8, 'Ascenseurs', 3),
(8, 'WiFi', 9),
(8, 'Gilets de securite', 30),
(8, 'Autolaveuses', 2),
(8, 'Barrieres de securite', 12),
(8, 'Chariot de menage', 6),

(9, 'Escalators', 4), -- Gare de Strasbourg (Strasbourg)
(9, 'Bornes Billets', 9),
(9, 'Ascenseurs', 4),
(9, 'WiFi', 10),
(9, 'Gilets de securite', 35),
(9, 'Autolaveuses', 3),
(9, 'Barrieres de securite', 15),
(9, 'Chariot de menage', 7),

(10, 'Escalators', 5), -- Gare de Nantes (Nantes)
(10, 'Bornes Billets', 10),
(10, 'Ascenseurs', 5),
(10, 'WiFi', 12),
(10, 'Gilets de securite', 40),
(10, 'Autolaveuses', 4),
(10, 'Barrieres de securite', 20),
(10, 'Chariot de menage', 8),

(11, 'Escalators', 3), -- Gare de Montpellier-Saint-Roch (Montpellier)
(11, 'Bornes Billets', 8),
(11, 'Ascenseurs', 3),
(11, 'WiFi', 9),
(11, 'Gilets de securite', 30),
(11, 'Autolaveuses', 2),
(11, 'Barrieres de securite', 12),
(11, 'Chariot de menage', 6);

-- A FAIRE
DELETE FROM Maintenances_de_Train;
INSERT INTO Maintenances_de_Train (nom, idTrain, date, heure, duree) VALUES 
('R.A.S', 101,'2000-01-01','00:00:00','00:00:00');

DELETE FROM Maintenances_de_Gare;
INSERT INTO Maintenances_de_Gare (nom, idGare, date, heure, duree) VALUES
('R.A.S', 1,'2000-01-01','00:00:00','00:00:00');

DELETE FROM Maintenances_de_Ligne;
INSERT INTO Maintenances_de_Ligne (nom, idLigne, date, heure, gareDebut, gareFin, duree) VALUES
('R.A.S', 1,'2000-01-01','00:00:00', 1, 1,'00:00:00');


DELETE FROM Incidents_de_Train;
INSERT INTO Incidents_de_Train (type, idTrain, date, heure, duree) VALUES
('', 101,'2000-01-01','00:00:00','00:00:00');

DELETE FROM Incidents_de_Gare;
INSERT INTO Incidents_de_Gare (type, idGare, date, heure, duree) VALUES
('', 1,'2000-01-01','00:00:00','00:00:00');

DELETE FROM Incidents_de_Ligne;
INSERT INTO Incidents_de_Ligne (type, idLigne, date, heure, gareDebut, gareFin, duree) VALUES
('', 1,'2000-01-01','00:00:00', 1, 1,'00:00:00');




/*

INSERT INTO Passe_par (idTrain, idGare) VALUES 
(101, 1), -- Train 101 passe par Gare du Nord (Paris)
(101, 2), -- Train 101 passe par Gare de Lyon (Lyon)
(101, 3), -- Train 101 passe par Gare Saint-Charles (Marseille)
(101, 6), -- Train 101 passe par Gare de Nice-Ville (Nice)
(102, 2), -- Train 102 passe par Gare de Lyon (Lyon)
(102, 3), -- Train 102 passe par Gare Saint-Charles (Marseille)
(102, 7), -- Train 102 passe par Gare de Toulouse-Matabiau (Toulouse)
(103, 3), -- Train 103 passe par Gare Saint-Charles (Marseille)
(103, 4), -- Train 103 passe par Gare Saint-Jean (Bordeaux)
(103, 10), -- Train 103 passe par Gare de Nantes (Nantes)
(104, 1), -- Train 104 passe par Gare du Nord (Paris)
(104, 3), -- Train 104 passe par Gare Saint-Charles (Marseille)
(104, 6), -- Train 104 passe par Gare de Nice-Ville (Nice)
(105, 1), -- Train 105 passe par Gare du Nord (Paris)
(105, 4), -- Train 105 passe par Gare Saint-Jean (Bordeaux)
(105, 7), -- Train 105 passe par Gare de Toulouse-Matabiau (Toulouse)
(106, 1), -- Train 106 passe par Gare du Nord (Paris)
(106, 6), -- Train 106 passe par Gare de Nice-Ville (Nice)
(106, 7), -- Train 106 passe par Gare de Toulouse-Matabiau (Toulouse)
(107, 1), -- Train 107 passe par Gare du Nord (Paris)
(107, 7), -- Train 107 passe par Gare de Toulouse-Matabiau (Toulouse)
(107, 4), -- Train 107 passe par Gare Saint-Jean (Bordeaux)
(108, 1), -- Train 108 passe par Gare du Nord (Paris)
(108, 8), -- Train 108 passe par Gare de Lille-Flandres (Lille)
(108, 9), -- Train 108 passe par Gare de Strasbourg (Strasbourg)
(109, 2), -- Train 109 passe par Gare de Lyon (Lyon)
(109, 6); -- Train 109 passe par Gare de Nice-Ville 



INSERT INTO Horaires (idTrain, idLigne, Heure) VALUES 
(101, 1, '08:00:00'),
(102, 2, '10:30:00'),
(103, 3, '15:00:00');


INSERT INTO Incidents (id_inci, idLigne, Type) VALUES 
(1, 1, 'Affaissement'),
(2, 2, 'Deraillement partiel'),
(3, 3, '');


INSERT INTO Retarde (id_inci, idTrain, idLigne, Heure, Décalage) VALUES 
(1, 101, 1, '08:00:00', '00:30:00'),
(2, 102, 2, '10:30:00', '01:00:00'),
(3, 103, 3, '15:00:00', '00:45:00');

INSERT INTO Maintenance_de_Gares (nomM, idGare) VALUES 
('Systeme_Drainage', 1),
('Panneaux_Affichage', 2),
('Quai_Endommage', 3);


INSERT INTO Affecte (id_inci, idGare) VALUES 
(1, 1),
(2, 2),
(3, 3);
*/