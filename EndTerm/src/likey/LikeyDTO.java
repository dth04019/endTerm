package likey;

public class LikeyDTO {
	String userID;
	int commentID;
	String userIP;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	
	public LikeyDTO() {
		
	}
	
	public LikeyDTO(String userID, int commentID, String userIP) {
		super();
		this.userID = userID;
		this.commentID = commentID;
		this.userIP = userIP;
	}
	
	
	
}
