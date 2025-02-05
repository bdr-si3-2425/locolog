START TRANSACTION;
WITH RECURSIVE CheminsDisponibles(gareDepart, garesIntermediaires, gareArrivee, horaireDepart, horaireArrivee, distance) AS (
	SELECT idGareDepart AS gareDepart, '' AS garesIntermediaires, idGareArrivee AS gareArrivee, (date + heure) AS horaireDepart, (date + heure + duree) AS horaireArrivee, 0 FROM Trajets
	UNION
	SELECT gareDepart, CONCAT(garesIntermediaires, ' ',idGareDepart::varchar), idGareArrivee AS gareArrivee, horaireDepart, (date + heure + duree) AS horaireArrivee, distance +1 FROM CheminsDisponibles 
	JOIN Trajets ON CheminsDisponibles.gareArrivee = idGareDepart
	WHERE gareDepart <> idGareArrivee and 
			garesIntermediaires NOT LIKE CONCAT('% ',idGareArrivee,' %') and 
			garesIntermediaires NOT LIKE CONCAT(idGareArrivee,' %') and 
			garesIntermediaires NOT LIKE CONCAT('% ',idGareArrivee) and 
			horaireDepart < (date + heure + duree) 
),
secondStepChemins AS (
SELECT gareDepart, garesIntermediaires, gareArrivee, horaireDepart, MIN(horaireArrivee), distance FROM CheminsDisponibles
GROUP BY (distance, gareDepart, garesIntermediaires, gareArrivee, horaireDepart)
ORDER BY distance, gareDepart, gareArrivee, horaireDepart
),

ActualNewLigneId AS (
    SELECT COALESCE(MAX(idLigne), 0) + 1 AS idLigne
    FROM Lignes
),
ActualNewTrainId AS (
    SELECT COALESCE(MAX(idTrain), 0) + 1 AS idTrain
    FROM Trains
),
TrajetPrNouvelleLigne(gareDepart,gareArrivee,distance) AS (
SELECT DISTINCT CD1.gareDepart,CD1.gareArrivee,MIN(CD1.distance) FROM secondStepChemins AS CD1
JOIN secondStepChemins as CD2  ON (CD1.gareDepart=CD2.gareDepart AND CD1.gareArrivee=CD2.gareArrivee) OR (CD1.gareArrivee=CD2.gareDepart AND CD1.gareDepart=CD2.gareArrivee)
GROUP BY CD1.gareDepart,CD1.gareArrivee
HAVING MIN(CD1.distance) > 2
ORDER BY MIN(CD1.distance),CD1.gareDepart,CD1.gareArrivee
),
Results AS (
SELECT ActualNewLigneId.idLigne, ActualNewTrainId.idTrain,  TrajetPrNouvelleLigne.gareDepart, TrajetPrNouvelleLigne.gareArrivee
FROM ActualNewLigneId, ActualNewTrainId, TrajetPrNouvelleLigne
LIMIT 1
)
SELECT * FROM Results
COMMIT;