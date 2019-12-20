package model;

public enum Uloga {

	KORISNIK, ADMINISTRATOR;
	
	public static Uloga fromInt(int u) {
		switch (u) {
		case 1:
			return KORISNIK;
		default:
			return ADMINISTRATOR;
		}
	}
	
	public static int toInt(Uloga uloga) {
		switch (uloga) {
		case KORISNIK:
			return 1;
		default:
			return 3;
		}
	}
}
