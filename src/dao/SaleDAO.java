package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import model.Sala;
import model.TipProjekcije;

public class SaleDAO {

	public static Sala get(String naziv) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, tipovi "
					+ "FROM sale WHERE naziv = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, naziv);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				int id = rset.getInt(index++);
				List<String> tipoviString = new ArrayList<String>(Arrays.asList(rset.getString(index++).split("\\s*,\\s*")));
				List<TipProjekcije> tipovi = new ArrayList<TipProjekcije>();	
				for(String s: tipoviString) {
					tipovi.add(TipProjekcije.valueOf(s));
				}
				return new Sala(id, naziv, tipovi);
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
	
	public static Sala getById(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT naziv, tipovi "
					+ "FROM sale WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				String naziv = rset.getString(index++);
				List<String> tipoviString = new ArrayList<String>(Arrays.asList(rset.getString(index++).split("\\s*,\\s*")));
				List<TipProjekcije> tipovi = new ArrayList<TipProjekcije>();
				for(String s: tipoviString) {
					tipovi.add(TipProjekcije.valueOf(s));
				}
				
				return new Sala(Integer.parseInt(id), naziv, tipovi);
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
}
