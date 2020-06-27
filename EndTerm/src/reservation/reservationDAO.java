package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.databaseUtil;

public class reservationDAO {
	
	public int join(int galleryID, String userID) {
		String SQL = "INSERT INTO RESERVATION VALUES(?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, galleryID);
			pstmt.setString(2, userID);

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int delete(int galleryID, String userID) {
		String SQL = "delete from RESERVATION where galleryID = ? and userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, galleryID);
			pstmt.setString(2, userID);

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int search(int galleryID, String userID) {
		String SQL = "SELECT userID FROM USER WHERE galleryID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userID)) {
					return 1;		
				}
				else return 0;
			}
			
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -2;
	}
	
}
