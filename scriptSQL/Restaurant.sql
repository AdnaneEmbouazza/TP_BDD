CREATE TABLE Contenant (
    Id_contenant INTEGER PRIMARY KEY ,
    Nom_contenant varchar(50)
);

CREATE TABLE Boisson (
    Id_boisson INTEGER PRIMARY KEY ,
    Nom_boisoon varchar(50) unique NOT NULL,
    temperature INTEGER,
    Degree_alcool INTEGER ,
    constraint temp check(temperature>0)
);

CREATE TABLE Resto (
    Id_resto INTEGER PRIMARY KEY ,
    Nom_resto varchar(50) unique ,
    Adresse varchar(200),
    Telephone varchar(50),
    Nom_chef varchar(50),
    Nb_etoiles INTEGER default 0
);

CREATE TABLE Menu (
    Id_menu INTEGER PRIMARY KEY ,
    Entree varchar(50) NOT NULL, 
    Plat varchar (50) NOT NULL ,
    Dessert varchar (50) NOT NULL
);

CREATE TABLE Menu_resto (
    Id_resto INTEGER ,
    Id_menu INTEGER ,
    prix INTEGER ,
    constraint pk_MenuResto PRIMARY KEY (Id_resto , Id_menu),
    constraint fk_IdResto FOREIGN KEY (Id_resto) references Resto (Id_resto),
    constraint fk_Id_menu FOREIGN KEY (Id_menu) references Menu (Id_menu)
);

CREATE TABLE Boisson_servie (
    Id_resto INTEGER ,
    Id_boisson INTEGER , 
    Id_contenant INTEGER ,
    prix INTEGER ,
    constraint pk_Boisson_servie PRIMARY KEY (Id_resto , ID_boisson , ID_contenant),
    constraint fk_IdResto FOREIGN KEY (Id_resto) references Resto (Id_resto) ,
    constraint fk_IdBoissson FOREIGN KEY (Id_boisson) references Boisson (ID_boisson) ON UPDATE cascade,
    constraint fk_IdContenant FOREIGN KEY (ID_contenant) references Contenant (Id_contenant)
);

-- question 7
Alter table Boisson_servie
DROP constraint fk_IdContenant;
DROP table contenant;

-- question 8 
Alter table Menu
ADD CAFE INTEGER;
-- question 9
Alter table Menu
ADD constraint valeur_cafe check (CAFE=0 or CAFE=1);
-- question 10 
Alter table Resto
Alter column Nb_etoiles DROP default;
DROP constraint cst_nbetoile ;
-- question 11 
ALTER table Resto 
DROP column Nb_etoiles;
-- question 12 
alter table Resto 
ALter column Nom_resto type Varchar(30);
--question 13 
Alter table Menu
Alter column CAFE set default 1;