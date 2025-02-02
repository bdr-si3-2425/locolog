INSERT INTO Maintenance (nomM) VALUES *
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


INSERT INTO Gares (idGare, Localisation, Nom, Nb_quais) VALUES 
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
(11, 'Montpellier', 'Gare de Montpellier-Saint-Roch', 9);


INSERT INTO Trains (idTrain, Type, Capacite, HeuresCumulees) VALUES 
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



INSERT INTO Trajet (Ville1, Ville2) VALUES 
('Paris', 'Lyon'),
('Lyon', 'Marseille'),
('Marseille', 'Bordeaux'),
('Bordeaux', 'Paris'),
('Paris', 'Marseille'),
('Paris', 'Bordeaux'),
('Paris', 'Nice'),
('Paris', 'Toulouse'),
('Paris', 'Lille'),
('Lyon', 'Nice'),
('Lyon', 'Toulouse'),
('Lyon', 'Lille'),
('Marseille', 'Nice'),
('Marseille', 'Toulouse'),
('Marseille', 'Lille'),
('Bordeaux', 'Nice'),
('Bordeaux', 'Toulouse'),
('Bordeaux', 'Lille'),
('Nice', 'Toulouse'),
('Nice', 'Lille'),
('Toulouse', 'Lille'),
('Strasbourg', 'Paris'),
('Strasbourg', 'Lyon'),
('Strasbourg', 'Marseille'),
('Strasbourg', 'Bordeaux'),
('Strasbourg', 'Nice'),
('Strasbourg', 'Toulouse'),
('Strasbourg', 'Lille'),
('Nantes', 'Paris'),
('Nantes', 'Lyon'),
('Nantes', 'Marseille'),
('Nantes', 'Bordeaux'),
('Nantes', 'Nice'),
('Nantes', 'Toulouse'),
('Nantes', 'Lille'),
('Montpellier', 'Paris'),
('Montpellier', 'Lyon'),
('Montpellier', 'Marseille'),
('Montpellier', 'Bordeaux'),
('Montpellier', 'Nice'),
('Montpellier', 'Toulouse'),
('Montpellier', 'Lille');

INSERT INTO Effectue (idTrain, Ville1, Ville2) VALUES 
(101, 'Paris', 'Lyon'),
(101, 'Lyon', 'Marseille'),
(101, 'Marseille', 'Nice'),
(102, 'Lyon', 'Marseille'),
(102, 'Marseille', 'Toulouse'),
(103, 'Marseille', 'Bordeaux'),
(103, 'Bordeaux', 'Nantes'),
(104, 'Paris', 'Marseille'),
(104, 'Marseille', 'Nice'),
(105, 'Paris', 'Bordeaux'),
(105, 'Bordeaux', 'Toulouse'),
(106, 'Paris', 'Nice'),
(106, 'Nice', 'Toulouse'),
(107, 'Paris', 'Toulouse'),
(107, 'Toulouse', 'Bordeaux'),
(108, 'Paris', 'Lille'),
(108, 'Lille', 'Strasbourg'),
(109, 'Lyon', 'Nice'),
(109, 'Nice', 'Marseille'),
(110, 'Lyon', 'Toulouse'),
(110, 'Toulouse', 'Bordeaux'),
(111, 'Lyon', 'Lille'),
(111, 'Lille', 'Paris'),
(112, 'Marseille', 'Nice'),
(112, 'Nice', 'Toulouse');

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
(109, 6), -- Train 109 passe par Gare de


INSERT INTO Lignes (idLigne, Gares_idGARE, Trains_idTrain) VALUES 
(1, 1, 101),
(2, 2, 102),
(3, 3, 103);


INSERT INTO Dessert (idGare, idLigne) VALUES 
(1, 1),
(2, 2),
(3, 3);


INSERT INTO Horaires (idTrain, idLigne, Heure) VALUES 
(101, 1, '08:00:00'),
(102, 2, '10:30:00'),
(103, 3, '15:00:00');


INSERT INTO Incidents (id_inci, idLigne, Type) VALUES 
(1, 1, 'Affaissement'),
(2, 2, 'Deraillement partiel'),
(3, 3, '');


INSERT INTO Retarde (id_inci, idTrain, idLigne, Heure, Decalage) VALUES 
(1, 101, 1, '08:00:00', '00:30:00'),
(2, 102, 2, '10:30:00', '01:00:00'),
(3, 103, 3, '15:00:00', '00:45:00');


