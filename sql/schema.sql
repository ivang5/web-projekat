DROP TABLE IF EXISTS korisnici;
CREATE TABLE korisnici (
	id INTEGER PRIMARY KEY,
	korisnickoIme VARCHAR(10) NOT NULL, 
	lozinka VARCHAR(10) NOT NULL,
             datumRegistracije DATETIME NOT NULL,
	uloga VARCHAR(14) NOT NULL DEFAULT 'KORISNIK',
             obrisan BOOL NOT NULL
);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('petar', 'petar', '2019-01-02 12:00:00.000' , 'ADMINISTRATOR', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('igor', 'igor', '2019-01-03 14:30:00.000' , 'ADMINISTRATOR', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('sinisa', 'sinisa', '2019-03-04 11:30:00.000' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('marija', 'marija', '2019-07-26 13:50:00.000' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('dragan', 'dragan', '2019-05-06 13:45:00.000' , 'KORISNIK', false);
INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) VALUES ('ana', 'ana', '2019-06-12 08:20:00.000' , 'KORISNIK', false);

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
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Joker', 'Todd Phillips', 'Joaquin Phoenix, Robert De Niro, Zazie Beetz', 'Krimi, Drama, Triler', 3, 'Warner Bros.', 'USA', 2019, 'Uvek sam u gomili, Arthur Fleck je covek koji trazi bliskost. No, dok koraca utabanim ulicama Gothama i vozi se javnim prevozom neprijateljskog grada prepunog podela i nezadovoljstva, Arthur nosi dve maske. Jednu nanosi za svoj posao klauna, a drugu nikada ne moze skinuti. To je maska koju projektuje u uzaludnom pokusaju da se oseca kao deo sveta oko sebe, a ne kao neshvacen covek kojeg zivot stalno porazava.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Pineapple Express', 'David Gordon Green', 'Seth Rogen, James Franco, Gary Cole', 'Akcija, Komedija, Krimi', 2, 'Sony Pictures', 'USA', 2008, 'Lencina Dale Denton (Rogen) ima samo jedan razlog zasto posjecuje svog jednako lenjog dilera Saula Silvera (Franco): kako bi kupio travu, tacnije tesko dostupnu novu sortu nazvanu Pineapple Express. No, kada Dave postane jedini svedok ubistvu koje pocini pokvarena policajka (Perez) i najopasniji narko boss u gradu (Cole), uhvati ga panika i na mestu zlocina mu ispadne paketic Pineapple Expressa. Sada Dale ima jos jedan razlog zbog kojeg posjecuje Saula: kako bi saznao da li je ta trava toliko tesko dostupna da bi mu se preko nje moglo uci u trag. I ispada da jeste. Dok Dale i Saul beze pokusavajuci spasiti zivote, ubrzo otkrivaju da nisu paranoicni od previse trave; za petama im se zaista nalaze gangsteri koji ih pokusavaju ubiti na najbrzi moguci nacin. Ukrcajte se na Pineapple Express.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Pulp Fiction', 'Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson', 'Krimi, Drama', 3, 'Miramax', 'USA', 1994, 'Pampkin (Tim Rot) i Hani Bani (Amanda Plamer) dvoje su lopova koji, jeduci u bifeu, odluce kako je najbolja stvar koju mogu da urade jeste ta da je opljackaju. Vinsent Vega (Dzon Travolta) i Dzuls Vinfeld (Semjuel L. Dzekson) placeni su ubice koji rade za Marselusa Volasa (Ving Rejms), zadatku da svome sefu vrate ukradenu posebnu i vrlo tajanstvenu aktovku. Kasnije, Vinsent, po Volasovom nalogu, mora da izvede njegovu suprugu Miju (Uma Turman) na veceru u grad, dok je on na poslovnom putu. Bac Kulidz (Brus Vilis) veteran je bokserskih borbi, kojem je placeno da lazira i pusti mec, ali on slucajno ubija svog protivnika. Sada zeli da pobegne iz grada, ali ne pre nego sto uzme srecni zlatni sat svoga oca.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('The Irishman', 'Martin Scorsese', 'Robert De Niro, Al Pacino, Joe Pesci', 'Biografija, Krimi, Drama', 4, 'Altitude Films', 'USA', 2019, 'U ostvarenju cija radnja prati istinitu pricu o mafiji pedesetih i nestanku legendarnog sindikalnog vodje Dzimija Hofe, glavne uloge igraju Robert de Niro, Al Pacino i Dzon Pesi. Placeni ubica Frenk Siran (De Niro) je glavni junak gangsterske sage od tri i po sata, koja gledaocu može izgledati i kao Skorsezeovo zivotno zavestanje. Iz njegove perspektive je ispricana prica o delu americke istorije, nasilju mafije i korupciji, inspirisana knjigom Carlsa Branta', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Inception', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'Akcija, Avantura, Naucna fantastika', 3, 'Warner Bros.', 'USA', 2010, 'Leonardo DiCaprio je Dom Kob, muskarac koji poseduje mogucnost manipulisanja snovima. Zahvaljujuci ovoj fantasticnoj sposobnosti Kob je postao veoma trazen od strane mocnih korporacija koje koriste njegove jedinstvene vestine kako bi nadmudrili konkurenciju i domogli se vrednih informacija. Ipak, njegov najnoviji zadatak je drugaciji od bilo cega sto je pre radio.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Jumanji: The Next Level', 'Jake Kasdan', 'Dwayne Johnson, Jack Black', 'Akcija, Avantura, Komedija', 3, 'Sony Pictures', 'USA', 2019, 'Kada cetvero srednjoskolaca otkrije staru video igru za koju nikad pre nisu culi (Jumanji), bice uvuceni u zabavan svet dzungle i doslovno postati avatari prema vlastitom izboru: Spencer ce tako postati streberski istrazivac, sportista Fridz ce postati pravi Ajnstajn, popularna devojka Betaniy ce postati sredovecni profesor, a krhka Marta ce se pretvoriti u neustrasivu ratnicu. Medjutim, zabava ce se uskoro pretvoriti u nesto drugo, kada otkriju da se Jumanji ne igra – vec prezivljava. Kako bi pobedili igru i vratili se u stvarni svet, morace proci najopasniju avanturu svojih zivota, otkriti sto je Alan Paris ostavio iza sebe pre 20 godina i promeniti nacin na koji gledaju sami sebe… Ili ce ostati zarobljeni u igri zauvek.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('The Matrix', 'Lana Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'Akcija, Naucna fantastika', 3, 'Warner Bros.', 'USA', 1999, 'Povuceni softverski strucnjak vodi dvostruki zivot. Noci provodi pred svojim kompjuterom gde pod pseudonimom Neo postaje haker koji pokušava otkriti nesto za sta ni sam nije siguran da postoji.Nakon sto stupi u kontakt sa Morfeusom, legendarnim hakerom za kojeg vlada tvrdi da je terorista, pocne ga progoniti policija predvodjena opasnim agentom Smitom (H. Vaving). Morfeus mu otkriva da je deo matriksa, a to je iluzija sveta, odnosno, virtualna stvarnost koju kompjuteri vec vekovima koriste da bi upravljali porobljenim ljudskim rodom. Morfeus je vodja jedne manje grupe ljudi koja je saznala istinu i pokusava pokrenuti rat za oslobodjenje od kompjutera. U njima se budi nova nada, jer prema legendi dolazi Odabrani - jedini koji ce se moci suprotstaviti strojevima. Sve ukazuje da bi Neo mogao biti taj...', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('The Godfather', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan', 'Krimi, Drama', 3, 'Paramount Pictures', 'USA', 1972, 'Po povratku iz Drugog svetskog rata , Michael Corleone ( Al Pacino ) ima dve stvari na umu : zeli se odmoriti od ratnih strahota i niposto ne zeli da udje u porodicni posao , sto , naravno , nije po volji njegovom ocu , mafijaskom donu Vitu Korleoneu ( Marlon Brando ) . Don Vito je dobar i obziran prema onima koji ga postuju , ali nasilan i nemilosrdan kada se nesto ispreci blagostanju njegove porodice . Smatrajuci kako se stari kodeksi casti trebaju nastaviti postovati i slediti kao najbolje uputstva uspesnog poslovanja , don Vito se sukobljava sa rivalima koji planiraju zapoceti unosan posao rasturanja droge . Sukob koji ce ta suprotstavljena vidjenja mafijaskog posla i odgovornosti izazvati bice jako krvav , a posebnu cenu platice Michael , odnosno njegovi snovi i zelje . Nakon sto don Vito prezivi pokusaj atentata , Michael zna kako vise ne sme da stoji po strani.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('Parasite', 'Bong Joon Ho', 'Kang-ho Song, Sun-kyun Lee, Yeo-jeong Jo', 'Krimi, Drama, Komedija', 3, 'CJ Entertainment', 'USA', 2019, 'Svi nezaposleni, Ki-taekova porodica s posebnim zanimanjem gleda na bogate i glamurozne Parkove kako bi ih izdrzavali dok ne postanu umesani u neocekivani incident.', false);
INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) VALUES ('The Gentlemen', 'Guy Ritchie', 'Matthew McConaughey, Charlie Hunnam, Michelle Dockery', 'Akcija, Krimi', 2, 'STX Entertainment', 'USA', 2020, 'Od pisca / redatelja Guya Ritchieja dolazi THE GENTLEMEN, sofisticirana akcija sa zvezdama. Film sledi americkog iseljenika Mickeyja Pearsona (Matthew McConaughey) koji je u Londonu izgradio visoko profitabilno carstvo marihuane. Kad se sazna vest da zauvek zeli dobiti pare od posla, pokrecu zavere, seme, podmicivanje i ucjenjivanje u pokusaju da ukradu. (u kojem ucestvuje glumacki ansambl sa svim zvezdama, ukljucujuci Charlie Hunnam, Henry Golding, Michelle Dockery, Jeremy Strong, Eddie Marsan, Colin Farrell i Hugh Grant).', false);

DROP TABLE IF EXISTS sale;
CREATE TABLE sale (
	id INTEGER PRIMARY KEY,
	naziv VARCHAR(20) NOT NULL,
	tipovi VARCHAR(20) NOT NULL
);
INSERT INTO sale (naziv, tipovi) VALUES ('sala1', 'TIP2D,TIP3D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala2', 'TIP3D,TIP4D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala3', 'TIP2D,TIP4D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala4', 'TIP2D');
INSERT INTO sale (naziv, tipovi) VALUES ('sala5', 'TIP3D');


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
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1581242400000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP3D', 2, '1581242400000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1581328800000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP3D', 2, '1581328800000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1581415200000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP3D', 2, '1581415200000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1581501600000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP3D', 2, '1581501600000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP2D', 1, '1581588000000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (1, 'TIP3D', 2, '1581588000000', 450.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 1, '1581258600000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 3, '1581242400000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP3D', 1, '1581345000000', 450.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP4D', 3, '1581328800000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 1, '1581431400000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 3, '1581415200000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 1, '1581517800000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP2D', 3, '1581501600000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP3D', 1, '1581604200000', 450.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (2, 'TIP4D', 3, '1581588000000', 600.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 2, '1581258600000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 3, '1581258600000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 2, '1581345000000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP3D', 3, '1581345000000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 2, '1581431400000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 3, '1581431400000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 2, '1581517800000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 3, '1581517800000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP4D', 2, '1581604200000', 600.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (3, 'TIP3D', 3, '1581604200000', 450.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581270300000', 500.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581282000000', 500.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP2D', 2, '1581356700000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP2D', 2, '1581368400000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581443100000', 500.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581454800000', 500.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581529500000', 500.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP3D', 2, '1581541200000', 500.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP2D', 2, '1581615900000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (4, 'TIP2D', 2, '1581627600000', 400.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 2, '1581231600000', 650.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 3, '1581270300000', 650.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP2D', 2, '1581318000000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP3D', 3, '1581356700000', 500.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 2, '1581404400000', 650.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 3, '1581443100000', 650.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 2, '1581490800000', 650.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP4D', 3, '1581529500000', 650.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP2D', 2, '1581577200000', 350.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (5, 'TIP3D', 3, '1581615900000', 500.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP2D', 1, '1581270300000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP3D', 1, '1581282000000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP4D', 1, '1581356700000', 650.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP2D', 1, '1581368400000', 300.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP2D', 1, '1581443100000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP3D', 1, '1581454800000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP4D', 1, '1581529500000', 650.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP2D', 1, '1581541200000', 300.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP3D', 1, '1581615900000', 450.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (6, 'TIP4D', 1, '1581627600000', 650.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP3D', 1, '1581231600000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP4D', 4, '1581231600000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP3D', 1, '1581318000000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP4D', 4, '1581318000000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP3D', 1, '1581404400000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP4D', 4, '1581404400000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP3D', 1, '1581490800000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP4D', 4, '1581490800000', 600.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP3D', 1, '1581577200000', 400.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (7, 'TIP4D', 4, '1581577200000', 600.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 4, '1581244200000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 3, '1581282000000', 250.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 4, '1581330600000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 3, '1581368400000', 250.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 4, '1581417000000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 3, '1581454800000', 250.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 4, '1581503400000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 3, '1581541200000', 250.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 4, '1581589800000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (8, 'TIP2D', 3, '1581627600000', 250.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP2D', 4, '1581255900000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP3D', 5, '1581255900000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP2D', 4, '1581342300000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP3D', 5, '1581342300000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP2D', 4, '1581428700000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP3D', 5, '1581428700000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP2D', 4, '1581515100000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP3D', 5, '1581515100000', 400.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP2D', 4, '1581601500000', 250.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (9, 'TIP3D', 5, '1581601500000', 400.00, 2, false);

INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP2D', 4, '1581269400000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP3D', 5, '1581269400000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP2D', 4, '1581355800000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP3D', 5, '1581355800000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP2D', 4, '1581442200000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP3D', 5, '1581442200000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP2D', 4, '1581528600000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP3D', 5, '1581528600000', 450.00, 2, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP2D', 4, '1581615000000', 300.00, 1, false);
INSERT INTO projekcije(film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) VALUES (10, 'TIP3D', 5, '1581615000000', 450.00, 2, false);

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
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (1, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (2, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (3, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (4, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (5, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (6, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (7, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (8, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (9, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (10, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (11, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (12, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (13, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (14, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (15, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (16, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (17, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (18, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (19, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (20, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (21, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (22, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (23, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (24, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (25, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (26, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (27, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (28, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (29, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (30, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (31, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (32, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (33, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (34, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (35, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (36, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (37, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (38, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (39, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (40, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (41, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (42, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (43, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (44, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (45, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (46, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (47, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (48, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (49, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (50, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (51, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (52, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (53, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (54, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (55, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (56, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (57, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (58, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (59, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (60, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (61, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (62, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (63, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (64, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (65, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (66, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (67, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (68, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (69, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 32, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 33, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 54, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 55, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 57, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 58, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 52, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (70, 53, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 74, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 73, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 68, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 67, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 35, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 34, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 47, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (71, 46, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 6, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 5, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 54, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 53, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 63, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (72, 64, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 24, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 25, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 54, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 53, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 67, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 64, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 22, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (73, 23, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 2, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 6, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 78, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 77, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 24, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 25, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 11, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (74, 12, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 37, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 36, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 22, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 21, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 33, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 34, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 66, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (75, 67, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 5, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 21, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 22, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 76, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 75, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 33, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (76, 34, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 3, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 23, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 18, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (77, 19, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 6, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 5, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 24, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 25, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 64, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 65, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 17, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (78, 16, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 13, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 6, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 5, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 4, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 3, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 2, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (79, 1, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 14, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 15, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 22, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 23, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 74, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 75, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 78, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (80, 79, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 16, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 17, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 22, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 21, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 33, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 34, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 56, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (81, 57, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 11, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 26, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 25, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 6, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 5, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 3, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (82, 2, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 64, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 65, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 67, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 66, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 76, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 75, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 55, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (83, 54, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 4, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 23, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 47, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 48, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 51, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 52, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 66, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (84, 67, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 27, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 28, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 42, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 41, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 53, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 54, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 76, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (85, 77, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 11, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 16, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 15, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 21, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 29, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (86, 28, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 27, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 26, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 33, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 22, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 21, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 25, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (87, 24, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 56, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 57, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 76, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 75, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 45, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 44, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 41, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (88, 42, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 11, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 73, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 74, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 33, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 34, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 55, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (89, 54, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 13, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 36, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 37, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 46, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 47, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 2, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (90, 3, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 77, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 78, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 67, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 68, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 62, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 63, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 55, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (91, 56, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 6, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 7, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 28, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 29, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 33, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 34, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 37, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (92, 38, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 56, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 57, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 27, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 28, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 1, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 2, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 8, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (93, 9, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 74, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 75, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 72, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 73, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 12, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 13, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 4, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (94, 5, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 31, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 32, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 34, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 57, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 58, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 52, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (95, 53, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 39, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 38, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 36, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 32, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 33, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 43, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (96, 44, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 6, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 7, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 36, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 56, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 57, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 71, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (97, 72, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 26, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 27, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 55, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 56, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 67, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 68, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 1, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (98, 2, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 44, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 45, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 25, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 26, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 65, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 66, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 34, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (99, 35, '2020-01-12 14:30:00.00', 6);

INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 12, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 13, '2020-01-12 14:30:00.00', 3);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 35, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 36, '2020-01-12 14:30:00.00', 4);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 68, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 69, '2020-01-12 14:30:00.00', 5);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 77, '2020-01-12 14:30:00.00', 6);
INSERT INTO karte(projekcija, sediste, datumVremeProdaje, korisnik) VALUES (100, 78, '2020-01-12 14:30:00.00', 6);

