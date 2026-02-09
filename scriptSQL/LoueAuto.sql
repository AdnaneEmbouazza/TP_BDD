CREATE DATABASE aembouazza_LoueAuto ;

CREATE TABLE Client
(
reference            varchar(2),
nom                  varchar(55),
prenom               varchar(55),
adresseRue           varchar(55),
adresseVille         varchar(55),
adresseCodePostal    varchar(5),
PRIMARY KEY (reference)
);

CREATE TABLE Vehicule
(
immatriculation      varchar(8),
modele               varchar(55),
marque               varchar(55),
etat                 varchar(55),
km                   int,
PRIMARY KEY (immatriculation)
);


CREATE TABLE Location
(
numero               int,
immatriculationVehicule  varchar(8),
date                 date,
kmDebut              int,
kmFin                int,
Commentaires         varchar(55),
referenceClient      varchar(2),
nbJours              int,
PRIMARY KEY (numero),
CONSTRAINT fk_reference_client FOREIGN KEY (referenceClient) REFERENCES Client(reference),
CONSTRAINT fk_immatriculation FOREIGN KEY (immatriculationVehicule) REFERENCES Vehicule(immatriculation)
);

INSERT INTO Client VALUES ('11', 'Raqui', 'Sophie', '89, rue Ménard', 'Aulnay', '93600' );
INSERT INTO Client VALUES ('2', 'Bounard', 'Hamed', '23, rue des petits ponts', 'Aulnay', '93600' );
INSERT INTO Client VALUES ('3', 'Baltazard', NULL , '56, rue Arnaud', 'Montreuil', '93100' );
INSERT INTO Client VALUES ('4', 'Fermi', 'Jean', '1, rue de Paris', 'Romainville', '93230' );
INSERT INTO Client VALUES ('5', 'Valmont', 'Yann', '23, rue des Merles', 'Montreuil', '93100' );
INSERT INTO Client VALUES ('6', 'Rouault', 'Martine', '18, rue des Pervenches', 'Aulnay', '93600' );

INSERT INTO Vehicule VALUES ('123ASZ93', 'clio', 'Renault', 'rayure porte arrière gauche', 10235 );
INSERT INTO Vehicule VALUES ('4561FR93', 'clio', 'Renault', NULL, 9654 );
INSERT INTO Vehicule VALUES ('7895EZ93', 'AX', 'Citroen', 'pare-choc avant droit ; porte avant gauche', 4789 );

INSERT INTO Location VALUES (21, '123ASZ93', '01/08/09', 9425, 9512, 'ras', '2', 1 );
INSERT INTO Location VALUES (22, '4561FR93', '02/08/09', 8521, 8645, 'ras', '11', 1 );
INSERT INTO Location VALUES (24, '4561FR93', '04/08/09', 9645, 9021, 'ras', '5', 2 );
INSERT INTO Location VALUES (42, '123ASZ93', '02/08/09', 9512, 9628, 'rayure porte arrière gauche', '5', 1 );
INSERT INTO Location VALUES (43, '123ASZ93', '04/08/09', 9628, 10235, 'ras', '4', 2 );

INSERT INTO Client VALUES ('7', 'Diana', 'Gakou', '18, rue des Pervenches', 'Ausnières', '92000' );

/* question 1 la marque de la voiture louée pdt la location numéro 24 

il s'agit d'une Renault Clio avec comme immatriculation 4561FR93

_ le nom du client qui a loué cette voiture pour cette location 

Le client s'appelle Valmont Yann 

Question 2 pk km debut/fin est dans location et pas vehicule 

car un meme vehicule peut etre loué plusieurs fois par plusieurs clients avec des kilométrages debut/fin differents .

_ quand est ce que le kilometrage pourra etre mis à jour dans vehicule 

à chaque fois qu'un véhicule est rendu et que kilometre fin est rempli dans Location

Question 3 Écrire la requête SQL qui permet d'obtenir les noms et villes des clients qui ont loué un véhicule le 15/08/2009. */

select adresseVille, nom, prenom from location,client 
where location.referenceClient=client.reference
and date='15/08/2009';

/* Question 4 Écrire la requête SQL qui permet d'obtenir 
les modèles des véhicules loués pendant plus de 2 jours au cours d'une même location. */

select modele from Vehicule , Location 
where vehicule.immatriculation = location.immatriculationVehicule
and location.nbjours>2 ;

/* Question 5 Écrire la requête SQL qui permet
d'obtenir les noms des clients qui ont effectué plus de 300 km au cours d'une même location. */

select nom , prenom from Client , location 
where Client.reference = location.referenceClient
and location.kmFin- location.kmDebut>300 ;