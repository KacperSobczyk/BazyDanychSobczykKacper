CREATE DATABASE cw9;
GO
CREATE SCHEMA geol;
GO
CREATE TABLE geol.GeoEon(
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(40)
);

CREATE TABLE geol.GeoEra(
    id_era INT PRIMARY KEY,
    nazwa_era VARCHAR(40),
	id_eon INT
);

CREATE TABLE geol.GeoOkres(
    id_okres INT PRIMARY KEY,
    nazwa_okres VARCHAR(40),
	id_era INT
);

CREATE TABLE geol.GeoEpoka(
    id_epoka INT PRIMARY KEY,
    nazwa_epoka VARCHAR(40),
	id_okres INT
);

CREATE TABLE geol.GeoPietro(
    id_pietro INT PRIMARY KEY,
    nazwa_pietro VARCHAR(40),
	id_epoka INT
);
ALTER TABLE geol.GeoEra ADD FOREIGN KEY (id_eon) REFERENCES geol.GeoEon(id_eon);
ALTER TABLE geol.GeoOkres ADD FOREIGN KEY (id_era) REFERENCES geol.GeoEra(id_era);
ALTER TABLE geol.GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES geol.GeoOkres(id_okres);
ALTER TABLE geol.GeoPietro ADD FOREIGN KEY (id_Epoka) REFERENCES geol.GeoEpoka(id_epoka);

