--a
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon varchar(20)
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('(+48) ', telefon)
SELECT * FROM ksiegowosc.pracownicy

--b
UPDATE ksiegowosc.pracownicy SET telefon = SUBSTRING(telefon, 1, 9) + '-' + SUBSTRING(telefon, 10, 3) + '-' + SUBSTRING(telefon, 13, 3)
SELECT * FROM ksiegowosc.pracownicy

--c
SELECT TOP 1 UPPER(nazwisko), UPPER(imie), UPPER(IDPracownika), UPPER(adres), UPPER(telefon) FROM ksiegowosc.pracownicy 
ORDER BY LEN(nazwisko) DESC

--d
ALTER TABLE ksiegowosc.pensje ALTER COLUMN kwota varchar(10)
Select HashBytes('MD5', imie) AS imie,  HashBytes('MD5', nazwisko) AS nazwisko, 
HashBytes('MD5', kwota) AS kwota 
FROM ksiegowosc.pracownicy kpr
INNER JOIN ksiegowosc.wynagrodzenia kwn ON kpr.IDPracownika = kwn.IDPracownika
INNER JOIN ksiegowosc.pensje kpn ON kpn.IDPensji = kwn.IDPensji

--e
SELECT imie, nazwisko, kpn.kwota, kpm.kwota 
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia kwn ON ksiegowosc.pracownicy.IDPracownika = kwn.IDPracownika
INNER JOIN ksiegowosc.pensje kpn ON kpn.IDPensji = kwn.IDPensji
LEFT OUTER JOIN ksiegowosc.premie kpm ON kpm.IDPremii = kwn.IDPremii

--f
SELECT 'Pracownik ' + imie + ' ' + nazwisko +' , w dniu ' + CONVERT(varchar, kgd.daty, 4) +  ' otrzyma³ pensjê ca³kowit¹ na kwotê ' 
+ CAST(SUM(kpn.kwota+ ISNULL(kpm.kwota, 0)) AS varchar(10)) + ' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ' 
+ CAST(kpn.kwota AS varchar(10))
+ ' z³, premia: ' + CAST(ISNULL(kpm.kwota, 0) AS varchar(10)) + ' z³, nadgodziny: ' 
+ CAST(CASE WHEN kgd.liczbaGodzin > 160 THEN (kgd.liczbaGodzin - 160)*20 ELSE 0 END AS varchar(10)) + ' z³.'
FROM ksiegowosc.pracownicy kpr
INNER JOIN  ksiegowosc.wynagrodzenia kwn ON kpr.IDPracownika = kwn.IDPracownika
INNER JOIN ksiegowosc.pensje kpn ON kpn.IDPensji = kwn.IDPensji
INNER JOIN ksiegowosc.godziny kgd ON kgd.IDGodziny = kwn.IDGodziny
LEFT OUTER JOIN ksiegowosc.premie kpm ON kpm.IDPremii = kwn.IDPremii
GROUP BY imie, nazwisko, kgd.daty, kpn.kwota, kpm.kwota, kgd.liczbaGodzin