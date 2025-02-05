
WITH RECURSIVE CheminsDisponibles(gareDepart, garesIntermediaires, gareArrivee, horaireDepart, horaireArrivee, distance) AS (
	SELECT idGareDepart AS gareDepart, ARRAY[]::integer[] AS garesIntermediaires, idGareArrivee AS gareArrivee, (date + heure) AS horaireDepart, (date + heure + duree) AS horaireArrivee, 0 FROM Trajets
	UNION
	SELECT gareDepart, garesIntermediaires || idGareDepart, idGareArrivee AS gareArrivee, horaireDepart, (date + heure + duree) AS horaireArrivee, distance +1 FROM CheminsDisponibles 
	JOIN Trajets ON CheminsDisponibles.gareArrivee = idGareDepart
	WHERE gareDepart <> idGareArrivee and 
			NOT (idGareArrivee = ANY(garesIntermediaires)) and 
			horaireDepart < (date + heure + duree) 
)

SELECT gareDepart, garesIntermediaires, gareArrivee, horaireDepart, MIN(horaireArrivee), distance FROM CheminsDisponibles
GROUP BY (distance, gareDepart, garesIntermediaires, gareArrivee, horaireDepart)
ORDER BY distance, gareDepart, gareArrivee, horaireDepart;