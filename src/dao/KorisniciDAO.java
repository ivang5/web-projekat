package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Korisnik;
import model.Uloga;

public class KorisniciDAO {

	public static Korisnik get(String korisnickoIme) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, lozinka, datumRegistracije, uloga, obrisan "
					+ "FROM korisnici WHERE korisnickoIme = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, korisnickoIme);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				String id = rset.getString(index++);
				String lozinka = rset.getString(index++);
				Date datumRegistracije = rset.getDate(index++);
				Uloga uloga = Uloga.valueOf(rset.getString(index++));
				boolean obrisan = rset.getBoolean(index++);
				
				return new Korisnik(Integer.parseInt(id), korisnickoIme, lozinka, datumRegistracije, uloga, obrisan);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return null;
	}
	
	
	public static Korisnik get(String korisnickoIme, String lozinka) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, datumRegistracije, uloga, obrisan "
					+ "FROM korisnici WHERE korisnickoIme = ? AND lozinka = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, korisnickoIme);
			pstmt.setString(2, lozinka);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				String id = rset.getString(index++);
				Date datumRegistracije = rset.getDate(index++);
				Uloga uloga = Uloga.valueOf(rset.getString(index++));
				boolean obrisan = rset.getBoolean(index++);
				
				return new Korisnik(Integer.parseInt(id), korisnickoIme, lozinka, datumRegistracije, uloga, obrisan);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return null;
	}
	
	
	public static Korisnik getById(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT korisnickoIme, lozinka, datumRegistracije, uloga, obrisan "
					+ "FROM korisnici WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				String korisnickoIme = rset.getString(index++);
				String lozinka = rset.getString(index++);
				Date datumRegistracije = rset.getDate(index++);
				Uloga uloga = Uloga.valueOf(rset.getString(index++));
				boolean obrisan = rset.getBoolean(index++);
				
				Korisnik korisnik = new Korisnik(Integer.parseInt(id), korisnickoIme, lozinka, datumRegistracije, uloga, obrisan);
				return korisnik; 
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return null;
	}
	
	
	public static List<Korisnik> getAll(String korisnickoIme, String uloga){
		List<Korisnik> korisnici = new ArrayList<>();
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			String query = "SELECT id, korisnickoIme, lozinka, datumRegistracije, uloga, obrisan "
					+ "FROM korisnici WHERE korisnickoIme LIKE ? AND uloga LIKE ? AND obrisan = ?";
			
			int index = 1;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(index++, "%" + korisnickoIme + "%");
			if(uloga == "") {
				pstmt.setString(index++, "%" + "%");
			}else {
				pstmt.setString(index++, uloga);
			}
			pstmt.setInt(index++, 0);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				index = 1;
				int id = rset.getInt(index++);
				String korIme = rset.getString(index++);
				String lozinka = rset.getString(index++);
				Date datumRegistracije = rset.getTimestamp(index++);
				Uloga korUloga = Uloga.valueOf(rset.getString(index++));
				boolean obrisan = rset.getBoolean(index++);
				
				Korisnik korisnik = new Korisnik(id, korIme, lozinka, datumRegistracije, korUloga, obrisan);
				korisnici.add(korisnik);
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return korisnici;
	}
	
	
	public static boolean add(Korisnik korisnik) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "INSERT INTO korisnici (korisnickoIme, lozinka, datumRegistracije, uloga, obrisan) "
					+ "VALUES (?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setString(index++, korisnik.getKorisnickoIme());
			pstmt.setString(index++, korisnik.getLozinka());
			pstmt.setTimestamp(index++, new Timestamp(korisnik.getDatumRegistracije().getTime()));
			pstmt.setString(index++, korisnik.getUloga().toString());
			pstmt.setInt(index++, (korisnik.isObrisan() == true? 1:0));
			
			return pstmt.executeUpdate() == 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
	
	public static boolean update(Korisnik korisnik) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "UPDATE korisnici SET korisnickoIme = ?, lozinka = ?, uloga = ?, obrisan = ? "
					+ "WHERE id = ?";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setString(index++, korisnik.getKorisnickoIme());
			pstmt.setString(index++, korisnik.getLozinka());
			pstmt.setString(index++, korisnik.getUloga().toString());
			pstmt.setInt(index++, (korisnik.isObrisan() == true? 1:0));
			pstmt.setInt(index++, korisnik.getId());
			
			return pstmt.executeUpdate() == 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
	
	public static boolean delete(String id) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "DELETE FROM korisnici WHERE id = ?";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			return pstmt.executeUpdate() == 1;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
}
