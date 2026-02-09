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


--question1 On veut obtenir la liste des codes candidats et des notes obtenues à l'épreuve d'économie (code épreuve = 6). 
--Cette liste doit être classée de manière à établir un classement de la meilleure note à la moins bonne.

select numCandidat , notes from notation 
where codeEpreuve=6
order by note desc;

--question 2 On souhaiterait afficher le code élève, le code épreuve, la note, le coefficient et la note coefficientée (note * coeff).

select notation.codeepreuve , coef , note , numCandidat , coef*note as NoteCoefficiente 
from notation , epreuve 
where notation.codeepreuve=epreuve.codeepreuve ;

--question 3 On veut obtenir le total des notes regroupé par code épreuve.

select sum(note) as TOTAL, codeEpreuve from epreuve 
group by codeepreuve;

--question 4 On désire connaître le nombre de candidats inscrits par établissement.

select count(numcandidat) as nbreCandidat , nomEtab 
from candidat , etablissement
where etablissement.codeetab=candidat.codeetab
group by nomEtab ;

-- question 5 On voudrait obtenir les statistiques suivantes (regroupées par code épreuve). On souhaite obtenir le résultat suivant 

select codeepreuve , avg(note) as moyennenote, min(note) as minimumdeNote ,max(note) as maximumdeNote
from notation 
group by codeepreuve ;

--question 6 On veut obtenir la liste des codes candidats (et leur moyenne) ayant la moyenne en économie (code épreuve = 6).
-- Cette liste doit être classée de manière à établir un classement du meilleur au moins bon élève en économie.

select numCandidat , avg(note) as moyenne from notation 
where codeEpreuve=6
group by numcandidat
having avg(note)>=10 
order by avg(note) desc ;