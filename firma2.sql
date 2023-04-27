CREATE DATABASE firma2;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
IDPracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(30) NOT NULL,
nazwisko VARCHAR(30) NOT NULL,	
adres VARCHAR(50),
telefon INT
);

CREATE TABLE ksiegowosc.godziny(
IDGodziny CHAR(4) PRIMARY KEY NOT NULL,
daty DATE NOT NULL,
liczbaGodzin INT,
IDPracownika INT NOT NULL
);

CREATE TABLE ksiegowosc.premie(
IDPremii CHAR(4) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(20),
kwota FLOAT NOT NULL
);

CREATE TABLE ksiegowosc.pensje(
IDPensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(40) NOT NULL,
kwota FLOAT,
IDPremii CHAR(4)
);

CREATE TABLE ksiegowosc.wynagrodzenia(
IDWynagrodzenia CHAR(4) PRIMARY KEY NOT NULL,
daty DATE NOT NULL,
IDPracownika INT NOT NULL,
IDGodziny CHAR(4) NOT NULL,
IDPensji INT NOT NULL,
IDPremii CHAR(4) 
);

ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (IDPracownika) REFERENCES ksiegowosc.pracownicy(IDPracownika);
ALTER TABLE ksiegowosc.pensje ADD FOREIGN KEY (IDPremii) REFERENCES ksiegowosc.premie(IDPremii);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (IDPracownika) REFERENCES ksiegowosc.pracownicy(IDPracownika);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (IDGodziny) REFERENCES ksiegowosc.godziny(IDGodziny);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (IDPensji) REFERENCES ksiegowosc.pensje(IDPensji);
ALTER TABLE ksiegowosc.wynagrodzenia ADD FOREIGN KEY (IDPremii) REFERENCES ksiegowosc.premie(IDPremii);

EXEC sp_addextendedproperty
@name = 'Komentarz dla tabeli Pracownicy',
@value = 'Tabela zawieraj¹ca dane osobowe pracowników',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'pracownicy';
GO

EXEC sp_addextendedproperty
@name = 'Komentarz dla tabeli Godziny ',
@value = 'Tabela zawieraj¹ca dane na temat przepracowanych godzin ',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'godziny';
GO

EXEC sp_addextendedproperty
@name = 'Komentarz dla tabeli Premie ',
@value = 'Tabela zawieraj¹ca informacje na temat premii',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'premie';
GO

EXEC sp_addextendedproperty
@name = 'Komentarz dla tabeli Pensje',
@value = 'Tabela zawieraj¹ca informacje na temat pensji',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'pensje';
GO

EXEC sp_addextendedproperty
@name = 'Komentarz dla tabeli Wynagrodzenia',
@value = 'Tabela zawieraj¹ca szczegó³y wynagrodzeñ pracowników',
@level0type = 'Schema',
@level0name = 'ksiegowosc',
@level1type = 'Table',
@level1name = 'wynagrodzenia';
GO


INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Antonii', 'Michalski', 'ul. Samma 3, Kraków', 234565432);
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Alina', 'Mia³ek', 'ul. Jagody 11, Kraków', 895647731);
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Anton', 'Nika', 'ul. Anielska 2, Kraków', 890674451);
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Anna', 'Malarska', 'ul. Lwowska 33, Kraków', 299978231);
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Aniela', 'Wolski', 'ul. Matejki 76, Kraków', 236789333);
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Maria', 'Æma', 'ul. Sodoma 23, Kraków', 908998767);
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Mieczys³aw', 'Nowak', 'ul. Lekarska 3, Kraków', 897666787);
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Joanna', 'Mina', 'ul. Wolna 45, Kraków', 789090087);
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Ewelina', 'Lewandowska', 'ul. Oleandry 90, Kraków', 678843434);
INSERT INTO ksiegowosc.pracownicy VALUES(10, 'Alicja', 'Kala', 'ul. Smolnia 78, Kraków', 245432367);

