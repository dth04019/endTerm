package reservation;

import java.sql.Date;

public class reservationDTO {

	private int galleryID;
	private String userID;
	public reservationDTO() {
		
	}
	public reservationDTO(int galleryID, String userID) {
		super();
		this.galleryID = galleryID;
		this.userID = userID;
	}
	
	
	public int getGalleryID() {
		return galleryID;
	}
	public void setGalleryID(int galleryID) {
		this.galleryID = galleryID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
