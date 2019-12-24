package dao;

import java.sql.Connection;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp.BasicDataSourceFactory;

public class ConnectionManager {

	private static final String DATABASE_NAME = "webprojekat.db";
	
	private static final String FILE_SEPARATOR = System.getProperty("file.separator");
	private static final String WINDOWS_PATH = "C:" + FILE_SEPARATOR + "SQLite" + FILE_SEPARATOR + DATABASE_NAME;
	private static final String LINUX_PATH = "SQLITE" + FILE_SEPARATOR + DATABASE_NAME;
	
	private static final String PATH = WINDOWS_PATH;
	
	private static DataSource dataSource;
	
	public static void open() {
		try {
			Properties dataSourceProperties = new Properties();
			dataSourceProperties.setProperty("driverClassName", "org.sqlite.JDBC");
			dataSourceProperties.setProperty("url", "jdbc:sqlite:" + PATH);
			
			dataSource = BasicDataSourceFactory.createDataSource(dataSourceProperties); // connection pool
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return dataSource.getConnection(); // slobodna konekcija se vadi iz pool-a na zahtev
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return null;
	}
	
}
