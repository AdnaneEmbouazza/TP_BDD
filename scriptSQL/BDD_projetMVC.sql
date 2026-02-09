
CREATE DATABASE aembouazza_APprojet

create table Utilisateur (
    MailU varchar(70) primary key ,
    PseudoU varchar(50) , 
    ageU int 
);

create table JeuVideo(
    IdJeu varchar (50) primary key ,
    NomJeu varchar (50) ,
    DateParution date ,
    NomDeveloppeur varchar (50),
    NomEditeur varchar (50) , 
    DescriptionJeu varchar (350) ,
    Prix float 
);

create table TypeJeu(
    IdTypeJeu varchar (50) primary key ,
    NomTypeJeu varchar (50)
);

create table Commande(
    IdCommande varchar (50) primary key ,
    DateCommande date ,
    MailU varchar (70) ,
    constraint fk_Commande foreign key (MailU) REFERENCES utilisateur(MailU)
);

create table MediaJeu(
    IdMedia varchar(50) primary key , 
    CheminMedia varchar(300) ,
    IdJeu varchar (50) ,
    constraint fk_MediaJeu foreign key (IdJeu) REFERENCES JeuVideo(IdJeu)
);

create table Contenir(
    IdCommande varchar (50) ,
    IdJeu varchar (50) ,
    Quantité INT,
    constraint pk_contenir primary key (IdCommande, IdJeuVideo),
    constraint fk_Contenir_Commande foreign key (IdCommande) REFERENCES Commande(IdCommande),
    constraint fk_Contenir_Jeu foreign key (IdJeu) REFERENCES JeuVideo(IdJeu)
);

create table Determiner(
    IdJeu varchar (50) ,
    IdTypeJeu varchar (50) , 
    constraint pk_Determiner primary key ( IdJeu , IdTypeJeu ),
    constraint fk_Determiner_Jeu foreign key (IdJeu) REFERENCES JeuVideo(IdJeu),
    constraint fk_Determiner_TypeJeu foreign key (IdTypeJeu) REFERENCES JeuVideo(IdTypeJeu)
);

create table Critiquer(
    MailU varchar (70) ,
    IdJeu varchar (50) ,
    note int ,
    commentaire varchar (150),
    DateCritique date ,
    constraint pk_Critiquer primary key ( MailU , IdJeu ),
    constraint fk_Critiquer_MailU foreign key (MailU) REFERENCES utilisateur(MailU),
    constraint fk_Critiquer_Jeu foreign key (IdJeu) REFERENCES JeuVideo(IdJeu)
);

