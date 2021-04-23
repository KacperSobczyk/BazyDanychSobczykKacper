--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon VARCHAR(30) NOT NULL;
UPDATE ksiegowosc.pracownicy SET telefon='(+48)'+ pracownicy.telefon;
SELECT * FROM ksiegowosc.pracownicy;
--b) Zmodyfikuj atrybut telefonw tabeli pracownicytak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’ 
UPDATE ksiegowosc.pracownicy SET telefon= LEFT(telefon,8) + '-' + RIGHT(telefon,6);
UPDATE ksiegowosc.pracownicy SET telefon= LEFT(telefon,12) + '-' + RIGHT(telefon,3);
--c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter
SELECT TOP 1 UPPER(nazwisko) FROM ksiegowosc.pracownicy ORDER BY LEN(nazwisko) DESC;
--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
SELECT	HASHBYTES('MD5',pracownicy.id_pracownika)as id_pracownika_MD5, 
		HASHBYTES('MD5',pracownicy.imie)as imie_MD5,
		HASHBYTES('MD5',pracownicy.nazwisko)as nazwisko_MD5,
		HASHBYTES('MD5',CAST(pensje.kwota AS VARCHAR(5)))as pensja_MD5 
		FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie 
ON pensje.id_pensji = wynagrodzenie.id_pensji ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika;
--e) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne.
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota as pensja, premie.kwota as premia
FROM ksiegowosc.pracownicy LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;
--f) wygeneruj raport (zapytanie), które zwróci w wyniki treœæ
SELECT 'Pracownik '+pracownicy.imie + ' ' + pracownicy.nazwisko + ', w dniu ' + 
CAST(wynagrodzenie.daty1 AS VARCHAR(15)) + ' otrzyma³ pensjê ca³kowit¹ na kwotê ' +
CAST(pensje.kwota AS VARCHAR(15)) + 'z³, gdzie wynagrodzenie zasadnicze wynosi³o: ' + 
CAST((pensje.kwota - premie.kwota) AS VARCHAR(15)) + ' z³, premia: ' +
CAST(premie.kwota AS VARCHAR(15)) +' z³.' AS Raport
FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika
INNER JOIN ksiegowosc.wynagrodzenie ON godziny.id_godziny = wynagrodzenie.id_godziny
INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
INNER JOIN ksiegowosc.pensje ON pensje.id_premii = premie.id_premii;