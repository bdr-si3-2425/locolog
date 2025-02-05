WITH TrainsDisponibles AS (
    SELECT DISTINCT t.idTrain
    FROM Trains t
    LEFT JOIN Maintenances_de_Train mdt ON t.idTrain = mdt.idTrain
    WHERE mdt.idTrain IS NULL OR (mdt.date + mdt.heure + mdt.duree) < CURRENT_DATE
)
SELECT DISTINCT td.idTrain
FROM TrainsDisponibles td
LEFT JOIN Trajets tj ON td.idTrain = tj.idTrain
WHERE tj.idTrain IS NULL OR (tj.date + tj.heure + tj.duree) < CURRENT_DATE;