CREATE TABLE Stage(
   NomStage VARCHAR(50),
   Durée INT,
   CONSTRAINT pk_stage PRIMARY KEY(NomStage)
);

CREATE TABLE Session(
   NumSession VARCHAR(50),
   DateDébut DATE,
   Stage VARCHAR(50) NOT NULL,
   CONSTRAINT pk_session PRIMARY KEY(NumSession),
   CONSTRAINT fk_sstage FOREIGN KEY(Stage) REFERENCES Stage(NomStage)
);

CREATE TABLE Cours(
   Numcours INT,
   TrancheHoraire VARCHAR(50),
   Contenu VARCHAR(50),
   CONSTRAINT pk_cours PRIMARY KEY(Numcours)
);

CREATE TABLE Formateur(
   NumForm INT,
   NomForm VARCHAR(50),
   AdrForm VARCHAR(50),
   CONSTRAINT pk_formateur PRIMARY KEY(NumForm)
);

CREATE TABLE Entreprise(
   RefEntr INT,
   NomEntr VARCHAR(50),
   RespForm VARCHAR(50),
   CONSTRAINT pk_entreprise PRIMARY KEY(RefEntr)
);

CREATE TABLE Stagiaire(
   NumStagiaire INT,
   NomStagiaire VARCHAR(50),
   AdrStagiaire VARCHAR(50),
   RefEntr INT NOT NULL,
   CONSTRAINT pk_stagiaire PRIMARY KEY(NumStagiaire),
   CONSTRAINT fk_refentr FOREIGN KEY(RefEntr) REFERENCES Entreprise(RefEntr)
);

CREATE TABLE Constituer(
   NomStage VARCHAR(50),
   Numcours INT,
   CONSTRAINT pk_constituer PRIMARY KEY(NomStage,Numcours),
   CONSTRAINT fk_nomstage FOREIGN KEY(NomStage) REFERENCES Stage(NomStage),
   CONSTRAINT fk_numcours FOREIGN KEY(Numcours) REFERENCES Cours(Numcours)
);

CREATE TABLE Inscription(
   NumSession VARCHAR(50),
   NumStagiaire INT,
   DateInscription DATE,
   CONSTRAINT pk_inscription PRIMARY KEY(NumSession, NumStagiaire),
   CONSTRAINT fk_numsession FOREIGN KEY(NumSession) REFERENCES Session(NumSession),
   CONSTRAINT fk_numstagiaire FOREIGN KEY(NumStagiaire) REFERENCES Stagiaire(NumStagiaire)
);

CREATE TABLE Presence(
   NumSession VARCHAR(50),
   NumStagiaire INT,
   CONSTRAINT pk_presence PRIMARY KEY(NumSession, NumStagiaire),
   CONSTRAINT fk_numsession FOREIGN KEY(NumSession) REFERENCES Session(NumSession),
   CONSTRAINT fk_numstagaire FOREIGN KEY(NumStagiaire) REFERENCES Stagiaire(NumStagiaire)
);

CREATE TABLE Intervention(
   NumSession VARCHAR(50),
   Numcours INT,
   NumForm INT,
   Dates DATE,
   CONSTRAINT pk_intervention PRIMARY KEY(NumSession, Numcours, NumForm),
   CONSTRAINT fk_numsession FOREIGN KEY(NumSession) REFERENCES Session(NumSession),
   CONSTRAINT fk_numcours FOREIGN KEY(Numcours) REFERENCES Cours(Numcours),
   CONSTRAINT fk_numform FOREIGN KEY(NumForm) REFERENCES Formateur(NumForm)
);
