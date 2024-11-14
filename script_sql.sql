-- Création de la base de données
CREATE DATABASE Centre_de_formation ;
USE Centre_de_formation;

-- Création de differentes tables
CREATE TABLE Etudiant(
   NumCINEtu VARCHAR(50),
   nomEtu VARCHAR(50) NOT NULL,
   villeEtu VARCHAR(50),
   niveauEtu INT,
   prenomEtu VARCHAR(50),
   dateNaissance DATE,
   adresseEtu VARCHAR(50),
   PRIMARY KEY(NumCINEtu)
);

CREATE TABLE Formation(
   codeForm VARCHAR(50),
   titreForm VARCHAR(50),
   dureeForm VARCHAR(50),
   prixForm CURRENCY,
   PRIMARY KEY(codeForm)
);

CREATE TABLE Specialite(
   codeSpec VARCHAR(50),
   nomSpec VARCHAR(50),
   descSpec TEXT,
   PRIMARY KEY(codeSpec)
);

CREATE TABLE Session(
   codeSess VARCHAR(50),
   nomSess VARCHAR(50),
   dateDebut DATE,
   dateFin DATE,
   codeForm VARCHAR(50) NOT NULL,
   PRIMARY KEY(codeSess),
   FOREIGN KEY(codeForm) REFERENCES Formation(codeForm)
);

CREATE TABLE estInscrit(
   NumCINEtu VARCHAR(50),
   codeSess VARCHAR(50),
   TypeCours VARCHAR(50),
   PRIMARY KEY(NumCINEtu, codeSess),
   FOREIGN KEY(NumCINEtu) REFERENCES Etudiant(NumCINEtu),
   FOREIGN KEY(codeSess) REFERENCES Session(codeSess)
);

CREATE TABLE Appartient(
   codeForm VARCHAR(50),
   codeSpec VARCHAR(50),
   PRIMARY KEY(codeForm, codeSpec),
   FOREIGN KEY(codeForm) REFERENCES Formation(codeForm),
   FOREIGN KEY(codeSpec) REFERENCES Specialite(codeSpec)
);

Changer le champ "TypeCours" en NOT NULL
ALTER TABLE `estinscrit` CHANGE `TypeCours` `TypeCours` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;

-- Ajouter une contrainte
ALTER TABLE Session ADD CONSTRAINT chk_date CHECK (dateFin > dateDebut);

-- Ajouter le champ Active
ALTER TABLE Specialite
ADD COLUMN Active TINYINT(1) DEFAULT 1;