INSERT INTO ksiegowosc.godziny VALUES('PN10', '2023-04-10', 150, 1);
INSERT INTO ksiegowosc.godziny VALUES('WT11', '2023-04-11', 160, 2);
INSERT INTO ksiegowosc.godziny VALUES('SR12', '2023-04-12', 170, 3);
INSERT INTO ksiegowosc.godziny VALUES('CZ13', '2023-04-13', 170, 4);
INSERT INTO ksiegowosc.godziny VALUES('PT14', '2023-04-14', 90, 5);
INSERT INTO ksiegowosc.godziny VALUES('SO15', '2023-04-15', 150, 6);
INSERT INTO ksiegowosc.godziny VALUES('ND16', '2023-04-16', 150, 7);
INSERT INTO ksiegowosc.godziny VALUES('PN17', '2023-04-17', 140, 8);
INSERT INTO ksiegowosc.godziny VALUES('WT18', '2023-04-18', 160, 9);
INSERT INTO ksiegowosc.godziny VALUES('SR19', '2023-04-19', 160, 10);

INSERT INTO ksiegowosc.premie VALUES('R04', 'roczna', 800);
INSERT INTO ksiegowosc.premie VALUES('R05', 'roczna', 900);
INSERT INTO ksiegowosc.premie VALUES('R08', 'roczna', 1000);
INSERT INTO ksiegowosc.premie VALUES('M04', 'miesiêczna', 400);
INSERT INTO ksiegowosc.premie VALUES('M05', 'miesiêczna', 800);
INSERT INTO ksiegowosc.premie VALUES('M06', 'miesiêczna', 700);
INSERT INTO ksiegowosc.premie VALUES('M07', 'miesiêczna', 700);
INSERT INTO ksiegowosc.premie VALUES('R06', 'roczna', 200);
INSERT INTO ksiegowosc.premie VALUES('R07', 'roczna', 900);
INSERT INTO ksiegowosc.premie VALUES('M08', 'roczna', 800);

INSERT INTO ksiegowosc.pensje VALUES(11, 'ochrona', 400, 'R04');
INSERT INTO ksiegowosc.pensje VALUES(12, 'sekretariat', 350, 'R05');
INSERT INTO ksiegowosc.pensje VALUES(13, 'ochrona', 4000, 'R08');
INSERT INTO ksiegowosc.pensje VALUES(14, 'kierownicze', 7000, 'M04');
INSERT INTO ksiegowosc.pensje VALUES(15, 'robotnicze', 4500, 'M05');
INSERT INTO ksiegowosc.pensje VALUES(16, 'robotnicze', 3500, 'M06');
INSERT INTO ksiegowosc.pensje VALUES(17, 'sekretariat', 2000, 'M07');
INSERT INTO ksiegowosc.pensje VALUES(18, 'robotnicze', 3000, 'R06');
INSERT INTO ksiegowosc.pensje VALUES(19, 'robotnicze', 2800, 'R07');
INSERT INTO ksiegowosc.pensje VALUES(20, 'robotnicze', 4000, 'M08');

INSERT INTO ksiegowosc.wynagrodzenia VALUES('001', '2023-04-21', 1, 'PN10', 11, 'R04');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('002', '2023-04-22', 2, 'WT11', 12, 'R05');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('003', '2023-04-23', 3, 'SR12', 13, 'R08');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('004', '2023-04-24', 4, 'CZ13', 14,  NULL);
INSERT INTO ksiegowosc.wynagrodzenia VALUES('005', '2023-04-25', 5, 'PT14', 15, 'M05');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('006', '2023-04-26', 6, 'SO15', 16, 'M06');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('007', '2023-04-27', 7, 'ND16', 17, 'M07');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('008', '2023-04-28', 8, 'PN17', 18, 'R06');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('009', '2023-04-29', 9, 'WT18', 19, 'R07');
INSERT INTO ksiegowosc.wynagrodzenia VALUES('010', '2023-04-30', 10, 'SR19', 20, NULL);

SELECT IDPracownika, nazwisko FROM ksiegowosc.pracownicy;


SELECT ksiegowosc.pracownicy.IDPracownika FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
WHERE ksiegowosc.pensje.kwota > 1000;

