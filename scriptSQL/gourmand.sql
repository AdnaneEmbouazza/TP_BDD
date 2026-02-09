
CREATE TABLE  Clients  (
     CodeClient  integer primary key,
     NomClient  character varying(35),
     AdresseClient  character varying(50),
     CPClient  character varying(5),
     VilleClient  character varying(25),
     TelephoneClient  character varying(16)
);

CREATE TABLE  Vendeurs  (
     CodeVendeur  integer primary key ,
     NomVendeur  character varying(35),
     AdresseV  character varying(40),
     CPV  character varying(5),
     VilleV  character varying(30),
     TelephoneV  character varying(16)
);

CREATE TABLE  Produits  (
     Ref  character varying(4) primary key,
     Designation  character varying(30),
     Quantite  integer,
     Descriptif  character varying(1),
     PUHT  double precision,
     Stock  double precision,
     Poids_piece  integer
);

CREATE TABLE  Commandes  (
     NumCommande  integer primary key,
     CodeVendeur  integer,
     CodeClient  integer,
     DateLivraison  timestamp with time zone,
     DateCommande  timestamp with time zone,
     TotalHT  double precision,
     TotalTVA  double precision,
     EtatCommande  smallint ,
     constraint fk_clients foreign key (CodeClient) References Clients(CodeClient),
     constraint fk_vendeurs foreign key (CodeVendeur) References Vendeurs(CodeVendeur)
);


CREATE TABLE  Lignes_commande  (
     NumeroCommande  integer,
     NumeroLigne  smallint,
     Reference  character varying(4),
     QuantiteDemandee  smallint,
     constraint pk_LignesCommande primary key(NumeroCommande , NumeroLigne),
     constraint fk_NumCommande foreign key(NumeroCommande) References Commandes(NumCommande),
     constraint fk_Ref foreign key (Reference) References Produits(Ref)
);


INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (17, 'TARINAUX Lucien', '12 rue de la Justice', '51100', 'REIMS', '03.26.25.48.87');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (46, 'MARTUSE', '103 avenue Lear', '51100', 'REIMS', '03.26.03.25.26');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (47, 'RABIN Sandrine', '21 rue de la Mediterranee', '51100', 'REIMS', '03.26.14.15.25');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (48, 'SILLARD Laurence', '15 rue Pasentiers', '51100', 'REIMS', '03.26.11.11.25');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (49, 'COTOY Sylvie', '12 rue des ecus', '51100', 'REIMS', '03.26.10.25.75');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (50, 'HELLOU Bernard', '21 rue de la Mediterranee', '51100', 'REIMS', '03.26.12.25.42');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (51, 'HENTION Martine', '50 allee des bons enfants', '51100', 'REIMS', '03.26.12.25.86');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (52, 'SIBAT Evelyne', '14 rue de la Baltique', '51100', 'REIMS', '03.26.12.23.33');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (53, 'MARIN Dominique', '24 rue de la Baltique', '51100', 'REIMS', '03.26.10.10.23');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (54, 'DURDUX Monique', '15 allee des Bearnais', '51150', 'VITRY LE FRANCOIS', '03.26.42.42.33');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (55, 'CANILLE Walter', '14 rue Lanterneau', '51100', 'REIMS', '03.26.12.12.87');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (56, 'BOUQUET Antoinette', '1, rue de la Mediterranee', '51140', 'ROMAIN', '03.26.78.89.54');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (57, 'GAUTON Nadine', '5 place des Oiseaux', '51200', 'FISMES', '03.26.53.56.55');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (58, 'LEGROS Christian', '18 place des Oiseaux', '51200', 'FISMES', '03.26.44.55.66');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (59, 'DUMOITIERS Lucille', '12 place Centrale', '02320', 'LONGUEVAL', '03.26.86.43.25');
INSERT INTO  Clients  ( CodeClient ,  NomClient ,  AdresseClient ,  CPClient ,  VilleClient ,  TelephoneClient ) VALUES (60, 'BOUCHE Carole', '4, rue Brule', '51200', 'FISMES', '03.26.33.96.85');

INSERT INTO  Vendeurs  ( CodeVendeur ,  NomVendeur ,  AdresseV ,  CPV ,  VilleV ,  TelephoneV ) VALUES (15, 'FILLARD Sylvain', '77 rue du l''Adriatique', '51100', 'REIMS', '03.26.12.25.25');
INSERT INTO  Vendeurs  ( CodeVendeur ,  NomVendeur ,  AdresseV ,  CPV ,  VilleV ,  TelephoneV ) VALUES (17, 'BAUDOT Marc', '16 rue de Reims', '51000', 'CHALONS EN CHAMPAGNE', '03.26.10.58.59');

INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('1004', 'FEU DE JOIE LIQUEUR ASSORT.', 500, 'G', 23, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('1007', 'TENDRE FRUIT', 500, 'G', 18, 120, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('1015', 'CARACAO', 500, 'G', 24.5, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('1016', 'COKTAIL', 500, 'G', 33, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('1017', 'ORFIN', 500, 'G', 32, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('3002', 'CARRE PECTO', 500, 'G', 29, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('3004', 'ZAN ALESAN', 25, 'P', 15, 50, 20);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('3010', 'PATES GRISES', 500, 'G', 35, 100, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('3016', 'CARAMEL AU LAIT', 500, 'G', 20, 100, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('3017', 'VIOLETTE TRADITION', 500, 'G', 25, 100, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4002', 'SUCETTE BOULE FRUIT', 25, 'P', 14, 100, 40);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4004', 'SUCETTE BOULE POP', 25, 'P', 21, 50, 40);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4010', 'CARAMBAR', 40, 'P', 18, 20, 15);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4011', 'CARANOUGA', 40, 'P', 18, 100, 15);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4012', 'CARAMBAR FRUIT', 40, 'P', 18, 100, 15);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4013', 'CARAMBAR COLA', 40, 'P', 18, 50, 15);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4015', 'SOURIS REGLISSE', 500, 'G', 24, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4016', 'SOURIS CHOCO', 500, 'G', 24, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4019', 'SCHTROUMPFS VERTS', 500, 'G', 24, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4020', 'CROCODILE', 500, 'G', 21, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4022', 'PERSICA', 500, 'G', 28, 20, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4025', 'COLA CITRIQUE', 500, 'G', 21, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4026', 'COLA LISSE', 500, 'G', 25, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4027', 'BANANE', 1000, 'G', 23, 20, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4029', 'OEUF SUR LE PLAT', 500, 'G', 25, 20, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4030', 'FRAISIBUS', 500, 'G', 25, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4031', 'FRAISE TSOIN-TSOIN', 500, 'G', 25, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4032', 'METRE REGLISSE ROULE', 500, 'G', 19, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4033', 'MAXI COCOBAT', 1000, 'G', 19, 20, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4034', 'DENTS VAMPIRE', 500, 'G', 22, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4036', 'LANGUE COLA CITRIQUE', 500, 'G', 21, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4037', 'OURSON CANDI', 1000, 'G', 21, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4039', 'SERPENT ACIDULE', 500, 'G', 21, 20, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4042', 'TETINE CANDI', 500, 'G', 20, 40, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4045', 'COLLIER PECCOS', 15, 'P', 21, 50, 50);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4052', 'TWIST ASSORTIS', 500, 'G', 22, 50, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4053', 'OURSON GUIMAUVE', 500, 'G', 35, 10, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4054', 'BOULE COCO MULER', 500, 'G', 34, 10, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4055', 'COCOMALLOW', 500, 'G', 33, 10, 0);
INSERT INTO  Produits  ( Ref ,  Designation ,  Quantite ,  Descriptif ,  PUHT ,  Stock ,  Poids_piece ) VALUES ('4057', 'CRIC-CRAC', 500, 'G', 33, 10, 0);


INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10178, 15, 47, '2008-09-05 00:00:00+02', '2008-09-05 00:00:00+02', 177, 9.75, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10179, 15, 47, '2008-10-13 00:00:00+02', '2008-10-13 00:00:00+02', 192, 10.5, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10180, 15, 48, '2008-10-10 00:00:00+02', '2008-10-10 00:00:00+02', 98, 5.4000000000000004, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10181, 15, 49, '2008-10-11 00:00:00+02', '2008-10-11 00:00:00+02', 175, 9.5999999999999996, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10182, 15, 50, '2008-10-11 00:00:00+02', '2008-10-11 00:00:00+02', 116, 6.4000000000000004, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10183, 15, 51, '2008-10-11 00:00:00+02', '2008-10-11 00:00:00+02', 118, 6.5, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10184, 15, 52, '2008-10-12 00:00:00+02', '2008-10-12 00:00:00+02', 102, 5.5999999999999996, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10185, 15, 53, '2008-10-12 00:00:00+02', '2008-10-12 00:00:00+02', 19, 1.05, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10186, 15, 54, '2008-10-10 00:00:00+02', '2008-10-10 00:00:00+02', 101, 5.5549999999999997, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10187, 15, 55, '2008-10-10 00:00:00+02', '2008-10-10 00:00:00+02', 65, 3.5750000000000002, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10188, 17, 56, '2008-10-12 00:00:00+02', '2008-10-12 00:00:00+02', 121, 6.6550000000000002, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10189, 17, 57, '2008-10-10 00:00:00+02', '2008-10-10 00:00:00+02', 110, 6.0499999999999998, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10190, 17, 58, '2008-10-13 00:00:00+02', '2008-10-13 00:00:00+02', 123, 6.7649999999999997, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10191, 17, 59, '2008-10-13 00:00:00+02', '2008-10-13 00:00:00+02', 107.5, 5.9124999999999996, 1);
INSERT INTO  Commandes  ( NumCommande ,  CodeVendeur ,  CodeClient ,  DateLivraison ,  DateCommande ,  TotalHT ,  TotalTVA ,  EtatCommande ) VALUES (10192, 17, 60, '2008-11-10 00:00:00+01', '2008-11-10 00:00:00+01', 237, 13.035, 1);



INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 1, '4015', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 2, '4025', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 3, '4031', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 4, '4036', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 5, '4004', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 6, '4053', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10178, 7, '4042', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 1, '4031', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 2, '4032', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 3, '4037', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 4, '4002', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 5, '4054', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 6, '4057', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10179, 7, '1007', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10180, 1, '4053', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10180, 2, '4055', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10180, 3, '3016', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 1, '4020', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 2, '4026', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 3, '4045', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 4, '4002', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 5, '4012', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10181, 6, '4054', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10182, 1, '4034', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10182, 2, '4012', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10182, 3, '4055', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10182, 4, '4057', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10183, 1, '4025', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10183, 2, '4027', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10183, 3, '4029', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10183, 4, '4039', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10183, 5, '4013', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10184, 1, '4025', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10184, 2, '4031', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10184, 3, '4004', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10185, 1, '4002', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10186, 1, '1016', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10186, 2, '3002', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10187, 1, '4015', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10187, 2, '4010', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10187, 3, '4011', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10188, 1, '1016', 2);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10188, 2, '4052', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10188, 3, '1004', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10189, 1, '1017', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10189, 2, '4016', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10189, 3, '4031', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10189, 4, '4033', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10190, 1, '3010', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10190, 2, '4015', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10190, 3, '4032', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10190, 4, '4053', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10191, 1, '1016', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10191, 2, '4052', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10191, 3, '4013', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10191, 4, '1015', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 1, '4025', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 2, '4030', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 3, '1017', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 4, '3016', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 5, '4031', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 6, '3017', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 7, '4022', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 8, '4052', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 9, '3004', 1);
INSERT INTO  Lignes_commande  ( NumeroCommande ,  NumeroLigne ,  Reference ,  QuantiteDemandee ) VALUES (10192, 10, '4019', 1);

-- Question 1 )

select NomClient , AdresseClient , TelephoneClient from client 
where NomClient like "_A_IN";

-- question 2 )

select NumCommande from Clients , Commandes 
where Client.CodeClient = Commandes.CodeClient
and NomClient like "% RABIN ";

--question 3 )

