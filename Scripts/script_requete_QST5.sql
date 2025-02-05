DROP FUNCTION IF EXISTS garesComprises;
CREATE FUNCTION garesComprises(ligne anyelement, GDepart anyelement, GArrivee anyelement) RETURNS anyarray
	AS 'WITH RECURSIVE CheminsDisponiblesParLigne(idLigne, gareDepart, garesIntermediaires, gareArrivee, horaireDepart, horaireArrivee, distance) AS (
		SELECT ligne, idGareDepart AS gareDepart, ARRAY[]::integer[] AS garesIntermediaires, idGareArrivee AS gareArrivee, (date + heure) AS horaireDepart, (date + heure + duree) AS horaireArrivee, 0 FROM Trajets
		JOIN Dessert DD ON DD.idGare = idGareDepart
		JOIN Dessert DA ON DA.idGare = idGareArrivee
		WHERE DD.idLigne = ligne and DA.idLigne = ligne
		UNION
		SELECT ligne, gareDepart, garesIntermediaires || idGareDepart, idGareArrivee AS gareArrivee, horaireDepart, (date + heure + duree) AS horaireArrivee, distance +1 FROM CheminsDisponiblesParLigne CDPL
		JOIN Trajets ON CDPL.gareArrivee = idGareDepart
		JOIN Dessert D ON idGareArrivee = idGare
		WHERE D.idLigne = ligne and
				gareDepart <> idGareArrivee and 
				NOT(gareArrivee = ANY(garesIntermediaires)) and 
				horaireDepart < (date + heure + duree) 
		)SELECT ARRAY[GDepart, GArrivee] || garesIntermediaires FROM CheminsDisponiblesParLigne
		WHERE GDepart = gareDepart and GArrivee = gareArrivee;'
	LANGUAGE SQL;
	
DROP FUNCTION IF EXISTS trajetDansChemin;
CREATE FUNCTION trajetDansChemin(GDepart integer, GArrivee integer, garesComprises anyarray) RETURNS boolean
	AS 'SELECT GDepart = ANY(garesComprises) and
			GArrivee = ANY(garesComprises);'
	LANGUAGE SQL;

DROP FUNCTION IF EXISTS trajetsImpactesParIncidents;
CREATE FUNCTION trajetsImpactesParIncidents(idLigneInci integer, GDepartInci integer, GArriveeInci integer, dateInci date, heureInci time, dureeInci interval)
RETURNS TABLE(idGareDepartTrajet integer, idGareArriveeTrajet integer, dateT date, heureT time)
	AS 'SELECT idGareDepart, idGareArrivee, date, heure FROM Trajets
		WHERE trajetDansChemin(idGareDepart, idGareArrivee, garesComprises(idLigneInci, GDepartInci, GArriveeInci)) and
			(date + heure) >= (dateInci + heureInci) and
			(date + heure) <= (dateInci + heureInci + duree);'
	LANGUAGE SQL;

WITH RECURSIVE CheminsSansIncidentsDisponibles(gareDepart, garesIntermediaires, gareArrivee, horaireDepart, horaireArrivee, distance) AS (
	SELECT idGareDepart AS gareDepart, ARRAY[]::integer[] AS garesIntermediaires, idGareArrivee AS gareArrivee, (date + heure) AS horaireDepart, (date + heure + duree) AS horaireArrivee, 0 FROM Trajets
	WHERE (date + heure) >= (DATE '2025-01-02' + TIME '06:00:00') and -- A remplacer par CURRENT_DATE + CURRENT_TIME dans un projet plus complet, ici juste pour test
		NOT (ROW(idGareDepart,idGareArrivee,date,heure) IN (SELECT DISTINCT idGareDepartTrajet(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						idGareArriveeTrajet(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						dateT(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						heureT(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)) FROM Incidents_de_Ligne))
	UNION
	SELECT gareDepart, garesIntermediaires || idGareDepart, idGareArrivee AS gareArrivee, horaireDepart, (date + heure + duree) AS horaireArrivee, distance +1 FROM CheminsSansIncidentsDisponibles 
	JOIN Trajets ON CheminsSansIncidentsDisponibles.gareArrivee = idGareDepart
	WHERE gareDepart <> idGareArrivee and 
			NOT (idGareArrivee = ANY(garesIntermediaires)) and 
			horaireDepart < (date + heure + duree) and
			NOT (ROW(idGareDepart,idGareArrivee,date,heure) IN (SELECT DISTINCT idGareDepartTrajet(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						idGareArriveeTrajet(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						dateT(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)), 
																						heureT(trajetsImpactesParIncidents(idLigne, idGareDepart, idGareArrivee, date, heure, duree)) FROM Incidents_de_Ligne))
)

SELECT GD.nomG, 
	(SELECT array_agg(GI.nomG) FROM (SELECT unnest(garesIntermediaires)) AS gInter JOIN GARES GI ON GI.idGare = gInter.unnest) AS garesInter, 
	GA.nomG, 
	horaireDepart, 
	MIN(horaireArrivee), 
	distance FROM CheminsSansIncidentsDisponibles CSID
JOIN Gares GD ON CSID.gareDepart = GD.idGare
JOIN Gares GA ON CSID.gareArrivee = GA.idGare
GROUP BY (distance, GD.nomG, garesInter, GA.nomG, horaireDepart)
ORDER BY distance, GD.nomG, GA.nomG, horaireDepart;