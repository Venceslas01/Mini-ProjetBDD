INSERT INTO Metier (nomMetier, descriptionMetier) VALUES
('Coach', 'Entraîneur personnel spécialisé dans le fitness et la musculation'),
('Réceptionniste', 'Accueille les membres et gère les rendez-vous'),
('Instructeur de Yoga', 'Enseigne le yoga et aide à la relaxation et la flexibilité'),
('Nutritionniste', 'Fournit des conseils en nutrition et en régime alimentaire'),
('Instructeur de Pilates', 'Conduit des cours de Pilates pour améliorer la posture et la force'),
('Technicien de maintenance', 'Entretien et réparation des équipements de la salle'),
('Directeur de salle', 'Gère les opérations quotidiennes et le personnel de la salle'),
('Kinésithérapeute', 'Fournit des soins de rééducation et de réadaptation physique'),
('Instructeur de Zumba', 'Anime des cours de Zumba pour le fitness en groupe');

INSERT INTO Forfait (nomForfait, descriptionForfait, tarif) VALUES
('Forfait Basic', 'Accès limité à certaines machine', 20.00),
('Forfait Premium', 'Accès illimité et cours inclus', 40.00);

INSERT INTO Abonnement (IDForfait, dateAbonnement) VALUES
(1, '2015-01-10'),(2, '2015-02-15'),(1, '2015-03-20'),(2, '2015-04-25'),(1, '2015-05-30'),(2, '2015-06-04'),(1, '2016-07-09'),(2, '2016-08-14'),(1, '2016-09-19'),(2, '2016-10-24'),
(1, '2017-11-29'),(2, '2017-12-04'),(1, '2018-01-08'),(2, '2018-02-12'),(1, '2018-03-19'),(2, '2018-04-23'),(1, '2019-05-28'),(2, '2019-06-02'),(1, '2019-07-07'),(2, '2019-08-11'),
(1, '2020-09-16'),(2, '2020-10-21'),(1, '2020-11-25'),(2, '2020-12-30'),(1, '2021-01-04'),(2, '2021-02-08'),(1, '2021-03-15'),(2, '2021-04-19'),(1, '2022-05-24'),(2, '2022-06-28'),
(1, '2022-08-02'),(2, '2022-09-06'),(1, '2023-10-11'),(2, '2023-11-25'),(1, '2023-12-20'),(2, '2023-12-24'),(1, '2023-12-28'),(2, '2023-12-16'),(1, '2023-12-20'),(2, '2023-12-25'),
(1, '2023-12-30'),(2, '2023-12-04'),(1, '2023-12-09');

LOAD DATA LOCAL INFILE '/home/venceslas/MiniProjetBDD/Personnes.csv'
INTO TABLE Personne 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

INSERT INTO TypeBatiment (IDType, nomTypeBatiment, descriptionTypeBatiment) VALUES
(1, 'Salle de sport', 'Un bâtiment dédié à diverses activités sportives et à l\'entraînement physique.'),
(2, 'Siège social', 'Le bâtiment principal où sont gérées les opérations administratives et la direction de l\'entreprise.');

INSERT INTO Batiment (IDBatiment, IDType, adresseBatiment, nomBatiment) VALUES
(1, 1, '123 Rue du Sport', 'Sport Center 1'),
(2, 1, '456 Avenue Fitness', 'Fitness World 2'),
(3, 1, '789 Boulevard Gym', 'Gymnase 3'),
(4, 1, '101 Rue de l\'Athlète', 'Athlete Club 4'),
(5, 1, '102 Avenue du Corps', 'Body Fitness 5'),
(6, 1, '103 Boulevard de la Santé', 'Health Gym 6'),
(7, 1, '104 Rue du Muscle', 'Muscle Mania 7'),
(8, 1, '105 Avenue Endurance', 'Endurance Gym 8'),
(9, 1, '106 Boulevard Force', 'Force Fitness 9'),
(10, 2, '107 Rue du Siège', 'Siège Social');

LOAD DATA LOCAL INFILE '/home/venceslas/MiniProjetBDD/machines.csv'
INTO TABLE Machine 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

