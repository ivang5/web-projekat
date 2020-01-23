package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Film;

public class FIlmoviDAO {

	public static Film get(String naziv) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan "
					+ "FROM filmovi WHERE naziv = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, naziv);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				int id = rset.getInt(index++);
				String reziser = rset.getString(index++);
				String glumci = rset.getString(index++);
				String zanrovi = rset.getString(index++);
				int trajanje = rset.getInt(index++);
				String distributer = rset.getString(index++);
				String zemljaPorekla = rset.getString(index++);
				int godinaProizvodnje = rset.getInt(index++);
				String opis = rset.getString(index++);
				boolean obrisan = rset.getBoolean(index++);
				
				return new Film(id, naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan);
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
	
	
	public static Film getById(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan "
					+ "FROM filmovi WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				String naziv = rset.getString(index++);
				String reziser = rset.getString(index++);
				String glumci = rset.getString(index++);
				String zanrovi = rset.getString(index++);
				int trajanje = rset.getInt(index++);
				String distributer = rset.getString(index++);
				String zemljaPorekla = rset.getString(index++);
				int godinaProizvodnje = rset.getInt(index++);
				String opis = rset.getString(index++);
				boolean obrisan = rset.getBoolean(index++);
				
				return new Film(Integer.parseInt(id), naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan);
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
	
	
	public static List<Film> getAll(String naziv, String zanrovi, int trajanjeOd, int trajanjeDo, String distributer, String zemljaPorekla, int godinaOd, int godinaDo){
		List<Film> filmovi = new ArrayList<>();
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			String query = "SELECT id, naziv, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, obrisan "
					+ "FROM filmovi WHERE naziv LIKE ? AND zanrovi LIKE ? AND trajanje >= ? AND trajanje <= ? AND distributer LIKE ? AND zemljaPorekla LIKE ? AND godinaProizvodnje >= ? AND godinaProizvodnje <= ? AND obrisan = ?";
			
			int index = 1;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(index++, "%" + naziv + "%");
			pstmt.setString(index++, "%" + zanrovi + "%");
			pstmt.setInt(index++, trajanjeOd);
			pstmt.setInt(index++, trajanjeDo);
			pstmt.setString(index++, "%" + distributer + "%");
			pstmt.setString(index++, "%" + zemljaPorekla + "%");
			pstmt.setInt(index++, godinaOd);
			pstmt.setInt(index++, godinaDo);
			pstmt.setInt(index++, 0);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				index = 1;
				String filmId = rset.getString(index++);
				String filmNaziv = rset.getString(index++);
				String filmZanrovi = rset.getString(index++);
				String filmTrajanje = rset.getString(index++);
				String filmDistributer = rset.getString(index++);
				String filmZemljaPorekla = rset.getString(index++);
				String filmGodinaProizvodnje = rset.getString(index++);
				boolean obrisan = rset.getBoolean(index++);
				
				Film film = new Film(Integer.parseInt(filmId), filmNaziv, filmZanrovi, Integer.parseInt(filmTrajanje), filmDistributer, filmZemljaPorekla, Integer.parseInt(filmGodinaProizvodnje), obrisan);
				filmovi.add(film);
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return filmovi;
	}
	
	
	public static boolean add(Film film) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "INSERT INTO filmovi (naziv, reziser, glumci, zanrovi, trajanje, distributer, zemljaPorekla, godinaProizvodnje, opis, obrisan) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setString(index++, film.getNaziv());
			if(film.getReziser() != null) {
				pstmt.setString(index++, film.getReziser());
			}else {
				pstmt.setString(index++, null);
			}
			if(film.getGlumci() != null) {
				pstmt.setString(index++, film.getGlumci());
			}else {
				pstmt.setString(index++, null);
			}
			if(film.getZanrovi() != null) {
				pstmt.setString(index++, film.getZanrovi());
			}else {
				pstmt.setString(index++, null);
			}
			pstmt.setInt(index++, film.getTrajanje());
			pstmt.setString(index++, film.getDistributer());
			pstmt.setString(index++, film.getZemljaPorekla());
			pstmt.setInt(index++, film.getGodinaProizvodnje());
			if(film.getOpis() != null) {
				pstmt.setString(index++, film.getOpis());
			}else {
				pstmt.setString(index++, null);
			}
			pstmt.setInt(index++, (film.isObrisan() == true? 1:0));
			
			return pstmt.executeUpdate() == 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();}
		}
		
		return false;
	}
	
	
	public static boolean update(Film film) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		
		try {
			String query = "UPDATE filmovi SET naziv = ?, reziser = ?, glumci = ?, zanrovi = ?, trajanje = ?, distributer = ?, zemljaPorekla = ?, godinaProizvodnje = ?, opis = ?, obrisan = ?  "
					+ "WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			int index = 1;
			pstmt.setString(index++, film.getNaziv());
			if(film.getReziser() != null) {
				pstmt.setString(index++, film.getReziser());
			}else {
				pstmt.setString(index++, null);
			}
			if(film.getGlumci() != null) {
				pstmt.setString(index++, film.getGlumci());
			}else {
				pstmt.setString(index++, null);
			}
			if(film.getZanrovi() != null) {
				pstmt.setString(index++, film.getZanrovi());
			}else {
				pstmt.setString(index++, null);
			}
			pstmt.setInt(index++, film.getTrajanje());
			pstmt.setString(index++, film.getDistributer());
			pstmt.setString(index++, film.getZemljaPorekla());
			pstmt.setInt(index++, film.getGodinaProizvodnje());
			if(film.getOpis() != null) {
				pstmt.setString(index++, film.getOpis());
			}else {
				pstmt.setString(index++, null);
			}
			pstmt.setInt(index++, (film.isObrisan() == true? 1:0));
			pstmt.setInt(index++, film.getId());
			
			return pstmt.executeUpdate() == 1;
			
		}  catch (Exception ex) {
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
			String query = "DELETE FROM filmovi WHERE id = ?";

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
