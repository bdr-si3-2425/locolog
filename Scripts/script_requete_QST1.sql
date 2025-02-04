WITH RECURSIVE Chemins AS (
    -- Étape 1 : Récupérer les trajets directs depuis la gare de départ
    SELECT 
        idTrain, 
        idGareDepart, 
        idGareArrivee, 
        date, 
        heure, 
        duree,
        0 AS nb_correspondances,  -- Pas de correspondance pour les trajets directs
        duree AS duree_totale, 
        ARRAY[idTrain] AS sequence_trains
    FROM Trajets
    WHERE idGareDepart = 1

    UNION ALL

    -- Étape 2 : Récursivement, ajouter des correspondances en minimisant les attentes
    SELECT 
        t.idTrain, 
        c.idGareDepart, 
        t.idGareArrivee,
        t.date, 
        t.heure, 
        t.duree, 
        c.nb_correspondances + 1 AS nb_correspondances, 
        c.duree_totale + t.duree  + (EXTRACT(EPOCH FROM (t.heure - (c.heure + c.duree))) * INTERVAL '1 second') AS duree_totale,
        c.sequence_trains || t.idTrain AS sequence_trains
    FROM Trajets t
    JOIN Chemins c ON t.idGareDepart = c.idGareArrivee
    WHERE t.heure > (c.heure + c.duree)  -- Vérifie qu'on ne rate pas la correspondance
	AND c.nb_correspondances < 3  -- Limite le nombre de correspondances
    AND NOT t.idTrain = ANY(c.sequence_trains)  -- Évite les boucles infinies
)
SELECT * 
FROM Chemins
WHERE idGareArrivee = 8
ORDER BY nb_correspondances ASC, duree_totale ASC
LIMIT 1;