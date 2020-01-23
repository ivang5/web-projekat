package model;

import java.util.ArrayList;
import java.util.List;

public class Sala {

	private int id;
	private String naziv;
	private List<TipProjekcije> tipovi = new ArrayList<TipProjekcije>();
	
	public Sala(int id, String naziv, List<TipProjekcije> tipovi) {
		super();
		this.id = id;
		this.naziv = naziv;
		this.tipovi = tipovi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<TipProjekcije> getTipovi() {
		return tipovi;
	}

	public void setTipovi(List<TipProjekcije> tipovi) {
		this.tipovi = tipovi;
	}

	@Override
	public String toString() {
		return "Sala [id=" + id + ", naziv=" + naziv + ", tipovi=" + tipovi + "]";
	}
	
}
