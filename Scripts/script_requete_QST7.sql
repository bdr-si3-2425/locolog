DROP VIEW IF EXISTS NbPassagesParGare;
CREATE VIEW NbPassagesParGare(idGare, nbPassages) AS 
	SELECT idGare, COUNT(*) AS nbPassages FROM Trajets
	JOIN Gares ON idGareDepart = idGare
	OR idGareDepart = idGare
	GROUP BY (idGare)
	ORDER BY nbPassages DESC;

DROP VIEW IF EXISTS NbUtilisationsParTrain;
CREATE VIEW NbUtilisationsParTrain(idTrain, nbUtilisations) AS 
	SELECT idTrain, COUNT(*) AS nbUtilisations FROM Trajets
	GROUP BY (idTrain)
	ORDER BY nbUtilisations DESC;

DROP VIEW IF EXISTS NbUtilisationsParLigne;
CREATE VIEW NbUtilisationsParLigne(idLigne, nbUtilisations) AS 
	SELECT DD.idLigne, COUNT(*) AS nbUtilisations FROM Trajets T
	JOIN Dessert DD ON DD.idGare = T.idGareDepart
	JOIN Dessert DA ON DA.idGare = T.idGareArrivee
	WHERE DD.idLigne = DA.idLigne
	GROUP BY (DD.idLigne)
	ORDER BY nbUtilisations DESC;

--SELECT nomG, nbPassages FROM NbPassagesParGare JOIN Gares USING(idGare) ORDER BY nbPassages DESC;
--SELECT typeT || '-' || idTrain, nbUtilisations FROM NbUtilisationsParTrain JOIN Trains USING(idTrain) ORDER BY nbUtilisations DESC;
--SELECT * FROM NbUtilisationsParLigne;