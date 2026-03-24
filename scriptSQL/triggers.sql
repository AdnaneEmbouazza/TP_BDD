-- Trig 1

create table article (
    id int primary key,
    nom varchar(50)
) ;

create table fournisseur (
    id int primary key,
    nom varchar(50)
);

create table unite (
    id int primary key,
    nom varchar(50)
);

create table acheter (
    idArt int ,
    idFourn int ,
    constraint pk_acheter primary key (idArt , idFourn),
    constraint fk_idArt foreign key (idArt) references article(id),
    constraint fk_idFourn foreign key (idFourn) references fournisseur(id)
);

create table approvisionner (
    idArt int ,
    idUnit int,
    constraint pk_approvisioner primary key (idArt , idUnit),
    constraint fk_idArt2 foreign key (idArt) references article(id),
    constraint fk_idUnit foreign key (idUnit) references unite(id)
);

create or replace function verifAcheter() 
returns trigger 
Language plpgsql
AS $$
BEGIN
    if exists (select * 
    from approvisionner 
    where idArt = new.idArt) 
    then
        RAISE EXCEPTION 'Article deja lie a la table approvisionner ' ;
    END if;

    return new;
END ;
$$ ;

create trigger trig1acheter before insert or update on acheter FOR EACH ROW execute function verifAcheter() ;

create or replace function verifApprovisonner() 
returns trigger 
Language plpgsql
AS $$
BEGIN
    if exists (select * 
    from acheter 
    where idArt = new.idArt) 
    then
        RAISE EXCEPTION 'Article deja lie a la table acheter ' ;
    END if;

    return new;
END ;
$$ ;

create trigger trig1approvisionner before insert or update on approvisionner FOR EACH ROW execute function verifApprovisonner() ;

--insert pour le test des triggers
INSERT INTO Article VALUES (1, 'Stylo'), (2, 'Clavier'), (3, 'Souris');
INSERT INTO Fournisseur VALUES (1, 'FournA'), (2, 'FournB');
insert into unite values (1 , 'UniteA');

INSERT INTO Acheter VALUES (1, 1);
-- OK : l’article 1 n’est pas dans Approvisionner

INSERT INTO Approvisionner VALUES (2, 1);
-- OK

INSERT INTO Acheter VALUES (2, 2);
-- ERREUR attendue : "Article deja present dans approvisionner"

INSERT INTO Approvisionner VALUES (3, 1);
-- OK : l’article 3 n’est pas dans Acheter

INSERT INTO Approvisionner VALUES (1, 2);
-- ERREUR attendue : "Article deja present dans Acheter"




-- Trig 2 Nicolas Joachim

Create Table Contrat (
	id int,
	nom text,
	primary key (id)
);

Create Table Vehicule (
	id int,
	nom text,
	idcon int references Contrat(id),
	primary key (id)
);

Create Table Sinistre (
	id int,
	nom text,
	primary key (id)
);

Create Table Impliquer (
	idvehic int references Vehicule(id),
	idsin int references Sinistre(id),
	primary key (idvehic, idsin)
);


create or replace function verifContrat()
returns trigger
Language plpgsql
as $$
BEGIN
    if exists (
        select 1 from impliquer , vehicule
        where vehicule.id = new.idvehic
        and vehicule.idcon is null
    )
    then RAISE EXCEPTION 'Ce vehicule n est pas assigne à un contrat ';
    END if ;

    return new;
END;
$$;

create trigger trig2verifContrat before insert or update on Impliquer FOR EACH ROW execute function verifContrat() ;

--insert pour le test du trigger
-- Contrats
INSERT INTO Contrat VALUES (1, 'Contrat A'), (2, 'Contrat B');

-- Véhicules
INSERT INTO Vehicule VALUES
    (10, 'Voiture Rouge', 1),     -- possède un contrat
    (20, 'Moto Bleue', NULL),     -- n'a PAS de contrat
    (30, 'Camion Vert', 2);       -- possède un contrat

-- Sinistres
INSERT INTO Sinistre VALUES
    (100, 'Accident A'),
    (200, 'Accident B');