select distinct designation from Produits , Lignes_commande , Commandes , Clients 
where Produits.Reference = Lignes_commande.Reference 
and Lignes_commande.NumCommande = Commandes.NumCommande
and Commandes.CodeClient = Clients.CodeClient
and NomClient like "% RABIN";

--question 4 )

select TotalHT from Commandes , Clients 
where Commandes.CodeClient = Clients.CodeClient
and NomClient like "% RABIN";

--question 5 )

select sum(PUHT) from Produits , Lignes_commande , Commandes , Clients 
where Produits.Reference = Lignes_commande.Reference 
and Lignes_commande.NumCommande = Commandes.NumCommande
and Commandes.CodeClient = Clients.CodeClient
and NomClient like "% RABIN";

--question 6 )

select sum(TotalTVA) from Commandes where DateCommande between "01-10-2008" and "31-10-2008";

--question 7 ) 

select NomVendeur , sum(TotalTVA) from Commandes , Vendeurs
where Vendeurs.CodeVendeur = Commandes.CodeVendeur 
and DateCommande between "01-10-2008" and "31-10-2008"
group by NomVendeur;

--question 8 )

select DateCommande , sum(TotalTVA) from commandes
group by DateCommande 
having sum(TotalTVA) > 300
order by DateCommande ;

--question 9 )

select designation , max(DateCommande) from Produits , commandes , Lignes_commande
where Produits.Ref = Lignes_commande.Reference 
and Lignes_commande.NumeroCommande = Commandes.NumCommande 
group by designation 
order by DateCommande DESC ;



