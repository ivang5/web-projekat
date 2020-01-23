package model;

import java.util.Date;

public class Projekcija {

	private int id;
	private Film film;
	private TipProjekcije tipProjekcije;
	private Sala sala;
	private Date datumVreme;
	private double cenaKarte;
	private Korisnik korisnik;
	private boolean obrisana;
	
	public Projekcija() {
		super();
	}

	public Projekcija(int id, Film film, TipProjekcije tipProjekcije, Sala sala, Date datumVreme, double cenaKarte,
			Korisnik korisnik, boolean obrisana) {
		super();
		this.id = id;
		this.film = film;
		this.tipProjekcije = tipProjekcije;
		this.sala = sala;
		this.datumVreme = datumVreme;
		this.cenaKarte = cenaKarte;
		this.korisnik = korisnik;
		this.obrisana = obrisana;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public TipProjekcije getTipProjekcije() {
		return tipProjekcije;
	}

	public void setTipProjekcije(TipProjekcije tipProjekcije) {
		this.tipProjekcije = tipProjekcije;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public Date getDatumVreme() {
		return datumVreme;
	}

	public void setDatumVreme(Date datumVreme) {
		this.datumVreme = datumVreme;
	}

	public double getCenaKarte() {
		return cenaKarte;
	}

	public void setCenaKarte(double cenaKarte) {
		this.cenaKarte = cenaKarte;
	}

	public Korisnik getKorisnik() {
		return korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public boolean isObrisana() {
		return obrisana;
	}

	public void setObrisana(boolean obrisana) {
		this.obrisana = obrisana;
	}

	@Override
	public String toString() {
		return "Projekcija [id=" + id + ", film=" + film + ", tipProjekcije=" + tipProjekcije + ", sala=" + sala
				+ ", datumVreme=" + datumVreme + ", cenaKarte=" + cenaKarte + ", korisnik=" + korisnik + "]";
	}
	
}
