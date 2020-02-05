package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Karta;
import model.Korisnik;
import model.Projekcija;
import model.Sediste;

public class KarteDAO {

	public static Karta get(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT projekcija, sediste, datumVremeProdaje, korisnik "
					+ "FROM karte WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				Projekcija projekcija = ProjekcijeDAO.getById(rset.getString(index++));
				Sediste sediste = SedistaDAO.getById(rset.getString(index++));
				Timestamp dateTime = rset.getTimestamp(index++);
				Date datumVremeProdaje = new Date(dateTime.getTime());
				Korisnik kupac = KorisniciDAO.getById(rset.getString(index++));
				
				return new Karta(Integer.parseInt(id), projekcija, sediste, datumVremeProdaje, kupac);
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
	
	public static List<Karta> getAll(){
		List<Karta> karte = new ArrayList<>();
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, projekcija, sediste, datumVremeProdaje, korisnik "
					+ "FROM karte";
			
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				int index = 1;
				int id = rset.getInt(index++);
				Projekcija projekcija = ProjekcijeDAO.getById(rset.getString(index++));
				Sediste sediste = SedistaDAO.getById(rset.getString(index++));
				Timestamp dateTime = rset.getTimestamp(index++);
				Date datumVremeProdaje = new Date(dateTime.getTime());
				Korisnik kupac = KorisniciDAO.getById(rset.getString(index++));
				
				Karta karta =  new Karta(id, projekcija, sediste, datumVremeProdaje, kupac);
				karte.add(karta);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return karte;
	}
	
	public static List<Karta> getKorisnikKarte(String korisnikId){
		List<Karta> karte = new ArrayList<>();
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, projekcija, sediste, datumVremeProdaje "
					+ "FROM karte WHERE korisnik = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, korisnikId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				int index = 1;
				int id = rset.getInt(index++);
				Projekcija projekcija = ProjekcijeDAO.getById(rset.getString(index++));
				Sediste sediste = SedistaDAO.getById(rset.getString(index++));
				Timestamp dateTime = rset.getTimestamp(index++);
				Date datumVremeProdaje = new Date(dateTime.getTime());
				//Korisnik kupac = KorisniciDAO.getById(rset.getString(index++));
				
				Karta karta =  new Karta(id, projekcija, sediste, datumVremeProdaje, KorisniciDAO.getById(korisnikId));
				karte.add(karta);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return karte;
	}
	
	public static List<Karta> getProjekcijaKarte(String projekcijaId){
		List<Karta> karte = new ArrayList<>();
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, sediste, datumVremeProdaje, korisnik "
					+ "FROM karte WHERE projekcija = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, projekcijaId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				int index = 1;
				int id = rset.getInt(index++);
				Sediste sediste = SedistaDAO.getById(rset.getString(index++));
				Timestamp dateTime = rset.getTimestamp(index++);
				Date datumVremeProdaje = new Date(dateTime.getTime());
				Korisnik kupac = KorisniciDAO.getById(rset.getString(index++));
				
				Karta karta =  new Karta(id, ProjekcijeDAO.getById(projekcijaId), sediste, datumVremeProdaje, kupac);
				karte.add(karta);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return karte;
	}
	
	public static boolean add(Karta karta) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "INSERT INTO karte (projekcija, sediste, datumVremeProdaje, korisnik) "
					+ "VALUES (?, ?, ?, ?)";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setInt(index++, karta.getProjekcija().getId());
			pstmt.setInt(index++, karta.getSediste().getId());
			pstmt.setTimestamp(index++,  new Timestamp(karta.getDatumVremeProdaje().getTime()));
			pstmt.setInt(index++, karta.getKorisnik().getId());
			
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
			String query = "DELETE FROM karte WHERE id = ?";

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
	
	public static boolean postojanjeProjekcije(String id) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			String query = "SELECT COUNT(*) from karte WHERE projekcija = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int brojKarata = rset.getInt(1);
				if(brojKarata > 0) 
					return true;
				else
					return false;
			}
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
	public static boolean postojanjeKorisnika(String id) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			String query = "SELECT COUNT(*) from karte WHERE korisnik = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int brojKarata = rset.getInt(1);
				if(brojKarata > 0) 
					return true;
				else
					return false;
			}
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
}
