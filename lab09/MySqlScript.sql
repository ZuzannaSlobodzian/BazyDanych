CREATE DATABASE geochronologia

CREATE TABLE GeoEon(
IDEon INT PRIMARY KEY,
NazwaEon VARCHAR(15) 
);

CREATE TABLE GeoEra(
IDEra INT PRIMARY KEY,
IDEon INT,
NazwaEra VARCHAR(15)
);

CREATE TABLE GeoOkres(
IDOkres INT PRIMARY KEY,
IDEra INT,
NazwaOkres VARCHAR(30)
);

CREATE TABLE GeoEpoka(
IDEpoka INT PRIMARY KEY,
IDOkres INT,
NazwaEpoka VARCHAR(15)
);

CREATE TABLE GeoPietro(
IDPietro INT PRIMARY KEY,
IDEpoka INT,
NazwaPietro VARCHAR(20)
);

ALTER TABLE GeoEra ADD FOREIGN KEY (IDEon) REFERENCES GeoEon(IDEon);
ALTER TABLE GeoOkres ADD FOREIGN KEY (IDEra) REFERENCES GeoEra(IDEra);
ALTER TABLE GeoEpoka ADD FOREIGN KEY (IDOkres) REFERENCES GeoOkres(IDOkres);
ALTER TABLE GeoPietro ADD FOREIGN KEY (IDEpoka) REFERENCES GeoEpoka(IDEpoka);

INSERT INTO GeoEon VALUES(0, 'Fanerozoik');

INSERT INTO GeoEra VALUES(0, 0, 'Kenzoik');
INSERT INTO GeoEra VALUES(1, 0, 'Mezozoik');
INSERT INTO GeoEra VALUES(2, 0, 'Paleozoik');

INSERT INTO GeoOkres VALUES(0, 0, 'Czwartorząd');
INSERT INTO GeoOkres VALUES(1, 0, 'Trzeciorząd Neogen');
INSERT INTO GeoOkres VALUES(2, 0, 'Trzeciorząd Paleogen');
INSERT INTO GeoOkres VALUES(3, 1, 'Kreda');
INSERT INTO GeoOkres VALUES(4, 1, 'Jura');
INSERT INTO GeoOkres VALUES(5, 1, 'Trias');
INSERT INTO GeoOkres VALUES(6, 2, 'Perm');
INSERT INTO GeoOkres VALUES(7, 2, 'Karbon');
INSERT INTO GeoOkres VALUES(8, 2, 'Dewon');

INSERT INTO GeoEpoka VALUES(0, 0, 'Holocen');
INSERT INTO GeoEpoka VALUES(1, 0, 'Plejstocen');
INSERT INTO GeoEpoka VALUES(2, 1, 'Pliocen');
INSERT INTO GeoEpoka VALUES(3, 1, 'Miocen');
INSERT INTO GeoEpoka VALUES(4, 2, 'Oligocen');
INSERT INTO GeoEpoka VALUES(5, 2, 'Eocen');
INSERT INTO GeoEpoka VALUES(6, 2, 'Paleocen');
INSERT INTO GeoEpoka VALUES(7, 3, 'Górna Kreda');
INSERT INTO GeoEpoka VALUES(8, 3, 'Dolna Kreda');
INSERT INTO GeoEpoka VALUES(9, 4, 'Górna Jura');
INSERT INTO GeoEpoka VALUES(10, 4, 'Środkowa Jura');
INSERT INTO GeoEpoka VALUES(11, 4, 'Dolna Jura');
INSERT INTO GeoEpoka VALUES(12, 5, 'Górny Trias');
INSERT INTO GeoEpoka VALUES(13, 5, 'Środkowy Trias');
INSERT INTO GeoEpoka VALUES(14, 5, 'Dolny Trias');
INSERT INTO GeoEpoka VALUES(15, 6, 'Górny Perm');
INSERT INTO GeoEpoka VALUES(16, 6, 'Dolny Perm');
INSERT INTO GeoEpoka VALUES(17, 7, 'Górny Karbon');
INSERT INTO GeoEpoka VALUES(18, 7, 'Dolny Karbon');
INSERT INTO GeoEpoka VALUES(19, 8, 'Górny Dewon');
INSERT INTO GeoEpoka VALUES(20, 8, 'Środkowy Dewon');
INSERT INTO GeoEpoka VALUES(21, 8, 'Dolny Dewon');

