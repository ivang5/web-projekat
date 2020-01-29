package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Film;
import model.Korisnik;
import model.Projekcija;
import model.Sala;
import model.TipProjekcije;

public class ProjekcijeDAO {

	public static Projekcija getById(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana "
					+ "FROM projekcije WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				Film film = FIlmoviDAO.getById(rset.getString(index++));
				TipProjekcije tipProjekcije = TipProjekcije.valueOf(rset.getString(index++));
				Sala sala = SaleDAO.getById(rset.getString(index++));
				Timestamp dateTime = rset.getTimestamp(index++);
				Date datumVreme = new Date(dateTime.getTime());
				double cenaKarte = rset.getDouble(index++);
				Korisnik korisnik = KorisniciDAO.getById(rset.getString(index++));
				boolean obrisana = rset.getBoolean(index++);
				
				return new Projekcija(Integer.parseInt(id), film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana);
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
	
	
	public static List<Projekcija> getAll(int film, String tipProjekcije, int sala, String datumOd, String datumDo, double cenaOd, double cenaDo){
		List<Projekcija> projekcije = new ArrayList<>();
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			String query = "SELECT id, film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana "
					+ "FROM projekcije WHERE film LIKE ? AND tipProjekcije LIKE ? AND sala LIKE ? AND datumVreme >= ? AND datumVreme <= ? AND cenaKarte >= ? AND cenaKarte <= ? AND obrisana = ?";
			
			int index = 1;
			pstmt = conn.prepareStatement(query);
			if(film == -1) {
				pstmt.setString(index++, "%" + "%");
			}else {
				pstmt.setString(index++, "%" + film + "%");
			}
			if(tipProjekcije == "") {
				pstmt.setString(index++, "%" + "%");
			}else {
				pstmt.setString(index++, tipProjekcije);
			}
			if(sala == -1) {
				pstmt.setString(index++, "%" + "%");
			}else {
				pstmt.setString(index++, "%" + sala + "%");
			}			
			pstmt.setString(index++, datumOd);
			pstmt.setString(index++, datumDo);
			pstmt.setDouble(index++, cenaOd);
			pstmt.setDouble(index++, cenaDo);
			pstmt.setInt(index++, 0);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				index = 1;
				String projekcijaId = rset.getString(index++);
				Film projekcijaFilm = FIlmoviDAO.getById(rset.getString(index++));
				TipProjekcije projekcijaTipProjekcije = TipProjekcije.valueOf(rset.getString(index++));
				Sala projekcijaSala = SaleDAO.getById(rset.getString(index++));
				Date projekcijaDatum = rset.getTimestamp(index++);
				double projekcijaCena = rset.getDouble(index++);
				Korisnik projekcijaKorisnik = KorisniciDAO.getById(rset.getString(index++));
				boolean obrisana = rset.getBoolean(index++);
				
				Projekcija projekcija = new Projekcija(Integer.parseInt(projekcijaId), projekcijaFilm, projekcijaTipProjekcije, projekcijaSala, projekcijaDatum, projekcijaCena, projekcijaKorisnik, obrisana);
				projekcije.add(projekcija);
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return projekcije;
	}
	
	
	public static boolean add(Projekcija projekcija) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "INSERT INTO projekcije (film, tipProjekcije, sala, datumVreme, cenaKarte, korisnik, obrisana) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setInt(index++, projekcija.getFilm().getId());
			pstmt.setString(index++, projekcija.getTipProjekcije().toString());
			pstmt.setInt(index++, projekcija.getSala().getId());
			pstmt.setTimestamp(index++,  new Timestamp(projekcija.getDatumVreme().getTime()));
			pstmt.setDouble(index++, projekcija.getCenaKarte());
			pstmt.setInt(index++, projekcija.getKorisnik().getId());
			pstmt.setInt(index++, (projekcija.isObrisana() == true? 1:0));
			
			return pstmt.executeUpdate() == 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
	
	public static boolean update(Projekcija projekcija) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "UPDATE projekcije SET film = ?, tipProjekcije = ?, sala = ?, datumVreme = ?, cenaKarte = ?, korisnik = ?, obrisana = ? "
					+ "WHERE id = ?";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setInt(index++, projekcija.getFilm().getId());
			pstmt.setString(index++, projekcija.getTipProjekcije().toString());
			pstmt.setInt(index++, projekcija.getSala().getId());
			pstmt.setTimestamp(index++, new Timestamp(projekcija.getDatumVreme().getTime()));
			pstmt.setDouble(index++, projekcija.getCenaKarte());
			pstmt.setInt(index++, projekcija.getKorisnik().getId());
			pstmt.setInt(index++, (projekcija.isObrisana() == true? 1:0));
			pstmt.setInt(index++, projekcija.getId());
			
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
			String query = "DELETE FROM projekcije WHERE id = ?";

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
	
	public static boolean postojanjeFilma(String id) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			String query = "SELECT COUNT(*) from projekcije WHERE film = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int brojProjekcija = rset.getInt(1);
				if(brojProjekcija > 0) 
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