INSERT INTO geol.GeoEon(id_eon, nazwa_eon) VALUES (1,'Fanerozoik');
INSERT INTO geol.GeoEra(id_era, nazwa_era, id_eon) VALUES (1,'Peleozoik',1);
INSERT INTO geol.GeoEra(id_era, nazwa_era, id_eon) VALUES (2,'Mezozoik',1);
INSERT INTO geol.GeoEra(id_era, nazwa_era, id_eon) VALUES (3,'Kenozoik',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (1,'Kambr',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (2,'Ordowik',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (3,'Sylur',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (4,'Dewon',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (5,'Karbon',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (6,'Perm',1);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (7,'Trias',2);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (8,'Jura',2);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (9,'Kreda',2);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (10,'Paleogen',3);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (11,'Neogen',3);
INSERT INTO geol.GeoOkres(id_okres, nazwa_okres, id_era) VALUES (12,'Czwartorzed',3);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (1,'Oddzia³ 1',1);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (2,'Oddzia³ 2',1);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (3,'Oddzia³ 3',1);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (4,'Furong',1);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (5,'Dolny',2);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (6,'Œrodkowy',2);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (7,'Górny',2);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (8,'Landower',3);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (9,'Wenlok',3);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (10,'Ludlow',3);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (11,'Przydol',3);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (12,'Dolny',4);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (13,'Œrodkowy',4);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (14,'Górny',4);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (15,'Dolny',5);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (16,'Górny',5);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (17,'Cisural',6);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (18,'Gwadelup',6);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (19,'Loping',6);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (20,'Dolny',7);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (21,'Œrodkowy',7);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (22,'Górny',7);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (23,'Dolny',8);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (24,'Œrodkowy',8);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (25,'Górny',8);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (26,'Górny',9);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (27,'Dolny',9);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (28,'Paleocen',10);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (29,'Eocen',10);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (30,'Oligocen',10);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (31,'Miocen',11);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (32,'Pliocen',11);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (33,'Plejstocen',12);
INSERT INTO geol.GeoEpoka(id_epoka, nazwa_epoka, id_okres) VALUES (34,'Holocen',12);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (1,'Pietro 1',1);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (2,'Pietro 2',1);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (3,'Pietro 3',2);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (4,'Pietro 4',2);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (5,'Pietro 5',3);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (6,'Drum',3);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (7,'Pietro 7',3);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (8,'Paib',4);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (9,'Pietro 9',4);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (10,'Pietro 10',4);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (11,'Tremadok',5);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (12,'Floj',5);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (13,'Pietro 3',6);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (14,'Darriwil',6);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (15,'Sandb',7);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (16,'Kat',7);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (17,'Hirnant',7);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (18,'Rhuddan',8);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (19,'Aeron',8);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (20,'Telych',8);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (21,'Sheinwood',9);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (22,'Homer',9);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (23,'Gorst',10);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (24,'Ludford',10);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (25,'',11);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (26,'Lochkow',12);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (27,'Prag',12);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (28,'Ems',12);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (29,'Eifel',13);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (30,'¯ywet',13);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (31,'Fran',14);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (32,'Famen',14);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (33,'Turniej',15);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (34,'Wizen',15);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (35,'Serpuchow',15);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (36,'Baszkir',16);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (37,'Moskow',16);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (38,'Kasimow',16);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (39,'G¿el',16);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (40,'Assel',17);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (41,'Sakmar',17);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (42,'Artyñsk',17);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (43,'Kungur',17);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (44,'Road',18);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (45,'Word',18);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (46,'Capitan',18);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (47,'Wucziaping',19);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (48,'Czangsing',19);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (49,'Ind',20);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (50,'Olenek',20);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (51,'Anizyk',21);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (52,'Ladyn',21);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (53,'Karnik',22);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (54,'Noryk',22);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (55,'Retyk',22);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (56,'Hetang',23);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (57,'Synemur',23);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (58,'Pliensbach',23);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (59,'Toark',23);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (60,'Aalen',24);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (61,'Bajos',24);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (62,'Baton',24);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (63,'Kelowej',24);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (64,'Oksword',25);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (65,'Kimeryd',25);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (66,'Tyton',25);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (67,'Berias',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (68,'Walan¿yn',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (69,'Hoteryw',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (70,'Barrem',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (71,'Apt',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (72,'Alb',26);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (73,'Cenoman',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (74,'Turon',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (75,'Koniak',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (76,'Santon',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (77,'Kampan',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (78,'Mastrycht',27);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (79,'Dan',28);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (80,'Seland',28);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (81,'Tanet',28);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (82,'Ipres',29);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (83,'Lutet',29);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (84,'Barton',29);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (85,'Priabon',29);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (86,'Rupel',30);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (87,'Szat',30);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (88,'Akwitan',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (89,'Burdyga³',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (90,'Lang',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (91,'Serrewal',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (92,'Torton',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (93,'Messyn',31);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (94,'Zankl',32);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (95,'Piacent',32);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (96,'Gelas',32);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (97,'Dolny',33);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (98,'Œrodkowy',33);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (99,'Górny',33);
INSERT INTO geol.GeoPietro(id_pietro, nazwa_pietro, id_epoka) VALUES (100,'',34);


SELECT * FROM geol.GeoPietro


SELECT GeoEon.id_eon,nazwa_eon,GeoEra.id_era,nazwa_era,GeoOkres.id_okres,nazwa_okres,GeoEpoka.id_epoka,nazwa_epoka,id_pietro,nazwa_pietro
INTO geol.GeoTabela
FROM geol.GeoPietro 
 JOIN geol.GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
 JOIN geol.GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
 JOIN geol.GeoEra ON GeoEra.id_era = GeoOkres.id_era
 JOIN geol.GeoEon ON GeoEon.id_eon = GeoEra.id_eon
 ALTER TABLE geol.GeoTabela ADD PRIMARY KEY (id_Pietro);

SELECT * FROM geol.GeoTabela
CREATE TABLE geol.Dziesiec(cyfra int, bit int);
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (0,1)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (1,1)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (2,2)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (3,2)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (4,3)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (5,3)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (6,3)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (7,3)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (8,4)
INSERT INTO geol.Dziesiec(cyfra,bit) VALUES (9,3)


CREATE TABLE geol.Milion(liczba int ,cyfra int, bit int);

INSERT INTO  geol.Milion SELECT a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra + 
			10000 * a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM geol.Dziesiec a1, geol.Dziesiec a2, geol.Dziesiec a3, geol.Dziesiec a4, geol.Dziesiec a5, geol.Dziesiec a6 ;

SELECT * FROM geol.Dziesiec ORDER BY cyfra ASC

SELECT * FROM geol.Milion ORDER BY liczba ASC

--zapytanie 1:
SELECT GETDATE();
SELECT COUNT(*) FROM geol.Milion INNER JOIN geol.GeoTabela ON Milion.liczba%100 =(geol.GeoTabela.id_pietro);
SELECT GETDATE();

--zapytanie 2:
SELECT GETDATE();
SELECT COUNT(*) FROM geol.Milion INNER JOIN  geol.GeoPietro  ON 
Milion.liczba%100=GeoPietro.id_pietro  
JOIN geol.GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
JOIN geol.GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
JOIN geol.GeoEra ON GeoEra.id_era = GeoOkres.id_era
JOIN geol.GeoEon ON GeoEon.id_eon = GeoEra.id_eon 
SELECT GETDATE();
--zapytanie 3:
SELECT GETDATE();
SELECT COUNT(*) FROM geol.Milion WHERE Milion.liczba%100= (SELECT id_pietro FROM geol.GeoTabela WHERE Milion.liczba%100 =(id_pietro));
SELECT GETDATE();
--zapytanie 4:
SELECT GETDATE();
SELECT COUNT(*) FROM geol.Milion
WHERE Milion.liczba%100 IN (SELECT GeoPietro.id_pietro FROM geol.GeoPietro 
 JOIN geol.GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka 
 JOIN geol.GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres
 JOIN geol.GeoEra ON GeoEra.id_era = GeoOkres.id_era
 JOIN geol.GeoEon ON GeoEon.id_eon = GeoEra.id_eon)
 SELECT GETDATE();

 CREATE INDEX milion
ON geol.Milion (liczba);

 CREATE INDEX tabela
ON geol.GeoTabela (id_eon,id_era,id_okres,id_epoka,id_pietro);

CREATE INDEX eon
ON geol.GeoEon (id_eon);

CREATE INDEX era
ON geol.GeoEra (id_era);

CREATE INDEX okres
ON geol.GeoOkres (id_okres);

CREATE INDEX epoka
ON geol.GeoEpoka (id_epoka);

CREATE INDEX pietro
ON geol.GeoPietro (id_pietro);




