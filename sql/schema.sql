DROP TABLE IF EXISTS korisnici;
CREATE TABLE korisnici (
	id INTEGER PRIMARY KEY,
	korisnickoIme VARCHAR(10) NOT NULL, 
	lozinka VARCHAR(10) NOT NULL,
             datumRegistracije DATETIME NOT NULL,
	uloga VARCHAR(14) NOT NULL DEFAULT 'KORISNIK',
             obrisan BOOL NOT NULL
);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('pera', 'pera', '2019-12-21 12:00' , 'ADMINISTRATOR', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('sima', 'sima', '2019-12-21 11:30' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('djoka', 'djoka', '2019-12-21 13:45' , 'KORISNIK', false);