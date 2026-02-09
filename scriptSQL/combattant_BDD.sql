-- ORDRE DE CREATION DES TABLES
-- 1. Tables sans FK
CREATE TABLE Soldat (
    Matricule INT PRIMARY KEY,
    Nom VARCHAR(30),
    Prenom VARCHAR(40)
);

CREATE TABLE Niveau_Difficulte (
    Code_Niveau VARCHAR(10) PRIMARY KEY,  -- ou INT
    Libelle_Niveau VARCHAR(20),
    Bonus INT
);

-- 2. Tables avec FK qui ne sont pas des PK
CREATE TABLE Participation (
    Num_Participation INT PRIMARY KEY,
    Date_Participation DATE,
    Matricule INT,  
    CONSTRAINT fk_matricule FOREIGN KEY(Matricule)
		REFERENCES Soldat(Matricule)
);

CREATE TABLE Obstacle (
    Nom_Obstacle VARCHAR(30) PRIMARY KEY,
    Note_Mini INT,
    Code_Niveau VARCHAR(10),
    CONSTRAINT kf_code_niveau FOREIGN KEY(Code_Niveau)
		REFERENCES Niveau_Difficulte(Code_Niveau)
);

-- 3. Tables dont la PK est un ensemble de FK
CREATE TABLE Passer (
    Note_Instructeur INT,
    Temps VARCHAR(15),
    Num_Participation INT,
    Nom_Obstacle VARCHAR(30),
	CONSTRAINT pk_passer PRIMARY KEY (Num_Participation, Nom_Obstacle),
	CONSTRAINT fk_Nom_Obstacle FOREIGN KEY(Nom_Obstacle)
		REFERENCES Obstacle(Nom_Obstacle),
    CONSTRAINT fk_Num_Participation FOREIGN KEY(Num_Participation)
		REFERENCES Participation(Num_Participation)
);

