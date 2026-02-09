create database aembouazza_notes;

CREATE TABLE epreuve(
codeepreuve SERIAL PRIMARY KEY, 
designepreuve VARCHAR(30), 
coef NUMERIC(2,1));

CREATE TABLE academie(
codeAc SERIAL PRIMARY KEY, 
libelleAc VARCHAR(20)
);

CREATE TABLE etablissement (
codeetab SERIAL PRIMARY KEY, 
nomEtab VARCHAR(30), 
codeAc INTEGER REFERENCES academie(codeAc)
);

CREATE TABLE candidat(
numCandidat SERIAL PRIMARY KEY,
nomCandidat VARCHAR(30), 
codeetab INTEGER REFERENCES etablissement(codeetab)
);

CREATE TABLE notation(
codeepreuve INTEGER REFERENCES epreuve(codeepreuve),
numCandidat INTEGER REFERENCES candidat(numCandidat),
note NUMERIC(4,2),
CONSTRAINT pk_notation PRIMARY KEY (codeepreuve,numCandidat)
);

INSERT INTO epreuve(designepreuve,coef) VALUES 
('Merise',2.5),('PHP',1),('SQL',3),('Javascript',1),('Anglais',0.5),('UML',2),('Java',1);

INSERT INTO academie(libelleAc) VALUES
('Bordeaux'),('Nantes'),('Poitiers'),('Toulouse'),('Marseille'),('Paris');

INSERT INTO etablissement(nomEtab,codeAc) VALUES 
('St Jory',4),('Charles De Gaulle',6),('St Lazarre',1),('St Jacques',2),('St Pierre',2),('Gustave Eiffel',1),
('Pierre Semard',3),('LaGorce',5);

INSERT INTO candidat(nomCandidat,codeetab) VALUES
('Jean Dupont',1),('Jean Pierre',1),('Lucie Holch',1),('Karim Lafdal',2),('Fabien Delhaye',2),('Romain Jacques',2),
('Frederic Rau',3),('Rose Marie',3),('Pierre Mignon',4),('Karl Much',5),('Emile Torch',5),('Louis Gan',6),('Romain Duc',6),
('Sylvain Bouy',7),('Michel Jean',8),('Georgette Luce',8);


 INSERT INTO notation(codeepreuve,numCandidat,note) VALUES
 (1,1,12),(1,3,14),(2,2,16),(2,5,7),(2,3,18),(2,8,10),(3,10,18),(5,4,12),(6,8,14),(6,2,15),(5,9,12),(2,9,14),(7,8,16),(1,10,15);


-- Question 1 :
  
INSERT INTO candidat VALUES (12001, 'Durand', '510');  

-- Question 2 : 

ALTER TABLE candidat
ADD column prenomCandidat VARCHAR (30);

-- Question 3 :

SELECT DISTINCT numCandidat 
FROM Candidat, Epreuve, Notation
WHERE C.numCandidat = N.numCandidat AND N.codeepreuve = E.codeEpreuve
  
-- Question 4 : 

SELECT nomCandidat
FROM Candidat
WHERE codeetab = '230' AND nomCandidat LIKE 'C%';

-- Question 5 : 

SELECT numCandidat, note
FROM notation
WHERE codeEpreuve = '6' AND (note BETWEEN 8 AND 14);  -- Les parenthèses sont PAS obligatoires ici --

-- Question 6 : 

SELECT numCandidat, nomCandidat
FROM Candidat
WHERE codeetab IN ('203', '206', '230', '235', '289'); 

-- Question 7 :

UPDATE notation
SET note = note + 1
WHERE codeEpreuve = '6';

-- Question 8 : 

SELECT nomCandidat, note
FROM candidat C, notation N
WHERE C.numCandidat = N.numCandidat
AND codeEpreuve = '6';

-- Question 9 : 

SELECT DISTINCT nomCandidat, nomEtab
FROM notation, etablissement, candidat
WHERE notation.numCandidat = candidat.numCandidat
AND Candidat.codeEtab = etablissement.codeEtab;

-- Question 10 : 

SELECT numCandidat, epreuve.codeEpreuve, note, coeff, note*coeff AS NoteCoefficiente
FROM epreuve, notation
WHERE epreuve.codeEpreuve = notation.codeEpreuve;

-- Question 11 : 

DELETE FROM candidat WHERE codeEtab IS NULL;



 