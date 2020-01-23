DROP TABLE IF EXISTS korisnici;
CREATE TABLE korisnici (
	id INTEGER PRIMARY KEY,
	korisnickoIme VARCHAR(15) NOT NULL, 
	lozinka VARCHAR(10) NOT NULL,
    datumRegistracije DATETIME NOT NULL,
	uloga VARCHAR(14) NOT NULL DEFAULT 'KORISNIK',
    obrisan BOOL NOT NULL
);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('pera', 'pera', '2019-12-21 12:00' , 'ADMINISTRATOR', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('sima', 'sima', '2019-12-21 11:30' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('djoka', 'djoka', '2019-12-21 13:45' , 'KORISNIK', false);

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
	opis VARCHAR(150)
);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis) VALUES ('Nesto', 'Pera', 'ja, ti, on', 'komedija', 2, 'Neki', 'Srbija', 2015, 'neki opis');
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis) VALUES ('Svasta', 'Zika', 'ja, ti, on', 'akcija', 2, 'Ovo', 'Srbija', 1998, 'neki opis');
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis) VALUES ('Nista', 'Sima', 'ja, ti, on', 'drama', 2, 'Ono', 'Srbija', 2019, 'neki opis');
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis) VALUES ('Ovo', 'Djoka', 'ja, ti, on', 'horor', 2, 'Neki', 'Srbija', 2002, 'neki opis');
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis) VALUES ('Ono', 'Joca', 'ja, ti, on', 'western', 2, 'Neki', 'Srbija', 1999, 'neki opis');

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
	film VARCHAR(30) NOT NULL,
	tipProjekcije VARCHAR(6) NOT NULL,
	sala VARCHAR(20) NOT NULL,
	datumVreme DATETIME NOT NULL,
	cenaKarte DECIMAL(10, 2),
	korisnik VARCHAR(15) NOT NULL,
	obrisana BOOL NOT NULL
);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES ('Nesto', 'TIP2D', 'sala1', '2020-02-25 13:00:00', 350.00, 'pera', false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES ('Svasta', 'TIP2D', 'sala1', '2020-01-22 21:00:00', 400.00, 'pera', false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES ('Svasta', 'TIP2D', 'sala3', '2020-01-22 22:00:00', 400.00, 'pera', false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES ('Ovo', 'TIP3D', 'sala2', '2020-01-22 20:00:00', 350.00, 'pera', false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES ('Ono', 'TIP4D', 'sala2', '2020-01-22 23:00:00', 350.00, 'pera', false);