SELECT ksiegowosc.pracownicy.IDPracownika FROM ksiegowosc.pracownicy
LEFT OUTER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
LEFT OUTER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
LEFT OUTER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
WHERE ksiegowosc.wynagrodzenia.IDPremii is NULL AND ksiegowosc.pensje.kwota > 2000;

SELECT IDPracownika FROM ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.imie LIKE 'J%';

SELECT IDPracownika FROM ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.imie LIKE '%n%' AND ksiegowosc.pracownicy.imie LIKE '%a';

SELECT imie,nazwisko, (liczbaGodzin-160)  AS nadgodziny FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON  ksiegowosc.wynagrodzenia.IDPracownika = ksiegowosc.pracownicy.IDPracownika
INNER JOIN ksiegowosc.godziny ON  ksiegowosc.wynagrodzenia.IDGodziny = ksiegowosc.godziny.IDGodziny
WHERE ksiegowosc.godziny.liczbaGodzin > 160;

SELECT imie,nazwisko FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
WHERE ksiegowosc.pensje.kwota > 1500 AND ksiegowosc.pensje.kwota < 3000;

SELECT imie,nazwisko FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON  ksiegowosc.wynagrodzenia.IDPracownika = ksiegowosc.pracownicy.IDPracownika
INNER JOIN ksiegowosc.godziny ON  ksiegowosc.wynagrodzenia.IDGodziny = ksiegowosc.godziny.IDGodziny
FULL JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
WHERE ksiegowosc.godziny.liczbaGodzin > 160 AND ksiegowosc.wynagrodzenia.IDPremii is NULL;

SELECT ksiegowosc.pracownicy.IDPracownika, imie, nazwisko, ksiegowosc.pensje.kwota FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
ORDER BY ksiegowosc.pensje.kwota;

SELECT ksiegowosc.pracownicy.IDPracownika, imie, nazwisko, (ksiegowosc.pensje.kwota+ksiegowosc.premie.kwota) AS wynagrodzenie 
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
ORDER BY  wynagrodzenie DESC;

SELECT ksiegowosc.pensje.stanowisko, COUNT(ksiegowosc.pensje.stanowisko) AS ilosc FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
GROUP BY ksiegowosc.pensje.stanowisko


SELECT ksiegowosc.pensje.stanowisko,
AVG(ksiegowosc.pensje.kwota+ISNULL(ksiegowosc.premie.kwota,0)) AS srednia,
MAX(ksiegowosc.pensje.kwota+ISNULL(ksiegowosc.premie.kwota,0)) AS maksymalne,
MIN(ksiegowosc.pensje.kwota+ISNULL(ksiegowosc.premie.kwota,0)) AS minimalne 
FROM ksiegowosc.wynagrodzenia
INNER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
LEFT OUTER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
WHERE ksiegowosc.pensje.stanowisko = 'sekretariat'
GROUP BY ksiegowosc.pensje.stanowisko;

SELECT (SUM(ksiegowosc.pensje.kwota) + SUM(ksiegowosc.premie.kwota)) AS suma FROM ksiegowosc.wynagrodzenia
LEFT OUTER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
LEFT OUTER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji;

SELECT ksiegowosc.pensje.stanowisko, (SUM(ksiegowosc.pensje.kwota) + SUM(ISNULL(ksiegowosc.premie.kwota, 0))) AS suma FROM ksiegowosc.wynagrodzenia
LEFT OUTER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
LEFT OUTER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
GROUP BY ksiegowosc.pensje.stanowisko;

SELECT ksiegowosc.pensje.stanowisko, COUNT(ksiegowosc.premie.kwota) AS premieSuma FROM ksiegowosc.wynagrodzenia
LEFT OUTER JOIN ksiegowosc.premie ON ksiegowosc.premie.IDPremii = ksiegowosc.wynagrodzenia.IDPremii
LEFT OUTER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
GROUP BY ksiegowosc.pensje.stanowisko;

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
GO 
DELETE pracownicy
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.IDPracownika = ksiegowosc.wynagrodzenia.IDPracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.pensje.IDPensji = ksiegowosc.wynagrodzenia.IDPensji
WHERE ksiegowosc.pensje.kwota <1200
SELECT * FROM ksiegowosc.pracownicy;