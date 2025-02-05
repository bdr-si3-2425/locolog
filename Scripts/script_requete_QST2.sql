SELECT idTrain
FROM Trains
WHERE heuresCumulees > 1000
AND idTrain NOT IN (
    SELECT idTrain
    FROM Maintenances_de_Train
    WHERE (date+heure+duree) > CURRENT_DATE
)

UNION
SELECT DISTINCT idTrain
FROM Incidents_de_Train
WHERE idTrain NOT IN (
    SELECT idTrain
    FROM Maintenances_de_Train
    WHERE (date+heure+duree) > CURRENT_DATE
);