INSERT INTO Impliquer VALUES (10, 100);
-- OK : vehicule 10 a un contrat (idcon = 1)

INSERT INTO Impliquer VALUES (30, 200);
-- OK : vehicule 30 a un contrat (idcon = 2)

INSERT INTO Impliquer VALUES (20, 100);
-- ❌
-- ERREUR attendue :
-- "Ce vehicule ne possede pas de contrat."

INSERT INTO Impliquer VALUES (20, 200);
-- ❌
--ERREUR attendue



-- trig3 Roberto

create table Personne(
id integer primary key,
nom text,
prenom text
);

create table Abonnement(
id integer primary key,
libelle text,
idPersonne integer references personne(id)
);

create table Abonne(
idAbonnement integer references abonnement(id),
idPersonne integer references personne(id),
primary key(idAbonnement, idPersonne)
);

create table Pret(
id integer primary key,
libelle text,
idPersonne integer references personne(id)
);


insert into personne values (1, 'Kami','Zamasu');

create or replace function verifAboOnPret()
returns trigger
Language plpgsql
as $$
BEGIN
    if not exists (
        select 1 from Abonne
        where Abonne.idpersonne = new.idPersonne
    )
    then RAISE EXCEPTION 'La personne n a pas d abonnement';
    END if ;

    return new;
END;
$$;

create trigger trig3verifAbo before insert or update on Pret FOR EACH ROW execute function verifAboOnPret() ;

insert into personne values (2, 'Goku', 'Son');
insert into pret values (1, 'Livre A', 2); -- ERREUR attendue : "La personne n a pas d abonnement"

insert into personne values (3, 'Vegeta', 'Prince');
insert into abonnement values (1, 'Premium', 3);
insert into abonne values (1, 3);
insert into pret values (2, 'Livre B', 3); -- OK

-- trigger 4

create table professeur(
id integer primary key,
nom text,
prenom text
);

insert into professeur values(1,'monsieur','man');
insert into professeur values(2,'madame','miss');
insert into professeur values(3,'mademoiselle','petitemiss');

create table matiere(
id integer primary key,
libelle text);

insert into matiere values(1,'maths');
insert into matiere values(2,'francais');
insert into matiere values(3,'anglais');
insert into matiere values(4,'informatique');

create table classe(
id integer primary key,
classe text);

insert into classe values(1,'sio1A');
insert into classe values(2,'sio1B');
insert into classe values(3,'sio2A');
insert into classe values(4,'sio2B');

create table enseigner(
idclasse integer references classe(id),
idmatiere integer references matiere(id),
idprof integer references professeur(id),
primary key(idmatiere,idprof,idclasse));

create table qualifie(
idprof integer references professeur(id),
idmatiere integer references matiere(id),
primary key(idprof,idmatiere));

insert into qualifie values(1,1);
insert into qualifie values(2,3);
insert into qualifie values(3,2);
insert into qualifie values(2,1);


-- trig5 Augustin

create table Personne(
id serial primary key,
nom text,
prenom text
);

create table Logement (
num integer primary key,
type text,
posseder integer references Personne(id) 
);

create table Louer (
idPersonne integer references Personne(id),
numLogement integer references Logement(num),
primary key (idPersonne, numLogement)
);

-- trig 6 

CREATE table article(
idA int primary key,
nom text);

CREATE table depot(
idD int primary key,
nom text);

CREATE table DepotArticle(
idDep int references depot(idD),
idArticle int references article(idA),
primary key(idDep,idArticle));

CREATE table commande(
num int primary key,
idDepot int references depot(idD));

CREATE table commandeArticle(
numCom int references commande(num),
idArt int references article(idA),
primary key(numCom,idArt));


insert into article values ('1','iphone'),('2','galaxyS6');
insert into depot values ('1','paris'),('2','lille');
insert into commande values ('1','2');
insert into DepotArticle values('1','2');
insert into commandeArticle values('1','1');

-- Trig 7

create table Pays(
id serial primary key,
nomp text);

create table Ville(
id serial primary key,
nomv text);

create table Personne(
id serial primary key,
nom text,
prenom text,
idpays integer references Pays(id),
idville integer references Ville(id));