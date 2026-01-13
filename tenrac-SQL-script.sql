
CREATE TABLE Titre(
   nomTitre VARCHAR(50),
   PRIMARY KEY(nomTitre)
);

CREATE TABLE Dignite(
   nomDignite VARCHAR(50),
   PRIMARY KEY(nomDignite)
);

CREATE TABLE Rang(
   nomRang VARCHAR(50),
   PRIMARY KEY(nomRang)
);

CREATE TABLE adressePostale(
   Ville VARCHAR(50),
   codePostale CHAR(5),
   PRIMARY KEY(Ville, codePostale)
);

CREATE TABLE Organisation(
   raisonSociale VARCHAR(50),
   numSiret VARCHAR(14) NOT NULL,
   PRIMARY KEY(raisonSociale),
   UNIQUE(numSiret)
);

CREATE TABLE Ordre(
   IdOrdre INT,
   nomOrdre VARCHAR(50),
   PRIMARY KEY(IdOrdre)
);

CREATE TABLE Partenaire(
   IdPartenaire INT,
   nomPartenaire VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdPartenaire)
);

CREATE TABLE Date_(
   Date_ DATE,
   PRIMARY KEY(Date_)
);

CREATE TABLE Ingredient(
   idIngredient VARCHAR(50),
   PRIMARY KEY(idIngredient)
);

CREATE TABLE Allergene(
   Nom_allergene VARCHAR(50),
   PRIMARY KEY(Nom_allergene)
);

CREATE TABLE Plat(
   Intitule VARCHAR(50),
   PRIMARY KEY(Intitule)
);

CREATE TABLE Sauces(
   Nom_sauce VARCHAR(50),
   PRIMARY KEY(Nom_sauce)
);

CREATE TABLE Machine(
   IdMachine INT,
   modeleMachine VARCHAR(70) NOT NULL,
   PRIMARY KEY(IdMachine)
);

CREATE TABLE Entretien(
   nomEntretien VARCHAR(50),
   typeEntretien VARCHAR(50),
   PRIMARY KEY(nomEntretien)
);

CREATE TABLE Lieu(
   Ville VARCHAR(50),
   codePostale CHAR(5),
   NomLieu VARCHAR(50),
   AdresseLieu VARCHAR(50),
   IdPartenaire INT NOT NULL,
   PRIMARY KEY(Ville, codePostale, NomLieu),
   FOREIGN KEY(Ville, codePostale) REFERENCES adressePostale(Ville, codePostale),
   FOREIGN KEY(IdPartenaire) REFERENCES Partenaire(IdPartenaire)
);

CREATE TABLE Grade(
   nomGrade VARCHAR(50),
   PRIMARY KEY(nomGrade)
);

CREATE TABLE Repas(
   IdRepas INT,
   nomRepas VARCHAR(50),
   PRIMARY KEY(IdRepas)
);

CREATE TABLE Club(
   IdOrdre INT,
   IdClub INT,
   nomClub VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdOrdre, IdClub),
   FOREIGN KEY(IdOrdre) REFERENCES Ordre(IdOrdre)
);

CREATE TABLE Reunion(
   Date_ DATE,
   Ville VARCHAR(50),
   codePostale CHAR(5),
   NomLieu VARCHAR(50),
   nomReunion VARCHAR(50),
   nbParticipants INT NOT NULL,
   IdRepas INT NOT NULL,
   PRIMARY KEY(Date_, Ville, codePostale, NomLieu),
   FOREIGN KEY(Date_) REFERENCES Date_(Date_),
   FOREIGN KEY(Ville, codePostale, NomLieu) REFERENCES Lieu(Ville, codePostale, NomLieu),
   FOREIGN KEY(IdRepas) REFERENCES Repas(IdRepas)
);

CREATE TABLE pasLegumes(
   idIngredient VARCHAR(50),
   Nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(idIngredient),
   FOREIGN KEY(idIngredient) REFERENCES Ingredient(idIngredient)
);

CREATE TABLE Legume(
   idIngredient VARCHAR(50),
   NomLegume VARCHAR(50) NOT NULL,
   PRIMARY KEY(idIngredient),
   FOREIGN KEY(idIngredient) REFERENCES Ingredient(idIngredient)
);

