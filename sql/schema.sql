DROP TABLE IF EXISTS korisnici;
CREATE TABLE korisnici (
	id INTEGER PRIMARY KEY,
	korisnickoIme VARCHAR(10) NOT NULL, 
	lozinka VARCHAR(10) NOT NULL,
             datumRegistracije DATETIME NOT NULL,
	uloga VARCHAR(14) NOT NULL DEFAULT 'KORISNIK',
             obrisan BOOL NOT NULL
);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('pera', 'pera', '2019-01-02 12:00:00.000' , 'ADMINISTRATOR', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('sima', 'sima', '2019-03-04 11:30:00.000' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('djoka', 'djoka', '2019-05-06 13:45:00.000' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('mara', 'mara', '2019-07-26 13:45:00.000' , 'KORISNIK', false);

DROP TABLE IF EXISTS filmovi;
CREATE TABLE filmovi (
	id INTEGER PRIMARY KEY,
	naziv VARCHAR(30) NOT NULL,
	reziser VARCHAR(25),
	glumci VARCHAR(100),
	zanrovi VARCHAR(50),
	trajanje INTEGER NOT NULL,
	distributer VARCHAR(25) NOT NULL,
	zemljaPorekla VARCHAR(25) NOT NULL,
	godinaProizvodnje INTEGER NOT NULL,
	opis VARCHAR(150),
             obrisan BOOL NOT NULL
);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Nesto', 'Pera', 'ja, ti, on', 'komedija', 2, 'Neki', 'Srbija', 2015, 'neki opis', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Svasta', 'Zika', 'ja, ti, on', 'akcija', 2, 'Ovo', 'Srbija', 1998, 'neki opis', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Nista', 'Sima', 'ja, ti, on', 'drama', 2, 'Ono', 'Srbija', 2019, 'neki opis', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Ovo', 'Djoka', 'ja, ti, on', 'horor', 2, 'Neki', 'Srbija', 2002, 'neki opis', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Ono', 'Joca', 'ja, ti, on', 'western', 2, 'Neki', 'Srbija', 1999, 'neki opis', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Novi film', 'novi reziser', 'novo, novo, novo', 'novi zanr', 3, 'novi distributer', 'Srbija', 2020, 'neki novi opis', false);

DROP TABLE IF EXISTS sale;
CREATE TABLE sale (
	id INTEGER PRIMARY KEY,
	naziv VARCHAR(20) NOT NULL,
	tipovi VARCHAR(20) NOT NULL
);
INSERT INTO sale (naziv, tipovi) VALUES ('sala1', 'TIP2D,TIP3D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala2', 'TIP3D,TIP4D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala3', 'TIP2D,TIP4D');


DROP TABLE IF EXISTS projekcije;
CREATE TABLE projekcije (
	id INTEGER PRIMARY KEY,
	film INTEGER NOT NULL,
	tipProjekcije VARCHAR(6) NOT NULL,
	sala INTEGER NOT NULL,
	datumVreme DATETIME NOT NULL,
	cenaKarte DECIMAL(10, 2),
	korisnik INTEGER NOT NULL,
	obrisana BOOL NOT NULL
);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1582632000000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 1, '1580210700000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 3, '1580331600000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1580324400000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 2, '1580335200000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP3D', 3, '1580321700000', 450.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1580315400000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP4D', 2, '1580304600000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP4D', 2, '1577836800000', 800.00, 1, false);

DROP TABLE IF EXISTS sedista;
CREATE TABLE sedista (
	id INTEGER PRIMARY KEY,
	redniBroj INTEGER NOT NULL,
	sala INTEGER NOT NULL
);
INSERT INTO sedista(redniBroj, sala) VALUES (1, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (2, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (3, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (4, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (5, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (6, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (7, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (8, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (9, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (10, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (11, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (12, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (13, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (14, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (15, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (16, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (17, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (18, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (19, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (20, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (21, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (22, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (23, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (24, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (25, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (26, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (27, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (28, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (29, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (30, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (31, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (32, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (33, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (34, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (35, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (36, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (37, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (38, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (39, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (40, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (41, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (42, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (43, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (44, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (45, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (46, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (47, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (48, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (49, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (50, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (51, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (52, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (53, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (54, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (55, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (56, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (57, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (58, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (59, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (60, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (61, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (62, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (63, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (64, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (65, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (66, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (67, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (68, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (69, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (70, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (71, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (72, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (73, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (74, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (75, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (76, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (77, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (78, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (79, 1);
INSERT INTO sedista(redniBroj, sala) VALUES (80, 1);

INSERT INTO sedista(redniBroj, sala) VALUES (1, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (2, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (3, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (4, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (5, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (6, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (7, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (8, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (9, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (10, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (11, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (12, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (13, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (14, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (15, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (16, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (17, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (18, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (19, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (20, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (21, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (22, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (23, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (24, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (25, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (26, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (27, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (28, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (29, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (30, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (31, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (32, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (33, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (34, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (35, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (36, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (37, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (38, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (39, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (40, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (41, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (42, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (43, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (44, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (45, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (46, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (47, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (48, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (49, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (50, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (51, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (52, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (53, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (54, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (55, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (56, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (57, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (58, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (59, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (60, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (61, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (62, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (63, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (64, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (65, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (66, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (67, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (68, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (69, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (70, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (71, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (72, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (73, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (74, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (75, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (76, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (77, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (78, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (79, 2);
INSERT INTO sedista(redniBroj, sala) VALUES (80, 2);

INSERT INTO sedista(redniBroj, sala) VALUES (1, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (2, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (3, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (4, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (5, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (6, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (7, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (8, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (9, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (10, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (11, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (12, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (13, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (14, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (15, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (16, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (17, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (18, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (19, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (20, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (21, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (22, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (23, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (24, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (25, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (26, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (27, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (28, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (29, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (30, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (31, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (32, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (33, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (34, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (35, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (36, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (37, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (38, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (39, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (40, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (41, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (42, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (43, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (44, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (45, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (46, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (47, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (48, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (49, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (50, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (51, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (52, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (53, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (54, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (55, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (56, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (57, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (58, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (59, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (60, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (61, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (62, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (63, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (64, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (65, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (66, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (67, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (68, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (69, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (70, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (71, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (72, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (73, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (74, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (75, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (76, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (77, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (78, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (79, 3);
INSERT INTO sedista(redniBroj, sala) VALUES (80, 3);

DROP TABLE IF EXISTS karte;
CREATE TABLE karte (
	id INTEGER PRIMARY KEY,
	projekcija INTEGER NOT NULL,
	sediste INTEGER NOT NULL,
	datumVremeProdaje DATETIME NOT NULL,
	korisnik INTEGER NOT NULL
);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 2, '2020-01-12 14:30:00.00', 2);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 3, '2020-01-11 21:00:00.00', 2);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 4, '2020-01-10 18:15:00.00', 2);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 5, '2020-01-14 21:30:00.00', 2);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 6, '2020-01-12 20:00:00.00', 2);

