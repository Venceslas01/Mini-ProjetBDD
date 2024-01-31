#-- 1
SELECT Personne.nomPersonne, Personne.prenomPersonne, Personne.adressePersonne, Forfait.nomForfait FROM Personne
JOIN Abonnement ON Personne.IDAbonnement = Abonnement.IDAbonnement
JOIN Forfait ON Abonnement.IDForfait = Forfait.IDForfait;

#-- 2
SELECT nomMachine, dateFabrication, dateMaintenance FROM Machine 
WHERE dateFabrication < DATE_SUB(CURDATE(), INTERVAL 5 YEAR) AND dateMaintenance < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

#-- 3
SELECT Forfait.IDForfait,Forfait.nomForfait,SUM(Forfait.tarif) as RevenuTotal FROM Abonnement 
JOIN Forfait  ON Abonnement.IDForfait = Forfait.IDForfait
WHERE MONTH(Abonnement.dateAbonnement) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) 
    AND YEAR(Abonnement.dateAbonnement) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
GROUP BY Forfait.IDForfait
ORDER BY RevenuTotal DESC
LIMIT 1;

#-- 4
SELECT Personne.IDPersonne, Personne.nomPersonne, Personne.prenomPersonne FROM Personne 
JOIN ParticipantCours  ON Personne.IDPersonne = ParticipantCours.IDPersonne
JOIN Cours  ON ParticipantCours.IDCours = Cours.IDCours
WHERE Cours.IDBatiment = 1
GROUP BY Personne.IDPersonne, Personne.nomPersonne, Personne.prenomPersonne
HAVING COUNT(DISTINCT Cours.IDCours) = (
    SELECT COUNT(*) FROM Cours
    WHERE IDBatiment = 1
);

#-- Choix des question

#-- quelle est la salle la plus fréquentée
SELECT Batiment.nomBatiment, (COUNT(ParticipantCours.IDPersonne) + COUNT(Seance.IDSeance)) AS TauxFrequentation FROM Batiment 
JOIN Cours ON Batiment.IDBatiment = Cours.IDBatiment
JOIN ParticipantCours  ON Cours.IDCours = ParticipantCours.IDCours
LEFT JOIN Seance ON Batiment.IDBatiment = Seance.IDBatiment
GROUP BY Batiment.IDBatiment
HAVING TauxFrequentation = (
        SELECT (COUNT(ParticipantCours.IDPersonne) + COUNT(Seance.IDSeance)) AS TauxFrequentation FROM Batiment 
        JOIN Cours  ON Batiment.IDBatiment = Cours.IDBatiment
        JOIN ParticipantCours  ON Cours.IDCours = ParticipantCours.IDCours
        LEFT JOIN Seance  ON Batiment.IDBatiment = Seance.IDBatiment
        GROUP BY Batiment.IDBatiment
	ORDER BY TauxFrequentation DESC
        LIMIT 1
);

#-- les personnes qui ont utilisés chaque machine d 'un batiment

SELECT DISTINCT Personne.IDPersonne, Personne.nomPersonne, Personne.prenomPersonne
FROM Personne 
INNER JOIN Abonnement  ON Personne.IDAbonnement = Abonnement.IDAbonnement
INNER JOIN DeblocageMachine  ON Abonnement.IDForfait = DeblocageMachine.IDForfait
INNER JOIN Machine ON DeblocageMachine.IDMachine = Machine.IDMachine
INNER JOIN Batiment ON Machine.IDBatiment = Batiment.IDBatiment
WHERE Batiment.IDBatiment = 1
GROUP BY Personne.IDPersonne
HAVING COUNT(DISTINCT Machine.IDMachine) = (SELECT COUNT(*) FROM Machine WHERE IDBatiment = 1);

#-- Trouver le client ayant passé le plus de temps à la salle
#-- On considere que un cours dure 60 minutes

SELECT Personne.IDPersonne, Personne.nomPersonne, Personne.prenomPersonne, SUM(TIMESTAMPDIFF(MINUTE, Seance.heureDebut, Seance.heureFin)) + (COUNT(DISTINCT ParticipantCours.IDCours) * 60) AS TempsTotal FROM Personne 
LEFT JOIN Seance  ON Personne.IDPersonne = Seance.IDPersonne
LEFT JOIN ParticipantCours  ON Personne.IDPersonne = ParticipantCours.IDPersonne
GROUP BY Personne.IDPersonne, Personne.nomPersonne, Personne.prenomPersonne
HAVING TempsTotal = (SELECT SUM(TIMESTAMPDIFF(MINUTE, Seance.heureDebut, Seance.heureFin)) + (COUNT(DISTINCT ParticipantCours.IDCours) * 60) AS TempsTotal FROM Personne 
        LEFT JOIN Seance  ON Personne.IDPersonne = Seance.IDPersonne
        LEFT JOIN ParticipantCours  ON Personne.IDPersonne = ParticipantCours.IDPersonne
        GROUP BY Personne.IDPersonne
        ORDER BY TempsTotal DESC
        LIMIT 1
);



