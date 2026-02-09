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

--question 1 

select count(numRepresentation) from representation 

--question 2 

select  count(date) from programmer 
where date = not null ;

--question 3 
insert into representation (numRepresentation,titre_representation,lieu) values (NULL, NULL ,' Basilique St Sernin ');
select nom from musicien,presentation 
where musicien.numRepresentation=presentation.numRepresentation
and lieu = ' Basilique St Sernin '
order by nom ASC;

--question 4 

select avg(tarif) from programmer;

--question 5 

select count(numRepresentation) from programmer 
order by numRepresentation DESC ;

--question 6 

select numRepresentation , max(tarif) from programmer
group by numRepresentation 
having tarif > 15;

--question 7 

select numRepresentation.representation , titre_representation , count(nom) from musicien , representation 
where numRepresentation.musicien = numRepresentation.representation
group by numRepresentation , titre_representation
order by 3 ASC; 

--question 8

select date , numRepresentation , min(tarif) from programmer 
group by numRepresentation , titre_representation
order by 3 ASC , 