CREATE TABLE Tenrac(
   IdTenrac INT,
   NomTenrac VARCHAR(30) NOT NULL,
   PrenomTenrac VARCHAR(30) NOT NULL,
   Mail VARCHAR(60) NOT NULL,
   Telrac VARCHAR(15) NOT NULL,
   AdresseTenrac VARCHAR(100) NOT NULL,
   nomGrade VARCHAR(50) NOT NULL,
   nomRang VARCHAR(50),
   nomDignite VARCHAR(50),
   nomTitre VARCHAR(50),
   IdOrdre INT NOT NULL,
   IdOrdre_1 INT,
   IdClub INT,
   raisonSociale VARCHAR(50),
   Ville VARCHAR(50) NOT NULL,
   codePostale CHAR(5) NOT NULL,
   PRIMARY KEY(IdTenrac),
   UNIQUE(Mail),
   UNIQUE(Telrac),
   FOREIGN KEY(nomGrade) REFERENCES Grade(nomGrade),
   FOREIGN KEY(nomRang) REFERENCES Rang(nomRang),
   FOREIGN KEY(nomDignite) REFERENCES Dignite(nomDignite),
   FOREIGN KEY(nomTitre) REFERENCES Titre(nomTitre),
   FOREIGN KEY(IdOrdre) REFERENCES Ordre(IdOrdre),
   FOREIGN KEY(IdOrdre_1, IdClub) REFERENCES Club(IdOrdre, IdClub),
   FOREIGN KEY(raisonSociale) REFERENCES Organisation(raisonSociale),
   FOREIGN KEY(Ville, codePostale) REFERENCES adressePostale(Ville, codePostale)
);

CREATE TABLE Technicien(
   IdTenrac INT,
   DiplomeTechnique BOOL,
   PRIMARY KEY(IdTenrac),
   FOREIGN KEY(IdTenrac) REFERENCES Tenrac(IdTenrac)
);

CREATE TABLE Collabore(
   IdOrdre INT,
   IdPartenaire INT,
   PRIMARY KEY(IdOrdre, IdPartenaire),
   FOREIGN KEY(IdOrdre) REFERENCES Ordre(IdOrdre),
   FOREIGN KEY(IdPartenaire) REFERENCES Partenaire(IdPartenaire)
);

CREATE TABLE assiste(
   IdTenrac INT,
   Date_ DATE,
   Ville VARCHAR(50),
   codePostale CHAR(5),
   NomLieu VARCHAR(50),
   PRIMARY KEY(IdTenrac, Date_, Ville, codePostale, NomLieu),
   FOREIGN KEY(IdTenrac) REFERENCES Tenrac(IdTenrac),
   FOREIGN KEY(Date_, Ville, codePostale, NomLieu) REFERENCES Reunion(Date_, Ville, codePostale, NomLieu)
);

CREATE TABLE supervise(
   IdTenrac INT,
   Date_ DATE,
   Ville VARCHAR(50),
   codePostale CHAR(5),
   NomLieu VARCHAR(50),
   PRIMARY KEY(IdTenrac, Date_, Ville, codePostale, NomLieu),
   FOREIGN KEY(IdTenrac) REFERENCES Tenrac(IdTenrac),
   FOREIGN KEY(Date_, Ville, codePostale, NomLieu) REFERENCES Reunion(Date_, Ville, codePostale, NomLieu)
);

CREATE TABLE Avoir(
   idIngredient VARCHAR(50),
   Nom_allergene VARCHAR(50),
   PRIMARY KEY(idIngredient, Nom_allergene),
   FOREIGN KEY(idIngredient) REFERENCES Ingredient(idIngredient),
   FOREIGN KEY(Nom_allergene) REFERENCES Allergene(Nom_allergene)
);

CREATE TABLE Sauce(
   Intitule VARCHAR(50),
   Nom_sauce VARCHAR(50),
   PRIMARY KEY(Intitule, Nom_sauce),
   FOREIGN KEY(Intitule) REFERENCES Plat(Intitule),
   FOREIGN KEY(Nom_sauce) REFERENCES Sauces(Nom_sauce)
);

CREATE TABLE Fait(
   idIngredient VARCHAR(50),
   Nom_sauce VARCHAR(50),
   PRIMARY KEY(idIngredient, Nom_sauce),
   FOREIGN KEY(idIngredient) REFERENCES Ingredient(idIngredient),
   FOREIGN KEY(Nom_sauce) REFERENCES Sauces(Nom_sauce)
);

CREATE TABLE Compose_de(
   idIngredient VARCHAR(50),
   Intitule VARCHAR(50),
   PRIMARY KEY(idIngredient, Intitule),
   FOREIGN KEY(idIngredient) REFERENCES Ingredient(idIngredient),
   FOREIGN KEY(Intitule) REFERENCES Plat(Intitule)
);

CREATE TABLE Periode(
   IdMachine INT,
   nomEntretien VARCHAR(50),
   periodicite VARCHAR(50),
   PRIMARY KEY(IdMachine, nomEntretien),
   FOREIGN KEY(IdMachine) REFERENCES Machine(IdMachine),
   FOREIGN KEY(nomEntretien) REFERENCES Entretien(nomEntretien)
);

