package model;

public enum TipProjekcije {
	
	TIP2D, TIP3D, TIP4D;
	
	public static TipProjekcije fromInt(int t) {
		switch (t) {
		case 1:
			return TIP2D;
		case 2:
			return TIP3D;
		default:
			return TIP4D;
		}
	}
	
	public static int toInt(TipProjekcije tipProjekcije) {
		switch (tipProjekcije) {
		case TIP2D:
			return 1;
		case TIP3D:
			return 2;
		default:
			return 3;
		}
	}
}
