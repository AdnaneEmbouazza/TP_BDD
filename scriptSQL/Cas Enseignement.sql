create database aembouazza_enseignement ;

create table Etudiant (
    NumE integer primary key ,
    NomE varchar (50) ,
    AgeE integer 
);

create table Enseignant (
    NumEn integer primary key ,
    NomEn varchar (50),
    NumDept integer 
); 

create table Cours (
    NomC varchar (50) primary key ,
    HorraireC time ,
    SalleC integer ,
    EnsC integer ,
    constraint fk_EnsC FOREIGN KEY (EnsC) references Enseignant (NumEn)
);

create table Inscrit (
    NumE integer ,
    NomC varchar (50),
    constraint pk_inscrit PRIMARY KEY (NumE , NomC)
);

-- question spécifier que la capacité de la salle doit etre supérieur à zero 

alter table Cours 
add CapC integer ;
alter table Cours 
add constraint Cap_C check (CapC > 0);

-- question pour mettre age par defaut à 18 ans 

alter table Etudiant 
alter AgeE set default 18 ;

-- question pour supprimer la contrainte sur la capacité de la salle > 0

alter table Cours
drop constraint Cap_c ; 

-- question pour Insérer le cours de SQL qui a lieu à 11h en salle 305 avec Mme Campos.

INSERT into Enseignant(NumEn, NomEn, NumDept) values(1, 'Mme Campos', null);
Insert into Cours (NomC , HorraireC , SalleC , EnsC ) values ('Cours de SQL' , '11:00:00', 305 , 1 );

-- question pour modifier le cours de SQL qui sera désormais donné par Mme Jimenez en salle 402.

INSERT into Enseignant(NumEn, NomEn, NumDept) values(2, 'Mme Jimenez', 1);
update Cours set EnsC = 2 , SalleC = 402 
WHERE NomC = 'cours de SQL';

-- question pour supprimer l'étudiant n°123.

delete from Etudiant 
where NumE = 123 ;

-- question pour modifier tous les cours car ils auront désormais lieu à 8h.

update Cours set HorraireC = '08:00:00';

-- question pour supprimer tous les étudiants âgés de moins de 13 ans et de plus de 99 ans.

delete from Etudiant 
where AgeE < 13 OR AgeE > 99 ;

-- question pour insérer le cours d'AMSI qui a lieu en salle 208 à 12h. 

insert into Cours (nomc , Sallec , Horrairec , Ensc) values ('Cours d AMSI' , 208 , '12:00:00' , null);