INSERT INTO GeoPietro VALUES(0, 0, 'Megalaj');
INSERT INTO GeoPietro VALUES(1, 0, 'Northgrip');
INSERT INTO GeoPietro VALUES(2, 0, 'Grenland');
INSERT INTO GeoPietro VALUES(3, 1, 'Plejstocen Pozny');
INSERT INTO GeoPietro VALUES(4, 1, 'Chiban');
INSERT INTO GeoPietro VALUES(5, 1, 'Kalabr');
INSERT INTO GeoPietro VALUES(6, 1, 'Gelas');
INSERT INTO GeoPietro VALUES(7, 2, 'Piacent');
INSERT INTO GeoPietro VALUES(8, 2, 'Zankl');
INSERT INTO GeoPietro VALUES(9, 3, 'Messyn');
INSERT INTO GeoPietro VALUES(10, 3, 'Torton');
INSERT INTO GeoPietro VALUES(11, 3, 'Serrawal');
INSERT INTO GeoPietro VALUES(12, 3, 'Lang');
INSERT INTO GeoPietro VALUES(13, 3, 'Burdygał');
INSERT INTO GeoPietro VALUES(14, 3, 'Akwitan');
INSERT INTO GeoPietro VALUES(15, 4, 'Szat');
INSERT INTO GeoPietro VALUES(16, 4, 'Rupel');
INSERT INTO GeoPietro VALUES(17, 5, 'Priabon');
INSERT INTO GeoPietro VALUES(18, 5, 'Barton');
INSERT INTO GeoPietro VALUES(19, 5, 'Lutet');
INSERT INTO GeoPietro VALUES(20, 5, 'Iprez');
INSERT INTO GeoPietro VALUES(21, 6, 'Tanet');
INSERT INTO GeoPietro VALUES(22, 6, 'Zeland');
INSERT INTO GeoPietro VALUES(23, 6, 'Dan');
INSERT INTO GeoPietro VALUES(24, 7, 'Mastrycht');
INSERT INTO GeoPietro VALUES(25, 7, 'Kampan');
INSERT INTO GeoPietro VALUES(26, 7, 'Santon');
INSERT INTO GeoPietro VALUES(27, 7, 'Koniak');
INSERT INTO GeoPietro VALUES(28, 7, 'Turon');
INSERT INTO GeoPietro VALUES(29, 7, 'Cenoman');
INSERT INTO GeoPietro VALUES(30, 8, 'Alb');
INSERT INTO GeoPietro VALUES(31, 8, 'Apt');
INSERT INTO GeoPietro VALUES(32, 8, 'Barrem');
INSERT INTO GeoPietro VALUES(33, 8, 'Hoteryw');
INSERT INTO GeoPietro VALUES(34, 8, 'Walanżyn');
INSERT INTO GeoPietro VALUES(35, 8, 'Berrias');
INSERT INTO GeoPietro VALUES(36, 9, 'Tyton');
INSERT INTO GeoPietro VALUES(37, 9, 'Kimeryd');
INSERT INTO GeoPietro VALUES(38, 9, 'Oksford');
INSERT INTO GeoPietro VALUES(39, 10, 'Kelowej');
INSERT INTO GeoPietro VALUES(40, 10, 'Baton');
INSERT INTO GeoPietro VALUES(41, 10, 'Bajos');
INSERT INTO GeoPietro VALUES(42, 10, 'Aalen');
INSERT INTO GeoPietro VALUES(43, 11, 'Toark');
INSERT INTO GeoPietro VALUES(44, 11, 'Pliensbach');
INSERT INTO GeoPietro VALUES(45, 11, 'Synemur');
INSERT INTO GeoPietro VALUES(46, 11, 'Hettang');
INSERT INTO GeoPietro VALUES(47, 12, 'Retyk');
INSERT INTO GeoPietro VALUES(48, 12, 'Noryk');
INSERT INTO GeoPietro VALUES(49, 12, 'Karnik');
INSERT INTO GeoPietro VALUES(50, 13, 'Ladyn');
INSERT INTO GeoPietro VALUES(51, 13, 'Anizyk');
INSERT INTO GeoPietro VALUES(52, 14, 'Olenek');
INSERT INTO GeoPietro VALUES(53, 14, 'Ind');
INSERT INTO GeoPietro VALUES(54, 15, 'Czangsing');
INSERT INTO GeoPietro VALUES(55, 15, 'Wucziaping');
INSERT INTO GeoPietro VALUES(56, 15, 'Kapitan');
INSERT INTO GeoPietro VALUES(57, 15, 'Word');
INSERT INTO GeoPietro VALUES(58, 15, 'Road');
INSERT INTO GeoPietro VALUES(59, 16, 'Kungur');
INSERT INTO GeoPietro VALUES(60, 16, 'Artinsk');
INSERT INTO GeoPietro VALUES(61, 16, 'Sakmar');
INSERT INTO GeoPietro VALUES(62, 16, 'Assel');
INSERT INTO GeoPietro VALUES(63, 17, 'Gżel');
INSERT INTO GeoPietro VALUES(64, 17, 'Kasimow');
INSERT INTO GeoPietro VALUES(65, 17, 'Moskow');
INSERT INTO GeoPietro VALUES(66, 17, 'Baszkir');
INSERT INTO GeoPietro VALUES(67, 18, 'Serpuchow');
INSERT INTO GeoPietro VALUES(68, 18, 'Wizen');
INSERT INTO GeoPietro VALUES(69, 18, 'Turnej');
INSERT INTO GeoPietro VALUES(70, 19, 'Famen');
INSERT INTO GeoPietro VALUES(71, 19, 'Fran');
INSERT INTO GeoPietro VALUES(72, 20, 'Żywet');
INSERT INTO GeoPietro VALUES(73, 20, 'Eifel');
INSERT INTO GeoPietro VALUES(74, 21, 'Ems');
INSERT INTO GeoPietro VALUES(75, 21, 'Prag');
INSERT INTO GeoPietro VALUES(76, 21, 'Lochkow');

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );
ALTER TABLE GeoTabela ADD PRIMARY KEY (IDPietro);