-- Insertions pour le Forfait Basic
INSERT INTO DeblocageMachine (IDMachine, IDForfait) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), 
(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), 
(11, 1), (12, 1), (13, 1), (14, 1), (15, 1), 
(16, 1), (17, 1), (18, 1), (19, 1), (20, 1), 
(21, 1), (22, 1), (23, 1), (24, 1), (25, 1);

-- Insertions pour le Forfait Premium
INSERT INTO DeblocageMachine (IDMachine, IDForfait) VALUES
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), 
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2), 
(11, 2), (12, 2), (13, 2), (14, 2), (15, 2), 
(16, 2), (17, 2), (18, 2), (19, 2), (20, 2), 
(21, 2), (22, 2), (23, 2), (24, 2), (25, 2),
(26, 2), (27, 2), (28, 2), (29, 2), (30, 2), 
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2), 
(36, 2), (37, 2), (38, 2), (39, 2), (40, 2), 
(41, 2), (42, 2), (43, 2), (44, 2), (45, 2), 
(46, 2), (47, 2), (48, 2), (49, 2), (50, 2);

LOAD DATA LOCAL INFILE '/home/venceslas/MiniProjetBDD/seances_1000_2012_2024(1).csv'
INTO TABLE Seance 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/venceslas/MiniProjetBDD/statistiques(1).csv'
INTO TABLE Statistique 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

INSERT INTO Cours (IDBatiment, nomCours, nombrePlaceCours) VALUES
(1, 'Yoga pour débutants', 20),(2, 'Circuit Training Avancé', 15),(3, 'Pilates Intermédiaire', 10),(4, 'Zumba Fitness', 25),(5, 'Musculation 101', 30),
(6, 'Cardio Kickboxing', 20),(7, 'CrossFit Niveau 1', 15),(8, 'Danse Contemporaine', 12),(9, 'Spinning Endurance', 18),(1, 'Aqua Fitness', 20),(2, 'Yoga Vinyasa', 22),
(3, 'Bootcamp Total Body', 16),(4, 'Méditation et Relaxation', 8),(5, 'HIIT Intensif', 20),(6, 'Poids Corporel et Mobilité', 15),(7, 'Tai Chi pour la Santé', 10),(8, 'Boxe Fitness', 18),
(9, 'Ballet Fitness', 15),(1, 'Yoga Aérien', 10),(2, 'Parkour Urbain', 12);

INSERT INTO ParticipantCours (IDCours, IDPersonne, dateCours) VALUES
(15, 21, '2024-03-01'),(17, 25, '2024-03-21'),(10, 24, '2024-08-13'),(1, 4, '2024-10-25'),(12, 32, '2024-12-02'),(1, 20, '2024-11-21'),(13, 15, '2024-11-27'),
(7, 13, '2025-01-16'),(18, 8, '2025-01-14'),(10, 4, '2024-04-01'),(2, 5, '2024-06-12'),(3, 10, '2024-07-09'),(4, 16, '2024-09-20'),(5, 22, '2024-11-15'),
(6, 27, '2024-08-05'),(8, 33, '2024-10-17'),(9, 29, '2024-12-23'),(11, 30, '2024-03-30'),(14, 17, '2024-05-22'),(19, 2, '2024-09-18'),(19, 4, '2023-07-01');

INSERT INTO AnimerCours (IDCours, IDPersonne) VALUES
(9, 44),(12, 39),(10, 44),(18, 43),(9, 40),(4, 47),(19, 54),
(12, 45),(13, 41),(9, 49),(19, 39),(14, 45),(10, 53),(11, 49),(20, 50),(15, 39),(6, 53),(3, 49),(8, 47),(7, 46);


INSERT INTO EntreeBatiment (IDBatiment, IDPersonne) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(1, 10),
(2, 11),(3, 12),(4, 13),(5, 14),(6, 15),(7, 16),(8, 17),(9, 18),(1, 19),
(2, 20),(3, 21),(4, 22),(5, 23),(6, 24),(7, 25),(8, 26),(9, 27),(1, 28),
(2, 29),(3, 30);



