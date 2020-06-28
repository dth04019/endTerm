package reservation;

import java.sql.Date;

public class reservationDTO {

	private int galleryID;
	private String userID;
	private int no;
	public reservationDTO() {
		
	}
	public reservationDTO(int galleryID, String userID, int no) {
		super();
		this.galleryID = galleryID;
		this.userID = userID;
		this.no = no;
	}
	
	
	public int getGalleryID() {
		return galleryID;
	}
	public void setGalleryID(int galleryID) {
		this.galleryID = galleryID;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
