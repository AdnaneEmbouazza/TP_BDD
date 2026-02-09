CREATE DATABASE login_repMus;

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

--question 1 Donnez le nombre de représentations.

select count(numrepresentation) from representation ;

--question 2 Donnez le nombre de dates où il y a des représentations programmées.

select count(date)  , numrepresentation from programmer ;

--question 3 Donnez la liste des musiciens (leurs noms seront classés par ordre alphabétique) qui jouent dans la Basilique St Sernin

select nom , lieu from musicien , representation 
where musicien.numRepresentation=representation.numRepresentation
and lieu='Basilique St Sernin'
order by nom asc;

--question 4 Donner le prix moyen d'une représentation

select avg(tarif), numrepresentation from programmer 
group by numrepresentation ;

--question 5 Donner le nombre de représentations prévues (classé par numéro de représentation décroissant).

SELECT numRepresentation, COUNT(numRepresentation) FROM programmer
GROUP BY numRepresentation
ORDER BY numRepresentation DESC;

-- question 6 Donner le prix le plus élevé pour chaque représentation (on affichera uniquement les prix dépassant 15 euros).

select max(tarif) , numRepresentation from programmer 
group by numRepresentation
having (max)tarif>15;

--question 7 Classez les représentations (n° et titre) en fonction du nombre de musiciens qui y participent (par ordre croissant).

select representation.numRepresentation , titre_representation from musicien , representation
where musicien.numRepresentation=representation.numRepresentation 
group by numrepresentation,titre_representation
order by count(nom) asc ; 

--question 8 Donner la date de chaque représentation où l'on propose le tarif le plus intéressant (maximum à 30 euros), 
--le tout classé par date croissante et dans le cas où il y aurait plusieurs représentations à la même date, en fonction du tarif le plus attractif.

select date , numRepresentation , min(tarif) from programmer 
group by date , numRepresentation 
having (min(tarif) < 30)
order by date asc , min(tarif) asc;