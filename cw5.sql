--2.Stwórz schemat
CREATE SCHEMA ksiegowosc;
GO
--3. Stwórz tabele
CREATE TABLE ksiegowosc.pracownicy
(
id_pracownika VARCHAR(4) PRIMARY KEY NOT NULL,
imie VARCHAR(16) NOT NULL,
nazwisko VARCHAR(16) NOT NULL,
adres VARCHAR(128) NOT NULL,
telefon INT
);
CREATE TABLE ksiegowosc.godziny
(
id_godziny VARCHAR(4) PRIMARY KEY NOT NULL,
daty DATE,
liczba_godzin INT NOT NULL,
id_pracownika VARCHAR(4) NOT NULL
);
CREATE TABLE ksiegowosc.pensje
(
id_pensji VARCHAR(8) PRIMARY KEY NOT NULL,
stanowisko VARCHAR(32),
kwota INT NOT NULL,
id_premii VARCHAR(4) NOT NULL
);
CREATE TABLE ksiegowosc.premie
(
id_premii VARCHAR (4) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(64),
kwota INT 
);
CREATE TABLE ksiegowosc.wynagrodzenie
(
id_wynagrodzenia VARCHAR (4) PRIMARY KEY NOT NULL,
daty1  DATE NOT NULL,
id_pracownika VARCHAR(4) NOT NULL,
id_godziny VARCHAR(4) NOT NULL,
id_pensji VARCHAR(8) NOT NULL,
id_premii VARCHAR (4) NOT NULL
);
--3cd. Dodanie kluczy obcych do tabel
ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.pensje ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);
--4. Dodanie rekordów
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A001','Kacper','Sobczyk','Mariacka 135',669326187);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A002','Maciej','Krawczyk','Targowa 12/5',921483294);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A003','Jacek','Wielgus','G³ówna 144',394812032);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A004','Dawid','Szczur','¯gowska 21/3',923842183);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A005','B³a¿ej','Rydzyk','Dachowa 11',NULL);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A006','Adam','Krajewski','Jana Paw³a II 35',382188432);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A007','Mateusz','¯ak','Warszawska 2',263994331);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A008','Micha³','Kucharski', 'Towarowa 35/11',993221832);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A009','Karolina','Bednarek','S³oneczna 13',NULL);
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES ('A010','Maja','Krupa','Boles³awa Prusa 90',372112033);
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T001', '2020-01-12', 163, 'A007');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T002', '2020-01-30', 164, 'A002');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T003', '2020-01-19', 163, 'A009');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T004', NULL, 159, 'A010');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T005', '2020-01-13', 166, 'A003');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T006', '2020-01-29', 162, 'A004');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T007', '2020-01-02', 164, 'A001');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T008', '2020-01-16', 163, 'A006');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T009', '2020-01-22', 162, 'A008');
INSERT INTO ksiegowosc.godziny(id_godziny, daty, liczba_godzin, id_pracownika) VALUES ('T010', '2020-01-29', 166, 'A005');
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B001', 'Dodatek do nadgodzin', 400);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B002', NULL, 0);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B003', 'Dodatek do nadgodzin', 200);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B004', 'Premia œwi¹teczna', 450);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B005', 'Dodatek do nadgodzin', 400);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B006', 'Premia za podniesienie kwalifikacji', 500);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B007', NULL, 0);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B008', 'Premia za zas³ugi', 480);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B009', 'Premia œwi¹teczna', 450);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota) VALUES('B010', 'Dodatek do nadgodzin', 400);
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P001', 'Barman', 2900, 'B001');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P002', 'Kelner', 3100, 'B002');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P003', NULL, 2600, 'B003');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P004', 'Kucharz', 2750, 'B004');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P005', 'Szef kuchni', 4150, 'B005');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P006', 'Recepcjonista', 3100, 'B006');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P007', NULL, 2600, 'B007');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P008', 'Sta¿ysta', 2200, 'B008');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P009', 'Obs³uga', 3100, 'B009');
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P010', 'Obs³uga', 3150, 'B010');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W001', '2020-01-31', 'A001', 'T007', 'P001', 'B001');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W002', '2020-01-31', 'A002', 'T002', 'P002', 'B002');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W003', '2020-01-31', 'A003', 'T005', 'P003', 'B003');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W004', '2020-01-31', 'A004', 'T006', 'P004', 'B004');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W005', '2020-01-31', 'A005', 'T010', 'P005', 'B005');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W006', '2020-01-31', 'A006', 'T008', 'P006', 'B006');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W007', '2020-01-31', 'A007', 'T001', 'P007', 'B007');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W008', '2020-01-31', 'A008', 'T009', 'P008', 'B008');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W009', '2020-01-31', 'A009', 'T003', 'P009', 'B009');
INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, daty1, id_pracownika, id_godziny, id_pensji, id_premii) VALUES ('W010', '2020-01-31', 'A010', 'T004', 'P010', 'B010');
--5. Wykonywanie zapytan:
--a) Wyœwietl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--b) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.
SELECT pracownicy.id_pracownika, pensje.kwota FROM ksiegowosc.pracownicy INNER JOIN ( ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie 
ON pensje.id_pensji = wynagrodzenie.id_pensji ) ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika WHERE pensje.kwota >1000;
--c)Wyœwietl id pracowników nieposiadaj¹cych premii, których p³aca jest wiêksza ni¿ 2000
SELECT pracownicy.id_pracownika, premie.kwota as premia, pensje.kwota as wyplata FROM (ksiegowosc.premie INNER JOIN (ksiegowosc.pracownicy INNER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika) 
ON premie.id_premii = wynagrodzenie.id_premii) INNER JOIN ksiegowosc.pensje ON premie.id_premii = pensje.id_premii WHERE premie.kwota = 0 AND pensje.kwota >2000;
--d)Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';
--e)Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%a';
--f)Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas pracy to 160 h miesiêcznie.
SELECT pracownicy.imie , pracownicy.nazwisko, godziny.liczba_godzin-160 as liczba_nadgodzin FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika WHERE godziny.liczba_godzin >160;
--g)Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 – 3000 PLN
SELECT pracownicy.imie,pracownicy.nazwisko,pensje.kwota FROM ksiegowosc.pracownicy INNER JOIN ( ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie 
ON pensje.id_pensji = wynagrodzenie.id_pensji ) ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika WHERE pensje.kwota >1500 AND pensje.kwota <3000;
--h)Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin-160 as nadgodziny, premie.kwota FROM ksiegowosc.premie INNER JOIN ((ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika) INNER JOIN ksiegowosc.wynagrodzenie 
ON godziny.id_godziny = wynagrodzenie.id_godziny) ON premie.id_premii = wynagrodzenie.id_premii WHERE godziny.liczba_godzin >160 AND  premie.kwota=0; 
--i)Uszereguj pracowników wed³ug pensji.
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota  FROM ksiegowosc.pracownicy INNER JOIN ( ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie 
ON pensje.id_pensji = wynagrodzenie.id_pensji ) ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika ORDER BY pensje.kwota DESC;
--j)Uszereguj pracowników wed³ug pensji i premii malej¹co.
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota as pensja ,premie.kwota as premia FROM (ksiegowosc.premie INNER JOIN (ksiegowosc.pracownicy INNER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika) 
ON premie.id_premii = wynagrodzenie.id_premii) INNER JOIN ksiegowosc.pensje ON premie.id_premii = pensje.id_premii ORDER BY premie.kwota DESC;
--k)Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’.
SELECT stanowisko, COUNT(stanowisko) FROM ksiegowosc.pensje GROUP BY stanowisko;
--l)Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘Obs³uga’ 
SELECT AVG(kwota)as œrednia_pensji, MIN(kwota)as pensja_min, MAX(kwota)as pensja_max FROM ksiegowosc.pensje WHERE stanowisko='Obs³uga';
--m)Policz sumê wszystkich wynagrodzeñ.
SELECT SUM(kwota)as suma_pensji FROM ksiegowosc.pensje;
--n)Policz sumê wynagrodzeñ w ramach danego stanowiska.
SELECT stanowisko ,SUM(kwota)as suma_wynagrodzen FROM ksiegowosc.pensje GROUP BY stanowisko;
--o)Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska
SELECT pensje.stanowisko ,COUNT(premie.kwota)as liczba_przyznanych_premii FROM ksiegowosc.premie INNER JOIN ksiegowosc.pensje ON
premie.id_premii = pensje.id_premii WHERE premie.kwota>0 GROUP BY stanowisko ;
--p)Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³.
INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES ('P011', 'Osoba do usuniecia', 1000, 'B010');
SELECT *  FROM ksiegowosc.pensje;
DELETE FROM ksiegowosc.pensje WHERE kwota<1200;
