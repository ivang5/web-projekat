package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Sala;
import model.Sediste;

public class SedistaDAO {

	public static Sediste getById(String id) {
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT redniBroj, sala "
					+ "FROM sedista WHERE id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				int index = 1;
				int redniBroj = rset.getInt(index++);
				Sala sala = SaleDAO.getById(rset.getString(index++));
				
				
				return new Sediste(Integer.parseInt(id), redniBroj, sala);
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

	public static Sediste getByRbAndSala(String redniBroj, String salaId) {
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT id, redniBroj, sala "
					+ "FROM sedista WHERE redniBroj = ? AND sala = ?";
			
			int index = 1;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(index++, redniBroj);
			pstmt.setString(index++, salaId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				index = 1;
				int sedisteId = rset.getInt(index++);
				int sedisteRedniBroj = rset.getInt(index++);
				Sala sedisteSala = SaleDAO.getById(rset.getString(index++));
				
				return new Sediste(sedisteId, sedisteRedniBroj, sedisteSala);
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
