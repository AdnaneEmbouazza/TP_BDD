CREATE DATABASE aembouazza_repMus;

CREATE TABLE representation(
numRepresentation INTEGER PRIMARY KEY,
titre_representation VARCHAR,
lieu VARCHAR);

CREATE TABLE musicien(
nom VARCHAR PRIMARY KEY,
numRepresentation INTEGER,
CONSTRAINT fk_numRepMus FOREIGN KEY (numRepresentation) REFERENCES representation(numRepresentation)
);

CREATE TABLE programmer(
date DATE,
numRepresentation INTEGER,
tarif FLOAT,
CONSTRAINT pk_prog PRIMARY KEY (date, numRepresentation),
CONSTRAINT fk_numRepProg FOREIGN KEY (numRepresentation) REFERENCES representation(numRepresentation)
);

INSERT INTO representation VALUES(
1, 'Carmen', 'opera Bastille'),
(2, 'Figaro', 'théâtre Marigny'),
(3, 'Le Lac des Cygnes', 'theatre Michel'),
(4, 'Carmen','theâtre Mogador'),
(5, 'Mme Butterfly', 'theatre Moliere'),
(6, 'Carmen', 'Opéra Garnier');

INSERT INTO musicien VALUES(
'Marvel Comics', 1),(
'Super Man', 5),(
'Spider Man', 2),(
'Herr Man', 3),(
'Bat Man', 4
);

INSERT INTO programmer VALUES(
'09-09-2012', 1, 15),(
'12-12-2012', 2, NULL),(
'04-04-2012', 3, 7.5),(
'06-06-2012', 4, 9.7),(
'07-07-2012', 5, 10),(
'08-08-2012', 5, 11.90),(
'01-06-2012', 5, 12.10),(
'10-10-2012', 3, 7.50);

-- Question 1 Donner la liste des titres des représentations.

select titre_representation from representation ;

-- Question 2 Donner la liste des titres des représentations ayant lieu à l'opéra Bastille.

select titre_representation from representation where lower(lieu)= 'opéra bastille';

--Question 3 Donner la liste des lieux de représentation qui commencent par "opéra.

select lieu from representation where lieu like 'opéra%';

--Question 4 Donner la liste des noms des musiciens et des titres des représentations auxquelles ils participent.

select nom,titre_representation from representation,musicien 
where representation.numRepresentation=musicien.numRepresentation;

--Question 5 Donner la liste des titres des représentations, les lieux et les tarifs pour la journée du 14/09/2012.

select titre_representation,lieu,tarif from representation,programmer
where representation.numRepresentation=programmer.numRepresentation
and date='14/09/2012';

--Donner la liste (sans doublon) des noms de musiciens qui participent à la représentation de "Carmen".

select nom UNIQUE from musicien,representation 
where representation.numRepresentation=musicien.numRepresentation
and titre_representation='Carmen';

-- Donner la liste des représentations (num, titre et lieu) proposant un tarif à moins de 15 euros.

select representation.numRepresentation,titre_representation,lieu from representation,programmer
where representation.numRepresentation=programmer.numRepresentation
and tarif<15 ;

-- Donner la liste des titres des représentations ayant lieu au mois d'avril 2012.

select titre_representation from representation,programmer
where representation.numRepresentation=programmer.numRepresentation
and date between '01/04/2012' and '30/04/2012';

--Donner la liste des dates et numéro de représentation qui n'ont pas de tarif renseigné.

select date , programmer.numRepresentation from representation,programmer
where representation.numRepresentation=programmer.numRepresentation
and tarif=NULL;

-- Donner la liste des musiciens jouant aux théâtres suivant : théâtre Marigny, théâtre Michel, théâtre Mogador et théâtre Molière.


SELECT nom  FROM musicien, representation
WHERE representation.numRepresentation = musicien.numRepresentation
AND lieu LIKE 'th%';