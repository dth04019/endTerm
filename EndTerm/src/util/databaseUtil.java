package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class databaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://jspendterm.clctnyh4pdaa.ap-northeast-2.rds.amazonaws.com:3306/jspendterm";
			String dbID = "admin";
			String dbPassword = "asas1020as";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