INSERT INTO Maintenance_de_Train (nomM, idTrain) VALUES 
--A remplir 


INSERT INTO Maintenance_de_Gares (nomM, idGare) VALUES 
('Systeme_Drainage', 1),
('Panneaux_Affichage', 2),
('Quai_Endommage', 3);


INSERT INTO Maintenance_de_Ligne (nomM, idLigne) VALUES 
--A remplir


INSERT INTO Equipements (Nom, idGare, nombre) VALUES 
('Escalators', 1, 5), -- Gare du Nord (Paris)
('Bornes Billets', 1, 20),
('Ascenseurs', 1, 10),
('WiFi', 1, 15),
('Gilets de securite', 1, 50),
('Autolaveuses', 1, 4),
('Barrieres de securite', 1, 25),
('Chariot de menage', 1, 10),

('Escalators', 2, 4), -- Gare de Lyon (Lyon)
('Bornes Billets', 2, 10),
('Ascenseurs', 2, 5),
('WiFi', 2, 12),
('Gilets de securite', 2, 40),
('Autolaveuses', 2, 3),
('Barrieres de securite', 2, 20),
('Chariot de menage', 2, 8),

('Escalators', 3, 3), -- Gare Saint-Charles (Marseille)
('Bornes Billets', 3, 8),
('Ascenseurs', 3, 3),
('WiFi', 3, 10),
('Gilets de securite', 3, 30),
('Autolaveuses', 3, 2),
('Barrieres de securite', 3, 15),
('Chariot de menage', 3, 6),

('Escalators', 4, 2), -- Gare Saint-Jean (Bordeaux)
('Bornes Billets', 4, 7),
('Ascenseurs', 4, 2),
('WiFi', 4, 7),
('Gilets de securite', 4, 25),
('Autolaveuses', 4, 1),
('Barrieres de securite', 4, 10),
('Chariot de menage', 4, 5),

('Escalators', 5, 4), -- Gare Part-Dieu (Lyon)
('Bornes Billets', 5, 9),
('Ascenseurs', 5, 4),
('WiFi', 5, 10),
('Gilets de securite', 5, 35),
('Autolaveuses', 5, 3),
('Barrieres de securite', 5, 15),
('Chariot de menage', 5, 7),

('Escalators', 6, 3), -- Gare de Nice-Ville (Nice)
('Bornes Billets', 6, 8),
('Ascenseurs', 6, 3),
('WiFi', 6, 9),
('Gilets de securite', 6, 30),
('Autolaveuses', 6, 2),
('Barrieres de securite', 6, 12),
('Chariot de menage', 6, 6),

('Escalators', 7, 3), -- Gare de Toulouse-Matabiau (Toulouse)
('Bornes Billets', 7, 8),
('Ascenseurs', 7, 3),
('WiFi', 7, 9),
('Gilets de securite', 7, 30),
('Autolaveuses', 7, 2),
('Barrieres de securite', 7, 12),
('Chariot de menage', 7, 6),

('Escalators', 8, 3), -- Gare de Lille-Flandres (Lille)
('Bornes Billets', 8, 8),
('Ascenseurs', 8, 3),
('WiFi', 8, 9),
('Gilets de securite', 8, 30),
('Autolaveuses', 8, 2),
('Barrieres de securite', 8, 12),
('Chariot de menage', 8, 6),

('Escalators', 9, 4), -- Gare de Strasbourg (Strasbourg)
('Bornes Billets', 9, 9),
('Ascenseurs', 9, 4),
('WiFi', 9, 10),
('Gilets de securite', 9, 35),
('Autolaveuses', 9, 3),
('Barrieres de securite', 9, 15),
('Chariot de menage', 9, 7),

('Escalators', 10, 5), -- Gare de Nantes (Nantes)
('Bornes Billets', 10, 10),
('Ascenseurs', 10, 5),
('WiFi', 10, 12),
('Gilets de securite', 10, 40),
('Autolaveuses', 10, 4),
('Barrieres de securite', 10, 20),
('Chariot de menage', 10, 8),

('Escalators', 11, 3), -- Gare de Montpellier-Saint-Roch (Montpellier)
('Bornes Billets', 11, 8),
('Ascenseurs', 11, 3),
('WiFi', 11, 9),
('Gilets de securite', 11, 30),
('Autolaveuses', 11, 2),
('Barrieres de securite', 11, 12),
('Chariot de menage', 11, 6);



INSERT INTO Affecte (id_inci, idGare) VALUES 
(1, 1),
(2, 2),
(3, 3);
