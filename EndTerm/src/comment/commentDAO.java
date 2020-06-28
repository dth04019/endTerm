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
	
	public ArrayList<commentDTO> getList (String searchType, String search, int pageNumber) {
		ArrayList<commentDTO> commentList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) {
				SQL = "SELECT * FROM COMMENT WHERE CONCAT(commentTitle, commentContent) LIKE ? ORDER BY commentID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6; 
			} else if(searchType.equals("추천순" )) {
				SQL = "SELECT * FROM COMMENT WHERE CONCAT(commentTitle, commentContent) LIKE ? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, "%" + search + "%");
			

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
	
	public int like(String commentID) {
		String SQL = "UPDATE COMMENT SET likeCount = likeCount + 1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  Integer.parseInt(commentID));
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
		return -1; //DB ERROR
	}
	
	public int delete(String commentID) {
		String SQL = "DELETE FROM COMMENT WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  Integer.parseInt(commentID));
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
		return -1; //DB ERROR
	}
	
	public String getUserID(String commentID) {
		String SQL = "SELECT userID FROM COMMENT WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  Integer.parseInt(commentID));

			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
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
		return null; //not existed
	}
	
	public int unlike(String commentID) {
		String SQL = "UPDATE COMMENT SET likeCount = likeCount - 1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = databaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  Integer.parseInt(commentID));
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
		return -1; //DB ERROR
	}
}
