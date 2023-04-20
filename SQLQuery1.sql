CREATE DATABASE firma;
CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy(
IDPracownika INT PRIMARY KEY NOT NULL,
imie VARCHAR(30) NOT NULL,
nazwisko VARCHAR(30) NOT NULL,	
adres VARCHAR(50),
telefon INT
);

CREATE TABLE rozliczenia.godziny(
IDGodziny CHAR(4) PRIMARY KEY NOT NULL,
daty DATE NOT NULL,
liczbaGodzin INT,
IDPracownika INT NOT NULL
);

CREATE TABLE rozliczenia.premie(
IDPremii CHAR(4) PRIMARY KEY NOT NULL,
rodzaj VARCHAR(20),
kwota FLOAT NOT NULL
);

CREATE TABLE rozliczenia.pensje(
IDPensji INT PRIMARY KEY NOT NULL,
stanowisko VARCHAR(40) NOT NULL,
kwota FLOAT,
IDPremii CHAR(4)
);

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (IDPracownika) REFERENCES rozliczenia.pracownicy(IDPracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (IDPremii) REFERENCES rozliczenia.premie(IDPremii);

INSERT INTO rozliczenia.pracownicy VALUES(1, 'Antonii', 'Michalski', 'ul. Samma 3, Kraków', 234565432);
INSERT INTO rozliczenia.pracownicy VALUES(2, 'Alina', 'Mia³ek', 'ul. Jagody 11, Kraków', 895647731);
INSERT INTO rozliczenia.pracownicy VALUES(3, 'Anton', 'Mika', 'ul. Anielska 2, Kraków', 890674451);
INSERT INTO rozliczenia.pracownicy VALUES(4, 'Anna', 'Malarska', 'ul. Lwowska 33, Kraków', 299978231);
INSERT INTO rozliczenia.pracownicy VALUES(5, 'Aniela', 'Wolski', 'ul. Matejki 76, Kraków', 236789333);
INSERT INTO rozliczenia.pracownicy VALUES(6, 'Maria', 'Æma', 'ul. Sodoma 23, Kraków', 908998767);
INSERT INTO rozliczenia.pracownicy VALUES(7, 'Mieczys³aw', 'Nowak', 'ul. Lekarska 3, Kraków', 897666787);
INSERT INTO rozliczenia.pracownicy VALUES(8, 'Ewa', 'Mina', 'ul. Wolna 45, Kraków', 789090087);
INSERT INTO rozliczenia.pracownicy VALUES(9, 'Ewelina', 'Lewandowska', 'ul. Oleandry 90, Kraków', 678843434);
INSERT INTO rozliczenia.pracownicy VALUES(10, 'Alicja', 'Kala', 'ul. Smolnia 78, Kraków', 245432367);

INSERT INTO rozliczenia.godziny VALUES('PN10', '2023-04-10', 8, 1);
INSERT INTO rozliczenia.godziny VALUES('WT11', '2023-04-11', 7, 2);
INSERT INTO rozliczenia.godziny VALUES('SR12', '2023-04-12', 8, 3);
INSERT INTO rozliczenia.godziny VALUES('CZ13', '2023-04-13', 8, 4);
INSERT INTO rozliczenia.godziny VALUES('PT14', '2023-04-14', 9, 5);
INSERT INTO rozliczenia.godziny VALUES('SO15', '2023-04-15', 8, 6);
INSERT INTO rozliczenia.godziny VALUES('ND16', '2023-04-16', 7, 7);
INSERT INTO rozliczenia.godziny VALUES('PN17', '2023-04-17', 7, 8);
INSERT INTO rozliczenia.godziny VALUES('WT18', '2023-04-18', 8, 9);
INSERT INTO rozliczenia.godziny VALUES('SR19', '2023-04-19', 8, 10);

INSERT INTO rozliczenia.premie VALUES('R04', 'roczna', '800');
INSERT INTO rozliczenia.premie VALUES('R05', 'roczna', '900');
INSERT INTO rozliczenia.premie VALUES('R08', 'roczna', '1000');
INSERT INTO rozliczenia.premie VALUES('M04', 'miesiêczna', '400');
INSERT INTO rozliczenia.premie VALUES('M05', 'miesiêczna', '800');
INSERT INTO rozliczenia.premie VALUES('M06', 'miesiêczna', '700');
INSERT INTO rozliczenia.premie VALUES('M07', 'miesiêczna', '700');
INSERT INTO rozliczenia.premie VALUES('R06', 'roczna', '200');
INSERT INTO rozliczenia.premie VALUES('R07', 'roczna', '900');
INSERT INTO rozliczenia.premie VALUES('M08', 'roczna', '800');

INSERT INTO rozliczenia.pensje VALUES('11', 'ochrona', '4000', 'R04');
INSERT INTO rozliczenia.pensje VALUES('12', 'sekretariat', '3500', 'R05');
INSERT INTO rozliczenia.pensje VALUES('13', 'ochrona', '4000', 'R08');
INSERT INTO rozliczenia.pensje VALUES('14', 'kierownicze', '7000', 'M04');
INSERT INTO rozliczenia.pensje VALUES('15', 'robotnicze', '4500', 'M05');
INSERT INTO rozliczenia.pensje VALUES('16', 'robotnicze', '3500', 'M06');
INSERT INTO rozliczenia.pensje VALUES('17', 'sekretariat', '4000', 'M07');
INSERT INTO rozliczenia.pensje VALUES('18', 'robotnicze', '3500', 'R06');
INSERT INTO rozliczenia.pensje VALUES('19', 'robotnicze', '3800', 'R07');
INSERT INTO rozliczenia.pensje VALUES('20', 'robotnicze', '4000', 'R08');

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

ALTER TABLE rozliczenia.godziny ADD dzienTygodnia AS DATEPART(weekday, daty);
ALTER TABLE rozliczenia.godziny ADD miesiac AS DATEPART(month, daty);

sp_rename 'rozliczenia.pensje.kwota', 'kwotaBrutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwotaNetto AS ROUND(kwotaBrutto/1.23, 2);
