CREATE DATABASE Sport;

USE Sport;

CREATE TABLE Metier (
  IDMetier INTEGER AUTO_INCREMENT,
  nomMetier VARCHAR(25) NOT NULL,
  descriptionMetier TEXT,
  CONSTRAINT pk_IDMetier1 PRIMARY KEY(IDMetier)
);

CREATE TABLE Forfait (
  IDForfait INTEGER AUTO_INCREMENT,
  nomForfait VARCHAR(25) NOT NULL,
  descriptionForfait TEXT,
  tarif DECIMAL(5,2),
  CONSTRAINT pk_IDForfait1 PRIMARY KEY(IDForfait)
);

CREATE TABLE Abonnement (
  IDAbonnement INTEGER AUTO_INCREMENT,
  IDForfait INTEGER,
  dateAbonnement DATE,
  CONSTRAINT pk_IDAbonnement PRIMARY KEY(IDAbonnement,IDForfait),
  CONSTRAINT fk_IDForfait FOREIGN KEY(IDForfait) REFERENCES Forfait(IDForfait)
);

CREATE TABLE Personne (
  IDPersonne INTEGER AUTO_INCREMENT,
  IDMetier INTEGER,
  IDAbonnement INTEGER,
  nomPersonne VARCHAR(25) NOT NULL,
  prenomPersonne VARCHAR(25) NOT NULL,
  dateDeNaissance VARCHAR(25) NOT NULL,
  adressePersonne VARCHAR(50),
  numTel VARCHAR(15),
  mail VARCHAR(100),
  CONSTRAINT pk_IDPersonne PRIMARY KEY(IDPersonne),
  CONSTRAINT fk_IDAbonnement FOREIGN KEY(IDAbonnement) REFERENCES Abonnement(IDAbonnement),
  CONSTRAINT fk_IDMetier FOREIGN KEY(IDMetier) REFERENCES Metier(IDMetier)
);

CREATE TABLE TypeBatiment (
  IDType INTEGER AUTO_INCREMENT,
  nomTypeBatiment VARCHAR(50) NOT NULL,
  descriptionTypeBatiment TEXT,
  CONSTRAINT pk_IDType PRIMARY KEY(IDType)
);

CREATE TABLE Batiment (
  IDBatiment INTEGER AUTO_INCREMENT,
  IDType INTEGER,
  adresseBatiment VARCHAR(50) NOT NULL,
  nomBatiment VARCHAR(50) NOT NULL,
  CONSTRAINT pk_IDBatiment PRIMARY KEY(IDBatiment),
  CONSTRAINT fk_IDType FOREIGN KEY(IDType) REFERENCES TypeBatiment(IDType)
);

CREATE TABLE Machine (
  IDMachine INTEGER AUTO_INCREMENT,
  IDBatiment INTEGER,
  nomMachine VARCHAR(50) NOT NULL,
  typeMachine VARCHAR(50),
  dateFabrication DATE,
  dateMaintenance DATE,
   CONSTRAINT pk_IDMachine PRIMARY KEY(IDMachine),
   CONSTRAINT fk_IDBatiment4 FOREIGN KEY(IDBatiment) REFERENCES Batiment(IDBatiment)
);

CREATE TABLE DeblocageMachine (
  IDForfait INTEGER,
  IDMachine INTEGER,
  CONSTRAINT pk_DeblocageMachine PRIMARY KEY(IDForfait,IDMachine),
  CONSTRAINT fk_IDForfait2 FOREIGN KEY(IDForfait) REFERENCES Forfait(IDForfait),
  CONSTRAINT fk_IDMachine1 FOREIGN KEY(IDMachine) REFERENCES Machine(IDMachine)
);


CREATE TABLE Seance (
  IDSeance INTEGER AUTO_INCREMENT,
  IDPersonne INTEGER,
  IDBatiment INTEGER,
  heureDebut TIME NOT NULL,
  heureFin TIME NOT NULL,
  dateSeance DATE NOT NULL,
  CONSTRAINT pk_IDSeance PRIMARY KEY(IDSeance),
  CONSTRAINT fk_IDPersonne2 FOREIGN KEY(IDPersonne) REFERENCES Personne(IDPersonne),
  CONSTRAINT fk_IDBatiment FOREIGN KEY(IDBatiment) REFERENCES Batiment(IDBatiment)
);

CREATE TABLE Statistique (
  IDStat INTEGER AUTO_INCREMENT,
  IDMachine INTEGER,
  IDSeance INTEGER,
  poidsMax DECIMAL(10,2),
  rythmeCardiaque INT(10),
  CONSTRAINT pk_IDStat PRIMARY KEY(IDStat),
  CONSTRAINT fk_IDSeance FOREIGN KEY(IDSeance) REFERENCES Seance(IDSeance),
  CONSTRAINT fk_IDMachine2 FOREIGN KEY(IDMachine) REFERENCES Machine(IDMachine)
);

CREATE TABLE Cours (
  IDCours INTEGER AUTO_INCREMENT,
  IDBatiment INTEGER,
  nomCours VARCHAR(50) NOT NULL,
  nombrePlaceCours INT,
  CONSTRAINT pk_IDCours PRIMARY KEY(IDCours),
  CONSTRAINT fk_IDBatiment3 FOREIGN KEY(IDBatiment) REFERENCES Batiment(IDBatiment)
);

CREATE TABLE ParticipantCours (
  IDCours INTEGER,
  IDPersonne INTEGER,
  dateCours DATE,
  CONSTRAINT pk_ParticipantCours PRIMARY KEY(IDCours,IDPersonne),
  CONSTRAINT fk_IDPersonne4 FOREIGN KEY(IDPersonne) REFERENCES Personne(IDPersonne),
  CONSTRAINT fk_IDCours1 FOREIGN KEY(IDCours) REFERENCES Cours(IDCours)
);

CREATE TABLE AnimerCours (
  IDCours INTEGER,
  IDPersonne INTEGER,
  CONSTRAINT pk_AnimerCours PRIMARY KEY(IDCours,IDPersonne),
  CONSTRAINT fk_IDPersonne5 FOREIGN KEY(IDPersonne) REFERENCES Personne(IDPersonne),
  CONSTRAINT fk_IDCours2 FOREIGN KEY(IDCours) REFERENCES Cours(IDCours)
);

CREATE TABLE EntreeBatiment (
  IDBatiment INT,
  IDPersonne INT,
  CONSTRAINT pk_EntreeBatiment PRIMARY KEY(IDBatiment,IDPersonne),
  CONSTRAINT fk_IDPersonne6 FOREIGN KEY(IDPersonne) REFERENCES Personne(IDPersonne),
  CONSTRAINT fk_IDBatiment5 FOREIGN KEY(IDBatiment) REFERENCES Batiment(IDBatiment)
);