CREATE TABLE PasserEntretien(
   Date_ DATE,
   IdMachine INT,
   nomEntretien VARCHAR(50),
   IdTenrac INT,
   PRIMARY KEY(Date_, IdMachine, nomEntretien, IdTenrac),
   FOREIGN KEY(Date_) REFERENCES Date_(Date_),
   FOREIGN KEY(IdMachine) REFERENCES Machine(IdMachine),
   FOREIGN KEY(nomEntretien) REFERENCES Entretien(nomEntretien),
   FOREIGN KEY(IdTenrac) REFERENCES Technicien(IdTenrac)
);

CREATE TABLE Composer(
   Intitule VARCHAR(50),
   IdRepas INT,
   PRIMARY KEY(Intitule, IdRepas),
   FOREIGN KEY(Intitule) REFERENCES Plat(Intitule),
   FOREIGN KEY(IdRepas) REFERENCES Repas(IdRepas)
);

INSERT INTO Ordre VALUES (1, 'Ordre des Chefs');
INSERT INTO Ordre VALUES (2, 'Ordre Marseille');
INSERT INTO Ordre VALUES (3, 'Ordre Paris');
INSERT INTO Ordre VALUES (4, 'Ordre PACA');
INSERT INTO Ordre VALUES (5, 'Ordre Lyon');
INSERT INTO Ordre VALUES (6, 'Ordre Alsace');
INSERT INTO Ordre VALUES (7, 'Ordre AntiLegumes');
INSERT INTO Ordre VALUES (8, 'Ordre Occitanie');
INSERT INTO Ordre VALUES (9, 'Ordre Europeen');

INSERT INTO Club VALUES (1, 1, 'Bosses');
INSERT INTO Club VALUES (1, 2, 'Ladies');
INSERT INTO Club VALUES (1, 3, 'Les Rois');
INSERT INTO Club VALUES (1, 4, 'Les Reines');
INSERT INTO Club VALUES (1, 5, 'Martin Nevot');
INSERT INTO Club VALUES (2, 1, 'Olympique Marseille');
INSERT INTO Club VALUES (2, 2, 'Savonnieres');
INSERT INTO Club VALUES (2, 3, 'Luminy');
INSERT INTO Club VALUES (2, 4, 'Saint Charles');
INSERT INTO Club VALUES (2, 5, 'Les Calanques');
INSERT INTO Club VALUES (3, 1, 'Allez PSG');
INSERT INTO Club VALUES (3, 2, 'Sorbonne');
INSERT INTO Club VALUES (3, 3, 'Pantheon');
INSERT INTO Club VALUES (3, 4, 'Les Nanterre');
INSERT INTO Club VALUES (3, 5, 'Paris-Saclay');
INSERT INTO Club VALUES (4, 1, 'Aixois');
INSERT INTO Club VALUES (4, 2, 'IUT Gaston Berger');
INSERT INTO Club VALUES (4, 3, 'Gap');
INSERT INTO Club VALUES (4, 4, 'Les Cucurbitacees');
INSERT INTO Club VALUES (4, 5, 'Sainte-Croix');
INSERT INTO Club VALUES (5, 1, 'Les Bouchons');
INSERT INTO Club VALUES (5, 2, 'Les Funiculaires');
INSERT INTO Club VALUES (6, 1, 'Fondue Vigneronne');
INSERT INTO Club VALUES (6, 2, 'Bretzels');
INSERT INTO Club VALUES (7, 1, 'Les Canard-Au-Sang');
INSERT INTO Club VALUES (7, 2, 'Les Foies Gras');
INSERT INTO Club VALUES (8, 1, 'Cassoulets');
INSERT INTO Club VALUES (9, 1, 'Les Gourmands Internationaux');
INSERT INTO Club VALUES (9, 2, 'Fromageres');

INSERT INTO Organisation VALUES ('TOTALENERGIES SE', 54205118000066);
INSERT INTO Organisation VALUES ('CARREFOUR FRANCE', 65205008502051);
INSERT INTO Organisation VALUES ('LVMH MOET HENNESSY LOUIS VUITTON', 77567041700051);
INSERT INTO Organisation VALUES ('BUSINESS FRANCE', 45193005100052);
INSERT INTO Organisation VALUES ('THE FRENCH MANAGEMENT', 98819846100028);
INSERT INTO Organisation VALUES ('LVMH MOET HENNESSY LOUIS VUITTON', 77567041700051);
INSERT INTO Organisation VALUES ('OPENAI FRANCE', 93245523100021);
INSERT INTO Organisation VALUES ('CROIX ROUGE FRANCAISE', 77567227221138);
INSERT INTO Organisation VALUES ('LA POSTE', 35600000000048);
INSERT INTO Organisation VALUES ('ALDI', 39922799000054);




