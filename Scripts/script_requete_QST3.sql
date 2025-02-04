SELECT 
    gare.idGare AS id_gare, 
    COUNT(*) AS nombre_trains,
    g.nbQuais * 3 * 4 AS capacite_max, 
    (COUNT(*) * 100.0 / (g.nbQuais * 3 * 4)) AS taux_saturation
FROM (
    SELECT idGareDepart AS idGare, heure FROM Trajets
    WHERE (EXTRACT(HOUR FROM heure) BETWEEN 7 AND 9) OR (EXTRACT(HOUR FROM heure) BETWEEN 17 AND 19)
    UNION ALL
    SELECT idGareArrivee AS idGare, heure FROM Trajets
    WHERE (EXTRACT(HOUR FROM heure) BETWEEN 7 AND 9) OR (EXTRACT(HOUR FROM heure) BETWEEN 17 AND 19)
) AS gare
JOIN Gares g ON gare.idGare = g.idGare
GROUP BY gare.idGare, g.nbQuais
ORDER BY taux_saturation DESC;