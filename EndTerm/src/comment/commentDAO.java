package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import comment.commentDTO;
import util.databaseUtil;

public class commentDAO {

	public ArrayList<commentDTO> getList() {
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<commentDTO> commentList= null;
		
		try {
			SQL = "SELECT * FROM COMMENT";
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			

			rs = pstmt.executeQuery();
			commentList = new ArrayList<commentDTO>();
			while(rs.next()) {
				commentDTO comment = new commentDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getDouble(6),
					rs.getDouble(7),
					rs.getDouble(8),
					rs.getDouble(9),
					rs.getInt(10)
				);
				commentList.add(comment);
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
		return commentList;
	}
	
	
	
	public int write(commentDTO comment) {
		String SQL = "INSERT INTO COMMENT VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, comment.getUserID());
			pstmt.setInt(2, comment.getGalleryID());
			pstmt.setString(3, comment.getCommentTitle());
			pstmt.setString(4, comment.getCommentContent());
			pstmt.setDouble(5, comment.getCommentTotal());
			pstmt.setDouble(6, comment.getCommentAccessibility());
			pstmt.setDouble(7, comment.getCommentArt());
			pstmt.setDouble(8, comment.getCommentPlace());

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
}
