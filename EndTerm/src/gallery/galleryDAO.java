package gallery;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.databaseUtil;

public class galleryDAO {
	
	
	public ArrayList<galleryDTO> getList() {
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<galleryDTO> galleryList= null;
		
		try {
			SQL = "SELECT * FROM GALLERY";
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			

			rs = pstmt.executeQuery();
			galleryList = new ArrayList<galleryDTO>();
			while(rs.next()) {
				galleryDTO gallery = new galleryDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getDate(5),
					rs.getDate(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getString(11),
					rs.getString(12)
				);
				galleryList.add(gallery);
			}
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
		return galleryList;
	}
}
