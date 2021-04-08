CREATE DATABASE firma;
GO
CREATE SCHEMA rozliczenia;
GO
CREATE TABLE rozliczenia.pracownicy
(
id_pracownika VARCHAR(4) PRIMARY KEY NOT NULL,
imie VARCHAR(16) NOT NULL,
nazwisko VARCHAR(16) NOT NULL,
adres VARCHAR(128) NOT NULL,
telefon INT
);
CREATE TABLE rozliczenia.godziny
(
id_godziny VARCHAR(4) PRIMARY KEY NOT NULL,
daty DATE NOT NULL,
liczba_godzin INT NOT NULL,
id_pracownika VARCHAR(4) NOT NULL
);
CREATE TABLE rozliczenia.pensje
(
id_pensji VARCHAR(8) PRIMARY KEY NOT NULL,
stanowisko VARCHAR(32),
kwota INT NOT NULL,
id_premii VARCHAR(4) NOT NULL
);
CREATE TABLE rozliczenia.premie
(
id_premii VARCHAR (4) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(64),
kwota INT NOT NULL
);
GO
ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A001','Kacper','Sobczyk','Mariacka 135',669326187);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A002','Maciej','Krawczyk','Targowa 12/5',921483294);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A003','Norbert','Wielgus','G³ówna 144',394812032);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A004','Dawid','Szczur','¯gowska 21/3',923842183);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A005','B³a¿ej','Rydzyk','Dachowa 11',NULL);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A006','Adam','Krajewski','Jana Paw³a II 35',382188432);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A007','Mateusz','¯ak','Warszawska 2',263994331);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A008','Micha³','Kucharski', 'Towarowa 35/11',993221832);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A009','Karolina','Bednarek','S³oneczna 13',NULL);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A010','Maja','Krupa','Boles³awa Prusa 90',372112033);
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T001', '2020-01-12', 3, 'A007');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T002', '2020-01-30', 4, 'A002');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T003', '2020-02-19', 3, 'A009');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T004', '2020-03-04', 1, 'A010');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T005', '2020-04-13', 6, 'A003');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T006', '2020-05-29', 2, 'A004');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T007', '2020-07-02', 4, 'A001');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T008', '2020-08-16', 3, 'A003');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T009', '2020-10-22', 2, 'A008');
INSERT INTO rozliczenia.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T010', '2020-11-29', 6, 'A005');
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B001', 'Dodatek do nadgodzin', 400);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B002', 'Dodatek za sta¿ pracy', 500);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B003', 'Dodatek do nadgodzin', 200);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B004', 'Premia œwi¹teczna', 450);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B005', 'Dodatek do nadgodzin', 400);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B006', 'Premia za podniesienie kwalifikacji', 500);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B007', NULL, 300);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B008', 'Premia za zas³ugi', 480);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B009', 'Premia œwi¹teczna', 450);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota) VALUES('B010', 'Dodatek do nadgodzin', 400);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P001', 'Barman', 2900, 'B001');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P002', 'Kelner', 3100, 'B002');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P003', NULL, 2600, 'B003');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P004', 'Kucharz', 2750, 'B004');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P005', 'Szef kuchni', 4150, 'B005');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P006', 'Recepcjonista', 3100, 'B006');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P007', NULL, 2600, 'B007');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P008', 'Sta¿ysta', 2200, 'B008');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P009', 'Obs³uga', 3100, 'B009');
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P010', 'Obs³uga', 3150, 'B010');
SELECT nazwisko, adres FROM rozliczenia.pracownicy;
SELECT DATEPART(WEEKDAY, '2020-01-12')as T001,DATEPART(WEEKDAY, '2020-01-30')as T002,DATEPART(WEEKDAY, '2020-02-19')as T003,DATEPART(WEEKDAY, '2020-03-04')as T004,
	DATEPART(WEEKDAY, '2020-04-13')as T005,DATEPART(WEEKDAY, '2020-05-29')as T006, DATEPART(WEEKDAY, '2020-07-02')as T007,DATEPART(WEEKDAY, '2020-08-16')as T008,
	DATEPART(WEEKDAY, '2020-10-22')as T009,DATEPART(WEEKDAY, '2020-11-29')as T010;
SELECT DATEPART(MONTH, '2020-01-12')as T001,DATEPART(MONTH, '2020-01-30')as T002,DATEPART(MONTH, '2020-02-19')as T003,DATEPART(MONTH, '2020-03-04')as T004,
	DATEPART(MONTH, '2020-04-13')as T005,DATEPART(MONTH, '2020-05-29')as T006, DATEPART(MONTH, '2020-07-02')as T007,DATEPART(MONTH, '2020-08-16')as T008,
	DATEPART(MONTH, '2020-10-22')as T009,DATEPART(MONTH, '2020-11-29')as T010;
EXECUTE sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
SELECT * FROM rozliczenia.pensje;
ALTER TABLE rozliczenia.pensje ADD kwota_netto INT;
SELECT kwota_brutto*0.82 AS kwota_netto FROM rozliczenia.pensje;
UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto*0.82;
