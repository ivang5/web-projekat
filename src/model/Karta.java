package model;

import java.util.Date;

public class Karta {

	private int id;
	private Projekcija projekcija;
	private Sediste sediste;
	private Date datumVremeProdaje;
	private Korisnik korisnik;
	
	public Karta(int id, Projekcija projekcija, Sediste sediste, Date datumVremeProdaje, Korisnik korisnik) {
		super();
		this.id = id;
		this.projekcija = projekcija;
		this.sediste = sediste;
		this.datumVremeProdaje = datumVremeProdaje;
		this.korisnik = korisnik;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Projekcija getProjekcija() {
		return projekcija;
	}
	public void setProjekcija(Projekcija projekcija) {
		this.projekcija = projekcija;
	}
	public Sediste getSediste() {
		return sediste;
	}
	public void setSediste(Sediste sediste) {
		this.sediste = sediste;
	}
	public Date getDatumVremeProdaje() {
		return datumVremeProdaje;
	}
	public void setDatumVremeProdaje(Date datumVremeProdaje) {
		this.datumVremeProdaje = datumVremeProdaje;
	}
	public Korisnik getKorisnik() {
		return korisnik;
	}
	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	@Override
	public String toString() {
		return "Karta [id=" + id + ", projekcija=" + projekcija + ", sediste=" + sediste + ", datumVremeProdaje="
				+ datumVremeProdaje + ", korisnik=" + korisnik + "]";
	}
	
}