CREATE TABLE dziesiec(
Cyfra INT, 
Bit INT
);

INSERT INTO dziesiec VALUES(0, 1);
INSERT INTO dziesiec VALUES(1, 1);
INSERT INTO dziesiec VALUES(2, 1);
INSERT INTO dziesiec VALUES(3, 1);
INSERT INTO dziesiec VALUES(4, 1);
INSERT INTO dziesiec VALUES(5, 1);
INSERT INTO dziesiec VALUES(6, 1);
INSERT INTO dziesiec VALUES(7, 1);
INSERT INTO dziesiec VALUES(8, 1);
INSERT INTO dziesiec VALUES(9, 1);

CREATE TABLE Milion(
Liczba INT, 
Cyfra INT, 
Bit INT
);

INSERT INTO  Milion 
SELECT a1.Cyfra + 10 * a2.Cyfra + 100 * a3.Cyfra 
+ 1000 * a4.Cyfra + 10000 * a5.Cyfra + 10000 * a6.Cyfra AS liczba,
a1.Cyfra AS Cyfra, a1.Bit AS Bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, 
Dziesiec a4, Dziesiec a5, Dziesiec a6;

SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba, 77) = (GeoTabela.IDPietro));

SELECT COUNT(*) FROM Milion INNER JOIN  GeoPietro  ON (mod(Milion.liczba, 77) = GeoPietro.IDPietro) 
NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;

SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba, 77) 
IN (SELECT IDPietro FROM GeoTabela WHERE mod(Milion.liczba, 77) = (IDPietro));

SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba, 77) 
IN (SELECT GeoPietro.IDPietro FROM GeoPietro NATURAL JOIN GeoEpoka 
NATURAL JOIN   GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);

CREATE INDEX TabelaInd ON GeoTabela(IDEon, IDEra, IDOkres, IDEpoka);
CREATE INDEX MilionLInd ON Milion(Liczba);









