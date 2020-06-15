package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class databaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/jspbookdb?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "asas1020as";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
